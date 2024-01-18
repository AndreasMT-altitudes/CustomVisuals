/*
*  Power BI Visual CLI
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

import "./../style/visual.less";
import powerbi from "powerbi-visuals-api";
import VisualConstructorOptions = powerbi.extensibility.visual.VisualConstructorOptions;
import VisualUpdateOptions = powerbi.extensibility.visual.VisualUpdateOptions;
import IVisual = powerbi.extensibility.visual.IVisual;
import EnumerateVisualObjectInstancesOptions = powerbi.EnumerateVisualObjectInstancesOptions;
import VisualObjectInstance = powerbi.VisualObjectInstance;
import DataView = powerbi.DataView;
import VisualObjectInstanceEnumerationObject = powerbi.VisualObjectInstanceEnumerationObject;

import { VisualSettings } from "./settings";

import * as d3 from 'd3';

export class Visual implements IVisual {
    private target: HTMLElement;
    private settings: VisualSettings;
    private svg: d3.Selection<SVGElement, any, any, any>;
    private dataView: DataView;

    constructor(options: VisualConstructorOptions) {
        this.target = options.element;
        this.svg = d3.select(this.target).append('svg');
    }

    public update(options: VisualUpdateOptions) {
        console.log('Visual update', options);
        this.settings = Visual.parseSettings(options && options.dataViews && options.dataViews[0]);
        this.dataView = options.dataViews[0];

        const width = options.viewport.width;
        const height = options.viewport.height;

        this.svg.attr('width', width)
            .attr('height', height);

        const data = this.processData(this.dataView);

        const colorScale: d3.ScaleOrdinal<string, string> = d3.scaleOrdinal<string, string>()
        .domain(data.map(d => d.category))
        .range(this.settings.dataColors);
    

        const stack = d3.stack()
            .keys(data.columns.slice(1));

        const stackedData = stack(data);

        const xScale = d3.scaleBand()
            .domain(data.map(d => d.category))
            .range([0, width])
            .padding(0.1);

        const yScale = d3.scaleLinear()
            .domain([0, d3.max(stackedData, d => d3.max(d, d => d[1]))])
            .range([height, 0]);

        const bars = this.svg.selectAll('.bar-group')
            .data(stackedData)
            .enter().append('g')
            .attr('class', 'bar-group')
            .attr('fill', (d: any) => colorScale(d.key));

        bars.selectAll('rect')
            .data(d => d)
            .enter().append('rect')
            .attr('x', d => xScale(String(d.data.category)))
            .attr('y', d => yScale(d[1]))
            .attr('height', d => yScale(d[0]) - yScale(d[1]))
            .attr('width', xScale.bandwidth());

        this.svg.selectAll('.axis').remove(); // Clear previous axes

        // Add X-axis
        this.svg.append('g')
            .attr('class', 'axis')
            .attr('transform', 'translate(0, ' + height + ')')
            .call(d3.axisBottom(xScale));

        // Add Y-axis
        this.svg.append('g')
            .attr('class', 'axis')
            .call(d3.axisLeft(yScale));
    }

    private static parseSettings(dataView: DataView): VisualSettings {
        return <VisualSettings>VisualSettings.parse(dataView);
    }

    private processData(dataView: DataView): any {
        const categorical = dataView.categorical;
        const categories = categorical.categories[0].values.map(String);
        const values = categorical.values.map(v => v.values);

        return {
            columns: ['category', ...categorical.values.map(v => v.source.displayName)],
            values: categories.map((category, i) => [category, ...values.map(v => v[i])])
        };
    }

    public enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstance[] | VisualObjectInstanceEnumerationObject {
        return VisualSettings.enumerateObjectInstances(this.settings || VisualSettings.getDefault(), options);
    }
}
