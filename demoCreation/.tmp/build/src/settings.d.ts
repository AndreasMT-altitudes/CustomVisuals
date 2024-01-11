import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;
export declare class VisualSettings extends DataViewObjectsParser {
    mySettingsAxes: mySettingsAxes;
    BarSettings: BarSettings;
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
    y_axis_title: string;
}
export declare class BarSettings {
    colLabel: string;
    textSize: number;
    LBarSize: number;
    UBarSize: number;
}
export declare class LowerColumnValue1Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class LowerColumnValue2Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class LowerColumnValue3Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class LowerColumnValue4Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class LowerColumnValue5Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue1Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue2Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue3Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue4Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
export declare class UpperColumnValue5Format {
    colLabel: string;
    textLabel: boolean;
    labelPlace: string;
}
