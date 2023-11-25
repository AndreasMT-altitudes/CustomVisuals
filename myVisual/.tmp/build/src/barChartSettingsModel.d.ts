import { formattingSettings } from "powerbi-visuals-utils-formattingmodel";
import { BarChartDataPoint } from "./barChart";
import FormattingSettingsCard = formattingSettings.Card;
import FormattingSettingsSlice = formattingSettings.Slice;
import FormattingSettingsModel = formattingSettings.Model;
/**
 * Enable Axis Formatting Card
 */
declare class EnableAxisCardSettings extends FormattingSettingsCard {
    show: formattingSettings.ToggleSwitch;
    fill: formattingSettings.ColorPicker;
    name: string;
    displayName: string;
    slices: Array<FormattingSettingsSlice>;
}
/**
 * Color Selector Formatting Card
 */
declare class ColorSelectorCardSettings extends FormattingSettingsCard {
    name: string;
    displayName: string;
    slices: Array<FormattingSettingsSlice>;
}
/**
* BarChart settings model class
*
*/
export declare class BarChartSettingsModel extends FormattingSettingsModel {
    enableAxis: EnableAxisCardSettings;
    colorSelector: ColorSelectorCardSettings;
    cards: (EnableAxisCardSettings | ColorSelectorCardSettings)[];
    /**
     * populate colorSelector object categories formatting properties
     * @param dataPoints
     */
    populateColorSelector(dataPoints: BarChartDataPoint[]): void;
}
export {};
