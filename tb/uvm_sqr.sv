class apb_sqr extends uvm_sequencer#(apb_seq_item);
	`uvm_component_utils(apb_sqr)

	//condttructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
		$display("SEQR");
	endfunction
//no build phase coz we don't have component
//no connect phase coz sqr-drv we dont hace connection in agent
//no eoe or sos coz test is the proper place
//no run coz default fifo arbitration id been taken care by the uvm lib
//no extract, no check no report no final coz we will take care in scb file			

endclass

//or
//typedef uvm_sequencer#(apb_seq_item) apb_sqr;
