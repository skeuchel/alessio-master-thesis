wire [15:0] ipc0 = dut.ipe.MPUIPC0;
wire [15:0] segb2 = dut.ipe.MPUIPSEGB2;
wire [15:0] segb1 = dut.ipe.MPUIPSEGB1;

initial
   begin
      $display("===============================================");
      $display("                 START SIMULATION             |");
      $display("===============================================");
      #10;

      repeat(5) @(posedge mclk);
      stimulus_done = 0;

      /* ----------------------  END OF TEST --------------- */
      @(r0==16'hFFFF);

      if (r15 !== 16'h3FFF)
         tb_error("====== secret not protected ======");

      if (r14 !== 16'd43)
         tb_error("====== secret not accessible from inside ======");

      stimulus_done = 1;
   end
