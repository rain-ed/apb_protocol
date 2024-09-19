class apb_seq_item extends uvm_sequence_item;
	//`uvm_object_utils(apb_seq_item)    //we have one factory reg below

rand bit [1:0] paddr; //packed array
rand bit [1:0] pwdata;
     bit [1:0] prdata;
rand bit        pwrite;
rand bit        penable;
rand bit        pselx;
     bit        pslave_error;
     bit        pready;

//factory registration for object with field do hooks
`uvm_object_utils_begin(apb_seq_item)            //UVM_ALL_ON: copy, compare, print, pack, unpack, clone, this all facility will be enabled
	`uvm_field_int(paddr,UVM_ALL_ON)
	`uvm_field_int(pwdata, UVM_ALL_ON)    //scalar int field
	`uvm_field_int(prdata, UVM_ALL_ON)
	`uvm_field_int(pwrite, UVM_ALL_ON)
	`uvm_field_int(penable, UVM_ALL_ON)
	`uvm_field_int(pselx, UVM_ALL_ON)
	`uvm_field_int(pslave_error, UVM_ALL_ON)
	`uvm_field_int(pready, UVM_ALL_ON)
 `uvm_object_utils_end


	function new(string name="apb_seq_item");
		super.new(name);
	endfunction
endclass
