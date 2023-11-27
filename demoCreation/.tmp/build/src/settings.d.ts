import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;
export declare class VisualSettings extends DataViewObjectsParser {
    settings_Legend_params: settings_Legend_params;
    mySettingsAxes: mySettingsAxes;
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
export declare class settings_Legend_params {
    Legend_Theme: string;
}
export declare class mySettingsAxes {
    colLabel: string;
    textSize: number;
    sizeTicks: string;
    axisLine: boolean;
}
export declare class LowerColumnValue1Format {
    colLabel: string;
}
export declare class LowerColumnValue2Format {
    colLabel: string;
}
export declare class LowerColumnValue3Format {
    colLabel: string;
}
export declare class LowerColumnValue4Format {
    colLabel: string;
}
export declare class LowerColumnValue5Format {
    colLabel: string;
}
export declare class UpperColumnValue1Format {
    colLabel: string;
}
export declare class UpperColumnValue2Format {
    colLabel: string;
}
export declare class UpperColumnValue3Format {
    colLabel: string;
}
export declare class UpperColumnValue4Format {
    colLabel: string;
}
export declare class UpperColumnValue5Format {
    colLabel: string;
}
