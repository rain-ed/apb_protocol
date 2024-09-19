class apb_drv extends uvm_driver#(apb_seq_item);
	`uvm_component_utils(apb_drv)
virtual apb_interface apb_interface_h; //dynamic

	function new(string name, uvm_component parent);
		super.new(name, parent);
		$display("DRV");
	endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);  //if config_db is not set then if you try to do get you get a fatal error.
$display("BDRV");
if(!uvm_config_db#(virtual apb_interface)::get(this,"","apb_intf",apb_interface_h))  //get is a static function therefore we use ::
`uvm_fatal("APB","set the interface to get it")
endfunction
//apb_sequence_item tx;   //to use tx instead of req.

virtual task run_phase(uvm_phase phase);

//why not repeat(5)? again and again i need to chnage the value of the repeat in drv/ mon/scb..
//repeat(seq), forever(drv/mon/scb)
forever begin
seq_item_port.get_next_item(req); //req is the default sequence_item handle
req.print();
driver_logic(); //tx to pinwiggle
seq_item_port.item_done();
end
endtask
//driver 1. tx to pinwiggle 2. which signal need to come at what point of time

task driver_logic();

//apb_interface_h.driver_cb.penable  	<=0;

@(posedge apb_interface_h.pclk);begin    //thread mill or road run
apb_interface_h.driver_cb.paddr    	<=req.paddr;   //tx to pinwiggle
apb_interface_h.driver_cb.pwrite	  	<=req.pwrite;


//$display("paddr::%h", apb_interface_h.driver_cb.paddr);  //it means that the data has reached the interface.


if(req.pwrite==1)
begin

apb_interface_h.driver_cb.pwdata   	<=req.pwdata;

@(posedge apb_interface_h.pclk);
apb_interface_h.driver_cb.penable  	<=1;

end


if(req.pwrite==0) begin
req.prdata<=apb_interface_h.driver_cb.prdata;  //pinwiggle to tx
end


apb_interface_h.driver_cb.penable  	<=0;

apb_interface_h.driver_cb.pselx <=req.pselx;
req.pready     				<=apb_interface_h.driver_cb.pready;
req.pslave_error				<=apb_interface_h.driver_cb.pslave_error;


end
endtask

//task monitor_logic();
//req.paddr			=apb_interface_h.monitor_cb.paddr;		
//req.pwrite			=apb_interface_h.monitor_cb.pwrite;
//req.pwdata			=apb_interface_h.monitor_cb.pwdata;
//req.penable			=apb_interface_h.monitor_cb.penable;
//req.prdata			=apb_interface_h.monitor_cb.prdata;
//req.pready			=apb_interface_h.monitor_cb.pready;
//req.pslave_error		=apb_interface_h.monitor_cb.pslave_error;
//endtask

endclass
