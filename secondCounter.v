module secondCounter (clk, clkOut);

input clk;
output reg clkOut=0;

reg [31:0] count = 0;

always @(negedge clk)
begin
	//if (count == 49999999)
	if (count == 10)
        begin
            clkOut <= ~clkOut;
            count <=0;
        end
    else
	    count <= count + 1;	
end
endmodule