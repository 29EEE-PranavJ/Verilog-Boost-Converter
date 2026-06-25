module mppt_top(
    input              clk,
    input              rst,

    input      [15:0]  pv_voltage,
    input      [15:0]  pv_current,

    output reg         gate_pwm
);

    // MPPT Registers
    reg [15:0] prev_voltage;
    reg [31:0] prev_power;
    reg [31:0] power;

    reg [7:0] duty;

    parameter STEP = 8'd2;

    wire signed [31:0] delta_p;
    wire signed [16:0] delta_v;

    assign delta_p = power - prev_power;
    assign delta_v = $signed({1'b0,pv_voltage}) -
                     $signed({1'b0,prev_voltage});

    // Slow MPPT Update Counter
    reg [19:0] mppt_counter;

    // PWM Counter
    reg [7:0] pwm_counter;

    always @(posedge clk or posedge rst)
    begin
        if(rst)
        begin
            prev_voltage <= 16'd0;
            prev_power   <= 32'd0;
            power        <= 32'd0;

            duty         <= 8'd128;   // 50%

            mppt_counter <= 20'd0;
            pwm_counter  <= 8'd0;

            gate_pwm     <= 1'b0;
        end
        else
        begin

            // PWM Generation
            pwm_counter <= pwm_counter + 1'b1;

            if(pwm_counter < duty)
                gate_pwm <= 1'b1;
            else
                gate_pwm <= 1'b0;

            // Slow MPPT Update
            mppt_counter <= mppt_counter + 1'b1;

            if(mppt_counter == 20'd500000)
            begin

                mppt_counter <= 20'd0;

                power <= pv_voltage * pv_current;

                if(delta_p > 0)
                begin
                    if(delta_v > 0)
                    begin
                        if(duty < 8'd250)
                            duty <= duty + STEP;
                    end
                    else
                    begin
                        if(duty > STEP)
                            duty <= duty - STEP;
                    end
                end
                else if(delta_p < 0)
                begin
                    if(delta_v > 0)
                    begin
                        if(duty > STEP)
                            duty <= duty - STEP;
                    end
                    else
                    begin
                        if(duty < 8'd250)
                            duty <= duty + STEP;
                    end
                end

                prev_voltage <= pv_voltage;
                prev_power   <= power;

            end
        end
    end

endmodule