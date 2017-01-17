/*package com.pxy.utils;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.Filter;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.junit.Test;


public class HelloWorld {

	String filePath = "E://eclipse_luna//test_ssh//src//com//pxy//utils//IndexWriter addDocument's a javadoc .txt";

	String indexPath = "E://eclipse_luna//test_ssh//luceneIndex";

	Analyzer analyzer = new StandardAnalyzer();

	*//**
	 * 创建索引
	 * 
	 * IndexWriter 是用来操作（增、删、改）索引库的
	 * 1.创建directory
	 * 2.创建indexwriter
	 * 3.创建document
	 * 4.为docunment添加field
	 * 5.通过indexwriter添加文档到索引中
	 *//*
	@Test
	public void createIndex() throws Exception {
		// file --> doc
		Document doc = File2DocumentUtils.file2Document(filePath);

		// 建立索引
		IndexWriter indexWriter = new IndexWriter(indexPath, analyzer, true,
				MaxFieldLength.LIMITED);
		indexWriter.addDocument(doc);
		indexWriter.close();
	}

	*//**
	 * 搜索
	 * 
	 * IndexSearcher 是用来在索引库中进行查询的
	 *//*
	@Test
	public void search() throws Exception {
//		String queryString = "document";
		String queryString = "adddocument";
		*//**
		 * 1.创建directory
		 * 2.创建indexReader
		 * 3.创建IndexSearcher
		 * 4.创建搜索的query
		 * 5.根据searcher搜索并返回topdocs
		 * 6.根据topdocs获取scoredoc
		 * 7.根据searcher和scoredoc对象获取具体document对象
		 * 8.根据document获取需要的值
		 * 9.关闭reader
		 *//*
		// 1，把要搜索的文本解析为 Query
		String[] fields = { "name", "content" };
		QueryParser queryParser = new MultiFieldQueryParser(fields, analyzer);
		Query query = queryParser.parse(queryString);

		// 2，进行查询
		IndexSearcher indexSearcher = new IndexSearcher(indexPath);
		Filter filter = null;
		TopDocs topDocs = indexSearcher.search(query, filter, 10000);
		System.out.println("总共有【" + topDocs.totalHits + "】条匹配结果");

		// 3，打印结果，评分对象
		for (ScoreDoc scoreDoc : topDocs.scoreDocs) {
			int docSn = scoreDoc.doc; // 文档内部编号
			Document doc = indexSearcher.doc(docSn); // 根据编号取出相应的文档
			File2DocumentUtils.printDocumentInfo(doc); // 打印出文档信息
		}
	}
}
*/