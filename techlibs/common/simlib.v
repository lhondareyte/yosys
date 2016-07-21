/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2012  Clifford Wolf <clifford@clifford.at>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *  ---
 *
 *  The Simulation Library.
 *
 *  This Verilog library contains simple simulation models for the internal
 *  cells ($not, ...) generated by the frontends and used in most passes.
 *
 *  This library can be used to verify the internal netlists as generated
 *  by the different frontends and passes.
 *
 *  Note that memory can only be simulated when all $memrd and $memwr cells
 *  have been merged to stand-alone $mem cells (this is what the "memory_collect"
 *  pass is doing).
 *
 */

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $not (A, Y)
//-
//- A bit-wise inverter. This corresponds to the Verilog unary prefix '~' operator.
//-
module \$not (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = ~$signed(A);
	end else begin:BLOCK2
		assign Y = ~A;
	end
endgenerate

endmodule


// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $pos (A, Y)
//-
//- A buffer. This corresponds to the Verilog unary prefix '+' operator.
//-
module \$pos (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = $signed(A);
	end else begin:BLOCK2
		assign Y = A;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $neg (A, Y)
//-
//- An arithmetic inverter. This corresponds to the Verilog unary prefix '-' operator.
//-
module \$neg (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = -$signed(A);
	end else begin:BLOCK2
		assign Y = -A;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $and (A, B, Y)
//-
//- A bit-wise AND. This corresponds to the Verilog '&' operator.
//-
module \$and (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) & $signed(B);
	end else begin:BLOCK2
		assign Y = A & B;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $or (A, B, Y)
//-
//- A bit-wise OR. This corresponds to the Verilog '|' operator.
//-
module \$or (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) | $signed(B);
	end else begin:BLOCK2
		assign Y = A | B;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $xor (A, B, Y)
//-
//- A bit-wise XOR. This corresponds to the Verilog '^' operator.
//-
module \$xor (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) ^ $signed(B);
	end else begin:BLOCK2
		assign Y = A ^ B;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $xnor (A, B, Y)
//-
//- A bit-wise XNOR. This corresponds to the Verilog '~^' operator.
//-
module \$xnor (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) ~^ $signed(B);
	end else begin:BLOCK2
		assign Y = A ~^ B;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $reduce_and (A, B, Y)
//-
//- An AND reduction. This corresponds to the Verilog unary prefix '&' operator.
//-
module \$reduce_and (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = &$signed(A);
	end else begin:BLOCK2
		assign Y = &A;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $reduce_or (A, B, Y)
//-
//- An OR reduction. This corresponds to the Verilog unary prefix '|' operator.
//-
module \$reduce_or (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = |$signed(A);
	end else begin:BLOCK2
		assign Y = |A;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $reduce_xor (A, B, Y)
//-
//- A XOR reduction. This corresponds to the Verilog unary prefix '^' operator.
//-
module \$reduce_xor (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = ^$signed(A);
	end else begin:BLOCK2
		assign Y = ^A;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $reduce_xnor (A, B, Y)
//-
//- A XNOR reduction. This corresponds to the Verilog unary prefix '~^' operator.
//-
module \$reduce_xnor (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = ~^$signed(A);
	end else begin:BLOCK2
		assign Y = ~^A;
	end
endgenerate

endmodule

// --------------------------------------------------------

//  |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
//-
//-     $reduce_bool (A, B, Y)
//-
//- An OR reduction. This cell type is used instead of $reduce_or when a signal is
//- implicitly converted to a boolean signal, e.g. for operands of '&&' and '||'.
//-
module \$reduce_bool (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = !(!$signed(A));
	end else begin:BLOCK2
		assign Y = !(!A);
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$shl (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = $signed(A) << B;
	end else begin:BLOCK2
		assign Y = A << B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$shr (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = $signed(A) >> B;
	end else begin:BLOCK2
		assign Y = A >> B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$sshl (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = $signed(A) <<< B;
	end else begin:BLOCK2
		assign Y = A <<< B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$sshr (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = $signed(A) >>> B;
	end else begin:BLOCK2
		assign Y = A >>> B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$shift (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (B_SIGNED) begin:BLOCK1
		assign Y = $signed(B) < 0 ? A << -B : A >> B;
	end else begin:BLOCK2
		assign Y = A >> B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$shiftx (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (Y_WIDTH > 0)
		if (B_SIGNED) begin:BLOCK1
			assign Y = A[$signed(B) +: Y_WIDTH];
		end else begin:BLOCK2
			assign Y = A[B +: Y_WIDTH];
		end
endgenerate

endmodule

// --------------------------------------------------------

module \$fa (A, B, C, X, Y);

parameter WIDTH = 1;

input [WIDTH-1:0] A, B, C;
output [WIDTH-1:0] X, Y;

wire [WIDTH-1:0] t1, t2, t3;

assign t1 = A ^ B, t2 = A & B, t3 = C & t1;
assign Y = t1 ^ C, X = (t2 | t3) ^ (Y ^ Y);

endmodule

// --------------------------------------------------------

module \$lcu (P, G, CI, CO);

parameter WIDTH = 1;

input [WIDTH-1:0] P, G;
input CI;

output reg [WIDTH-1:0] CO;

integer i;
always @* begin
	CO = 'bx;
	if (^{P, G, CI} !== 1'bx) begin
		CO[0] = G[0] || (P[0] && CI);
		for (i = 1; i < WIDTH; i = i+1)
			CO[i] = G[i] || (P[i] && CO[i-1]);
	end
end

endmodule

// --------------------------------------------------------

module \$alu (A, B, CI, BI, X, Y, CO);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 1;
parameter B_WIDTH = 1;
parameter Y_WIDTH = 1;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] X, Y;

input CI, BI;
output [Y_WIDTH-1:0] CO;

wire [Y_WIDTH-1:0] AA, BB;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign AA = $signed(A), BB = BI ? ~$signed(B) : $signed(B);
	end else begin:BLOCK2
		assign AA = $unsigned(A), BB = BI ? ~$unsigned(B) : $unsigned(B);
	end
endgenerate

// this is 'x' if Y and CO should be all 'x', and '0' otherwise
wire y_co_undef = ^{A, A, B, B, CI, CI, BI, BI};

assign X = AA ^ BB;
assign Y = (AA + BB + CI) ^ {Y_WIDTH{y_co_undef}};

function get_carry;
	input a, b, c;
	get_carry = (a&b) | (a&c) | (b&c);
endfunction

genvar i;
generate
	assign CO[0] = get_carry(AA[0], BB[0], CI) ^ y_co_undef;
	for (i = 1; i < Y_WIDTH; i = i+1) begin:BLOCK3
		assign CO[i] = get_carry(AA[i], BB[i], CO[i-1]) ^ y_co_undef;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$lt (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) < $signed(B);
	end else begin:BLOCK2
		assign Y = A < B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$le (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) <= $signed(B);
	end else begin:BLOCK2
		assign Y = A <= B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$eq (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) == $signed(B);
	end else begin:BLOCK2
		assign Y = A == B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$ne (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) != $signed(B);
	end else begin:BLOCK2
		assign Y = A != B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$eqx (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) === $signed(B);
	end else begin:BLOCK2
		assign Y = A === B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$nex (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) !== $signed(B);
	end else begin:BLOCK2
		assign Y = A !== B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$ge (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) >= $signed(B);
	end else begin:BLOCK2
		assign Y = A >= B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$gt (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) > $signed(B);
	end else begin:BLOCK2
		assign Y = A > B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$add (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) + $signed(B);
	end else begin:BLOCK2
		assign Y = A + B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$sub (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) - $signed(B);
	end else begin:BLOCK2
		assign Y = A - B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$mul (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) * $signed(B);
	end else begin:BLOCK2
		assign Y = A * B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$macc (A, B, Y);

parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;
parameter CONFIG = 4'b0000;
parameter CONFIG_WIDTH = 4;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output reg [Y_WIDTH-1:0] Y;

// Xilinx XSIM does not like $clog2() below..
function integer my_clog2;
	input integer v;
	begin
		if (v > 0)
			v = v - 1;
		my_clog2 = 0;
		while (v) begin
			v = v >> 1;
			my_clog2 = my_clog2 + 1;
		end
	end
endfunction

localparam integer num_bits = CONFIG[3:0] > 0 ? CONFIG[3:0] : 1;
localparam integer num_ports = (CONFIG_WIDTH-4) / (2 + 2*num_bits);
localparam integer num_abits = my_clog2(A_WIDTH) > 0 ? my_clog2(A_WIDTH) : 1;

function [2*num_ports*num_abits-1:0] get_port_offsets;
	input [CONFIG_WIDTH-1:0] cfg;
	integer i, cursor;
	begin
		cursor = 0;
		get_port_offsets = 0;
		for (i = 0; i < num_ports; i = i+1) begin
			get_port_offsets[(2*i + 0)*num_abits +: num_abits] = cursor;
			cursor = cursor + cfg[4 + i*(2 + 2*num_bits) + 2 +: num_bits];
			get_port_offsets[(2*i + 1)*num_abits +: num_abits] = cursor;
			cursor = cursor + cfg[4 + i*(2 + 2*num_bits) + 2 + num_bits +: num_bits];
		end
	end
endfunction

localparam [2*num_ports*num_abits-1:0] port_offsets = get_port_offsets(CONFIG);

`define PORT_IS_SIGNED   (0 + CONFIG[4 + i*(2 + 2*num_bits)])
`define PORT_DO_SUBTRACT (0 + CONFIG[4 + i*(2 + 2*num_bits) + 1])
`define PORT_SIZE_A      (0 + CONFIG[4 + i*(2 + 2*num_bits) + 2 +: num_bits])
`define PORT_SIZE_B      (0 + CONFIG[4 + i*(2 + 2*num_bits) + 2 + num_bits +: num_bits])
`define PORT_OFFSET_A    (0 + port_offsets[2*i*num_abits +: num_abits])
`define PORT_OFFSET_B    (0 + port_offsets[2*i*num_abits + num_abits +: num_abits])

integer i, j;
reg [Y_WIDTH-1:0] tmp_a, tmp_b;

always @* begin
	Y = 0;
	for (i = 0; i < num_ports; i = i+1)
	begin
		tmp_a = 0;
		tmp_b = 0;

		for (j = 0; j < `PORT_SIZE_A; j = j+1)
			tmp_a[j] = A[`PORT_OFFSET_A + j];

		if (`PORT_IS_SIGNED && `PORT_SIZE_A > 0)
			for (j = `PORT_SIZE_A; j < Y_WIDTH; j = j+1)
				tmp_a[j] = tmp_a[`PORT_SIZE_A-1];

		for (j = 0; j < `PORT_SIZE_B; j = j+1)
			tmp_b[j] = A[`PORT_OFFSET_B + j];

		if (`PORT_IS_SIGNED && `PORT_SIZE_B > 0)
			for (j = `PORT_SIZE_B; j < Y_WIDTH; j = j+1)
				tmp_b[j] = tmp_b[`PORT_SIZE_B-1];

		if (`PORT_SIZE_B > 0)
			tmp_a = tmp_a * tmp_b;

		if (`PORT_DO_SUBTRACT)
			Y = Y - tmp_a;
		else
			Y = Y + tmp_a;
	end
	for (i = 0; i < B_WIDTH; i = i+1) begin
		Y = Y + B[i];
	end
end

`undef PORT_IS_SIGNED
`undef PORT_DO_SUBTRACT
`undef PORT_SIZE_A
`undef PORT_SIZE_B
`undef PORT_OFFSET_A
`undef PORT_OFFSET_B

endmodule

// --------------------------------------------------------

module \$div (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) / $signed(B);
	end else begin:BLOCK2
		assign Y = A / B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$mod (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) % $signed(B);
	end else begin:BLOCK2
		assign Y = A % B;
	end
endgenerate

endmodule

// --------------------------------------------------------
`ifndef SIMLIB_NOPOW

module \$pow (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) ** $signed(B);
	end else if (A_SIGNED) begin:BLOCK2
		assign Y = $signed(A) ** B;
	end else if (B_SIGNED) begin:BLOCK3
		assign Y = A ** $signed(B);
	end else begin:BLOCK4
		assign Y = A ** B;
	end
endgenerate

endmodule

`endif
// --------------------------------------------------------

module \$logic_not (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED) begin:BLOCK1
		assign Y = !$signed(A);
	end else begin:BLOCK2
		assign Y = !A;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$logic_and (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) && $signed(B);
	end else begin:BLOCK2
		assign Y = A && B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$logic_or (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

generate
	if (A_SIGNED && B_SIGNED) begin:BLOCK1
		assign Y = $signed(A) || $signed(B);
	end else begin:BLOCK2
		assign Y = A || B;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$slice (A, Y);

parameter OFFSET = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
output [Y_WIDTH-1:0] Y;

assign Y = A >> OFFSET;

endmodule

// --------------------------------------------------------

module \$concat (A, B, Y);

parameter A_WIDTH = 0;
parameter B_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [A_WIDTH+B_WIDTH-1:0] Y;

assign Y = {B, A};

endmodule

// --------------------------------------------------------

module \$mux (A, B, S, Y);

parameter WIDTH = 0;

input [WIDTH-1:0] A, B;
input S;
output reg [WIDTH-1:0] Y;

always @* begin
	if (S)
		Y = B;
	else
		Y = A;
end

endmodule

// --------------------------------------------------------

module \$pmux (A, B, S, Y);

parameter WIDTH = 0;
parameter S_WIDTH = 0;

input [WIDTH-1:0] A;
input [WIDTH*S_WIDTH-1:0] B;
input [S_WIDTH-1:0] S;
output reg [WIDTH-1:0] Y;

integer i;
reg found_active_sel_bit;

always @* begin
	Y = A;
	found_active_sel_bit = 0;
	for (i = 0; i < S_WIDTH; i = i+1)
		if (S[i]) begin
			Y = found_active_sel_bit ? 'bx : B >> (WIDTH*i);
			found_active_sel_bit = 1;
		end
end

endmodule

// --------------------------------------------------------
`ifndef SIMLIB_NOLUT

module \$lut (A, Y);

parameter WIDTH = 0;
parameter LUT = 0;

input [WIDTH-1:0] A;
output reg Y;

wire lut0_out, lut1_out;

generate
	if (WIDTH <= 1) begin:simple
		assign {lut1_out, lut0_out} = LUT;
	end else begin:complex
		\$lut #( .WIDTH(WIDTH-1), .LUT(LUT                  ) ) lut0 ( .A(A[WIDTH-2:0]), .Y(lut0_out) );
		\$lut #( .WIDTH(WIDTH-1), .LUT(LUT >> (2**(WIDTH-1))) ) lut1 ( .A(A[WIDTH-2:0]), .Y(lut1_out) );
	end

	if (WIDTH > 0) begin:lutlogic
		always @* begin
			casez ({A[WIDTH-1], lut0_out, lut1_out})
				3'b?11: Y = 1'b1;
				3'b?00: Y = 1'b0;
				3'b0??: Y = lut0_out;
				3'b1??: Y = lut1_out;
				default: Y = 1'bx;
			endcase
		end
	end
endgenerate

endmodule

`endif
// --------------------------------------------------------

module \$sop (A, Y);

parameter WIDTH = 0;
parameter DEPTH = 0;
parameter TABLE = 0;

input [WIDTH-1:0] A;
output reg Y;

integer i, j;
reg match;

always @* begin
	Y = 0;
	for (i = 0; i < DEPTH; i=i+1) begin
		match = 1;
		for (j = 0; j < WIDTH; j=j+1) begin
			if (TABLE[2*WIDTH*i + 2*j + 0] && A[j]) match = 0;
			if (TABLE[2*WIDTH*i + 2*j + 1] && !A[j]) match = 0;
		end
		if (match) Y = 1;
	end
end

endmodule

// --------------------------------------------------------

module \$tribuf (A, EN, Y);

parameter WIDTH = 0;

input [WIDTH-1:0] A;
input EN;
output [WIDTH-1:0] Y;

assign Y = EN ? A : 'bz;

endmodule

// --------------------------------------------------------

module \$assert (A, EN);

input A, EN;

`ifndef SIMLIB_NOCHECKS
always @* begin
	if (A !== 1'b1 && EN === 1'b1) begin
		$display("Assertion %m failed!");
		$stop;
	end
end
`endif

endmodule

// --------------------------------------------------------

module \$assume (A, EN);

input A, EN;

`ifndef SIMLIB_NOCHECKS
always @* begin
	if (A !== 1'b1 && EN === 1'b1) begin
		$display("Assumption %m failed!");
		$stop;
	end
end
`endif

endmodule

// --------------------------------------------------------

module \$predict (A, EN);

input A, EN;

endmodule

// --------------------------------------------------------

module \$initstate (Y);

output reg Y = 1;
reg [3:0] cnt = 1;
reg trig = 0;

initial trig <= 1;

always @(cnt, trig) begin
	Y <= |cnt;
	cnt <= cnt + |cnt;
end

endmodule

// --------------------------------------------------------

module \$equiv (A, B, Y);

input A, B;
output Y;

assign Y = (A !== 1'bx && A !== B) ? 1'bx : A;

`ifndef SIMLIB_NOCHECKS
always @* begin
	if (A !== 1'bx && A !== B) begin
		$display("Equivalence failed!");
		$stop;
	end
end
`endif

endmodule

// --------------------------------------------------------
`ifndef SIMLIB_NOSR

module \$sr (SET, CLR, Q);

parameter WIDTH = 0;
parameter SET_POLARITY = 1'b1;
parameter CLR_POLARITY = 1'b1;

input [WIDTH-1:0] SET, CLR;
output reg [WIDTH-1:0] Q;

wire [WIDTH-1:0] pos_set = SET_POLARITY ? SET : ~SET;
wire [WIDTH-1:0] pos_clr = CLR_POLARITY ? CLR : ~CLR;

genvar i;
generate
	for (i = 0; i < WIDTH; i = i+1) begin:bitslices
		always @(posedge pos_set[i], posedge pos_clr[i])
			if (pos_clr[i])
				Q[i] <= 0;
			else if (pos_set[i])
				Q[i] <= 1;
	end
endgenerate

endmodule

`endif
// --------------------------------------------------------

module \$dff (CLK, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;

input CLK;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;

always @(posedge pos_clk) begin
	Q <= D;
end

endmodule

// --------------------------------------------------------

module \$dffe (CLK, EN, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter EN_POLARITY = 1'b1;

input CLK, EN;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;

always @(posedge pos_clk) begin
	if (EN == EN_POLARITY) Q <= D;
end

endmodule

// --------------------------------------------------------
`ifndef SIMLIB_NOSR

module \$dffsr (CLK, SET, CLR, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter SET_POLARITY = 1'b1;
parameter CLR_POLARITY = 1'b1;

input CLK;
input [WIDTH-1:0] SET, CLR, D;
output reg [WIDTH-1:0] Q;

wire pos_clk = CLK == CLK_POLARITY;
wire [WIDTH-1:0] pos_set = SET_POLARITY ? SET : ~SET;
wire [WIDTH-1:0] pos_clr = CLR_POLARITY ? CLR : ~CLR;

genvar i;
generate
	for (i = 0; i < WIDTH; i = i+1) begin:bitslices
		always @(posedge pos_set[i], posedge pos_clr[i], posedge pos_clk)
			if (pos_clr[i])
				Q[i] <= 0;
			else if (pos_set[i])
				Q[i] <= 1;
			else
				Q[i] <= D[i];
	end
endgenerate

endmodule

`endif
// --------------------------------------------------------

module \$adff (CLK, ARST, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter ARST_POLARITY = 1'b1;
parameter ARST_VALUE = 0;

input CLK, ARST;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;
wire pos_arst = ARST == ARST_POLARITY;

always @(posedge pos_clk, posedge pos_arst) begin
	if (pos_arst)
		Q <= ARST_VALUE;
	else
		Q <= D;
end

endmodule

// --------------------------------------------------------

module \$dlatch (EN, D, Q);

parameter WIDTH = 0;
parameter EN_POLARITY = 1'b1;

input EN;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;

always @* begin
	if (EN == EN_POLARITY)
		Q = D;
end

endmodule

// --------------------------------------------------------
`ifndef SIMLIB_NOSR

module \$dlatchsr (EN, SET, CLR, D, Q);

parameter WIDTH = 0;
parameter EN_POLARITY = 1'b1;
parameter SET_POLARITY = 1'b1;
parameter CLR_POLARITY = 1'b1;

input EN;
input [WIDTH-1:0] SET, CLR, D;
output reg [WIDTH-1:0] Q;

wire pos_en = EN == EN_POLARITY;
wire [WIDTH-1:0] pos_set = SET_POLARITY ? SET : ~SET;
wire [WIDTH-1:0] pos_clr = CLR_POLARITY ? CLR : ~CLR;

genvar i;
generate
	for (i = 0; i < WIDTH; i = i+1) begin:bitslices
		always @*
			if (pos_clr[i])
				Q[i] = 0;
			else if (pos_set[i])
				Q[i] = 1;
			else if (pos_en)
				Q[i] = D[i];
	end
endgenerate

endmodule

`endif
// --------------------------------------------------------

module \$fsm (CLK, ARST, CTRL_IN, CTRL_OUT);

parameter NAME = "";

parameter CLK_POLARITY = 1'b1;
parameter ARST_POLARITY = 1'b1;

parameter CTRL_IN_WIDTH = 1;
parameter CTRL_OUT_WIDTH = 1;

parameter STATE_BITS = 1;
parameter STATE_NUM = 1;
parameter STATE_NUM_LOG2 = 1;
parameter STATE_RST = 0;
parameter STATE_TABLE = 1'b0;

parameter TRANS_NUM = 1;
parameter TRANS_TABLE = 4'b0x0x;

input CLK, ARST;
input [CTRL_IN_WIDTH-1:0] CTRL_IN;
output reg [CTRL_OUT_WIDTH-1:0] CTRL_OUT;

wire pos_clk = CLK == CLK_POLARITY;
wire pos_arst = ARST == ARST_POLARITY;

reg [STATE_BITS-1:0] state;
reg [STATE_BITS-1:0] state_tmp;
reg [STATE_BITS-1:0] next_state;

reg [STATE_BITS-1:0] tr_state_in;
reg [STATE_BITS-1:0] tr_state_out;
reg [CTRL_IN_WIDTH-1:0] tr_ctrl_in;
reg [CTRL_OUT_WIDTH-1:0] tr_ctrl_out;

integer i;

task tr_fetch;
	input [31:0] tr_num;
	reg [31:0] tr_pos;
	reg [STATE_NUM_LOG2-1:0] state_num;
	begin
		tr_pos = (2*STATE_NUM_LOG2+CTRL_IN_WIDTH+CTRL_OUT_WIDTH)*tr_num;
		tr_ctrl_out = TRANS_TABLE >> tr_pos;
		tr_pos = tr_pos + CTRL_OUT_WIDTH;
		state_num = TRANS_TABLE >> tr_pos;
		tr_state_out = STATE_TABLE >> (STATE_BITS*state_num);
		tr_pos = tr_pos + STATE_NUM_LOG2;
		tr_ctrl_in = TRANS_TABLE >> tr_pos;
		tr_pos = tr_pos + CTRL_IN_WIDTH;
		state_num = TRANS_TABLE >> tr_pos;
		tr_state_in = STATE_TABLE >> (STATE_BITS*state_num);
		tr_pos = tr_pos + STATE_NUM_LOG2;
	end
endtask

always @(posedge pos_clk, posedge pos_arst) begin
	if (pos_arst) begin
		state_tmp = STATE_TABLE[STATE_BITS*(STATE_RST+1)-1:STATE_BITS*STATE_RST];
		for (i = 0; i < STATE_BITS; i = i+1)
			if (state_tmp[i] === 1'bz)
				state_tmp[i] = 0;
		state <= state_tmp;
	end else begin
		state_tmp = next_state;
		for (i = 0; i < STATE_BITS; i = i+1)
			if (state_tmp[i] === 1'bz)
				state_tmp[i] = 0;
		state <= state_tmp;
	end
end

always @(state, CTRL_IN) begin
	next_state <= STATE_TABLE[STATE_BITS*(STATE_RST+1)-1:STATE_BITS*STATE_RST];
	CTRL_OUT <= 'bx;
	// $display("---");
	// $display("Q: %b %b", state, CTRL_IN);
	for (i = 0; i < TRANS_NUM; i = i+1) begin
		tr_fetch(i);
		// $display("T: %b %b -> %b %b [%d]", tr_state_in, tr_ctrl_in, tr_state_out, tr_ctrl_out, i);
		casez ({state, CTRL_IN})
			{tr_state_in, tr_ctrl_in}: begin
				// $display("-> %b %b <-   MATCH", state, CTRL_IN);
				{next_state, CTRL_OUT} <= {tr_state_out, tr_ctrl_out};
			end
		endcase
	end
end

endmodule

// --------------------------------------------------------
`ifndef SIMLIB_NOMEM

module \$memrd (CLK, EN, ADDR, DATA);

parameter MEMID = "";
parameter ABITS = 8;
parameter WIDTH = 8;

parameter CLK_ENABLE = 0;
parameter CLK_POLARITY = 0;
parameter TRANSPARENT = 0;

input CLK, EN;
input [ABITS-1:0] ADDR;
output [WIDTH-1:0] DATA;

initial begin
	if (MEMID != "") begin
		$display("ERROR: Found non-simulatable instance of $memrd!");
		$finish;
	end
end

endmodule

// --------------------------------------------------------

module \$memwr (CLK, EN, ADDR, DATA);

parameter MEMID = "";
parameter ABITS = 8;
parameter WIDTH = 8;

parameter CLK_ENABLE = 0;
parameter CLK_POLARITY = 0;
parameter PRIORITY = 0;

input CLK;
input [WIDTH-1:0] EN;
input [ABITS-1:0] ADDR;
input [WIDTH-1:0] DATA;

initial begin
	if (MEMID != "") begin
		$display("ERROR: Found non-simulatable instance of $memwr!");
		$finish;
	end
end

endmodule

// --------------------------------------------------------

module \$meminit (ADDR, DATA);

parameter MEMID = "";
parameter ABITS = 8;
parameter WIDTH = 8;
parameter WORDS = 1;

parameter PRIORITY = 0;

input [ABITS-1:0] ADDR;
input [WORDS*WIDTH-1:0] DATA;

initial begin
	if (MEMID != "") begin
		$display("ERROR: Found non-simulatable instance of $meminit!");
		$finish;
	end
end

endmodule

// --------------------------------------------------------

module \$mem (RD_CLK, RD_EN, RD_ADDR, RD_DATA, WR_CLK, WR_EN, WR_ADDR, WR_DATA);

parameter MEMID = "";
parameter signed SIZE = 4;
parameter signed OFFSET = 0;
parameter signed ABITS = 2;
parameter signed WIDTH = 8;
parameter signed INIT = 1'bx;

parameter signed RD_PORTS = 1;
parameter RD_CLK_ENABLE = 1'b1;
parameter RD_CLK_POLARITY = 1'b1;
parameter RD_TRANSPARENT = 1'b1;

parameter signed WR_PORTS = 1;
parameter WR_CLK_ENABLE = 1'b1;
parameter WR_CLK_POLARITY = 1'b1;

input [RD_PORTS-1:0] RD_CLK;
input [RD_PORTS-1:0] RD_EN;
input [RD_PORTS*ABITS-1:0] RD_ADDR;
output reg [RD_PORTS*WIDTH-1:0] RD_DATA;

input [WR_PORTS-1:0] WR_CLK;
input [WR_PORTS*WIDTH-1:0] WR_EN;
input [WR_PORTS*ABITS-1:0] WR_ADDR;
input [WR_PORTS*WIDTH-1:0] WR_DATA;

reg [WIDTH-1:0] memory [SIZE-1:0];

integer i, j;
reg [WR_PORTS-1:0] LAST_WR_CLK;
reg [RD_PORTS-1:0] LAST_RD_CLK;

function port_active;
	input clk_enable;
	input clk_polarity;
	input last_clk;
	input this_clk;
	begin
		casez ({clk_enable, clk_polarity, last_clk, this_clk})
			4'b0???: port_active = 1;
			4'b1101: port_active = 1;
			4'b1010: port_active = 1;
			default: port_active = 0;
		endcase
	end
endfunction

initial begin
	for (i = 0; i < SIZE; i = i+1)
		memory[i] = INIT >>> (i*WIDTH);
end

always @(RD_CLK, RD_ADDR, RD_DATA, WR_CLK, WR_EN, WR_ADDR, WR_DATA) begin
`ifdef SIMLIB_MEMDELAY
	#`SIMLIB_MEMDELAY;
`endif
	for (i = 0; i < RD_PORTS; i = i+1) begin
		if (!RD_TRANSPARENT[i] && RD_CLK_ENABLE[i] && RD_EN[i] && port_active(RD_CLK_ENABLE[i], RD_CLK_POLARITY[i], LAST_RD_CLK[i], RD_CLK[i])) begin
			// $display("Read from %s: addr=%b data=%b", MEMID, RD_ADDR[i*ABITS +: ABITS],  memory[RD_ADDR[i*ABITS +: ABITS] - OFFSET]);
			RD_DATA[i*WIDTH +: WIDTH] <= memory[RD_ADDR[i*ABITS +: ABITS] - OFFSET];
		end
	end

	for (i = 0; i < WR_PORTS; i = i+1) begin
		if (port_active(WR_CLK_ENABLE[i], WR_CLK_POLARITY[i], LAST_WR_CLK[i], WR_CLK[i]))
			for (j = 0; j < WIDTH; j = j+1)
				if (WR_EN[i*WIDTH+j]) begin
					// $display("Write to %s: addr=%b data=%b", MEMID, WR_ADDR[i*ABITS +: ABITS], WR_DATA[i*WIDTH+j]);
					memory[WR_ADDR[i*ABITS +: ABITS] - OFFSET][j] = WR_DATA[i*WIDTH+j];
				end
	end

	for (i = 0; i < RD_PORTS; i = i+1) begin
		if ((RD_TRANSPARENT[i] || !RD_CLK_ENABLE[i]) && port_active(RD_CLK_ENABLE[i], RD_CLK_POLARITY[i], LAST_RD_CLK[i], RD_CLK[i])) begin
			// $display("Transparent read from %s: addr=%b data=%b", MEMID, RD_ADDR[i*ABITS +: ABITS],  memory[RD_ADDR[i*ABITS +: ABITS] - OFFSET]);
			RD_DATA[i*WIDTH +: WIDTH] <= memory[RD_ADDR[i*ABITS +: ABITS] - OFFSET];
		end
	end

	LAST_RD_CLK <= RD_CLK;
	LAST_WR_CLK <= WR_CLK;
end

endmodule

`endif
// --------------------------------------------------------
