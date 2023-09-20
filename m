Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ACDC04FF1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51C010E544;
	Wed, 20 Sep 2023 19:31:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A3410E544
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238259; x=1726774259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=v34NrIOfZifJzOxAsax3Y/dCxHreCzvhwPl/DQoyrEU=;
 b=IbXssVuYyOWSIXvyBtwbFfsDW2M3Y6DhCyDjhHG9QfVr0cL0ruj+HONE
 jEvqNKKyXiXsPahHMB4u9+dKAA+EYzeiXen6BShNOBDoGiWDuIARwXCtC
 RQKdCX7V+0cifBVHYxuPSCMQTyMnCkTTJMgPji+iJckPTSQ8NbE7BEjr8
 kY/Ea2HGQhwDjUNokGU2ZJhLaSuifbfv6UQOSko1yyETWEgBBqbpNilb3
 CGM8Ps1hfrjAXPYftzR1rCf1/9uyalvsPyNCxrSZmzX+6belSVk44sR08
 8V+Tlz8CUgPdhBAFLMX5NtjPdnJbXreQ85l43x9QjKnfjG0Ivx3PKMltb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="377619033"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="377619033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812287643"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="812287643"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8DaK1pEdEDo23pxovIf1dVd4VEb018TOY8xAppZPE8YjHgrssvDaA203J94LWZFE0s7OU/PB90C09W3Nn0DxJwhMINRuWdKL6eLux/GFDs6c+O3bSpLqMiqEw/Qk/PIKtQh3c0TadoXZVBtyt7QU3+ZFiXl2olFcL4OQXT6vBpOiswLns6nTjpQiBBC/ZzeFJPfZwTI5AAHo+6JiOAErIwb4kbUBBm38bgAaA1VEfyUHkrkTF1iTrxVK/9eiCRw96jFxq6mcYXTefTKM4k9m65qRimVG7IN492RqbLTSYh9IUeR6CCri8lAnDrQTAuDDOwTzwlmrZ6kbaD0TWO4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPuzzMEWJWlHiAvC/iSGkEKVmWngiZMpwI96wqy9lXk=;
 b=PVCRaEyyU3Y2xV64VOZWqwaw9EJYN8/101hckSI8+IE0T6Z9zq2OGcLYHXa+5cOa5aK8Q98tvTciuLZxJpEWK1xTbjylmVcUnXy5HehtSq100YKKYYBhsPWaTx8yz6uDwtKwk2FSJ6wkWtKigPbCjOgu/nM0PKD0Nh1ve2+D4XdsNAjWfHNrOSloSJRZIka6zb7wvzxVBNHFITjXL/S02WFztydfWBnQlduep80l1/NWmrLoWm/rn2AmNVfDiU9tV+RJi2hc6aoQQnsHU5GT9zoggoiZheiPM0gFxhGyuOPCcQtmhykNPKzTvq3MVQDI8f34xZelmGaqj4mcrKxacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:36 -0400
Message-ID: <20230920192940.135004-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: cc590219-85f7-479a-05c1-08dbba10166f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9hKjw33ZE0M9mj20yk9Wlf8/LFw7YYQOGDOQp3bMmaqQ3rToExB3ljYSVV3nW4GrYWtGRkisRZ53pkup0dVHANNpGtvzDENyGdujJQPYyD8oswaTDjxTVzTaM7IpSduuW7PJRNY+d0IQQzZn04qEOASLtI225zvtPuhDlQLESRyAaxT5BDqld3F9pDV905KZvoTRNhOCWj4JVf46hNTEZc9QysEKLxCAP4HN3uH0919FHET40T68/e7knNpIyxy/jtxfd6Rlpr+CSXQHoRcp9DbV276cxZSbyR0QOP7rnUkJ6XsuiOhtQ7OwLgpKZncHq85hwqqkj+ZAxAaSVNMZJ7GlnXmwmaXYNd7iQbTJIKdfTRqJGget2rvYL3eRkrTURLjI37yOpiUuXxfKeOX7vTCZdC/WBjDBACpP5TFC0h6CUxJeNEd/nJ9xzDFu16KAJT7mSw/Wez61SI6wZTW+Zsi+UYVh51M5Q8FeBKxizdZhjvGod2UWkmeQMidJeM1V6x/LiWMIzsh5D3wUWVr05EuI019d/HX5iV3xn0ucmtb4Rw+J+NVlVYw7N7wrc5hN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?53LDXtYlamAyn784iclb3qOusTlVQhNY8LqcfnSoRpdumprqftBAzf7NN1Hz?=
 =?us-ascii?Q?AH6sR4LLK4AFcrx30ai3/OFVZcuWRYeggFFs6DCZYsC0KL/S8/P65K8rqCkI?=
 =?us-ascii?Q?s/Hzi80VeVTmB1y20Tra4joHPNuVL4bFwbgssXzd1nEvOMzG2gu2PxdcTS7M?=
 =?us-ascii?Q?f+5QTR2Yz5iHCZPHrlbU4NFzMRsARZc5GkPbNZAuS/ffD81kuMK9i1M/JuN7?=
 =?us-ascii?Q?0+RXN/GA5ZxOEIg9ogouy2KPEr4A8rKEwTxSJESkqEhQQcKBK3omBwEHg6yK?=
 =?us-ascii?Q?9ISbQpGYRpI14WIK8ndVvZbGVRKjSvmZIgKq1icwcJd+FZWooBZa6GphbaKO?=
 =?us-ascii?Q?JoMxZyGGf+IeHlE20SezTatciGt97W8pMU2F4Umw4wca2AhlHnKk5ilu2+iy?=
 =?us-ascii?Q?G8bLwheTrjKVQmWl7wNxpMK5PcaXFnbU0lQD8UeOR0mFrMtpOJst4dzyd218?=
 =?us-ascii?Q?Iofhj5qKW0oGef+kS5/q8dAQGt2GU1whGZR8vypVlrppFNDu6YGkcO5I8qmn?=
 =?us-ascii?Q?6PyG52B8tiIqobI2lqAPQylkKP/vk6Ooe+mCCeoXtliTAjPVQA2WSG59+5WX?=
 =?us-ascii?Q?DP3rlRglG/757CepzEGxYkHpqVabYvI1npAKs3IeZOmX6MJmY3eFJHH0mUXz?=
 =?us-ascii?Q?B2O+OSFEexMb0Tk085ZtmpxH01haCsdsFJqfScRgP4mtW+chx4PCRh9M16ht?=
 =?us-ascii?Q?Hz9Q1GAM38BDcA9glPfYHdxafXcVjyni1NpAJPC7/53hyNEzlC/dRYKdx0hh?=
 =?us-ascii?Q?att6nHxc4ATOHNgh9ZNgZ4nxKf4z6WH2PIr5Gh1WDMEdBvzGNgwviYzn7DIQ?=
 =?us-ascii?Q?8lxsPU6en9P8wge0UGGFxGbEZtHuYXbO01/q5cD088kCoIwLoT+mL+4UAu6S?=
 =?us-ascii?Q?CkLWWLLeXZYC9jl5srUtoSU/AvMrBuKTKGlmnUCqT7KYXx2jPppW5U0TFTmL?=
 =?us-ascii?Q?GGoUIMScwkLcGF5rrlS0bKmLoYwAwSoIGs3Mi+4IRtCxm+4+9Airr1FVnoik?=
 =?us-ascii?Q?uYOLRd/M62bw2POqVI89gwzJLG7viv5RHlVhdBLzuGumf6fnTgsL9L9+D6sX?=
 =?us-ascii?Q?mcPoYcHsTlamM95eQgUU1EGNyepZg35ZaTrV54QXtkx0AAH7nRrlq384p9q+?=
 =?us-ascii?Q?huLpZuu1E8DfEh+3nQB16qOFFYIShnYavyLolHHHI7eHo1+OVjwYSk+bcd9q?=
 =?us-ascii?Q?r1NKuwohR1+hbHLykA3Bq61c44FFKfWZsaceY1Yb/+RvObdDUchtgb16C1KP?=
 =?us-ascii?Q?poIyVpcQMMyZzE3sT7nUwBYU8h7QY7pF4KXITOFY+HcPOvrmF4YSWcWZt0/2?=
 =?us-ascii?Q?6sUexIWIjWRgQjE2UBVYR6II0B6jerba5iRaELTjCVJv6caNNE5KdT7GRCuf?=
 =?us-ascii?Q?D8H7xXOWS2oUAgHuJF+ALlevaZvURKmopIAsCeq8LSznVNz8cI7wOzJbtWlP?=
 =?us-ascii?Q?zF9AWq26vLBGd5aX7LGl7GHqgz9Hx/itpjej6kyWnxnnk5oraXhbo2yX+kbX?=
 =?us-ascii?Q?TADA/hP/DgGKP7MgrPLCg7sg6Zt8YGSk+RfGpUyVoueKgaS/hHzwcyiwyfjP?=
 =?us-ascii?Q?wSxUfi0g3oQM2VQ9LQ4VUtZ2CX3SAvhNw2bEe53U26QVWdE3ZfwupnavldWc?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc590219-85f7-479a-05c1-08dbba10166f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:46.4947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRv1rAgaJ4T/kYQprAPOH099zH8/DFtMbJVGdhqdNKgVBPWwvDAoJhcs4rCHwv7obBXChH3l3NTuBKBWn5/WQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 16/20] drm/xe/uapi: Rename gts to gt_list
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

During the uapi review it was identified a possible confusion
with the plural of acronym with a new acronym. So the
recommendation is to go with gt_list instead.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 40 +++++++++++++++++------------------
 include/uapi/drm/xe_drm.h     | 18 ++++++++--------
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index fb448e76fb0f..f7a374c28fa5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -350,14 +350,14 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
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
@@ -367,34 +367,34 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
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
@@ -506,7 +506,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
 	query_engines,
 	query_memory_usage,
 	query_config,
-	query_gts,
+	query_gt_list,
 	query_hwconfig,
 	query_gt_topology,
 	query_cs_cycles,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7db4cafd4651..43155d2c01d9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -339,7 +339,7 @@ struct drm_xe_query_config {
 /**
  * struct drm_xe_query_gt - describe an individual GT.
  *
- * To be used with drm_xe_query_gts, which will return a list with all the
+ * To be used with drm_xe_query_gt_list, which will return a list with all the
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
@@ -376,19 +376,19 @@ struct drm_xe_query_gt {
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
@@ -481,7 +481,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_ENGINES	0
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
 #define DRM_XE_DEVICE_QUERY_CONFIG	2
-#define DRM_XE_DEVICE_QUERY_GTS		3
+#define DRM_XE_DEVICE_QUERY_GT_LIST	3
 #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
 #define DRM_XE_QUERY_CS_CYCLES		6
-- 
2.41.0

