package com.pxy.utils;


import com.uwantsoft.goeasy.client.goeasyclient.GoEasy;

public class testPublishMessageInGoEasy {
		public static void main(String[] args) {
			 GoEasy goEasy = new GoEasy("bac4091d-b42f-495f-8c83-bcd877758047");
		   goEasy.publish("Sakura_first","hello");
		}
}
