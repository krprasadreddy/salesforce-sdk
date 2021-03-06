@isTest
private class IBMNaturalLanguageUnderstandingV1Test {
  /**
   *  Test Analyze text, HTML, or a public webpage.
   *
   */
  static testMethod void testAnalyze() {
    String body = IBMWatsonMockResponses.analysisResults();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMWatsonIAMOptions iamOptions = new IBMWatsonIAMOptions.Builder()
      .apiKey('apikey')
      .build();
    IBMNaturalLanguageUnderstandingV1 naturalLanguageUnderstanding = new IBMNaturalLanguageUnderstandingV1('2017-02-27', iamOptions);
    naturalLanguageUnderstanding.setEndPoint('https://gateway.watsonplatform.net/natural-language-understanding/api');
    IBMNaturalLanguageUnderstandingV1Models.ConceptsOptions concepts = new IBMNaturalLanguageUnderstandingV1Models.ConceptsOptionsBuilder()
      .xlimit(40)
      .build();
    concepts = concepts.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.EmotionOptions emotion = new IBMNaturalLanguageUnderstandingV1Models.EmotionOptionsBuilder()
      .document(true)
      .addTargets('test')
      .targets(new List<String>{'test'})
      .build();
    emotion = emotion.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.EntitiesOptions entities = new IBMNaturalLanguageUnderstandingV1Models.EntitiesOptionsBuilder()
      .xlimit(40)
      .model('test')
      .sentiment(true)
      .emotion(true)
      .build();
    entities = entities.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.KeywordsOptions keywords = new IBMNaturalLanguageUnderstandingV1Models.KeywordsOptionsBuilder()
      .xlimit(40)
      .sentiment(true)
      .emotion(true)
      .build();
    keywords = keywords.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.RelationsOptions relations = new IBMNaturalLanguageUnderstandingV1Models.RelationsOptionsBuilder()
      .model('test')
      .build();
    relations = relations.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.SemanticRolesOptions semanticRoles = new IBMNaturalLanguageUnderstandingV1Models.SemanticRolesOptionsBuilder()
      .xlimit(40)
      .keywords(true)
      .entities(true)
      .build();
    semanticRoles = semanticRoles.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.SentimentOptions sentiment = new IBMNaturalLanguageUnderstandingV1Models.SentimentOptionsBuilder()
      .document(true)
      .addTargets('test')
      .targets(new List<String>{'test'})
      .build();
    sentiment = sentiment.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.CategoriesOptions categories = new IBMNaturalLanguageUnderstandingV1Models.CategoriesOptions();
    categories.put('emotion', emotion);
    IBMNaturalLanguageUnderstandingV1Models.MetadataOptions metadata = new IBMNaturalLanguageUnderstandingV1Models.MetadataOptions();
    metadata.put('', '');
    IBMNaturalLanguageUnderstandingV1Models.Features features = new IBMNaturalLanguageUnderstandingV1Models.FeaturesBuilder()
      .concepts(concepts)
      .emotion(emotion)
      .entities(entities)
      .keywords(keywords)
      .metadata(metadata)
      .relations(relations)
      .semanticRoles(semanticRoles)
      .categories(categories)
      .sentiment(sentiment)
      .build();
    features = features.newBuilder().build();

    IBMNaturalLanguageUnderstandingV1Models.AnalyzeOptions options = new IBMNaturalLanguageUnderstandingV1Models.AnalyzeOptionsBuilder()
      .text('text')
      .html('<html><body>test</body></html>')
      .url('https://gateway.watsonplatform.net')
      .features(features)
      .clean(false)
      .xpath('test')
      .fallbackToRaw(true)
      .returnAnalyzedText(true)
      .language('en')
      .limitTextCharacters(100)
      .addHeader('Test-Header', 'test_value')
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.AnalysisResults resp =
      naturalLanguageUnderstanding.analyze(options);
    System.assertEquals(resp.getLanguage(), 'en');
    System.assertEquals(resp.getAnalyzedText(), null);
    System.assertEquals(resp.getRetrievedUrl(), 'https://www.ibm.com/us-en/');
    System.assertEquals(resp.getUsage().getFeatures(), 4);
    System.assertEquals(resp.getUsage().getTextCharacters(), 40);
    System.assertEquals(resp.getUsage().getTextUnits(), 5);
    System.assertEquals(resp.getConcepts()[0].getText(), 'test');
    System.assertEquals(resp.getConcepts()[0].getRelevance(), 0.66382);
    System.assertEquals(resp.getConcepts()[0].getDbpediaResource(), 'test');
    System.assertEquals(resp.getEntities()[0].getXtype(), 'Company');
    System.assertEquals(resp.getEntities()[0].getRelevance(), 0.89792);
    System.assertEquals(resp.getEntities()[0].getCount(), 12);
    System.assertEquals(resp.getEntities()[0].getDisambiguation().getName(), 'IBM');
    System.assertEquals(resp.getEntities()[0].getDisambiguation().getDbpediaResource(), 'http://dbpedia.org/resource/IBM');
    System.assertEquals(resp.getEntities()[0].getDisambiguation().getSubtype().size(), 7);
    System.assertEquals(resp.getEntities()[0].getEmotion().getSadness(), 0.271362);
    System.assertEquals(resp.getEntities()[0].getEmotion().getJoy(), 0.618694);
    System.assertEquals(resp.getEntities()[0].getEmotion().getFear(), 0.033186);
    System.assertEquals(resp.getEntities()[0].getEmotion().getDisgust(), 0.056113);
    System.assertEquals(resp.getEntities()[0].getEmotion().getAnger(), 0.099437);
    System.assertEquals(resp.getEntities()[0].getSentiment().getScore(), 0.099437);
    System.assertEquals(resp.getKeywords()[0].getEmotion().getAnger(), 0.044105);
    System.assertEquals(resp.getKeywords()[0].getRelevance(), 0.900808);
    System.assertEquals(resp.getKeywords()[0].getSentiment().getScore(), 0.419889);
    System.assertEquals(resp.getKeywords()[0].getText(), 'free trial');
    System.assertEquals(resp.getCategories()[0].getScore(), 0.89792);
    System.assertEquals(resp.getCategories()[0].getLabel(), 'Company');
    System.assertEquals(resp.getEmotion().getDocument().getEmotion().getAnger(), 0.099437);
    System.assertEquals(resp.getEmotion().getTargets()[0].getText(), 'test');
    System.assertEquals(resp.getEmotion().getTargets()[0].getEmotion().getAnger(), 0.099437);
    System.assertEquals(resp.getRelations()[0].getArguments()[0].getEntities()[0].getText(), 'test');
    System.assertEquals(resp.getRelations()[0].getArguments()[0].getEntities()[0].getXtype(), 'Company');
    System.assertEquals(resp.getRelations()[0].getXtype(), 'Company');
    System.assertEquals(resp.getRelations()[0].getSentence(), 'Company');
    System.assertEquals(resp.getRelations()[0].getScore(), 0.89792);
    System.assertEquals(resp.getMetadata().getAuthors()[0].getName(), 'test');
    System.assertEquals(resp.getMetadata().getTitle(), 'test');
    System.assertEquals(resp.getMetadata().getPublicationDate(), '2017-05-16T13:56:54.957Z');
    System.assertEquals(resp.getSemanticRoles()[0].getSentence(), 'Company');
    System.assertEquals(resp.getSemanticRoles()[0].getSubject().getEntities()[0].getXtype(), 'Company');
    System.assertEquals(resp.getSemanticRoles()[0].getSubject().getEntities()[0].getText(), 'test');
    System.assertEquals(resp.getSemanticRoles()[0].getSubject().getText(), 'test');
    System.assertEquals(resp.getSemanticRoles()[0].getSubject().getKeywords()[0].getText(), 'test');
    System.assertEquals(resp.getSemanticRoles()[0].getAction().getText(), 'test');
    System.assertEquals(resp.getSemanticRoles()[0].getAction().getNormalized(), 'test');
    System.assertEquals(resp.getSemanticRoles()[0].getAction().getVerb().getText(), 'test');
    System.assertEquals(resp.getSemanticRoles()[0].getAction().getVerb().getTense(), 'test');
    System.assertEquals(resp.getSemanticRoles()[0].getXobject().getText(), 'test');
    System.assertEquals(resp.getSemanticRoles()[0].getXobject().getKeywords()[0].getText(), 'test');
    System.assertEquals(resp.getSentiment().getTargets()[0].getText(), 'test');
    System.assertEquals(resp.getSentiment().getTargets()[0].getScore(), 0.89792);
    System.assertEquals(resp.getSentiment().getDocument().getLabel(), 'test');
    System.assertEquals(resp.getSentiment().getDocument().getScore(), 0.89792);
    Test.stopTest();
  }
  static testMethod void testAnalysisResultsAttributes() {
    Test.startTest();
    IBMNaturalLanguageUnderstandingV1Models.AnalysisResults analysisResults =
      new IBMNaturalLanguageUnderstandingV1Models.AnalysisResults();
    analysisResults.setLanguage('de');
    analysisResults.setAnalyzedText('test');
    analysisResults.setRetrievedUrl('https://www.ibm.com/us-en/');
    IBMNaturalLanguageUnderstandingV1Models.Usage usage = new IBMNaturalLanguageUnderstandingV1Models.Usage();
    usage.setFeatures(4);
    usage.setTextCharacters(40);
    usage.setTextUnits(5);
    analysisResults.setUsage(usage);
    IBMNaturalLanguageUnderstandingV1Models.ConceptsResult conceptsResult = new IBMNaturalLanguageUnderstandingV1Models.ConceptsResult();
    conceptsResult.setText('test');
    conceptsResult.setRelevance((Double)0.66382);
    conceptsResult.setDbpediaResource('test');
    analysisResults.setConcepts(new List<IBMNaturalLanguageUnderstandingV1Models.ConceptsResult>{conceptsResult});
    IBMNaturalLanguageUnderstandingV1Models.EntitiesResult entitiesResult = new IBMNaturalLanguageUnderstandingV1Models.EntitiesResult();
    entitiesResult.setXtype('Company');
    entitiesResult.setRelevance((Double)0.89792);
    entitiesResult.setCount(12);
    entitiesResult.setText('test');
    IBMNaturalLanguageUnderstandingV1Models.DisambiguationResult disambiguationResult = new IBMNaturalLanguageUnderstandingV1Models.DisambiguationResult();
    disambiguationResult.setName('IBM');
    disambiguationResult.setDbpediaResource('http://dbpedia.org/resource/IBM');
    disambiguationResult.setSubtype(new List<String>{'test'});
    entitiesResult.setDisambiguation(disambiguationResult);
    IBMNaturalLanguageUnderstandingV1Models.EmotionScores emotionScores = new IBMNaturalLanguageUnderstandingV1Models.EmotionScores();
    emotionScores.setSadness((Double)0.271362);
    emotionScores.setJoy((Double)0.618694);
    emotionScores.setFear((Double)0.033186);
    emotionScores.setDisgust((Double)0.056113);
    emotionScores.setAnger((Double)0.099437);
    entitiesResult.setEmotion(emotionScores);
    IBMNaturalLanguageUnderstandingV1Models.FeatureSentimentResults featureSentimentResults = new IBMNaturalLanguageUnderstandingV1Models.FeatureSentimentResults();
    featureSentimentResults.setScore((Double)0.099437);
    entitiesResult.setSentiment(featureSentimentResults);
    analysisResults.setEntities(new List<IBMNaturalLanguageUnderstandingV1Models.EntitiesResult>{entitiesResult});
    IBMNaturalLanguageUnderstandingV1Models.KeywordsResult keywordsResult = new IBMNaturalLanguageUnderstandingV1Models.KeywordsResult();
    keywordsResult.setRelevance((Double)0.89792);
    keywordsResult.setText('test');
    keywordsResult.setEmotion(emotionScores);
    keywordsResult.setSentiment(featureSentimentResults);
    analysisResults.setKeywords(new List<IBMNaturalLanguageUnderstandingV1Models.KeywordsResult>{keywordsResult});
    IBMNaturalLanguageUnderstandingV1Models.CategoriesResult categoriesResult = new IBMNaturalLanguageUnderstandingV1Models.CategoriesResult();
    categoriesResult.setLabel('Company');
    categoriesResult.setScore((Double)0.89792);
    analysisResults.setCategories(new List<IBMNaturalLanguageUnderstandingV1Models.CategoriesResult>{categoriesResult});
    IBMNaturalLanguageUnderstandingV1Models.EmotionResult emotionResult = new IBMNaturalLanguageUnderstandingV1Models.EmotionResult();
    IBMNaturalLanguageUnderstandingV1Models.DocumentEmotionResults documentEmotionResults = new IBMNaturalLanguageUnderstandingV1Models.DocumentEmotionResults();
    documentEmotionResults.setEmotion(emotionScores);
    emotionResult.setDocument(documentEmotionResults);
    IBMNaturalLanguageUnderstandingV1Models.TargetedEmotionResults targetedEmotionResults = new IBMNaturalLanguageUnderstandingV1Models.TargetedEmotionResults();
    targetedEmotionResults.setEmotion(emotionScores);
    targetedEmotionResults.setText('test');
    emotionResult.setTargets(new List<IBMNaturalLanguageUnderstandingV1Models.TargetedEmotionResults>{targetedEmotionResults});
    analysisResults.setEmotion(emotionResult);
    IBMNaturalLanguageUnderstandingV1Models.MetadataResult metadataResult = new IBMNaturalLanguageUnderstandingV1Models.MetadataResult();
    analysisResults.setMetadata(metadataResult);
    IBMNaturalLanguageUnderstandingV1Models.RelationsResult relationsResult = new IBMNaturalLanguageUnderstandingV1Models.RelationsResult();
    relationsResult.setScore((Double)0.89792);
    relationsResult.setXtype('Company');
    relationsResult.setSentence('Company');
    IBMNaturalLanguageUnderstandingV1Models.RelationArgument relationArgument = new IBMNaturalLanguageUnderstandingV1Models.RelationArgument();
    relationArgument.setText('test');
    IBMNaturalLanguageUnderstandingV1Models.RelationEntity relationEntity = new IBMNaturalLanguageUnderstandingV1Models.RelationEntity();
    relationEntity.setXtype('Company');
    relationEntity.setText('test');
    relationArgument.setEntities(new List<IBMNaturalLanguageUnderstandingV1Models.RelationEntity>{relationEntity});
    relationsResult.setArguments(new List<IBMNaturalLanguageUnderstandingV1Models.RelationArgument>{relationArgument});
    analysisResults.setRelations(new List<IBMNaturalLanguageUnderstandingV1Models.RelationsResult>{relationsResult});
    IBMNaturalLanguageUnderstandingV1Models.SemanticRolesResult semanticRolesResult = new IBMNaturalLanguageUnderstandingV1Models.SemanticRolesResult();
    semanticRolesResult.setSentence('Company');
    IBMNaturalLanguageUnderstandingV1Models.SemanticRolesSubject semanticRolesSubject = new IBMNaturalLanguageUnderstandingV1Models.SemanticRolesSubject();
    semanticRolesSubject.setText('test');
    IBMNaturalLanguageUnderstandingV1Models.SemanticRolesEntity semanticRolesEntity = new IBMNaturalLanguageUnderstandingV1Models.SemanticRolesEntity();
    semanticRolesEntity.setXtype('Company');
    semanticRolesEntity.setText('test');
    semanticRolesSubject.setEntities(new List<IBMNaturalLanguageUnderstandingV1Models.SemanticRolesEntity>{semanticRolesEntity});
    IBMNaturalLanguageUnderstandingV1Models.SemanticRolesKeyword semanticRolesKeyword = new IBMNaturalLanguageUnderstandingV1Models.SemanticRolesKeyword();
    semanticRolesKeyword.setText('test');
    semanticRolesSubject.setKeywords(new List<IBMNaturalLanguageUnderstandingV1Models.SemanticRolesKeyword>{semanticRolesKeyword});
    semanticRolesResult.setSubject(semanticRolesSubject);
    IBMNaturalLanguageUnderstandingV1Models.SemanticRolesAction semanticRolesAction = new IBMNaturalLanguageUnderstandingV1Models.SemanticRolesAction();
    semanticRolesResult.setAction(semanticRolesAction);
    IBMNaturalLanguageUnderstandingV1Models.SemanticRolesObject semanticRolesObject = new IBMNaturalLanguageUnderstandingV1Models.SemanticRolesObject();
    semanticRolesResult.setXobject(semanticRolesObject);
    analysisResults.setSemanticRoles(new List<IBMNaturalLanguageUnderstandingV1Models.SemanticRolesResult>{semanticRolesResult});
    IBMNaturalLanguageUnderstandingV1Models.SentimentResult sentimentResult = new IBMNaturalLanguageUnderstandingV1Models.SentimentResult();
    analysisResults.setSentiment(sentimentResult);
    System.assertEquals(analysisResults.getLanguage(), 'de');
    System.assertEquals(analysisResults.getAnalyzedText(), 'test');
    System.assertEquals(analysisResults.getRetrievedUrl(), 'https://www.ibm.com/us-en/');
    System.assertEquals(analysisResults.getUsage().getFeatures(), 4);
    System.assertEquals(analysisResults.getUsage().getTextCharacters(), 40);
    System.assertEquals(analysisResults.getUsage().getTextUnits(), 5);
    System.assertEquals(analysisResults.getConcepts()[0].getText(), 'test');
    System.assertEquals(analysisResults.getConcepts()[0].getRelevance(), 0.66382);
    System.assertEquals(analysisResults.getConcepts()[0].getDbpediaResource(), 'test');
    System.assertEquals(analysisResults.getEntities()[0].getXtype(), 'Company');
    System.assertEquals(analysisResults.getEntities()[0].getRelevance(), 0.89792);
    System.assertEquals(analysisResults.getEntities()[0].getCount(), 12);
    System.assertEquals(analysisResults.getEntities()[0].getDisambiguation().getName(), 'IBM');
    System.assertEquals(analysisResults.getEntities()[0].getDisambiguation().getDbpediaResource(), 'http://dbpedia.org/resource/IBM');
    System.assertEquals(analysisResults.getEntities()[0].getDisambiguation().getSubtype().size(), 1);
    System.assertEquals(analysisResults.getEntities()[0].getEmotion().getSadness(), 0.271362);
    System.assertEquals(analysisResults.getEntities()[0].getEmotion().getJoy(), 0.618694);
    System.assertEquals(analysisResults.getEntities()[0].getEmotion().getFear(), 0.033186);
    System.assertEquals(analysisResults.getEntities()[0].getEmotion().getDisgust(), 0.056113);
    System.assertEquals(analysisResults.getEntities()[0].getEmotion().getAnger(), 0.099437);
    System.assertEquals(analysisResults.getEntities()[0].getSentiment().getScore(), 0.099437);
    System.assertEquals(analysisResults.getKeywords()[0].getEmotion().getAnger(), 0.099437);
    System.assertEquals(analysisResults.getKeywords()[0].getRelevance(), 0.89792);
    System.assertEquals(analysisResults.getKeywords()[0].getSentiment().getScore(), 0.099437);
    System.assertEquals(analysisResults.getKeywords()[0].getText(), 'test');
    System.assertEquals(analysisResults.getCategories()[0].getScore(), 0.89792);
    System.assertEquals(analysisResults.getCategories()[0].getLabel(), 'Company');
    System.assertEquals(analysisResults.getEmotion().getDocument().getEmotion().getAnger(), 0.099437);
    System.assertEquals(analysisResults.getEmotion().getTargets()[0].getText(), 'test');
    System.assertEquals(analysisResults.getEmotion().getTargets()[0].getEmotion().getAnger(), 0.099437);
    System.assertEquals(analysisResults.getRelations()[0].getArguments()[0].getEntities()[0].getText(), 'test');
    System.assertEquals(analysisResults.getRelations()[0].getArguments()[0].getEntities()[0].getXtype(), 'Company');
    System.assertEquals(analysisResults.getRelations()[0].getXtype(), 'Company');
    System.assertEquals(analysisResults.getRelations()[0].getSentence(), 'Company');
    System.assertEquals(analysisResults.getRelations()[0].getScore(), 0.89792);
    Test.stopTest();
  }
  static testMethod void testListModels() {
    String body = IBMWatsonMockResponses.listModelsResults();
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMNaturalLanguageUnderstandingV1 naturalLanguageUnderstanding = new IBMNaturalLanguageUnderstandingV1('2017-02-27');
    naturalLanguageUnderstanding.setEndPoint('https://gateway.watsonplatform.net/natural-language-understanding/api');
    naturalLanguageUnderstanding.setUsernameAndPassword('username', 'password');
    IBMNaturalLanguageUnderstandingV1Models.ListModelsOptions options = new IBMNaturalLanguageUnderstandingV1Models.ListModelsOptionsBuilder()
      .addHeader('Test-Header', 'test_value')
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    IBMNaturalLanguageUnderstandingV1Models.ListModelsResults resp =
      naturalLanguageUnderstanding.listModels(options);
    System.assertEquals(resp.getModels().size(),1);
    System.assertEquals(resp.getModels()[0].getStatus(), 'string');
    System.assertEquals(resp.getModels()[0].getmodelId(), 'string');
    System.assertEquals(resp.getModels()[0].getLanguage(), 'string');
    System.assertEquals(resp.getModels()[0].getDescription(), 'string');
    Test.stopTest();
  }

  static testMethod void testDeleteModel() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    IBMNaturalLanguageUnderstandingV1 naturalLanguageUnderstanding = new IBMNaturalLanguageUnderstandingV1('2017-09-01', 'username', 'password');
    naturalLanguageUnderstanding.setEndPoint('https://gateway.watsonplatform.net/natural-language-understanding/api');
    IBMNaturalLanguageUnderstandingV1Models.DeleteModelOptions options = new IBMNaturalLanguageUnderstandingV1Models.DeleteModelOptionsBuilder()
      .modelId('test')
      .addHeader('Test-Header', 'test_value')
      .build();
    //you can add more attributes using following builder method. This step is not necessary
    options = options.newBuilder().build();
    naturalLanguageUnderstanding.deleteModel(options);
    Test.stopTest();
  }
  static testMethod void testException() {
    String body = '';
    IBMWatsonMockHttpResponse mockResponse = new IBMWatsonMockHttpResponse(200, 'Success', body, null);
    Test.setMock(HttpCalloutMock.class, mockResponse);
    Test.startTest();
    try
    {
      IBMNaturalLanguageUnderstandingV1 naturalLanguageUnderstanding = new IBMNaturalLanguageUnderstandingV1('');
      naturalLanguageUnderstanding.setEndPoint('https://gateway.watsonplatform.net/natural-language-understanding/api');
      IBMNaturalLanguageUnderstandingV1Models.DeleteModelOptions options = new IBMNaturalLanguageUnderstandingV1Models.DeleteModelOptionsBuilder()
        .modelId('test')
        .addHeader('Test-Header', 'test_value')
        .build();
      naturalLanguageUnderstanding.deleteModel(options);
    }
    catch( IBMWatsonServiceExceptions.IllegalArgumentException exptn) {
      System.assertEquals(exptn.getMessage(), 'versionDate cannot be null.');
    }
    Test.stopTest();
  }
}