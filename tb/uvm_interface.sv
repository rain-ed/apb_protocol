interface apb_interface(input logic pclk, input logic preset_n);
//declare all the protocol signal with logic with logic keyword
//logic pclk;
//logic preset_n;  //logic=wire+reg
logic [1:0] paddr;
logic [1:0] pwdata;
logic [1:0] prdata;
logic pwrite;
logic penable;
logic pselx;
logic pslave_error;
logic pready;

//clocking block (synchronous signal)

clocking driver_cb @(posedge pclk);
default input #1  output #0;
output paddr;
output pwrite;
output pwdata;
input prdata;
output penable;
output pselx;
input pslave_error;
input pready;

endclocking

clocking monitor_cb @(posedge pclk);
default input #1  output #0;

input paddr;
input pwrite;
input pwdata;
input prdata;
input penable;
input pselx;
input pslave_error;
input pready;
	
endclocking

//modport (asynchronous signal)

modport driver(
output paddr,
output pwrite,
output pwdata,
input prdata,
output penable,
output pselx,
input pslave_error,
input pready
);

modport monitor(

input paddr,
input pwrite,
input pwdata,
input prdata,
input penable,
input pselx,
input pslave_error,
input pready
);

endinterface
