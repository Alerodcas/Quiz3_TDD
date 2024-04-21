module Quiz3(
    input rst,          // Reset de la FSM
    input logic clk,    // Clock de la FSM
    input logic btn0,   // Boton para ingresar digito 0 (0 presionado, 1 sin presionar)
	input logic btn1, 	// Boton para ingresar digito 1 (0 presionado, 1 sin presionar)
	input logic btnEntry, // Boton para ingresar numero (0 presionado, 1 sin presionar)
    output logic ledLight // Registro de estado
);

// Declaración de parámetros
localparam STATE_0 = 4'b0000;
localparam STATE_1 = 4'b0001;
localparam STATE_2 = 4'b0010;
localparam STATE_3 = 4'b0011;
localparam STATE_4 = 4'b0100;
localparam STATE_5 = 4'b0101;
localparam STATE_6 = 4'b0110;
localparam STATE_7 = 4'b0111;
localparam STATE_8 = 4'b1000;
localparam STATE_9 = 4'b1001;
localparam STATE_10 = 4'b1010;
localparam STATE_11 = 4'b1011;
localparam STATE_12 = 4'b1100;
localparam STATE_13 = 4'b1101;
localparam STATE_14 = 4'b1110;
localparam STATE_15 = 4'b1111;


logic [3:0] estado_actual, estado_siguiente;

// FSM de control
always_ff @(posedge clk or negedge rst)
begin
    if (!rst) begin
        estado_actual <= STATE_0;
    end
    else begin
        estado_actual <= estado_siguiente;
    end
end

// State machine logic
always_comb
begin
	estado_siguiente = estado_actual;
    case (estado_actual)
        STATE_0:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_0;
            else if (!btn1)
                estado_siguiente = STATE_1;
		  STATE_1:
			  if (!btn0) // Button pressed
						 estado_siguiente = STATE_2;
				else if (!btn1)
						 estado_siguiente = STATE_3;
		  STATE_2:
			  if (!btn0) // Button pressed
						 estado_siguiente = STATE_4;
				else if (!btn1)
						 estado_siguiente = STATE_5;
		  STATE_3:
				if (!btn0) // Button pressed
						 estado_siguiente = STATE_6;
				else if (!btn1)
						 estado_siguiente = STATE_7;
		  STATE_4:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_8;
            else if (!btn1)
                estado_siguiente = STATE_9;
		  STATE_5:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_10;
            else if (!btn1)
                estado_siguiente = STATE_11;
		  STATE_6:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_12;
            else if (!btn1)
                estado_siguiente = STATE_13;
		  STATE_7:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_14;
            else if (!btn1)
                estado_siguiente = STATE_15;
		  STATE_8:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_0;
            else if (!btn1)
                estado_siguiente = STATE_1;
		  STATE_9:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_2;
            else if (!btn1)
                estado_siguiente = STATE_3;
		  STATE_10:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_4;
            else if (!btn1)
                estado_siguiente = STATE_5;
		  STATE_11:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_6;
            else if (!btn1)
                estado_siguiente = STATE_7;
		  STATE_12:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_8;
            else if (!btn1)
                estado_siguiente = STATE_9;
		  STATE_13:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_10;
            else if (!btn1)
                estado_siguiente = STATE_11;
		  STATE_14:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_12;
            else if (!btn1)
                estado_siguiente = STATE_13;
		  STATE_15:
				if (!btn0) // Button pressed
                estado_siguiente = STATE_14;
            else if (!btn1)
                estado_siguiente = STATE_15; 
			default: 
				estado_siguiente = estado_actual;
    endcase
end


// Obtiene si el estado actual tiene al menos 2 1s cuando se presiona el boton
assign ledLight = (!btnEntry) && !(estado_actual == STATE_0 || 
estado_actual == STATE_1 || estado_actual == STATE_2 || estado_actual == STATE_4 || estado_actual == STATE_8);


endmodule