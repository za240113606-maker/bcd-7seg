
`default_nettype none


module tt_um_bcd_7seg (
    input  wire [7:0] ui_in,    // Entradas dedicadas: ui_in[3:0] = BCD
    output wire [7:0] uo_out,   // Salidas dedicadas: uo_out[6:0] = {g,f,e,d,c,b,a}
    input  wire [7:0] uio_in,   // Entradas bidireccionales
    output wire [7:0] uio_out,  // Salidas bidireccionales
    output wire [7:0] uio_oe,   // Habilitación de salida bidireccional (1 = salida)
    input  wire       ena,      // Habilitación del diseño
    input  wire       clk,      // Reloj
    input  wire       rst_n     // Reset activo en bajo
);

    wire [3:0] bcd = ui_in[3:0];
    reg  [6:0] seg; // {g, f, e, d, c, b, a}, 1 = segmento encendido

    always @(*) begin
        case (bcd)
            4'd0:    seg = 7'b011_1111;
            4'd1:    seg = 7'b000_0110;
            4'd2:    seg = 7'b101_1011;
            4'd3:    seg = 7'b100_1111;
            4'd4:    seg = 7'b110_0110;
            4'd5:    seg = 7'b110_1101;
            4'd6:    seg = 7'b111_1101;
            4'd7:    seg = 7'b000_0111;
            4'd8:    seg = 7'b111_1111;
            4'd9:    seg = 7'b110_1111;
            default: seg = 7'b000_0000; // Apagado para valores inválidos (10..15)
        endcase
    end

    assign uo_out  = {1'b0, seg};
    assign uio_out = 8'b0000_0000;
    assign uio_oe  = 8'b0000_0000;

    // Evita warnings por señales no usadas en diseño puramente combinacional
    wire _unused = &{ena, clk, rst_n, uio_in, ui_in[7:4], 1'b0};

endmodule
