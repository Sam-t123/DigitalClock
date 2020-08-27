module hourCounter (seconds, minutes, reset, set, set_hours, hours);

input reset;
input set;
input [4:0] set_hours;
input seconds;
input [6:0] minutes;
output reg[4:0] hours=0;

reg [6:0] count = 0;

always @(negedge seconds, posedge reset, posedge set)
    begin
        if (reset == 1)
            begin
                hours <= 0;
                count <= 0;
            end 
        else if (set == 1)
            begin
                hours <= set_hours;
                count <= 0;
            end 
        else if (minutes == 59)
        begin

            if (count == 59)
                begin
                    if (hours == 23)
                        hours <= 0;
                    else
                        hours <= hours + 1;
                    count <= 0;           
                end
            else
                count <= count +1;
        end
            
    end

endmodule