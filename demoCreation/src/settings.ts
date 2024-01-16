/*
 *  Power BI Visualizations
 *
 *  Copyright (c) Microsoft Corporation
 *  All rights reserved.
 *  MIT License
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the ""Software""), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,2
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

"use strict";

import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;

export class VisualSettings extends DataViewObjectsParser {
  public GeneralPlot: GeneralPlot = new GeneralPlot();
  public mySettingsAxes: mySettingsAxes = new mySettingsAxes(); 
  public BarSettings: BarSettings = new BarSettings();
  public LegendSettings: LegendSettings = new LegendSettings();
  public SmallMultiSettings: SmallMultiSettings = new SmallMultiSettings();
  public LowerColumnValue1Format: LowerColumnValue1Format = new LowerColumnValue1Format();
  public LowerColumnValue2Format: LowerColumnValue2Format = new LowerColumnValue2Format();   
  public LowerColumnValue3Format: LowerColumnValue3Format = new LowerColumnValue3Format();   
  public LowerColumnValue4Format: LowerColumnValue4Format = new LowerColumnValue4Format();   
  public LowerColumnValue5Format: LowerColumnValue5Format = new LowerColumnValue5Format(); 
  public UpperColumnValue1Format: UpperColumnValue1Format = new UpperColumnValue1Format();
  public UpperColumnValue2Format: UpperColumnValue2Format = new UpperColumnValue2Format();   
  public UpperColumnValue3Format: UpperColumnValue3Format = new UpperColumnValue3Format();   
  public UpperColumnValue4Format: UpperColumnValue4Format = new UpperColumnValue4Format();   
  public UpperColumnValue5Format: UpperColumnValue5Format = new UpperColumnValue5Format();   
  
  
  public rcv_script: rcv_scriptSettings = new rcv_scriptSettings();
      }

export class rcv_scriptSettings {
  // undefined
  public provider      // undefined
  public source     }
    


export class GeneralPlot{
  public colBack: string = "#FFFFFF"
  public colGrid: string = "#F1F2F3"
}
  export class mySettingsAxes {
  public colLabel: string = "#FFFFFF"
  public x_axis_title: string = ""
  public x_axis_titleTextSize: number = 10
  public x_axis_textSize: number = 8
  public x_axis_textRotate: string = "0"
  public y_axis_title: string = ""
  public y_axis_titleTextSize: number = 10
  public y_axis_textSize: number = 8
}

export class BarSettings{
  public colLabel: string = "grey";
  public unitLabel: string = "auto";
  public decimal: string = "0"
  public textSize: string = "12";
  public LBarSize: string = "0.6";
  public UBarSize: string = "0.35";
}

export class LegendSettings{
  public Orientation: string = "h";
  public textSize: string = "8";
  public legendTitle: string = "";
  public legendTitleSize: string = "12"
}

export class SmallMultiSettings{
  public numCol: number = 2
}

export class LowerColumnValue1Format {
  public Name: string = "";
  public colLabel: string = "#43384a";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class LowerColumnValue2Format {
  public Name: string = "";
  public colLabel: string = "#59786c";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class LowerColumnValue3Format {
  public Name: string = "";
  public colLabel: string = "#82231c";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class LowerColumnValue4Format {
  public Name: string = "";
  public colLabel: string = "#511536";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class LowerColumnValue5Format {
  public Name: string = "";
  public colLabel: string = "#443e67";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class UpperColumnValue1Format {
  public Name: string = "";
  public colLabel: string = "#fed34c";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class UpperColumnValue2Format {
  public Name: string = "";
  public colLabel: string = "#f4d1c1";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class UpperColumnValue3Format {
  public Name: string = "";
  public colLabel: string = "#71AFE2";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class UpperColumnValue4Format {
  public Name: string = "";
  public colLabel: string = "#3d3c1d";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}

export class UpperColumnValue5Format {
  public Name: string = "";
  public colLabel: string = "#625750";
  public textLabel: boolean = false;
  public labelPlace: string = "none";
}
