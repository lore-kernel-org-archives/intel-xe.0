Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383EBCD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC37D10E3CE;
	Tue, 19 Sep 2023 14:26:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E66F10E3CD;
 Tue, 19 Sep 2023 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133586; x=1726669586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QY7iolrfGNDf98XLgfx88pJkvg0QF+jBkZUd6qwKJ+w=;
 b=bE7bk70QZWmHGdG2hoAA4vWmvOeRHYkEx3X0vrh8B8PLYr42fQhzh4qv
 SGIifcmykza3p7ofCjijFG4IGJgF+HUjDzsVgaEJQ5w+mTtMD0BaOE/sT
 NleP4sB5gkJ+UsOIC5+m+mOjVW9sTyIaAiLxH2stbBpEf5nmaHRH1sFWc
 91X9GWMjTQwXIrQ0H46Uidyph6UytwuI9mx7yF52Hvj+WF2CPE+nFhSYD
 mZ+GumRwpfrF7IDLe5hv0aWz5nYW/Hcic+qbMkJbcoM9g4IrCbmUemmdE
 Coarp/GUBAFZHhYiRjW473AWgGt/8buo7jhovPM94F55/ZCawokZ5OgHQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786075"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786075"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319664"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319664"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZIPc3F02Can6aEjhMIw4SWDtKSfGEWWCTumByq8FoJOA+hVjOiQ5CAhth1Ir3AU3FobXrpgyg801esxti7/wUalKKHUsCvkm/zKLhaEeCwaJJGGtSKMMspF7gNGHdCrDIJZxlSnq7YCahYlgCq5xPjuA19zQiC5TePzZOc7cSD7I/vV8Y4jOpamyXKZ5rhU+zdTUm1TivBOYDvcdB78Fz5pSMdUcZy+JkuFRudfKOrfxqcqoqc5KNMGJDSOwSnruFUug4g0RESGh0elQf6MlWPQhWngx/BQLHDm5ne/FfqmcVwZ14U8qgGYF6zLGCtYHKwxdhUl6tPLw1X4tMZZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VWKSleLYkXIeV/7ZSzhKSdvDYzGg/Fle7mxM+2vM/U=;
 b=KEOA+H7TxtNFiDp/rE95eVOeXNfN4LC6CDoKm0/W0yTiLP1Ss+TwZcLMQ5uCsbRELvLlE/OZkHNThB0QlqpgNj1+7GXBgEx301ZFptAGUNM09EG11Qtzl3CiyxqVvMuxptVQ1dlRdTKL0F9abQqXIf00bZrFc1pOzGZmDUXgrpTcWUAwVaTM8CZJPhKM7Xy5a9uxNy/zyn7XQXCYv7AeLcQDcdPuGq225R3JsGq6Ph/rkvkLpQ285CJSSLpmt4LAMY3m8sAKc3A29smbT3MExk4ijMyVGOT3IygUK18QG+ynqbaZBBC9BjvSdrSpLg5146KkUtOeyrcqO8M51aIC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:26:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:53 -0400
Message-ID: <20230919142000.91363-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: a9f7a72e-7ae3-49f7-74c6-08dbb91c5c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Mrf1iBBt7sgJox4jqgF85TW4OqWSjfHMqcUNF4Hcsj6T5T6JssRDrjxOdVou/ErAqSqu4ZiZT3tgC0PRtyQsv7pkksCe+P9WfAdkv3EbbGBOMZ+kle9X4mOGUGMoXf+FJlXMZAVhOQHdBGug0CuRidH1oy0ACFTsORQTFD7pEdn8vhXqc5JQT/o99XFQ9aV/eRSIZzHMna7upaesu0x97HafxDPgs0SB+jkXgDqZsGaEznFpH6qPAarGZM6EMYxzn+UqLpSg3j6m7AFpanph3zSheYiIzeaDrtVHijYeMjzycNdgHMAQCt9NpONQF9I91kQ9nfXjFtuNnnS03A7eeLrBJcpDa145fk0dVEoC4NwCqxzAxoPfDvPDgs33kbz7hv4PlKTfeRKtR8DRvfcZSzUnqWCrX/mL7Ro0DAveeVVoeuztOwBT4INCpEf6JEta9WDM94Vyp7ZVm+MG0s9t14GUBvELGy5A7VjfJidenyPoo2lW1dWdyXFk/WHz8YtEmaq+5LpKc8LM8xTmQ3Cd07BYG/eBGTvFY3sQJT/XXUnsHKjf7b9zDtKOebtDIaI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(450100002)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(38100700002)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rocV7/8GU2C1gmzWge3aNic0gpmBzu7mSs+jqjFoFsWevuw485D4bB1Fg1z0?=
 =?us-ascii?Q?Gwhkcaru+Kf257ryXY5s03vJ5vTdZR5LYuKRipbsrS3XgKmbiEwp2Du/ujhC?=
 =?us-ascii?Q?rxWk0kL3lDOr4qlr9zh62iOAXEKQykh/mWNdItQgC3QOBJGnIp0AsCu6X28V?=
 =?us-ascii?Q?fCv+sljuL3O2aDvVw6FX/XUtfOT2CBqiswIY1FdP2tXQJhUrTEA7SCQMRdVR?=
 =?us-ascii?Q?MkRU2wvb6OGCOmsdsaoDSlUb5f+TB8M5q4Vd/dOFkx4hpAPuVmyV/dDFJG4c?=
 =?us-ascii?Q?17oTAjqK0djJ9ay0p5AhJmPe6YraBTSBQ4Cj2SD+W8BCrT0rZO4HWhGUNZ9r?=
 =?us-ascii?Q?nKXLV6CVFQS/9J7zX3eIT35ThS7gQH4DSzJdvpY5gP7Ho21MS15tqlJA/a/N?=
 =?us-ascii?Q?79q9LZ5e7cRsd+kj4IeLQRuChDBI75+d+cI2oibLw707BDP/VAXNNWyla/ah?=
 =?us-ascii?Q?iV4c4fOtlP4588JuJBMqn7G2gcpPcjsyh35mVkhwOAZ1rYckEEmYNtjcwot1?=
 =?us-ascii?Q?Gx/EIJbGEf6aoCMCC+BUNEMlui0Cs1uWHhRwltnSFwUBhWfkSAxNS5nG8jUY?=
 =?us-ascii?Q?VjAC3dZaEAEqs6f3H5GBLCQLiOP1uMy/tbJ4r0/MUUSxuVOR3nERKBr4ZqSQ?=
 =?us-ascii?Q?G64NNTTo8fiXUgk0LEPwTTOBbFJUavuI6puvMFqSXaH06jfVl5fxlXC9kt+D?=
 =?us-ascii?Q?Z7KcCy2D0u8zwKm63pM4WNlwF9jQvL7lY41uZWQUgr3N5M7sRT1npwe+Fdve?=
 =?us-ascii?Q?+4gZEaupoGs696Y5kiVH+ZwUNUsJ0MfoINzKSh2L2yESEIKBsEDigDE9s5NH?=
 =?us-ascii?Q?/XnpPnDjt2166QamWRDW+6DfLt27F2fVPhEHwJpml4ZXNrJsNG4gQ2R+dipL?=
 =?us-ascii?Q?k2kR9MDTR/okJzw3zf+jdbGXgfct6i+EZzJfh4sWaEQeAcp6rm61n0sT7ln/?=
 =?us-ascii?Q?A71CZEZbg6L5bOgWYY9FNDVIv5jRqhXTbeABNEVf3un5WxAQYBYds1yEItPg?=
 =?us-ascii?Q?mJ5EvwSUKnyyTUCuZTahgz7tavxNqESflshqrhXwke+jadhmeOjqhiWF94GM?=
 =?us-ascii?Q?H0JPPnMhaSMVZ+JpMvJqAvkM78+kAQkq+PLfbig2/Hozk4TuIX7WXaKNRlp6?=
 =?us-ascii?Q?rs+Lw8a4LjxK57hCLugTI8hRCveQB63GWMUPXH8FTrfc3wvqHqXRWQFwoqvF?=
 =?us-ascii?Q?Gm43dxajaa+M+pCDLXSOE92nmECB8hxqx9XZefn7qPB17r78qiLiBHa+AJcX?=
 =?us-ascii?Q?skRPedflVeKv7Q0eGveLGlS9hA1dW5dHToZsKMbPeTr1J2KaPyHhaIq2QlqE?=
 =?us-ascii?Q?PQwgVAIkSfv0/EaUhcC5+1IWqYyu5VRkdcC8CvF1kDhZjbKTWIK8GaMxO88L?=
 =?us-ascii?Q?cxWia7JGgFawRFPZRPoPkAjH75+9cO77Ks6SqxOV2DkAp3+RyL24UZj70sot?=
 =?us-ascii?Q?a8aPgmr4QGK/ot5cZL6Mif2NtaV5GD1eAMCIm60aygxhKN0iaxO3h/eUGuSW?=
 =?us-ascii?Q?grLw+aA/iuZpSBHVM/t+fFj7g6G+6kDzd7LX4b4qmvFK7aUIw0pGviXL5X+9?=
 =?us-ascii?Q?+kVECd/MU+MaH2jtDCabWWV2W1IpLbETsV+qmDETGO6KNbcqQbQriFOnLkbq?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f7a72e-7ae3-49f7-74c6-08dbb91c5c28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:06.3625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8bbCDzudKepSjJlKgihiekyk3RddK1b8HVA9U8aIGgd8UqQakJYHtL7XZwV+t5yDVVAdd65ib6sw5uipw7m0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 10/16] drm-uapi/xe: Replace useless
 'instance' per unique gt_id
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Replace useless 'instance' per unique gt_id")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
 tests/intel/xe_query.c    |  2 +-
 2 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 336b77074..544f2f14b 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -336,6 +336,47 @@ struct drm_xe_query_config {
 	__u64 info[];
 };
 
+/**
+ * struct drm_xe_query_gt - describe an individual GT.
+ *
+ * To be used with drm_xe_query_gts, which will return a list with all the
+ * existing GT individual descriptions.
+ * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
+ * implementing graphics and/or media operations.
+ */
+struct drm_xe_query_gt {
+#define XE_QUERY_GT_TYPE_MAIN		0
+#define XE_QUERY_GT_TYPE_REMOTE		1
+#define XE_QUERY_GT_TYPE_MEDIA		2
+	/** @type: GT type: Main, Remote, or Media */
+	__u16 type;
+	/** @gt_id: Unique ID of this GT within the PCI Device */
+	__u16 gt_id;
+	/** @clock_freq: A clock frequency for timestamp */
+	__u32 clock_freq;
+	/** @features: Reserved for future information about GT features */
+	__u64 features;
+	/**
+	 * @native_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
+	 * direct access.
+	 */
+	__u64 native_mem_regions;
+	/**
+	 * @slow_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that this GT can indirectly access, although
+	 * they live on a different GPU/Tile.
+	 */
+	__u64 slow_mem_regions;
+	/**
+	 * @inaccessible_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
+	 */
+	__u64 inaccessible_mem_regions;
+	/** @reserved: Reserved */
+	__u64 reserved[8];
+};
+
 /**
  * struct drm_xe_query_gts - describe GTs
  *
@@ -346,30 +387,10 @@ struct drm_xe_query_config {
 struct drm_xe_query_gts {
 	/** @num_gt: number of GTs returned in gts */
 	__u32 num_gt;
-
 	/** @pad: MBZ */
 	__u32 pad;
-
-	/**
-	 * @gts: The GTs returned for this device
-	 *
-	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
-	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
-	 * bandwidth between this GT and remote region?
-	 */
-	struct drm_xe_query_gt {
-#define XE_QUERY_GT_TYPE_MAIN		0
-#define XE_QUERY_GT_TYPE_REMOTE		1
-#define XE_QUERY_GT_TYPE_MEDIA		2
-		__u16 type;
-		__u16 instance;
-		__u32 clock_freq;
-		__u64 features;
-		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
-		__u64 reserved[8];
-	} gts[];
+	/** @gts: The GT list returned for this device */
+	struct drm_xe_query_gt gts[];
 };
 
 /**
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index acf069f46..eb8d52897 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -279,7 +279,7 @@ test_query_gts(int fd)
 
 	for (i = 0; i < gts->num_gt; i++) {
 		igt_info("type: %d\n", gts->gts[i].type);
-		igt_info("instance: %d\n", gts->gts[i].instance);
+		igt_info("gt_id: %d\n", gts->gts[i].gt_id);
 		igt_info("clock_freq: %u\n", gts->gts[i].clock_freq);
 		igt_info("features: 0x%016llx\n", gts->gts[i].features);
 		igt_info("native_mem_regions: 0x%016llx\n",
-- 
2.41.0

