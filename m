Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95067CD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6245410E27B;
	Tue, 19 Sep 2023 14:26:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D3D10E27D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133614; x=1726669614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=v34NrIOfZifJzOxAsax3Y/dCxHreCzvhwPl/DQoyrEU=;
 b=E3+ycQ2nNqk2iTPzTkPVZRCF+jJR3hvFyEejTqaimdNRyvLS/HBjQgRu
 D4qII2mNxcUJ0wcQkvaQ26pyHez0KnwnEMGty0sJyRzj4b5WTVN1b5GfT
 oIaxpz64amD2SGydSV5dPFcq09jO4l6QBQN7UOkczr65l9kyijuEWkX3E
 h3ZuYwMnKPAIXR4iwo6VTj+3XiHdIruZCRXSbb+cIzoXOmAZe2tK/ASZ2
 3xr1KydiT+z6n3fKbFhMr2lLKPniTqqvg0+uBlzbWg0k3Yj9sjOIMMw31
 DuauygR+yGjO7vpNH5BkJVRL+7PQi4osT/4nF6H/PWNDhy8vIUID5YeV0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382708035"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="382708035"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749498940"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="749498940"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6CLtqaHhbR0T8jb8zljzFyGbezhueZb2lceBQ8t01JWDhm6CVoXyZX61sEt/CKiwFGnQuHWAxxFFBEbbcxbpK470zFOgno1TghRuuAXDsdcPHV/9DZMUCEsTpO/5xO+dSlzD1D2NV5bFQOh4h71kqUEqEVkgIAZf6gNmtbD2tPp1gyvnJombrw3vSO/6rVeDdUJPD/E4tmWbJSDapjcAlUatR7XXslwYs2KFRYRJqgbVleQFGL+mW0Ih3YpyWZ2Zx39Qxm/bTQd540c90K44kE8WTe5Zp928Hips02EyIA0rsQWbmeA2TRN5HyifJt4utDtxaypXizzA64NOZhXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPuzzMEWJWlHiAvC/iSGkEKVmWngiZMpwI96wqy9lXk=;
 b=nxkSzMhGmEW6dSYP02t0aLIFpnMVW+ccIzjayIt4tYdhCgtcvLWlNLtRHG0HDRPPOo9JFrdc+8QyHqADD+4USMwPepATIRSzxnxRJcgrBt8SQslPSOE6ayNSDm8JNPR9+GUeyDVzCAkwAIl+8PpJKt6MwPqiQCZWCpyRF6lvFGZQHM9m7M33DY1Ti4uvEdkrKy/GOk6xfjmtBm1zvjXHHDWbJkW595S6OCw0rS0cxK5hPVhEbhEU2s87Fr9Y+i7lekliddujBSUpImRLCmWlnJa/q5JyJQ+/Ll9iOligPJ4pXmbQHdkjnZEWW0HPajFBDAOUA8u9+4PEp8CPcuGCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:25:03 -0400
Message-ID: <20230919142504.91652-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df0f0f8-abba-4f69-1cae-08dbb91c70c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MExPTfaGnNOsod6ChYzOhiJavKVfqM2t5JJuxAMiSG39dTm/iSwtN7PA+Xdc5q/UUpm9sot4Y/CJyKY9fYXyUbGTxr2NenPxI4wglJgn2yP36FMlQP8azAuilOUX8heKkGpTkkQe94lDoV7SclTn1RVG1e37rhHp5v6bepy+Zo6nPu6RRhbRo0IiFTaw8TKXOuOMNKt+M2z0DyQLCZNl97vDHZxoylq201eRQgTy+YMQ8YMPgSRMPKRTpsSenNbgvZBigFlAl9U/VYLHr/XXJDuK4IB0xGY++MdTV4rkF2E580duDgGD8Mmrhkoblrx7bQk5HHHZDLJo3S+dkQ06k9RTpNcasHJiZd3tGQzeisI4+S7AXf7kKp8fknvqWW9DrMMkkcMbyQ10SEGHXGJXjyzZsSDuL/akcfyEJQdx1YIFo4rFQscl7WbcGmvvPn8srBe1T0TtJOJR2rz8jBl5nHNao/jYNTPh+fLQi88osHy6O8sLgfFkt0VCh6kLWeLfnKBTjkuQSMkJadWj4BjzUxcJrn1gxTRHDbkBVJDUdsnCmrJC39a68Y8uhsKhrZSR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JqZngBEnNKCI/oIHFlmotvJw3qaNmf3P83zpOd83mqA620lG/hut4YVRRwt2?=
 =?us-ascii?Q?vaTnO2i3tkUu+rbaHoNVY2B2P/uYRfniDfVl/OJ3RYWrMCk3USO+10hIKM0i?=
 =?us-ascii?Q?4E+i8iF/IPqzitoPs1ljchPGh62850a4VwWkbhlSi881jfMMsSAjGjGAuPua?=
 =?us-ascii?Q?nlQGI5zUKjv/2dOyIE7ud2IGtr+xfnM4+nxJ9Mj1eff4X9zPdqHJ/bEBp/kl?=
 =?us-ascii?Q?aZIjSLXsHEJb7Yt/RIJEV+z9YaVNw7mMrWBzvlFFuOA1WAxwxG97i8MqaIYV?=
 =?us-ascii?Q?DjUaelgg87+w/9c80FvyTZtAR6J5klk24BkYcIq0SvSWMpxsp7zoGKmnlcfp?=
 =?us-ascii?Q?ssWwXxyRZ9QqHGR6500VUAq3RHfBltDbHMnVdNvSVMnCX/7NrCrn7WmIJDOL?=
 =?us-ascii?Q?BxPEJ56qQdX+ueSGGVuCpAQmyGlPVy2DrGmGzke/FZq/gA/N+Lsu1b66KYAM?=
 =?us-ascii?Q?eje0juM0UMjczvb5kpmIJI4do2Nfy/d37PSjenEU58uGIIT8K6t/ToiquXVc?=
 =?us-ascii?Q?6IA2UvlDQcfnXf5RD7kG6PqlQjLp33GBoLD/DocJ/c/VkHf2YpQWPBBmH7yu?=
 =?us-ascii?Q?3CW/WpXU3FTmVTSaYaqrh95RSaT7vRpS50XLf6I5QnvC3rq+LrwAcJ1+jOCz?=
 =?us-ascii?Q?U8NMZDtvNDpXeDVSCuhTsAh1c2A01Mo/lqk4c1j8fwQHpykdgi/67aNq8W0N?=
 =?us-ascii?Q?v0P/FJqSOpV2KeCGcBnkICFpCo4pEsqAbaJWmW9KiBaKkBJTWjg0dQq0Keoy?=
 =?us-ascii?Q?AsStntwja1f9DcoGsEweaK9tgJqgkw9i1amLGXJmJqq8X5pTTJ/QDC+X7O1M?=
 =?us-ascii?Q?XvS7eD0+DciI7irzs+ycTc92r6BqDOvim4jftQR7tBYUUFyH3cdQpQnLNl8E?=
 =?us-ascii?Q?rOnPJBKJLDxB88wjAiwTxRJKn4ja3QIeYa39zRscy3AiazsklwluIwGVqMzK?=
 =?us-ascii?Q?1/zZqBpcFtCe0e5YxTUL9jTMUUPj77x99pcyQolwgJ2ybHuaOYckQb13Ki0k?=
 =?us-ascii?Q?jGBhVjgL7c5NQP0fgBqs/Eb0oYB7wne990JABdx7LUg/9jnWmfj6OTJW7ZLA?=
 =?us-ascii?Q?bLpZ6SGAUbrr4bEQW3vOEjm3fAFAhnQj4yCjhujlpTP+1Gt6kPBa+mpS7Mux?=
 =?us-ascii?Q?SOBpWjxshMd+CMwMJGlIVV96Cnz4OfjVDBVUhkQDn0Xh2WZELypP849arM4w?=
 =?us-ascii?Q?vIccMjs0EhT9ihuqfcFukJ8oncTQ7bs14pQ3F+IC5b7df16XwF9CMOkiFt1k?=
 =?us-ascii?Q?U5CyfUB03usFqB50v1cQrrv8o+ZdR3yCwXXf5sJjt7lfHyhQsovb+RJosqEY?=
 =?us-ascii?Q?v37k3zGC/8iYF/EK/W6wJfGWZ4uOTdrg74L8Zox5NAFEdEmoGjhXJK/DkomC?=
 =?us-ascii?Q?hFNruBibjfVEgw92HqbcPULN1BV/kqoRclbAcruQLblbr64nI+zl11ppTMFZ?=
 =?us-ascii?Q?h1QUjdBeMx+Dwioy6/HIRgOp2ANg2+yUcOKvTtfv2Y6YwEiZd28q2HhCNUxS?=
 =?us-ascii?Q?Wklz2qoncpE4V28hggu0935n3VW6B4d5/uJ3Dt8IcGN+VdQqHCm8O2obN3PK?=
 =?us-ascii?Q?lkofnF4Wu7v15UApsmDbW5Rr0VsN1/W0/qLVzKWD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df0f0f8-abba-4f69-1cae-08dbb91c70c6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:40.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+CaLwAMoW32ree6R6kGq5TbpIiihC9di61239WkoJunsDxheUUGzArkQiil2bpUEK0Co2FEt04Bysgk+l5wkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 16/17] drm/xe/uapi: Rename gts to gt_list
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com,
 Matt Roper <matthew.d.roper@intel.com>
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

