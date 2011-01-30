// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.jenrawson.familyfridge.domain;

import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.jenrawson.familyfridge.domain.AccountDataOnDemand;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AccountIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AccountIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AccountIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: AccountIntegrationTest: @Transactional;
    
    @Autowired
    private AccountDataOnDemand AccountIntegrationTest.dod;
    
    private static final LocalServiceTestHelper AccountIntegrationTest.helper = new LocalServiceTestHelper(new com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig());
    
    @BeforeClass
    public static void AccountIntegrationTest.setUp() {
        helper.setUp();
    }
    
    @AfterClass
    public static void AccountIntegrationTest.tearDown() {
        helper.tearDown();
    }
    
    @Test
    public void AccountIntegrationTest.testCountAccounts() {
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", dod.getRandomAccount());
        long count = com.jenrawson.familyfridge.domain.Account.countAccounts();
        org.junit.Assert.assertTrue("Counter for 'Account' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AccountIntegrationTest.testFindAccount() {
        com.jenrawson.familyfridge.domain.Account obj = dod.getRandomAccount();
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to provide an identifier", id);
        obj = com.jenrawson.familyfridge.domain.Account.findAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'Account' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Account' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AccountIntegrationTest.testFindAllAccounts() {
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", dod.getRandomAccount());
        long count = com.jenrawson.familyfridge.domain.Account.countAccounts();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Account', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<com.jenrawson.familyfridge.domain.Account> result = com.jenrawson.familyfridge.domain.Account.findAllAccounts();
        org.junit.Assert.assertNotNull("Find all method for 'Account' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Account' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AccountIntegrationTest.testFindAccountEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", dod.getRandomAccount());
        long count = com.jenrawson.familyfridge.domain.Account.countAccounts();
        if (count > 20) count = 20;
        java.util.List<com.jenrawson.familyfridge.domain.Account> result = com.jenrawson.familyfridge.domain.Account.findAccountEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Account' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Account' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AccountIntegrationTest.testFlush() {
        com.jenrawson.familyfridge.domain.Account obj = dod.getRandomAccount();
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to provide an identifier", id);
        obj = com.jenrawson.familyfridge.domain.Account.findAccount(id);
        org.junit.Assert.assertNotNull("Find method for 'Account' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAccount(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Account' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AccountIntegrationTest.testMerge() {
        com.jenrawson.familyfridge.domain.Account obj = dod.getRandomAccount();
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to provide an identifier", id);
        obj = com.jenrawson.familyfridge.domain.Account.findAccount(id);
        boolean modified =  dod.modifyAccount(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        com.jenrawson.familyfridge.domain.Account merged = (com.jenrawson.familyfridge.domain.Account) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Account' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AccountIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", dod.getRandomAccount());
        com.jenrawson.familyfridge.domain.Account obj = dod.getNewTransientAccount(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Account' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Account' identifier to no longer be null", obj.getId());
    }
    
    @Test
    @Transactional(propagation = Propagation.SUPPORTS)
    public void AccountIntegrationTest.testRemove() {
        com.jenrawson.familyfridge.domain.Account obj = dod.getRandomAccount();
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Account' failed to provide an identifier", id);
        obj = com.jenrawson.familyfridge.domain.Account.findAccount(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Account' with identifier '" + id + "'", com.jenrawson.familyfridge.domain.Account.findAccount(id));
    }
    
}