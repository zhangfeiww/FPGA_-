module clock_top(
	input		wire			clk		,
	input		wire			rstn	,
	
	output		wire	[7:0]	seg		,
	output		wire	[5:0]	sel
);
				wire    [4:0]   hour    ;
				wire    [5:0]   min     ;
				wire    [5:0]   sec     ;

counter u0_counter(

	.clk	(clk),		
	.rstn	(rstn),
	.hour	(hour),
	.min	(min),
	.sec	(sec)
);

seg_driver u0_seg_driver(
   	.clk	(clk)	,
   	.rstn	(rstn)	,
	.hour	(hour)	,
	.min	(min)	,
	.sec	(sec)	,

	.seg	(seg)	,
	.sel	(sel)	
);
endmodule
