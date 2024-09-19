//####################################################################################################################
//####################################################################################################################
//                   WR_SEQ
//####################################################################################################################
//####################################################################################################################

class apb_wr_seq extends uvm_sequence#(apb_seq_item);
	`uvm_object_utils(apb_wr_seq)

         apb_seq_item apb_seq_item_h;  //optional if we use req

       

	//condttructor
	function new(string name="apb_wr_seq");
		super.new(name);
	endfunction
        task body;
			//code-1 req is the default handle/variable to the seq_item so if we use req instance is optional
		//	apb_seq_item_h=apb_seq_item::type_id::create("apb_seq_item_h"); 
//		repeat(5) begin     //to reduce the number of iteration in the output
	
		repeat(10) begin
			req=apb_seq_item::type_id::create("req");  
	
			wait_for_grant();
			req.randomize() with {pwrite==1;};

//			req.randomize() with { pwrite==1;}; //randomize with inline constraints
			send_request(req);
			wait_for_item_done();
			end

//			//code-2
//			apb_seq_item_h=apb_seq_item::type_id::create("apb_seq_item_h");
//			start_item(req);
//			req.randomize() with { pwrite ==1;};
//			finish_item(req);
//
//			//code-3
//			repeat(10) begin
//			`uvm_do(req);
//           (or)
//			`uvm_do_with(req,{req.pwrite==1;})
//			end
			
			
		endtask

endclass

//####################################################################################################################
//####################################################################################################################
//                   RD_SEQ
//####################################################################################################################
//####################################################################################################################

class apb_rd_seq extends uvm_sequence#(apb_seq_item);
	`uvm_object_utils(apb_rd_seq)

         apb_seq_item apb_seq_item_h;  //optional if we use req

       

	//condttructor
	function new(string name="apb_rd_seq");
		super.new(name);
	endfunction
        task body;
			//code-1 req is the default handle/variable to the seq_item so if we use req instance is optional
		//	apb_seq_item_h=apb_seq_item::type_id::create("apb_seq_item_h"); 
			repeat(10) begin
			req=apb_seq_item::type_id::create("req");  
	
			wait_for_grant();
			req.randomize() with {pwrite==0;};

//			req.randomize() with { pwrite==1;}; //randomize with inline constraints
			send_request(req);
			wait_for_item_done();
			end

//			//code-2
//			apb_seq_item_h=apb_seq_item::type_id::create("apb_seq_item_h");
//			start_item(req);
//			req.randomize() with { pwrite ==1;};
//			finish_item(req);
//
//			//code-3
//			repeat(10) begin
//			`uvm_do(req);
//           (or)
//			`uvm_do_with(req,{req.pwrite==1;})
//			end
			
			
		endtask

endclass


//####################################################################################################################
//####################################################################################################################
//                   WR_RD_SEQ
//####################################################################################################################
//####################################################################################################################

class apb_wr_rd_seq extends uvm_sequence#(apb_seq_item);
	`uvm_object_utils(apb_wr_rd_seq)

         apb_seq_item apb_seq_item_h;  //optional if we use req

       

	//condttructor
	function new(string name="apb_wr_rd_seq");
		super.new(name);
	endfunction
        task body;
			//code-1 req is the default handle/variable to the seq_item so if we use req instance is optional
		//	apb_seq_item_h=apb_seq_item::type_id::create("apb_seq_item_h"); 
			repeat(10) begin
			req=apb_seq_item::type_id::create("req");  
	
			wait_for_grant();
			req.randomize() with {pwrite==1;};

//			req.randomize() with { pwrite==1;}; //randomize with inline constraints
			send_request(req);
			wait_for_item_done();
		
			req=apb_seq_item::type_id::create("req");  
	
			wait_for_grant();
			req.randomize() with {pwrite==0;};

//			req.randomize() with { pwrite==1;}; //randomize with inline constraints
			send_request(req);
			wait_for_item_done();

//above 10 lines or below 2 lines
//`uvm_do_with(req,{req.pwrite==1;})
//`uvm_do_with(req,{req.pwrite==0;})

			end

		endtask

endclass


//####################################################################################################################
//####################################################################################################################
//                   RANDOM_SEQ
//####################################################################################################################
//####################################################################################################################




class apb_random_seq extends uvm_sequence#(apb_seq_item);
	`uvm_object_utils(apb_random_seq)

         apb_seq_item apb_seq_item_h;  //optional if we use req

       

	//condttructor
	function new(string name="apb_random_seq");
		super.new(name);
	endfunction
        task body;
			//code-1 req is the default handle/variable to the seq_item so if we use req instance is optional
		//	apb_seq_item_h=apb_seq_item::type_id::create("apb_seq_item_h"); 
			repeat(10) begin
			req=apb_seq_item::type_id::create("req");  
	
			wait_for_grant();
			req.randomize();

//			req.randomize() with { pwrite==1;}; //randomize with inline constraints
			send_request(req);
			wait_for_item_done();
			end


			
			
		endtask

endclass
