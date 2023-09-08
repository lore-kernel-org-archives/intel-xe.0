Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCA0EEB56F
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9FB10E94A;
	Fri,  8 Sep 2023 20:33:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740BD10E94A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694205214; x=1725741214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=C+ngvZeZd7543mjm8UJKl5cQMF6JS/gwSXz7jWn5DUU=;
 b=W3hN8sku4R8tky9379c5AvFTxjRyRmbo+cRAT4RSx57mMEKEB0pLB2Wd
 6ofJm+AdmpQehS/tUkipWayBbFrNSyKkITOy+e6jSLLcX/p/vcowEt8Gg
 JeJ5FFTHP9jYP8ST0wXccrmwPxso6ui4A6FEQpBv0t7wQYe7YtjwExMpW
 kozCKqQ/ewyAWJXdACgotNvrheU0VyBN7VWAwRbhzN38ziMz5PJE359vX
 /ag52OpOu1VqJf73mRnCs6Js/WZDrBEOFsP6qwlfGWdEZRy3pGtM2AOie
 Cy9BR2NudFRHZKEbt/pl6kankw8F8tjmrIMlPY2IQ496zdIKtfnJakn/M Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357205406"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="357205406"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 13:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="832780900"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="832780900"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 13:33:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:33:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 13:33:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 13:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT7TCD2etKraVaJGUE2e1jhtKeV9vEyHvwg/m5vICQQs55DPH3QDMYzZiA4wjpAf8aGSvXE0D3rIrHCGbHD38RoYCJlk/Hnr3ST+VoRoqL1Uj1IcwPkU5zHO9Z7csjFl7rfudBpmLgCfZ3akEJA2ZQxcKdBoqZCY1CqQDueW08DMwMAavbXvITZQDY8C8cLlrepKHntAqgFRfaWR79awvwaaItg6Udwbzaj8sidRvLJJYXfQ5L4rICCTqWLPCyFJfDQ0QNrVxHVSyAvtIDASsxJTiUiM+mR4fuURrM7AYx3WNI813VWWY/+bru+p1hqARJ1sL5SD87xZ4szopIIBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gVyjBkKuKdaDmHUKmeBzTzAfn6aBndnnndVLXajL14=;
 b=ax/kkHjH3cKmKcEYjNFye1T13awlamzJwnjK1B+Xrk9nqOp0fm6pRy6nd7sG5Eo/27g64yRxsgZD1NlqTc5dkFXsyTwXSeBut1oINpuqfj4um1f4wtm6sbv5sbYn1nz0k1nELGhBlvSt/UlPZeBv5SJOYXWTev2Hf3viP3//vDVKiciYtM5AnTqQQqSDd0O2IR2/DNPKAYa7O28If5ByaMD65fqcIkq+/txgFzw03FEKTeF/QlrbZbb4s7MVgw2MDDm0cgJB17mJiNKm/ut5LBVT1KlbHxopbCb7Csbm5ZER+Lai+PwkrK745gULPO+96xTWvsn1J5Hmhia582BJew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 20:33:28 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 20:33:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 16:33:02 -0400
Message-ID: <20230908203302.449041-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908203302.449041-1-rodrigo.vivi@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 948b6fa7-c8d3-4e01-ba06-08dbb0aadb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p4RruEi7W27M5go7jJrGX7zwjIZ498Wj9OOL/Az+6wRj9vHD7zV3tpywLPKb0jOVxsJVjrK7pD63UBLJGqsaoJY7p7Y5nSDMLoDM0F6aCnLsgbM7a9NtQ3vi5p5eWWg96XjNDZcggqlNLjKhJKYOhIQ5Yd2SGrLAvikpgW48uXhC8GV2RH7NwwfYw01dGqX4t2EeHYkTrHBHCV4QDMxAsgcfy25ZcB1WtX1LM0Dnx5xbCMBqPO9zawLrRE4pEyemvElgOKlvsBH2uNd5Vkmbaca5EM5YkuxLIRKr9ZIGrqFnvJeUBaGs1sdTICR0X3IrKN/bfYNABnf0oFjfvoDbLZCsGFsQ7AjDaRYM9rHU5kGEgsGGO5WzbY7XLSxzcGjsd7mWEEYxgbc1nPijJcm3wh8/PEnT7ZHZ5EqsuX+1/Z/zoaR593s8wimciRv4Iw2ZdsGpQFkVBvCNy6TIFw3gbebtOPlJUjVT1DlfUS/Z12ra0y6rQLrkUIZVAGT+2UNz0CKaeY0gkS9704aleZ5PbUcs+tHlPURQAreeyQb/l6UldBikERRnlc2zsEqPPxcA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(6666004)(6486002)(6506007)(6512007)(107886003)(36756003)(82960400001)(38100700002)(86362001)(2616005)(1076003)(26005)(41300700001)(83380400001)(478600001)(5660300002)(8936002)(4326008)(8676002)(44832011)(2906002)(66946007)(316002)(54906003)(6916009)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rOtzp1FW7JB8O33LARpy56CfDteB7UgOd7qyc0Mx28sd0WcGtuXjer/ICH7o?=
 =?us-ascii?Q?XCy3qW03w5OgQ9hMGuOvbXvVzAsaPjIFL2cDxuLLeGh0rFZNE8ea4R+dxvUN?=
 =?us-ascii?Q?qL8K+RD2cxWQZjzzNIWBotvi59peRQojh4VA8miDB4dznJxCE79m21yJ/uqQ?=
 =?us-ascii?Q?YPaiCxYTYFkQu5X57fJZmRnLYZIEQ6wSUQCn0Qd9nS+EDzbcpGaXmlInp2c9?=
 =?us-ascii?Q?fYWlfsRjedflYE1zhnLhE6hjQE1L7dWgSoyc6tdbGpHzSaq7lp2tK8PX6sbv?=
 =?us-ascii?Q?NUwpAG3VBfGkz+Rr74TFhOiYmHXzbWCPbrI/2qaQKUI6k+UEX6gpC7UHXAm4?=
 =?us-ascii?Q?x39MbLcwqcXx9ET6T68wQ88gLyWeYDsVSsIR0t9shglKTW9xIv/gwDf75BeK?=
 =?us-ascii?Q?FbMzgxMPEQR1+ozK+RCbr+GvtQ5pk4MuaiqZQsFH6lCBwoEa0H8xB8+ctG7l?=
 =?us-ascii?Q?CpKA2yEb+aiFg1aOO1E2FCCPjED98hcmhiu9MpLGo9mKs5QBgWnfapA7HFC3?=
 =?us-ascii?Q?/SkOHZyyThXWV8G+bRsKkt/clb5XZ1qih6KeXPbKJH6vUIlI75hXosy4mvMX?=
 =?us-ascii?Q?XGFf64T+Iwfr9pFkpSUoZGCirPEHyoU6/XvNcvZYIANDrII0sMy7zOt1ehlw?=
 =?us-ascii?Q?XEuakqwwgs10BpU6hFkGUtQyvIGsrui7pYmuHHXZWgSyEYLjqkF62ubf30u3?=
 =?us-ascii?Q?bb39O9x3OHQOib8uulMgaa/6ymh8QWnlGXKuDtFCXPkQu5pI6SYRaSPte54I?=
 =?us-ascii?Q?PuTl3cgg7kdpTrAeq0+E/PKuLRHs8BKg+o5kOLTWfn8oyP8ikMAN0Xbovp/+?=
 =?us-ascii?Q?loHIyL0yXVs3Qmr4uRf5rMzOKS2h7TfqFkYURnD10F9jiL+iNpCJrbznMo7c?=
 =?us-ascii?Q?pWPhDCRVctmE+ADegHEiCbze0e7gq/l0kbdS4sxr+H7JjHEsWiNA4U0rS7HG?=
 =?us-ascii?Q?5kRYlkQu7dMi/FKddQmTPlOC/8DIOMgtDdVv67OGthjPicoUQchhfv8C7/MW?=
 =?us-ascii?Q?SB5Ov+1Uc4DZJeLrDhKmGugZBpxn2yDyPIYtYFQFn6ST+XyYrGoROeOMfuZx?=
 =?us-ascii?Q?GexOptiPuoZy1eIRm+nsVWdliReKS9UIDSpPEpt6PFyRnn5RBviRyHJv0OgU?=
 =?us-ascii?Q?/05fOcAhF5SwfFO7vnKqwuySk33TA06Q3QK/01eKodD7RZLE3lPN7gZ2XB3D?=
 =?us-ascii?Q?OKbLD0/CRyP6OrXKRncGcwCVJJCwYadSi80xF1l7pmdLvb/7zLWV+JViJpkw?=
 =?us-ascii?Q?I2zMLgc6BR9p5uV64k3+Zf7m9OBECovgVHUY9tzGXKpNB0bq7BAyUznHw+vS?=
 =?us-ascii?Q?c4B8stiF5LQnYbRT38rCPFGVU6h6P97ZJAPAiHTSIBuzu/Io5xJKgsB/Ugi2?=
 =?us-ascii?Q?myjFSE/QyY6f4Di2JOdm4fDIuKBnet9xks2WxHCv6SRd+vreloc+WXcK054+?=
 =?us-ascii?Q?NhTCPlcNAjLm4cSaF6dv8m9A8nhUvQe9hgDFiKtGfervlQqzqxPbvs0gxzUY?=
 =?us-ascii?Q?Mt+eE+X+WuKNvi0VmHl5PTWsYOuLa9c97Ji2lryhbkwDYCjgwGtl1VygqFae?=
 =?us-ascii?Q?yRQpuMSSWFcmkB3jHue37S8JmuE94tjaVU2LcjT+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 948b6fa7-c8d3-4e01-ba06-08dbb0aadb88
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:33:28.4609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NElfZy3yOp+Wr6UjVGmJ+xb9yzvM0aWZm03NJyz19yz/Aavu0u+7Joe8AtPh1JzuYB499ylF2PW6Xe1RmaHa6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 5/5] drm/xe/uapi: Rename gts to gt_list.
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

During the uapi review it was identified a possible confusion
with the plural of acronym with a new acronym. So the
recommendation is to go with gt_list instead.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 40 +++++++++++++++++------------------
 include/uapi/drm/xe_drm.h     | 18 ++++++++--------
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 280274b7a507..92d4ec611c49 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -210,14 +210,14 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	return 0;
 }
 
-static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
+static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt;
-	size_t size = sizeof(struct drm_xe_query_gts) +
+	size_t size = sizeof(struct drm_xe_query_gt_list) +
 		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
-	struct drm_xe_query_gts __user *query_ptr =
+	struct drm_xe_query_gt_list __user *query_ptr =
 		u64_to_user_ptr(query->data);
-	struct drm_xe_query_gts *gts;
+	struct drm_xe_query_gt_list *gt_list;
 	u8 id;
 
 	if (query->size == 0) {
@@ -227,34 +227,34 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 		return -EINVAL;
 	}
 
-	gts = kzalloc(size, GFP_KERNEL);
-	if (!gts)
+	gt_list = kzalloc(size, GFP_KERNEL);
+	if (!gt_list)
 		return -ENOMEM;
 
-	gts->num_gt = xe->info.gt_count;
+	gt_list->num_gt = xe->info.gt_count;
 	for_each_gt(gt, xe, id) {
 		if (xe_gt_is_media_type(gt))
-			gts->gts[id].type = XE_QUERY_GT_TYPE_MEDIA;
+			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MEDIA;
 		else if (gt_to_tile(gt)->id > 0)
-			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
+			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_REMOTE;
 		else
-			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
-		gts->gts[id].gt_id = gt->info.id;
-		gts->gts[id].clock_freq = gt->info.clock_freq;
+			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
+		gt_list->gt_list[id].gt_id = gt->info.id;
+		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
-			gts->gts[id].native_mem_regions = 0x1;
+			gt_list->gt_list[id].native_mem_regions = 0x1;
 		else
-			gts->gts[id].native_mem_regions =
+			gt_list->gt_list[id].native_mem_regions =
 				BIT(gt_to_tile(gt)->id) << 1;
-		gts->gts[id].slow_mem_regions = xe->info.mem_region_mask ^
-			gts->gts[id].native_mem_regions;
+		gt_list->gt_list[id].slow_mem_regions = xe->info.mem_region_mask ^
+			gt_list->gt_list[id].native_mem_regions;
 	}
 
-	if (copy_to_user(query_ptr, gts, size)) {
-		kfree(gts);
+	if (copy_to_user(query_ptr, gt_list, size)) {
+		kfree(gt_list);
 		return -EFAULT;
 	}
-	kfree(gts);
+	kfree(gt_list);
 
 	return 0;
 }
@@ -366,7 +366,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engines,
 	query_memory_usage,
 	query_config,
-	query_gts,
+	query_gt_list,
 	query_hwconfig,
 	query_gt_topology,
 };
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 81cdd3c95f2f..94b53dc74fa1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -265,7 +265,7 @@ struct drm_xe_query_config {
 /**
  * struct drm_xe_query_gt - describe an individual GT.
  *
- * To be used with drm_xe_query_gts, which will return a list with all the
+ * To be used with drm_xe_query_gt_list, which will return a list with all the
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
@@ -302,19 +302,19 @@ struct drm_xe_query_gt {
 };
 
 /**
- * struct drm_xe_query_gts - describe GTs
+ * struct drm_xe_query_gt_list - A list with GT description items.
  *
  * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
- * drm_xe_query_gts in .data.
+ * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
+ * drm_xe_query_gt_list in .data.
  */
-struct drm_xe_query_gts {
-	/** @num_gt: number of GTs returned in gts */
+struct drm_xe_query_gt_list {
+	/** @num_gt: number of GT items returned in gt_list */
 	__u32 num_gt;
 	/** @pad: MBZ */
 	__u32 pad;
-	/** @gts: The GT list returned for this device */
-	struct drm_xe_query_gt gts[];
+	/** @gt_list: The GT list returned for this device */
+	struct drm_xe_query_gt gt_list[];
 };
 
 /**
@@ -407,7 +407,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINES	0
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
 #define DRM_XE_DEVICE_QUERY_CONFIG	2
-#define DRM_XE_DEVICE_QUERY_GTS		3
+#define DRM_XE_DEVICE_QUERY_GT_LIST	3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
 	/** @query: The type of data to query */
-- 
2.41.0

