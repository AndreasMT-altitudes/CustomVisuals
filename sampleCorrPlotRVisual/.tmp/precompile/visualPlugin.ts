import { Visual } from "../../src/visual";
import powerbiVisualsApi from "powerbi-visuals-api";
import IVisualPlugin = powerbiVisualsApi.visuals.plugins.IVisualPlugin;
import VisualConstructorOptions = powerbiVisualsApi.extensibility.visual.VisualConstructorOptions;
import DialogConstructorOptions = powerbiVisualsApi.extensibility.visual.DialogConstructorOptions;
var powerbiKey: any = "powerbi";
var powerbi: any = window[powerbiKey];
var sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796: IVisualPlugin = {
    name: 'sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796',
    displayName: 'sampleCorrPlotRVisual',
    class: 'Visual',
    apiVersion: '3.8.0',
    create: (options: VisualConstructorOptions) => {
        if (Visual) {
            return new Visual(options);
        }
        throw 'Visual instance not found';
    },
    createModalDialog: (dialogId: string, options: DialogConstructorOptions, initialState: object) => {
        const dialogRegistry = globalThis.dialogRegistry;
        if (dialogId in dialogRegistry) {
            new dialogRegistry[dialogId](options, initialState);
        }
    },
    custom: true
};
if (typeof powerbi !== "undefined") {
    powerbi.visuals = powerbi.visuals || {};
    powerbi.visuals.plugins = powerbi.visuals.plugins || {};
    powerbi.visuals.plugins["sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796"] = sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796;
}
export default sampleCorrPlotRVisualB3968A9487B54C63AAA9C3B53CC67796;