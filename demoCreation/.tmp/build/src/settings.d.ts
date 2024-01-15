import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;
export declare class VisualSettings extends DataViewObjectsParser {
    mySettingsAxes: mySettingsAxes;
    BarSettings: BarSettings;
    LegendSettings: LegendSettings;
    LowerColumnValue1Format: LowerColumnValue1Format;
    LowerColumnValue2Format: LowerColumnValue2Format;
    LowerColumnValue3Format: LowerColumnValue3Format;
    LowerColumnValue4Format: LowerColumnValue4Format;
    LowerColumnValue5Format: LowerColumnValue5Format;
    UpperColumnValue1Format: UpperColumnValue1Format;
    UpperColumnValue2Format: UpperColumnValue2Format;
    UpperColumnValue3Format: UpperColumnValue3Format;
    UpperColumnValue4Format: UpperColumnValue4Format;
    UpperColumnValue5Format: UpperColumnValue5Format;
    rcv_script: rcv_scriptSettings;
}
export declare class rcv_scriptSettings {
    provider: any;
    source: any;
}
export declare class mySettingsAxes {
    x_axis_title: string;
    x_axis_titleTextSize: number;
    x_axis_textSize: number;
    x_axis_textRotate: string;
    y_axis_title: string;
    y_axis_titleTextSize: number;
    y_axis_textSize: number;
}
export declare class BarSettings {
    colLabel: string;
    unitLabel: string;
    decimal: string;
    textSize: string;
    LBarSize: string;
    UBarSize: string;
}
export declare class LegendSettings {
    Orientation: string;
    textSize: string;
    legendTitle: string;
    legendTitleSize: string;
}
export declare class LowerColumnValue1Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class LowerColumnValue2Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class LowerColumnValue3Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class LowerColumnValue4Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class LowerColumnValue5Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue1Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue2Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue3Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue4Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue5Format {
    Name: string;
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
