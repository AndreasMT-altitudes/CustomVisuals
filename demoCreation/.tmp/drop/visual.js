var demoCreation522AEF1866B94124B4C4F588A968843A_DEBUG;
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ 934:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   Kq: () => (/* binding */ parseElement),
/* harmony export */   ME: () => (/* binding */ runHTMLWidgetRenderer),
/* harmony export */   Tx: () => (/* binding */ resetInjector)
/* harmony export */ });
/* unused harmony export injectorReady */
/* provided dependency */ var window = __webpack_require__(738);

let injectorCounter = 0;
function resetInjector() {
    injectorCounter = 0;
}
function injectorReady() {
    return injectorCounter === 0;
}
function parseElement(el, target) {
    let arr = [];
    if (!el || !el.hasChildNodes()) {
        return;
    }
    let nodes = el.children;
    for (let i = 0; i < nodes.length; i++) {
        let tempNode;
        if (nodes.item(i).nodeName.toLowerCase() === "script") {
            tempNode = createScriptNode(nodes.item(i));
        }
        else {
            tempNode = nodes.item(i).cloneNode(true);
        }
        target.appendChild(tempNode);
        arr.push(tempNode);
    }
    return arr;
}
function createScriptNode(refNode) {
    let script = document.createElement("script");
    let attr = refNode.attributes;
    for (let i = 0; i < attr.length; i++) {
        script.setAttribute(attr[i].name, attr[i].textContent);
        if (attr[i].name.toLowerCase() === "src") {
            // waiting only for src to finish loading - async opetation
            injectorCounter++;
            script.onload = () => {
                injectorCounter--;
            };
        }
    }
    // tslint:disable-next-line
    script.innerHTML = refNode.innerHTML;
    return script;
}
function runHTMLWidgetRenderer() {
    // rendering HTML which was created by HTMLWidgets package
    // wait till all tje script elements are loaded
    let intervalVar = window.setInterval(() => {
        if (injectorReady()) {
            window.clearInterval(intervalVar);
            if (window.hasOwnProperty("HTMLWidgets") && window["HTMLWidgets"].staticRender) {
                window["HTMLWidgets"].staticRender();
            }
        }
    }, 100);
}


/***/ }),

/***/ 50:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   Jx: () => (/* binding */ VisualSettings)
/* harmony export */ });
/* unused harmony exports rcv_scriptSettings, mySettingsAxes, LowerColumnValue1Format, LowerColumnValue2Format, LowerColumnValue3Format, LowerColumnValue4Format, LowerColumnValue5Format, UpperColumnValue1Format, UpperColumnValue2Format, UpperColumnValue3Format, UpperColumnValue4Format, UpperColumnValue5Format */
/* harmony import */ var powerbi_visuals_utils_dataviewutils__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(554);
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


var DataViewObjectsParser = powerbi_visuals_utils_dataviewutils__WEBPACK_IMPORTED_MODULE_0__/* .DataViewObjectsParser */ .U;
class VisualSettings extends DataViewObjectsParser {
    constructor() {
        super(...arguments);
        this.mySettingsAxes = new mySettingsAxes();
        this.LowerColumnValue1Format = new LowerColumnValue1Format();
        this.LowerColumnValue2Format = new LowerColumnValue2Format();
        this.LowerColumnValue3Format = new LowerColumnValue3Format();
        this.LowerColumnValue4Format = new LowerColumnValue4Format();
        this.LowerColumnValue5Format = new LowerColumnValue5Format();
        this.UpperColumnValue1Format = new UpperColumnValue1Format();
        this.UpperColumnValue2Format = new UpperColumnValue2Format();
        this.UpperColumnValue3Format = new UpperColumnValue3Format();
        this.UpperColumnValue4Format = new UpperColumnValue4Format();
        this.UpperColumnValue5Format = new UpperColumnValue5Format();
        this.rcv_script = new rcv_scriptSettings();
    }
}
class rcv_scriptSettings {
}
class mySettingsAxes {
    constructor() {
        this.colLabel = "grey";
        this.textSize = 10;
        this.sizeTicks = "8";
        this.axisLine = false;
    }
}
class LowerColumnValue1Format {
    constructor() {
        this.colLabel = "grey";
        this.textLabel = false;
    }
}
class LowerColumnValue2Format {
    constructor() {
        this.colLabel = "grey";
        this.textLabel = false;
    }
}
class LowerColumnValue3Format {
    constructor() {
        this.colLabel = "grey";
        this.textLabel = false;
    }
}
class LowerColumnValue4Format {
    constructor() {
        this.colLabel = "grey";
        this.textLabel = false;
    }
}
class LowerColumnValue5Format {
    constructor() {
        this.colLabel = "grey";
        this.textLabel = false;
    }
}
class UpperColumnValue1Format {
    constructor() {
        this.colLabel = "#FF0000";
        this.textLabel = false;
    }
}
class UpperColumnValue2Format {
    constructor() {
        this.colLabel = "gray";
        this.textLabel = false;
    }
}
class UpperColumnValue3Format {
    constructor() {
        this.colLabel = "gray";
        this.textLabel = false;
    }
}
class UpperColumnValue4Format {
    constructor() {
        this.colLabel = "gray";
        this.textLabel = false;
    }
}
class UpperColumnValue5Format {
    constructor() {
        this.colLabel = "gray";
        this.textLabel = false;
    }
}


/***/ }),

/***/ 728:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   u: () => (/* binding */ Visual)
/* harmony export */ });
/* harmony import */ var _settings__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(50);
/* harmony import */ var _htmlInjectionUtility__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(934);
/* provided dependency */ var window = __webpack_require__(738);
/*
*  Power BI Visual CLI
*
*  Copyright (c) Microsoft Corporation
*  All rights reserved.
*  MIT License
*
*  Permission is hereby granted, free of charge, to any person obtaining a copy
*  of this software and associated documentation files (the ""Software""), to deal2
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



var VisualUpdateType;
(function (VisualUpdateType) {
    VisualUpdateType[VisualUpdateType["Data"] = 2] = "Data";
    VisualUpdateType[VisualUpdateType["Resize"] = 4] = "Resize";
    VisualUpdateType[VisualUpdateType["ViewMode"] = 8] = "ViewMode";
    VisualUpdateType[VisualUpdateType["Style"] = 16] = "Style";
    VisualUpdateType[VisualUpdateType["ResizeEnd"] = 32] = "ResizeEnd";
    VisualUpdateType[VisualUpdateType["All"] = 62] = "All";
})(VisualUpdateType || (VisualUpdateType = {}));
// below is a snippet of a definition for an object which will contain the property values
// selected by the users
/*interface VisualSettings {
    lineColor: string;222s222
}*/
// to allow this scenario you should first the following JSON definition to the capabilities.json file
// under the "objects" property:
// "settings": {
//     "displayName": "Visual Settings",
//     "description": "Visual Settings Tooltip",
//     "properties": {
//         "lineColor": {
//         "displayName": "Line Color",
//         "type": { "fill": { "solid": { "color": true }}}
//         }
//     }
// }
// in order to improve the performance, one can update the <head> only in the initial rendering.
// set to 'true' if you are using different packages to create the widgets
const updateHTMLHead = false;
const renderVisualUpdateType = [
    VisualUpdateType.Resize,
    VisualUpdateType.ResizeEnd,
    VisualUpdateType.Resize + VisualUpdateType.ResizeEnd
];
class Visual {
    constructor(options) {
        if (options && options.element) {
            this.rootElement = options.element;
        }
        this.headNodes = [];
        this.bodyNodes = [];
    }
    update(options) {
        if (!options ||
            !options.type ||
            !options.viewport ||
            !options.dataViews ||
            options.dataViews.length === 0 ||
            !options.dataViews[0]) {
            return;
        }
        const dataView = options.dataViews[0];
        this.settings = Visual.parseSettings(dataView);
        let payloadBase64 = null;
        if (dataView.scriptResult && dataView.scriptResult.payloadBase64) {
            payloadBase64 = dataView.scriptResult.payloadBase64;
        }
        if (renderVisualUpdateType.indexOf(options.type) === -1) {
            if (payloadBase64) {
                this.injectCodeFromPayload(payloadBase64);
            }
        }
        else {
            this.onResizing(options.viewport);
        }
    }
    onResizing(finalViewport) {
        // tslint:disable-next-line
        /* add code to handle resizing of the view port */
    }
    injectCodeFromPayload(payloadBase64) {
        // inject HTML from payload, created in R
        // the code is injected to the 'head' and 'body' sections.
        // if the visual was already rendered, the previous DOM elements are cleared
        (0,_htmlInjectionUtility__WEBPACK_IMPORTED_MODULE_1__/* .resetInjector */ .Tx)();
        if (!payloadBase64) {
            return;
        }
        // create 'virtual' HTML, so parsing is easier
        let el = document.createElement("html");
        try {
            // tslint:disable-next-line
            el.innerHTML = window.atob(payloadBase64);
        }
        catch (err) {
            return;
        }
        // if 'updateHTMLHead == false', then the code updates the header data only on the 1st rendering
        // this option allows loading and parsing of large and recurring scripts only once.
        if (updateHTMLHead || this.headNodes.length === 0) {
            while (this.headNodes.length > 0) {
                let tempNode = this.headNodes.pop();
                document.head.removeChild(tempNode);
            }
            let headList = el.getElementsByTagName("head");
            if (headList && headList.length > 0) {
                let head = headList[0];
                this.headNodes = (0,_htmlInjectionUtility__WEBPACK_IMPORTED_MODULE_1__/* .parseElement */ .Kq)(head, document.head);
            }
        }
        // update 'body' nodes, under the rootElement
        while (this.bodyNodes.length > 0) {
            let tempNode = this.bodyNodes.pop();
            this.rootElement.removeChild(tempNode);
        }
        let bodyList = el.getElementsByTagName("body");
        if (bodyList && bodyList.length > 0) {
            let body = bodyList[0];
            this.bodyNodes = (0,_htmlInjectionUtility__WEBPACK_IMPORTED_MODULE_1__/* .parseElement */ .Kq)(body, this.rootElement);
        }
        (0,_htmlInjectionUtility__WEBPACK_IMPORTED_MODULE_1__/* .runHTMLWidgetRenderer */ .ME)();
    }
    static parseSettings(dataView) {
        return _settings__WEBPACK_IMPORTED_MODULE_0__/* .VisualSettings */ .Jx.parse(dataView);
    }
    /**
     * This function gets called for each of the objects defined in the capabilities files and allows you to select which of the
     * objects and properties you want to expose to the users in the property pane.
     *
     */
    enumerateObjectInstances(options) {
        return _settings__WEBPACK_IMPORTED_MODULE_0__/* .VisualSettings */ .Jx.enumerateObjectInstances(this.settings || _settings__WEBPACK_IMPORTED_MODULE_0__/* .VisualSettings */ .Jx.getDefault(), options);
    }
}


/***/ }),

/***/ 567:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   N: () => (/* binding */ getValue)
/* harmony export */ });
/* unused harmony export getFillColorByPropertyName */
function getValue(object, propertyName, defaultValue) {
    if (!object) {
        return defaultValue;
    }
    let propertyValue = object[propertyName];
    if (propertyValue === undefined) {
        return defaultValue;
    }
    return propertyValue;
}
/** Gets the solid color from a fill property using only a propertyName */
function getFillColorByPropertyName(object, propertyName, defaultColor) {
    let value = getValue(object, propertyName);
    if (!value || !value.solid) {
        return defaultColor;
    }
    return value.solid.color;
}
//# sourceMappingURL=dataViewObject.js.map

/***/ }),

/***/ 982:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   d9: () => (/* binding */ getCommonValue)
/* harmony export */ });
/* unused harmony exports getValue, getObject, getFillColor */
/* harmony import */ var _dataViewObject__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(567);

/** Gets the value of the given object/property pair. */
function getValue(objects, propertyId, defaultValue) {
    if (!objects) {
        return defaultValue;
    }
    return _dataViewObject__WEBPACK_IMPORTED_MODULE_0__/* .getValue */ .N(objects[propertyId.objectName], propertyId.propertyName, defaultValue);
}
/** Gets an object from objects. */
function getObject(objects, objectName, defaultValue) {
    if (objects && objects[objectName]) {
        return objects[objectName];
    }
    return defaultValue;
}
/** Gets the solid color from a fill property. */
function getFillColor(objects, propertyId, defaultColor) {
    const value = getValue(objects, propertyId);
    if (!value || !value.solid) {
        return defaultColor;
    }
    return value.solid.color;
}
function getCommonValue(objects, propertyId, defaultValue) {
    const value = getValue(objects, propertyId, defaultValue);
    if (value && value.solid) {
        return value.solid.color;
    }
    if (value === undefined
        || value === null
        || (typeof value === "object" && !value.solid)) {
        return defaultValue;
    }
    return value;
}
//# sourceMappingURL=dataViewObjects.js.map

/***/ }),

/***/ 554:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   U: () => (/* binding */ DataViewObjectsParser)
/* harmony export */ });
/* harmony import */ var _dataViewObjects__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(982);

class DataViewObjectsParser {
    static getDefault() {
        return new this();
    }
    static createPropertyIdentifier(objectName, propertyName) {
        return {
            objectName,
            propertyName
        };
    }
    static parse(dataView) {
        let dataViewObjectParser = this.getDefault(), properties;
        if (!dataView || !dataView.metadata || !dataView.metadata.objects) {
            return dataViewObjectParser;
        }
        properties = dataViewObjectParser.getProperties();
        for (let objectName in properties) {
            for (let propertyName in properties[objectName]) {
                const defaultValue = dataViewObjectParser[objectName][propertyName];
                dataViewObjectParser[objectName][propertyName] = _dataViewObjects__WEBPACK_IMPORTED_MODULE_0__/* .getCommonValue */ .d9(dataView.metadata.objects, properties[objectName][propertyName], defaultValue);
            }
        }
        return dataViewObjectParser;
    }
    static isPropertyEnumerable(propertyName) {
        return !DataViewObjectsParser.InnumerablePropertyPrefix.test(propertyName);
    }
    static enumerateObjectInstances(dataViewObjectParser, options) {
        let dataViewProperties = dataViewObjectParser && dataViewObjectParser[options.objectName];
        if (!dataViewProperties) {
            return [];
        }
        let instance = {
            objectName: options.objectName,
            selector: null,
            properties: {}
        };
        for (let key in dataViewProperties) {
            if (dataViewProperties.hasOwnProperty(key)) {
                instance.properties[key] = dataViewProperties[key];
            }
        }
        return {
            instances: [instance]
        };
    }
    getProperties() {
        let properties = {}, objectNames = Object.keys(this);
        objectNames.forEach((objectName) => {
            if (DataViewObjectsParser.isPropertyEnumerable(objectName)) {
                let propertyNames = Object.keys(this[objectName]);
                properties[objectName] = {};
                propertyNames.forEach((propertyName) => {
                    if (DataViewObjectsParser.isPropertyEnumerable(objectName)) {
                        properties[objectName][propertyName] =
                            DataViewObjectsParser.createPropertyIdentifier(objectName, propertyName);
                    }
                });
            }
        });
        return properties;
    }
}
DataViewObjectsParser.InnumerablePropertyPrefix = /^_/;
//# sourceMappingURL=dataViewObjectsParser.js.map

/***/ }),

/***/ 738:
/***/ ((module) => {

module.exports = Function('return this')();

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _src_visual__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(728);
/* provided dependency */ var window = __webpack_require__(738);

var powerbiKey = "powerbi";
var powerbi = window[powerbiKey];
var demoCreation522AEF1866B94124B4C4F588A968843A_DEBUG = {
    name: 'demoCreation522AEF1866B94124B4C4F588A968843A_DEBUG',
    displayName: 'demoCreation',
    class: 'Visual',
    apiVersion: '3.8.0',
    create: (options) => {
        if (_src_visual__WEBPACK_IMPORTED_MODULE_0__/* .Visual */ .u) {
            return new _src_visual__WEBPACK_IMPORTED_MODULE_0__/* .Visual */ .u(options);
        }
        throw 'Visual instance not found';
    },
    createModalDialog: (dialogId, options, initialState) => {
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
    powerbi.visuals.plugins["demoCreation522AEF1866B94124B4C4F588A968843A_DEBUG"] = demoCreation522AEF1866B94124B4C4F588A968843A_DEBUG;
}
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (demoCreation522AEF1866B94124B4C4F588A968843A_DEBUG);

})();

demoCreation522AEF1866B94124B4C4F588A968843A_DEBUG = __webpack_exports__;
/******/ })()
;
//# sourceMappingURL=https://localhost:8080/assets/visual.js.map