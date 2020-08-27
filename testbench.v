module testbench();
reg built_in_clock;
wire Seconds;
reg set;
reg reset;
reg [4:0] set_hours;
reg [6:0] set_minutes;
wire [6:0] Minutes;
wire [4:0] Hours;

display displayInst(.clk(built_in_clock), .reset(reset), .set(set), .set_hours(set_hours), .set_minutes(set_minutes), .sec(Seconds), .min(Minutes), .hrs(Hours));


initial
begin
     built_in_clock= 1'b0;	
	 reset = 0;
	 set = 0;
	 set_hours = 0;
	 set_minutes = 0; 
end

always
	#1 built_in_clock=~built_in_clock;
	   
initial
begin
	#4000000 reset = 1;
	#100 reset =0;
	#100000 set = 1;
		  set_hours = 12;
		  set_minutes = 30;
	#100 set = 0;
	#50000 $finish;
end
// Monitor the outputs
	//initial
	//$monitor($time," CLK= %b, SECS= %b, MINS= %b, HRS= %b", CLK, SEC, MIN, HRS);

//Dumping the VCD file	
	initial
	begin
		$dumpfile("display.vcd");
		$dumpvars();
	end
endmodule