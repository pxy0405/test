/*package com.pxy.utils;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.RAMDirectory;
import org.junit.Test;


public class DirectoryTest {
	String filePath = "E://eclipse_luna//test_ssh//src//com//pxy//utils//IndexWriter addDocument's a javadoc .txt";

	String indexPath = "E://eclipse_luna//test_ssh//luceneIndex";

	Analyzer analyzer = new StandardAnalyzer();

	@Test
	public void test1()throws Exception {
		//可以存到磁盘，但是速度慢
		// Directory dir = FSDirectory.getDirectory(indexPath);
		//内存当中存索引，没有IO操作，速度快，不保存
		Directory dir = new RAMDirectory();
		
		Document doc = File2DocumentUtils.file2Document(filePath);
		IndexWriter indexWriter = new IndexWriter(dir, analyzer, MaxFieldLength.LIMITED);
		indexWriter.addDocument(doc);
		indexWriter.close();
	}
	
	@Test
	public void test2() throws Exception{
		Directory fsDir = FSDirectory.getDirectory(indexPath);
	
		// 1，启动时读取，用RAM，1。。内存当中，写在内存还是数据库
		Directory ramDir = new RAMDirectory(fsDir);
		
		// 运行程序时操作 ramDir2.。indexwriter写索引
		IndexWriter ramIndexWriter = new IndexWriter(ramDir, analyzer, MaxFieldLength.LIMITED);
		// 添加 Document3..创建document filed
		Document doc = File2DocumentUtils.file2Document(filePath);
		ramIndexWriter.addDocument(doc);
		//先关闭，再合并
		ramIndexWriter.close();
		
		// 2，退出时显回保存，用FS，磁盘上，通过TRUE设置为每次退出保存时都是重新创建
		IndexWriter fsIndexWriter = new IndexWriter(fsDir, analyzer,true, MaxFieldLength.LIMITED);
		//合并所有索引库成为一个数组，路径不进行优化，减少IO
		fsIndexWriter.addIndexesNoOptimize(new Directory[]{ramDir});
		//可用commit代替
		//	fsIndexWriter.flush();
		//	fsIndexWriter.optimize();
		fsIndexWriter.close();
	}
	
	
	@Test
	public void test3() throws Exception{
		Directory fsDir = FSDirectory.getDirectory(indexPath);
		IndexWriter fsIndexWriter = new IndexWriter(fsDir, analyzer, MaxFieldLength.LIMITED);
		
		fsIndexWriter.optimize();
		fsIndexWriter.close();
	}
}
*/