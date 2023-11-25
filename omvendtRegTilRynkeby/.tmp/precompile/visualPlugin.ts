import { Visual } from "../../src/visual";
import powerbiVisualsApi from "powerbi-visuals-api";
import IVisualPlugin = powerbiVisualsApi.visuals.plugins.IVisualPlugin;
import VisualConstructorOptions = powerbiVisualsApi.extensibility.visual.VisualConstructorOptions;
import DialogConstructorOptions = powerbiVisualsApi.extensibility.visual.DialogConstructorOptions;
var powerbiKey: any = "powerbi";
var powerbi: any = window[powerbiKey];
var omvendtRegTilRynkebyBA464F4E927A49529F38D530D0394DFF: IVisualPlugin = {
    name: 'omvendtRegTilRynkebyBA464F4E927A49529F38D530D0394DFF',
    displayName: 'omvendtRegTilRynkeby',
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
    powerbi.visuals.plugins["omvendtRegTilRynkebyBA464F4E927A49529F38D530D0394DFF"] = omvendtRegTilRynkebyBA464F4E927A49529F38D530D0394DFF;
}
export default omvendtRegTilRynkebyBA464F4E927A49529F38D530D0394DFF;