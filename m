Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EA1C5320E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D584C10E338;
	Tue, 20 Aug 2024 20:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxFdiM9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF1110E2DE
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185574; x=1755721574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I0k8XJC6xssSUQJ2pLMQxB+z46DGpNqs2OPZeRqoDQM=;
 b=VxFdiM9S+11flwZP03OkP5LH3S3VzBo2W3dlizuCIE9j9vgsLhOt73uK
 zUfE0y8ScrBDrrdClLWNHiTElB4hy3yhbQTHWKZ4GaEM094luX1x5zeCo
 DmYwoQrMTyLKM6pdejSb9/4IM4WT3gAjk/1IEAjANOirXFxkITD7Wug3N
 BRbknaJ5AJISFXcOpUSATtHeqYUN4mtIJFBiPp1QItEP2IsavL8zRZuFt
 NlpPtHqAnLm08xZJj/pHt/fvYQuFteXkHaBobwepdj/9Afcw7zX1e3BGo
 vGRW1ThpRuZQiSVdrmVU7iAi2HRVjzDpyfqFdQS2O6R+SYm4bA8P4gPGa g==;
X-CSE-ConnectionGUID: 03qor8rhT/60daPnQFgFNA==
X-CSE-MsgGUID: MqkUx7UVSPWt5KrrevsA4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22646510"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22646510"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:14 -0700
X-CSE-ConnectionGUID: n1qWUP6oT3KJPOizGMwjYQ==
X-CSE-MsgGUID: 4G/8j6hyRry8Q6CYbxouCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="61004371"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:26:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:26:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFva2XY182Oa9Tayk3P905qcZ9WOCyA6A4bYfy/yoIsNJT3TRR1o5OT/0jJc4zgM0PpQuCh09eIGi/cGcBUmM2H1F8Ynw5+g6yM0xs9tRH3KCLKZBflnw/kpEfs2gcW+C7j8PBSeXi72hVgI96HHBmXk/cKYt8DCzOLLvttsrcModCy1/OOCqS6AkZE/68rwdsl4uO/PTBJvMX2HONH6WkyPa98WcsK9DtLGQKyIjByctHCFdPlhRNpnOFj0yi2aUiHwcJs1L0KYUN6v7vhhNkojDq6+3Xx2R4TISZFOGtjQKiVIjtsUBOoEu6y66gZASEX8dSysL0w3ZWK8qOxg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gpu52xo7uZLNR4XVR56Ntg7G3RAYeL/ewVb3peA6Pj0=;
 b=l8kNdHOXA5C19q4PqBKvrymdWlkN8Ej683KTy1Y4yIVC4kdra/wN5cMiMwPPucLflshr9sbFSQsrzwVD3NTda8dUBuwhXNoeoO8ZzYm7TSJfNRfZpN8MPcaFtKPtQU81zkNj4oQUmLBGLOyOgkm6GlvkawO+zONZi+CxQ4sufSQ/QznsodYJYSdAhj6TApToZJd8e84ZrN57p2ZOAnILHUMOZx56gzH6kiVsTJXX+VhNpIcSXJha1Cv0W6lfrfYHY+XX0ilUPm21qEcTSmG0/yP8NPEiGJhBVYkeZSy+L+LUDOijIaPAiZqHqkXKZChJf1UkHpGL83g65Uam6yNpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:26:04 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:26:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH 07/12] drm/xe: Limit drm_mm_node_allocated access to
 xe_ggtt_node
Date: Tue, 20 Aug 2024 16:25:42 -0400
Message-ID: <20240820202547.300257-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 73466561-9482-48aa-a4e8-08dcc1565077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kpoZJ6E3rlcuh/wYa6rTVN9UglrqFGXCmtxQW7u/SURYprW112mN3usQHhCm?=
 =?us-ascii?Q?hzahAeXC29q76Yofd4GTLsZkYV1wh9hkggfUdz28FGIr1app6YddbR0QW7sS?=
 =?us-ascii?Q?amyMVaUDRHV2IiOLRgBxzciSlxg2aCWN0HRHcUSOtR0pT+c1mfWW9DQbBr85?=
 =?us-ascii?Q?7OF3FO/1efkOp98+XSWqGD/kxWYRLihANrl2/rz1oVFtQ2NCUGttmJSn5mGt?=
 =?us-ascii?Q?3nzVUQ+CPNHQEZmxgF0HQ/t8MSRmj59pYWnXYqDYwuApf57/LlJ7J0ywJJzM?=
 =?us-ascii?Q?0mk35Sp7bzl3WGEd618R4VKSqrB2e9QeEDAisyna+IylvnCCniKiWOPismmX?=
 =?us-ascii?Q?R4QlqdKjUSyI1cSPAastsqzn1RuMux3rdN/Oa3iHNJUSxyn4eqyRUU1R7YL1?=
 =?us-ascii?Q?tIGZguwfczSegP+GPjO+FU+3uugnp6AdkdEYFly89v8ceZr6RLZc0r0Ni2GP?=
 =?us-ascii?Q?Z0rbDJQOsObkYHWIwNxsiKbbNmYsG64qy+/O4Vb3eS0KFWjkx1mUk9nNhYzG?=
 =?us-ascii?Q?O6at+UqR0CCs0goJ+J0Rl4tpD+4jnhWzRWGGT/14X1G/aLUTZLv9O9YbUiLg?=
 =?us-ascii?Q?31WphT+jItEH05pO3OLRwH1acJyeapY+40Ow3softOKnx98V1y/jq6q6sPWx?=
 =?us-ascii?Q?ftyank4TLUPeCl+kDJTsdAyjvKfCcs6Y+C+O2n3F7tCXELagRJ33TDfBasze?=
 =?us-ascii?Q?Aw7oracd2Gn8+XidYLwLEtU9HnpzIJDhvD9JRBy8w4iTSf7Ln6uy5Wy92p4n?=
 =?us-ascii?Q?ZIQ3H2aAIWOtnexZMQox+Jdaq5bXXRS9/tNIdFtdfd3X+wa21UmaebPcVA4J?=
 =?us-ascii?Q?VMevrzL7+BzzObOgpH/d5kAwILDuviRJSHF3xg+3slMVYW/8xchpQzETWlDC?=
 =?us-ascii?Q?DYSP7BCjxKN8bx8MSkA149PWM3Vf6IIEVrLdSKOMdfFbDDl1362oxvK0A7Yd?=
 =?us-ascii?Q?6QCd6xyhMXAREuK6LazzFgxFaD8Oi5qr3sarzqeqSUq8ZqW3xcet0wuwl4vK?=
 =?us-ascii?Q?uhZnxW5dn2GVuj974IBEwsVCtLLzDmFslFsTB9m26FE8IKWykC/xnD2cqI9h?=
 =?us-ascii?Q?Xns5HW1Z++GbX2nyTOUMWmc7CjbUNuGunAX5dSJOz1YgxCi3sWp0nUVvNtsE?=
 =?us-ascii?Q?lMsiGo+RjoV5sfNbqs73EdlKMkJRGQKJYoPdqU8iW+aIIIGws2qoST2tqRpS?=
 =?us-ascii?Q?b0Gs0hQlkudoPBIFdL21289p8nscInyTxjTTqZN3yrw8crQUrLUBxUe+HZGH?=
 =?us-ascii?Q?d/NVbitO2TMC5/0ShagrjHXuKqBTSBoN8aaSLNv6sO1xj/6IAJ6XlSqiWuCZ?=
 =?us-ascii?Q?6xcK9Om12W1sebvxtMLv01SIA4SxVWzOQLuBmGBxqeoAOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?seBNAMAj3s2ORgLAOUMi28Hyl60g1VJgqd8r3ko62OTjuzUbDqMTH0SnMO/h?=
 =?us-ascii?Q?ZZ3KPTAHsZvAhzruYlzQ5Rm83foLmMbftu8Qdtcowes5pMRlUZ4HqEUkV0uY?=
 =?us-ascii?Q?TvXIEDPM4um6ivL9viSMu+rCNUY0nk8dCJew/KFWgapD2PtWBsYTNv19hrhE?=
 =?us-ascii?Q?QjybcYwZX+8XkcFswur47T2fZG088PNmyBr7kczQ/17pU8FfQxPdn9AmGxrx?=
 =?us-ascii?Q?Qrt6V/oj8EEWJuiLo2ei6Exk+AKQaqoqvBLtYRbd0+3q3OKHr82pWBDZSdkF?=
 =?us-ascii?Q?Yn2OY91MKrWHWCR1zz2TVWI1nXwFNHGJjmUu5nNgouley7oC8206KBNPIWDn?=
 =?us-ascii?Q?H1z4pBCylb7HtYR9evoA5h7l9r//CTxjS3SW56SQIckqQT4LWkQDANgbW+vy?=
 =?us-ascii?Q?UEvwVX0FVtjLdxft/4C5lIeWWoOLdYDpR1co280eUjBh3rsXXZVtgx5vSLqs?=
 =?us-ascii?Q?plfWyW9wScbYrU5RtreXEqht24ZMZBJt8P/0MoA986plYRYhiwBnj3/Ks40e?=
 =?us-ascii?Q?mPyuFcKUxi1LdzoyjHfTKhJctEBva611e0dPa9K50qd+wF+47Xril7T87oYD?=
 =?us-ascii?Q?FTIcdKlcOOEfQZd+uzJhKk+EnE6gwkED6Oyh7AaugZ25Kiufvl33+uG6E7Ky?=
 =?us-ascii?Q?ztb3AKoYQC8PJyvRsofqQzXnfClhtmy+9Eiim9R6NNZvOllyfaunW2zvYM+f?=
 =?us-ascii?Q?ac6bdaNH/jeDZ/o/GXhETnWZcZdzNnuSzVY2/EFWK52wO6ANekB9usIuP8Ek?=
 =?us-ascii?Q?g6GnBtqkMtLQVqJyYhMP/YZdEtuGnEe6TZH+zQz7oVYLj1c/NSBE2V4r7KT2?=
 =?us-ascii?Q?5T8Mu1X8weCC93j7gsTmDsbFl7Y4NNcD4gngwx1is7znOokNhO1bux8mHxw3?=
 =?us-ascii?Q?oZkKlnYLypj0OVkZzOBb10bnfTTMblxcnoKBXz7AcLlJWkUDFawcKhZ1TBuC?=
 =?us-ascii?Q?pmQoFjV4ebgK1DFi2LkLNckrXbdLC5FF7MND4qU+YjA/f2cspNNmPpVNflbm?=
 =?us-ascii?Q?pW6AoLZZgY0yie7XjVBGTudYjLDj8rG8DDF3i/hzFwN3zOYo1F5rt0Vu07ul?=
 =?us-ascii?Q?fIowBRgl6I3TcR1+Yt2cFpimPxlNnSRClPI+RICW4BNOuzuN6aYP1yM/sXsh?=
 =?us-ascii?Q?j74fttERCmdyafjDRKv5wvSHHGHodOD/aoEJ3vF5eIDlXNNVS+cviWdkgvL9?=
 =?us-ascii?Q?z5kyV9uT78RQuYwPKR1g2dlYVz/OYcmXYEZV9Bex7FlUheL0qDmT/u9f+MDT?=
 =?us-ascii?Q?utiC4tExzAU9a6j1LRlzftbPfn1f5/dk9k7J28fP+B2FCLnzA9fKIcIEWCkE?=
 =?us-ascii?Q?Yk1VSRd64DYTQYP0qqOnGhsUQjhSyTrkvGkvflBIO/7EiBp0+/mQPcA9O79n?=
 =?us-ascii?Q?FpPPIyrefd9xJqdCwXXYzbijauq3IDGc5Vp7vcZChMr8i0RIKusD2xQb7ysM?=
 =?us-ascii?Q?wjywO/CrDRY2dyTDM3oEIVzD7llwtgVvtDQTdsTgX4oBrBhU1v2sWIOMkXJ7?=
 =?us-ascii?Q?wQv0zKsfHCVpwfMInRjK2dDgAa2AD6WbMsTh8BYOQb7swX8jrHCKwYWQboi7?=
 =?us-ascii?Q?/ubCPeXmYYzR24bgINYjDJ/9bGKm4oxBEJ1vP4dL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73466561-9482-48aa-a4e8-08dcc1565077
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:26:04.3261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns+jpp6OvHFv1wmP7oj65gXtO7DuGD6F1AH/y1VQT9yi8yM14c0D8/FHwOrMqukyR0PD8W/qoeoH/CqgxKlykQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6029
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Continue with the encapsulation of drm_mm_node inside xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 ++++++------
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index db74c3395ef8..de4930b67a29 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -323,7 +323,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
+	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
 		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e0da24bb5774..7c8bbaa30fca 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -477,6 +477,17 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_node_allocated - Check if node is allocated
+ * @node: the &xe_ggtt_node to be inspected
+ *
+ * Return: True if allocated, False otherwise.
+ */
+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
+{
+	return drm_mm_node_allocated(&node->base);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 5147930357de..f816b3c0732b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -23,6 +23,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3ca98f8a0eae..947750d97d7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -235,7 +235,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (drm_mm_node_allocated(&config->ggtt_region.base)) {
+	if (xe_ggtt_node_allocated(&config->ggtt_region)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
 		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
 		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
@@ -376,7 +376,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-	if (drm_mm_node_allocated(&node->base)) {
+	if (xe_ggtt_node_allocated(node)) {
 		/*
 		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
@@ -406,14 +406,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	size = round_up(size, alignment);
 
-	if (drm_mm_node_allocated(&node->base)) {
+	if (xe_ggtt_node_allocated(node)) {
 		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
 		if (unlikely(err))
 			return err;
 
 		pf_release_ggtt(tile, node);
 	}
-	xe_gt_assert(gt, !drm_mm_node_allocated(&node->base));
+	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
 
 	if (!size)
 		return 0;
@@ -439,7 +439,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 	struct xe_ggtt_node *node = &config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
-	return drm_mm_node_allocated(&node->base) ? node->base.size : 0;
+	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
 }
 
 /**
@@ -2028,7 +2028,7 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!drm_mm_node_allocated(&config->ggtt_region.base))
+		if (!xe_ggtt_node_allocated(&config->ggtt_region))
 			continue;
 
 		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.46.0

