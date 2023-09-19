Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A528CD5BD2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F7210E3C2;
	Tue, 19 Sep 2023 14:26:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BD710E28B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133599; x=1726669599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zpKDPSusOA1WgDTqaraMVjnwwHdBMC7N8RHCWDqkGn4=;
 b=hUW1zBX7LOW4KfKQX1568aRdwjpvfltvLVgkKnnylgVoe4cz+7ENNGLR
 mmc58G0qOFLUOiuci+0Psc4fDpbcTsK4jH2TQIoMIGzpTaip4L+kxk5bS
 RK0Yh1bWgQW4AGshGhTQ4otFqx8vPay9NTs0XAqgwm1wMfKesRln3fqFn
 /MQehU5ufv0Dg3Zm09DwxTPHY20DSmuyBSKPQr8cuRfp1agd4Ra7cxpus
 iHQfBDr9DDsua1arkGKk7Ex7Uk+n0oe4yGtEBiJhITkVLHbJVDAVgMdhS
 nO3dt600CvQ2V+mgzR2OEA6o0bA/RF53X2oZCVKdDCyX800tMM4Y+P3vd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278974"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278974"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="695924463"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695924463"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQDAaGcyeGVNFa3bMmrkqVsJDVgusrKXQXfp7LZhUKHDQzmzTzmttRcVhPJZ/0ZPbmmOAVdKIX/ScTvCFI95M6SS4Pnz2cOz9vgDoUcnJtqwGrTS9qvPhkBSelJ5mUibJ9tri3NAEvfY/GnRgZpkKTCNBKO8U/8LDD9WOy+XfEWj0rgjycP82xNUrbA4ariP4fggfiQk/Cc9yvuD2W1V9Z4FA1WU1GU8kHNuBT3bPiGBy6LNbHIoK8EknXUh5fbTN4E/gDFAIR2q5pisI10QZXr7s9poT7hCBLN5vrSfo0HHt+ReOQ7rMJ3NSxz3RhkpB80KrJf+Fd49zf7w1m6T5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uid1D4++iV7ue2eCXIJElh7FS6NPXaru1eMYj6Ng7d4=;
 b=RMOMbPaFfoSLSYeHGef6Ob0XU+iEvNGzySM1iiPIc/5K3NCqphbn6JsZFQO4QhGF3Un+O8DItd3Zcl1LWTYnGEIbkmUehUKffJsMp8DMMspYrtAJw0A5PUphjc2gl5OYrtuX+hRqUeo8dMugeFLDMS4p+NFsLFT4p/733ymyMAZEfNf+pwxHJau7+DyqulGxsZOjA0Sc5BE92oAyJqE7p2J1FMvI/SB6bV8XEB0L7QiD3lIp+QYGnJf8IYmmq6NgdsKPAMkv4pn4q6/pr77MRtTyHfuwL7C2odFqyX9FCJn1ra8opfYS6q9IKL/bnUiJS2MeD2s603WGS8QkaaeZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:25:00 -0400
Message-ID: <20230919142504.91652-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:a03:80::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f0cb78-7f3a-49ff-0b6c-08dbb91c69ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdisC/6opc+3g5lOK9Q92xvLuIIrOYbvmnFJb3ZgP2oytcb4ZiewsYr1lPpdS5DLoKbcJoS6nxq7OCqaWw7AoNvi9j+mMJXk5PDD4udm78dxAWUERAcz2WLuCYslXfsKZ5sssriqHR82/rz3GuK3ZU1zV0AOVP1BaGXoieUhBp8v178EwwimOh4XjjmKoYl8BVZ3Dj5UXiyoaL/blIslbURgBf7AAbzzacIQGvGYWKVZocvXODALxFZDMhHJrqSeraU660+0TOd8ZRD+LIQbyejpduDUSNE1NaldBY46VevCuUD9gH44EweR3J6GxqQqPIK8EbC8PreIG8xqOzIQVJdmL9DTAXm01q0DVpPatF+pdQ/BUtO0mog7LESKMF1QrPBVR2O8AYTHuTSEvHE1DWM68P1YGDz43WDfS2NphB40mGQWyCJhaX8eRqUpie4boPn9cIujZpiBrHKxg0zx1KDRvEDV4ItdsStF9aQ0a2VbeZ9dHktN26KRbFc9D3gljl67Li6Y+fcek+HVSt28A7qfSPJQyQ9LGdp6rBfUzVJv47L04ymDx0wzzg2mS8V9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YtpcjMdF/veAjzq+PM4VbaHUKwUuV0jLosK1ef6fKbjMMZBYwqlqZa5mdzW6?=
 =?us-ascii?Q?uoQQ05ORp/JTxI6fby+iJF9efPHbOY0PfgoO0xJmcIEhzMKyx5H/BxqtQuIk?=
 =?us-ascii?Q?C7lfZrCtxu89AkvOOPaAtgvXZ6ln3OLpaxYfNbfSm/te3Xg5nkUwZgdhJN7f?=
 =?us-ascii?Q?oTWgXO4K7T7tuLCCpjspE5HySRFT1z+28wHYCZEMysv8GpA9RJpy/Y5I0M4e?=
 =?us-ascii?Q?grKyaiWvT2LSQILHEXScay2l0nzk1bqvOuj6vExi43lSFYdZrBgZ74VM0bdv?=
 =?us-ascii?Q?ziGqXO0kRaD2Cx9dGw+MK4/0tJr1O1R6iN5snU8FYeE0UMJSKQ3bWHZ6mcnU?=
 =?us-ascii?Q?j0NWlCZwvbmpPjE12mfDxwIvHJLVNw/iuAU1y3cYYsoEvgc8w6IzZWc+9PAP?=
 =?us-ascii?Q?UUARngW3VAbvsvGMn1aHBNR1uUGvQhf786jbZC1LPP3rg9oyWgRB+5ZrrQU1?=
 =?us-ascii?Q?8niIoulZpgkCqU3vibSIQ0o1asNRYjlh+KJVvNonLDssu0xNMmtRa1kQFpBg?=
 =?us-ascii?Q?LJf/9o+vD+lV8MQDWV6ultZieBdrr2hJPLfgYjNOkHoC4zABXe/tQxoD2Lx5?=
 =?us-ascii?Q?HEVw4R4zQs2ray15uf/q5Mt7uiVPoB8AtLEZ2gu4lFsb76ukior4BJ5ytv3y?=
 =?us-ascii?Q?16Ht7MkIVvTUKbnoIGxmtLPp+hoZRoiujJyHXt4CALAF5E+VDCP1x1+0wZGO?=
 =?us-ascii?Q?niV3VIe+c6S4zXE+g1+/v2ok93wQUtLy96wNdRRC54ukTL3jO3tHh5UGW6NT?=
 =?us-ascii?Q?WUQ/BYzAyNN8N17Icmhh+/dRrEOWyt3WT31m42x2YBWV/vGqsYg6BNaF9ttU?=
 =?us-ascii?Q?b502ielmKUbKoxKVISmfinc1eUMSbxaE0NlLK1SQnz3fy0lruW/cNTDE+ZDu?=
 =?us-ascii?Q?bTO3cyM1ZwxuHEignEc3CoAflEC+mHZ1gLcLPjDlmAw2SQeMsSMTNRP65mWv?=
 =?us-ascii?Q?GoauUB1lKGPQh731sH8jietC/7d83gHy7riQFLw7SnZyn5nFRIlTT6SjlSFi?=
 =?us-ascii?Q?c2XbBW6/ED4/GfV2nwwH6iVGcekT53G4tCcq1YWs8SmYk552Crof+9MkHdgE?=
 =?us-ascii?Q?skgmaGlRzBtcFnHTacVMF25ypWAmrt9E1frwA2w4MeZhH/yDjbJwWg0ZSf4K?=
 =?us-ascii?Q?YAqEN52wSPEHMn37arFqVs0Ko6GgS6kXYXoYrIbl9Zt1dcXz7u2S/TsjW8RP?=
 =?us-ascii?Q?aEm7ZyGK2hF0PcGI54m1o/DjGXuddxwltUkvtmi0o1wQt0HV9EPIB6v4OBaD?=
 =?us-ascii?Q?S+/9u7zdVXYquKK4eacPAhblYnN6quMeNKD+t7OiWjxFfC/uYygtuZenEafO?=
 =?us-ascii?Q?F19+oEgMtzwD/GCpTY5X/EeKttfCxc0q6ZOZRHci/60wWk0n4JDI3H1KiQQQ?=
 =?us-ascii?Q?Xkb/V24Z184OM05PeE1tiTrTss3+I4LTPGqdEbMULi7IxxVmPPcBJKsRHCdG?=
 =?us-ascii?Q?Ni3b7xSXyvK5LMBDXPdWif2DBglsMQ2dC4aZYaJ24vsR3KlW1YsF0LQ0OEaP?=
 =?us-ascii?Q?HIQGAUd6Wa6bzxEEFD5ZcIo4cr6PZfFp8rCpgYFZT1LqTlaCGYQ1KkSI15dE?=
 =?us-ascii?Q?LerwBUGcY8+nX9/sSpHSlwZj5IEIMLkZk3bG24fV5d1U/Gd9cGQ92hQHDKPe?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f0cb78-7f3a-49ff-0b6c-08dbb91c69ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:29.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoLA+OnlC0lG4xtobwlwqry3sPS/9tnmPbM/dTq7pETZCqkxXL54aBGHRYaWWTCsEAVh3e0oMAdnNAsQd4MeOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 13/17] drm/xe/uapi: Document drm_xe_query_gt
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

Split drm_xe_query_gt out of the gt list one in order to better
document it.

No functional change at this point. Any actual change to the
uapi should come in follow-up additions.

v2: s/maks/mask

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 65 ++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 22 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 817fdb762758..ad344b3324c6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
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
+	/** @instance: Instance of this GT in the GT list */
+	__u16 instance;
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
-- 
2.41.0

