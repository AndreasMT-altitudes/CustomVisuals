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
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
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
  public mySettingsAxes: mySettingsAxes = new mySettingsAxes(); 
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
  public provider
  public source     }
    

export class mySettingsAxes {
  public colLabel: string = "grey";
  public textSize: number = 10;
  public sizeTicks: string = "8";
  public axisLine: boolean = false;

}

export class LowerColumnValue1Format {
  public colLabel: string = "grey";

}

export class LowerColumnValue2Format {
  public colLabel: string = "grey";

}

export class LowerColumnValue3Format {
  public colLabel: string = "grey";

}

export class LowerColumnValue4Format {
  public colLabel: string = "grey";

}

export class LowerColumnValue5Format {
  public colLabel: string = "grey";

}

export class UpperColumnValue1Format {
  public colLabel: string = "#FF0000";

}

export class UpperColumnValue2Format {
  public colLabel: string = "gray";

}

export class UpperColumnValue3Format {
  public colLabel: string = "gray";

}

export class UpperColumnValue4Format {
  public colLabel: string = "gray";

}

export class UpperColumnValue5Format {
  public colLabel: string = "gray";

}