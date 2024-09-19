class apb_scb extends uvm_scoreboard;
	`uvm_component_utils(apb_scb)
uvm_analysis_imp#(apb_seq_item, apb_scb) scoreboard_import;
//int queue[$]	
//condttructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
		scoreboard_import=new("scoreboard_import", this);
	endfunction

function write(apb_seq_item tx);
//queue.push_front(tx);
endfunction

//checker
task run_phase(uvm_phase phase);
endtask	


	endclass
