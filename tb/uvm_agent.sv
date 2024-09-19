class apb_agent extends uvm_agent;
`uvm_component_utils(apb_agent)

apb_sqr apb_sqr_h;
apb_drv apb_drv_h;
apb_mon apb_mon_h;

	//condttructor
function new(string name, uvm_component parent);
super.new(name, parent);
	$display("AGENT");
endfunction
        
function void build_phase(uvm_phase phase);  //its a component so we use buildphase.
super.build_phase(phase);
	$display("BAGENT_start");

apb_sqr_h=apb_sqr::type_id::create("apb_sqr_h",this);
apb_drv_h=apb_drv::type_id::create("apb_drv_h",this);
apb_mon_h=apb_mon::type_id::create("apb_mon_h",this);
	$display("BAGENT_end");
endfunction

function void connect_phase(uvm_phase phase);
			$display("CAGENT_start");

apb_drv_h.seq_item_port.connect(apb_sqr_h.seq_item_export);
//seq_item_port and seq_item_export are keywwords
	$display("CAGENT_end");

endfunction



endclass
