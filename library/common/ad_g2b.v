// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// Each core or library found in this collection may have its own licensing terms.
// The user should keep this in in mind while exploring these cores.
//
// Redistribution and use in source and binary forms,
// with or without modification of this file, are permitted under the terms of either
//  (at the option of the user):
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory, or at:
// https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
//
// OR
//
//   2.  An ADI specific BSD license as noted in the top level directory, or on-line at:
// https://github.com/analogdevicesinc/hdl/blob/dev/LICENSE
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module ad_g2b #(

  parameter DATA_WIDTH = 8) (

  input       [DATA_WIDTH-1:0]    din,
  output      [DATA_WIDTH-1:0]    dout);

  function [DATA_WIDTH-1:0] g2b;
    input [DATA_WIDTH-1:0] g;
    integer i;
    begin
      g2b[DATA_WIDTH-1] = g[DATA_WIDTH-1];
      for (i = DATA_WIDTH-1; i > 0; i = i -1) begin
        g2b[i-1] = g2b[i] ^ g[i-1];
      end
    end
  endfunction

  assign dout = g2b(din);

endmodule

