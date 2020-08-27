module minuteCounter (seconds, reset, set, set_minutes, minutes);

input reset;
input set;
input [6:0] set_minutes;
input seconds;
output reg[6:0] minutes=0;

reg [5:0] count = 0;

always @(negedge seconds, posedge reset, posedge set)
begin
    if (reset == 1)
        begin
            minutes <= 0;
            count <= 0;
        end 
    else if (set == 1)
        begin
            minutes <= set_minutes;
            count <= 0;
        end 
	else if (count == 59)
        begin
            if (minutes == 59)
                minutes <= 0;

            else
                minutes <= minutes + 1;

            count <=0;
        end
	else
	     count <= count + 1;	
end

endmodule