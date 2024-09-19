class apb_mon extends uvm_monitor;
`uvm_component_utils(apb_mon)
virtual apb_interface apb_interface_h; //dynamic
apb_seq_item req;
uvm_analysis_port #(apb_seq_item) monitor_port;
	//condttructor
function new(string name, uvm_component parent);
super.new(name, parent);
		$display("MON");

//we are creating the analysis port.
monitor_port=new("monitor_port",this);

endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);  //if config_db is not set then if you try to do get you get a fatal error.
$display("BMON");
if(!uvm_config_db#(virtual apb_interface)::get(this,"","apb_intf",apb_interface_h))  //get is a static function therefore we use ::
`uvm_fatal("APB","please set the interface to get it");
endfunction

task run_phase(uvm_phase phase);
//monitor_logic(req);
//req.paddr			=apb_interface_h.monitor_cb.paddr;		
//req.pwrite			=apb_interface_h.monitor_cb.pwrite;
//req.pwdata			=apb_interface_h.monitor_cb.pwdata;
//req.penable			=apb_interface_h.monitor_cb.penable;
//req.prdata			=apb_interface_h.monitor_cb.prdata;
//req.pready			=apb_interface_h.monitor_cb.pready;
//req.pslave_error		=apb_interface_h.monitor_cb.pslave_error;
//monitor_port.write(req);  //write calling in monitor and write implementation in scoreboard, this is called mon-scb handshaking.
	endtask

task monitor_logic(apb_seq_item req);

endtask
endclass
