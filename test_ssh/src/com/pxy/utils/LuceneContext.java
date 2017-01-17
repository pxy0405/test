package com.pxy.utils;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.NRTManager;
import org.apache.lucene.search.NRTManagerReopenThread;
import org.apache.lucene.search.SearcherManager;
import org.apache.lucene.search.SearcherWarmer;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.chenlb.mmseg4j.analysis.MMSegAnalyzer;

public class LuceneContext {
	//设置成单例模式
	private static LuceneContext instance;
	private static final String INDEX_PATH = "E:/lucene/message";
	private static IndexWriter writer;
	private static Analyzer analyzer;
	private static Version version;
	private static NRTManager nrtMgr;
	private static SearcherManager mgr;
	private static Directory directory;
	private LuceneContext(){
		
	}
	public static LuceneContext getInstance(){
		if(instance == null)instance = new LuceneContext();
		return instance;
	}
	private static void init() throws IOException{
		directory = FSDirectory.open(new File(INDEX_PATH));
		version = Version.LUCENE_35;
		String dicUrl = LuceneContext.class.getClassLoader().getResource("data").getPath();
		analyzer = new MMSegAnalyzer(dicUrl);
		writer = new IndexWriter(directory,new IndexWriterConfig(version,analyzer));
		nrtMgr = new NRTManager(writer, new SearcherWarmer(){
			@Override
			public void warm(IndexSearcher arg0) throws IOException {
				System.out.println("reopen index");
			}
			
		});
		mgr = nrtMgr.getSearcherManager(true);
		NRTManagerReopenThread reopenThread = new NRTManagerReopenThread(nrtMgr, 5.0, 0.025);
		reopenThread.setName("NRTManager reopen Thread");
	}
}
