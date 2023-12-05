module counter(
	input	wire			clk		,
	input	wire			rstn	,

	output	reg		[4:0]	hour	,
	output	reg		[5:0]	min		,
	output	reg		[5:0]	sec

);

localparam MAX_1S	=	26'd50_000_000	;
localparam MAX_DAY	=	17'd86_400		;

reg		[25:0]		cnt_1s;
reg		[16:0]		cnt_day;

//1s counter
always@(posedge clk or negedge rstn)begin
	if(!rstn)
		cnt_1s <= 26'd0;
	else if (cnt_1s == MAX_1S -1'd1)
		cnt_1s <= 26'd0;
	else
		cnt_1s <= cnt_1s + 1'd1;
end


//day counter
always@(posedge clk or negedge rstn)begin
	if(!rstn)
		cnt_day <= 17'd0;
	else if (cnt_day == MAX_DAY -1'd1 && cnt_1s == MAX_1S -1'd1)
		cnt_day <= 26'd0;
	else if(cnt_1s == MAX_1S -1'd1)
		cnt_day <= cnt_day + 1'd1;
	else
		cnt_day <= cnt_day;
end

always@(*)begin
	hour 	= 	cnt_day	/ 12'd3600					;
	min		=	(cnt_day % 12'd3600) / 6'd60		;
	sec		=	(cnt_day % 12'd3600) % 6'd60		;
end

endmodule
