class apb_env extends uvm_env;
	`uvm_component_utils(apb_env)

	 apb_scb apb_scb_h;
         apb_agent apb_agent_h;
       
	//condttructor
	function new(string name, uvm_component parent);
		super.new(name, parent);
			$display("ENV");
	endfunction
        function void build_phase(uvm_phase phase);  // void is like the o/p datatype
	       super.build_phase(phase);
	   	$display("BENV_start");
	   
	apb_scb_h=apb_scb::type_id::create("apb_scb_h",this);
	apb_agent_h=apb_agent::type_id::create("apb_agent_h",this);  
		$display("BENV_end");

endfunction

//mon-scb connection in env we need to write a code for conneect phase

function void connect_phase(uvm_phase phase);
			$display("CENV_start");

apb_agent_h.apb_mon_h.monitor_port.connect(apb_scb_h.scoreboard_import);
//apb_agent_h.apb_sender_port.monitor_port.connect(apb_scoreboard_h.apb_reciever_port);
//those who can be changed are identifiers.
	$display("CENV_end");

endfunction
endclass
