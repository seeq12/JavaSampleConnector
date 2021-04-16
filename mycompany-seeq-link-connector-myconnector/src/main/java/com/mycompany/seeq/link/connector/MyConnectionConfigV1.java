package com.mycompany.seeq.link.connector;

import com.seeq.link.sdk.DefaultPullDatasourceConnectionConfig;

/**
 * The configuration object should be a Plain Old Java Object (POJO) with little to no logic, just fields.
 */
public class MyConnectionConfigV1 extends DefaultPullDatasourceConnectionConfig {
    private int tagCount;
    private String samplePeriod;
    private int childAssetCount;

    public int getTagCount() {
        return this.tagCount;
    }

    public void setTagCount(int tagCount) {
        this.tagCount = tagCount;
    }

    public int getChildAssetCount(){
        return this.childAssetCount;
    }

    public void setChildAssetCount(int childCount){
        this.childAssetCount = childCount;
    }

    public String getSamplePeriod() {
        return this.samplePeriod;
    }

    public void setSamplePeriod(String samplePeriod) {
        this.samplePeriod = samplePeriod;
    }
}
