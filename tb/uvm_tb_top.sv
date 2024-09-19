//we have 4 main pillar module,class, program, interface
//module-static
//class-dynamic
//interface-static and dynamic
//program-only sv test file

module apb_tb_top;
//declare the clk and reset
bit pclk;
bit preset_n; //clk and reset are single bit so the datatype is given by bit.

always #5 pclk=~pclk;
initial begin
preset_n=1;
#5 preset_n=0;
end

//code related to the interface

apb_interface intf(pclk, preset_n); //passing the clock and reset to intf, test and dut

//code related to the dut

apb_slave dut(
	.pclk       (intf.pclk),
	.preset_n    (intf.preset_n),
	.paddr      (intf.paddr),
	.pwdata     (intf.pwdata),
	.prdata     (intf.prdata),
	.pwrite     (intf.pwrite),
	.pselx      (intf.pselx),
	.penable    (intf.penable),
	.pslave_error (intf.pslave_error),
	.pready     (intf.pready)
	);


//code related to test
//run_test will do the following(1.call the test, 2. call all the phases, 3. call the $finish
initial begin
//run_test(); //test name is passed from the command line arguement i.e., run.do
//or

run_test("apb_wr_rd_test");     //not recommended we'll need to change the run.do
end
                              //vsim UVM_TEST Name individually for each test

//config_db

initial begin
		uvm_config_db#(virtual apb_interface)::set(uvm_root::get(),"*","apb_intf",intf);
end
endmodule

