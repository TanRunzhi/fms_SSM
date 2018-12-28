package com.yc.project.util;

import java.awt.Font;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;

import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

public class PieChartUtil {
	public static PieDataset initPieData(){
		//设置数据
		DefaultPieDataset dataset = new DefaultPieDataset();
		dataset.setValue("Java", 500);
		dataset.setValue("C/C++", 120);
		dataset.setValue("PHP", 420);
		dataset.setValue(".Net", 480);
		return dataset;
		}

		public static JFreeChart createPieChart() {

		JFreeChart pieChart = ChartFactory.createPieChart3D(
		"web开发语言",  //标题
		initPieData(),
		//数据
		true,
		// 是否显示图例
		true,
		//是否显示工具提示
		false
		//是否生成URL
		);
		pieChart.getTitle().setFont(new Font("隶书", Font.BOLD, 25));
		pieChart.getLegend().setItemFont(new Font("宋体", Font.BOLD, 15));
		PiePlot plot = (PiePlot) pieChart.getPlot();
		//获得饼图的Plot对象
		plot.setLabelFont(new Font("宋体", Font.PLAIN, 12));
		// 图片中显示百分比:自定义方式，{0} 表示选项， {1} 表示数值， {2} 表示所占比例 ,小数点后两位
		// plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0}：{1}({2})", NumberFormat.getNumberInstance(),
		//new DecimalFormat("0.00%")));
		plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0}：{2}", NumberFormat.getNumberInstance(), NumberFormat.getPercentInstance()));
		return pieChart;
		}

		public static String generatePieChart(HttpSession session, PrintWriter pw){

		String filename = null;
		JFreeChart chart = createPieChart();
		ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
		try {
		//saveChartAsPNG生成PNG图片,并返回文件名
		filename = ServletUtilities.saveChartAsPNG(chart, 500, 300, info, session);
		} catch (IOException e) {
		e.printStackTrace();
		}
		try {
		ChartUtilities.writeImageMap(pw, filename, info, false);//将生成的图片写入到输出流
		} catch (IOException e) {
		e.printStackTrace();
		}
		pw.flush();
		return filename;
		}
}
