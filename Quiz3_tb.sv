//`timescale 1ns / 1ps

module Quiz3_tb;

    // Inputs
    reg rst;
    reg clk;
    reg btn0;
    reg btn1;
    reg btnEntry;

    // Outputs
    wire ledLight;

    // Instantiate the Unit Under Test (UUT)
    Quiz3 uut (
        .rst(rst),
        .clk(clk),
        .btn0(btn0),
        .btn1(btn1),
        .btnEntry(btnEntry),
        .ledLight(ledLight)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with a period of 10ns
    end

    // Test cases
    initial begin
        // Initialize Inputs
        rst = 1;
        btn0 = 1;
        btn1 = 1;
        btnEntry = 1;

        // Wait for global reset
        #100;
        rst = 0; // Assert reset
        #10;
        rst = 1; // Deassert reset
        #10;

        // Case 1: Enter 01011 and press enter, expect ledLight to turn on
        enterDigits(0,1,0,1,1);

        // Case 2: Enter 00001 and press enter, expect ledLight to turn off
        enterDigits(0,0,0,0,1);

        // Case 3: Enter 11110 and press enter, expect ledLight to turn on
        enterDigits(1,1,1,1,0);

        // Case 4: Enter 10100 and press enter, expect ledLight to turn off
        enterDigits(1,0,1,0,0);

        // Case 5: Enter 11111 and press enter, expect ledLight to turn on
        enterDigits(1,1,1,1,1);

        // Finish the simulation
        #100;
        $finish;
    end

    // Helper task to enter digits and press enter
    task enterDigits(input bit d0, d1, d2, d3, d4);
        begin
            pressButton(d0);
            pressButton(d1);
            pressButton(d2);
            pressButton(d3);
            pressButton(d4);
            pressEnter();
        end
    endtask

    // Helper task to simulate button press
    task pressButton(input bit digit);
        begin
            if (digit) begin
                btn1 = 0; // Press button 1
                #10;
                btn1 = 1; // Release button 1
            end else begin
                btn0 = 0; // Press button 0
                #10;
                btn0 = 1; // Release button 0
            end
            #10; // Wait for debounce (if applicable)
        end
    endtask

    // Helper task to simulate enter button press
    task pressEnter();
        begin
            btnEntry = 0; // Press enter
            #10;
            btnEntry = 1; // Release enter
            #10; // Wait for debounce (if applicable)
        end
    endtask

endmodule