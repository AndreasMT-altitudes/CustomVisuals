import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;
export declare class VisualSettings extends DataViewObjectsParser {
    rcv_script: rcv_scriptSettings;
    LowerColumnValue1Format: LowerColumnValue1Format;
}
export declare class rcv_scriptSettings {
    provider: any;
    source: any;
}
export declare class LowerColumnValue1Format {
    colLabel: string;
    textLabel: boolean;
    labelColor: string;
    labelPlace: string;
    fontSize: number;
}
