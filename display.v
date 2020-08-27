module display (clk, reset, set, set_hours, set_minutes, sec, min, hrs);

input reset;
input set;
input [4:0] set_hours;
input [6:0] set_minutes;
input clk;
output sec;
output [6:0] min;
output [4:0] hrs;

secondCounter secondCounterInst(.clk(clk), .clkOut(sec));
minuteCounter minuteCounterInst(.seconds(sec), .reset(reset), .set(set), .set_minutes(set_minutes), .minutes(min));
hourCounter hourCounterInst(.seconds(sec), .minutes(min), .reset(reset), .set(set), .set_hours(set_hours), .hours(hrs));

endmodule