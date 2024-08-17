Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F051C52D7D
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681BA10E034;
	Sat, 17 Aug 2024 10:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkw5Bh9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E2B10E05A
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890973; x=1755426973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0f0xGgvGDN9FAaRK0TC8lszxrTmyQz3IkOk2ZoslOEg=;
 b=fkw5Bh9+Mx8xrkDbWAoQ8yBDHkRuPuaxZ1wyd2rByyAWAx6029zU392N
 RQgNL2/igO8mC1QLiPiU8KZvsDs9TwCviPPSpdASY8RqjW5VzOooPMK8+
 iwCreAyZZRmppSl9+OLtlZZgx9Bhgx+1UFRiSg3O+5yqv5T1v/Sf8ec7u
 1I2ZN31W23A1fc+pZibsZnqoghxqdTReTejP2ZCfay0VUhhRZaWp31Wb3
 Tf1mwJmIS5mg6Vb4PZJhpwCnXyUSLEywYr/v1eymDbQCsGim/KVeW11nX
 lKjpVUGlWPHXHb79cMbY5BKjufCD0YHtoCxGeJIGvt84X/gFzd3rwZtmK g==;
X-CSE-ConnectionGUID: h4eFMQa3Q+iytTaUw8Lb+w==
X-CSE-MsgGUID: QovDQFdTT5yiT0zBp3C3kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21993418"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="21993418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:13 -0700
X-CSE-ConnectionGUID: hPkmDrS0Td+XQcJG3292VQ==
X-CSE-MsgGUID: w3Kjf+zATCGJ/+w18yvp+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="59755216"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8rCIVzJyrheW6G5RiY9z1GDUrPXgputPaZwrBQmRJ/AFMRT9H0toRIE8qWBbdqWTp2EOmhKXFbFQkDM+49wqHGwrycLTQqPUy66DBKYXhlrC5L3dpPTQ22hcDpR/iwzhX1fKSAMRT6PuvU2HukYoF7F0NOVqcb6Xq3/DQfhi77UyGkqvBNZM0X4wdyWCBs4d9heR+6j0L+in/J5jEAxprO4DYs75NIJNjYWf2KA+CluZzBMHVxsfwQQsMuPRulLXEDFSekkzfLPgO/NpYe8L4XsZyV0+ucUd3cKTMz7++SmvMdpbweND7yjeH92+twjVHJHc5ZVIOwlCMieL83PCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxeDTExAiMFb0rUpW4mGKkpKdrbnR5DEJdeAX76um8I=;
 b=R5pjBss4VDEZm+BYaLILxjillAwAWibMgs/STjglhzTkcBG0lyUa88gAWBbPtIpBhVSSb+Yrpepi0ctk0dYvSzCgMOEerI3CUgFslJux7rBcxvCcPZdoLsuht94tW78KupEU4VWYa89+dwWAO7ZMyr2Gi0EwozRqcKXYbMUySbUQI1ctFbdIOxROacFzCEKRmpQBLbeDltSh/dHfzjqo2eEbP1qWfsugtZfrES3XB7Prl3zT/CvqfUBNp+8RJjSoPZcffHPEkI9fFPIt0U9MDyHq7by6/tUnGKsqavNl7p6U6djGBPYE3iYJDyW4SteDDgGmr8ezYQKADQJ6bcTrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:10 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 06/12] drm/xe: Rename xe_ggtt_node related functions
Date: Sat, 17 Aug 2024 06:35:49 -0400
Message-ID: <20240817103556.163783-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f16c1c2-cd39-47e1-5d13-08dcbea8688e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gXV43SdXmuxxSza8j5W1Fe+TitHPRGZTuY2uRn+1MJfAMBaywlxNWcAFFaDF?=
 =?us-ascii?Q?TTi6K1hfMTQLHycn0dbk3unkEdMJkI/AcPfopln8WDkuDYVJCAv8ZJwsjjIn?=
 =?us-ascii?Q?VXC54G5plwdLAMF5xNemZT/D3Ba9Rt2Q9YJLqXv8vdy0rAkwVkiTGhOnCH/L?=
 =?us-ascii?Q?HOvpW4xFiuTOe2tt3lK7hR695gnaNXp10sbCLwXdHpEp23vvVzCDjbiP+2v6?=
 =?us-ascii?Q?zsWBfxyOsLGQwdbXJt1iYW5ez88p9Mkmd8WpamSNpTnT0xu6RTzV8vPtX9Qy?=
 =?us-ascii?Q?MrzSGrr/y38K/k+cQiqs4m7dj8pAxbNV1/pAyPCKwmNmvVs8w0RXtgRFVD5s?=
 =?us-ascii?Q?W9eI0gs+XVLQ+dLK3nEUOJEXdgO9PO+FN34/pqJETfK49OMP7hriA7yVMH+6?=
 =?us-ascii?Q?jxsZcs2oVQuzCS+PhJbQdFGWDpYpTL8QKmB9XxrjK3hdKJaUiVNVIz+10FfC?=
 =?us-ascii?Q?RC6CVbezSva7Wimzop6BVmQ+nMWYneyC/SQ45RTRsnXCwJeaSUVOkTlmMBnO?=
 =?us-ascii?Q?misrzWd6C1lfQZeKMHHBh++quzhewExzOHCs+e4WHaq8QPBsmaiTPQy9q9k4?=
 =?us-ascii?Q?/YPlSqZ4x2avTb/FOHI6cZRZ6yAt999ip1d1qdM/c8pHg75/xc72bI80h0gs?=
 =?us-ascii?Q?/RXAwaaQTwponETPIzFDwUG0Kj6Sdwm6Wr3K9qKykXbuUPPiCgdYOBjqkeI/?=
 =?us-ascii?Q?lqiuC8IzmTxM+zTZq+GR4GrmtyECDSo5DMY7ykYQ9DxpKAypPODf2dUW2bBG?=
 =?us-ascii?Q?lmXeE0gHnAH+4ARYbArEVhXkhUbUBZHjYZzaO7tMGFkbooXwtVZE/Llv6ble?=
 =?us-ascii?Q?EeD2VzigwsBKThRxkEofwiaWRcrKvE0ciWokMGW2aju96O6FtEtTQYerf2Qc?=
 =?us-ascii?Q?IqPSKk9vQPnQp7wm7xKUYiPl2oY8JspRdecWa//+dSVAYwqVZObnis8IzFf4?=
 =?us-ascii?Q?4yhCYqeMy23XRIVKpc0qXpX3Iq156UCrrZYRNgAXu12ERDIeG7mDaJYf7cJk?=
 =?us-ascii?Q?rf3lL8nm40l0WVW+m3FObxVVon+oflraYzrQaF29smqU+gMiFsHnETwwFQBc?=
 =?us-ascii?Q?jg4drmzGoOA+7DJ0urS5F/CFt7u1LRdge44K1SjpppB5uUe+aEIT2QJp46yV?=
 =?us-ascii?Q?w5lgjjVnuGJT3yV4knDlZd9KgdbYHhgLr6slugrMY+ocubhwiZ5gEveHElAJ?=
 =?us-ascii?Q?V3jV7Up8nA7ktaUTPOLDBADaVntTiR1yO7T8Cufe+rAsIYECZ0ZSDAdH7v7Y?=
 =?us-ascii?Q?RG15kfOTMECUZvgQk+lOlrkl50YD6YldZ8osUlw0/lZqX4CtM2pGn9pD/5xr?=
 =?us-ascii?Q?4xHcXK/1FvDDok2hkHFShFnn1O7rlgyJ0KQUt8Y31fV1Gw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UZd8nHlQLlicBRNr5TIuxpaIO0d1g35xq/AX9l+0UceBVcAv0dmLN5KImFN6?=
 =?us-ascii?Q?Em30l86BXRXnbn2wHqM3GHMxbefcbj5YClkewC8B1Tpvu8SRnJEJ1JKkw77v?=
 =?us-ascii?Q?LBeHJYGUOOch55gFunTn0f1KZvngeOc2CVE10zgSk6Rk18Q4L3Q9K6wYEqd1?=
 =?us-ascii?Q?Z8JkT0tQQ7ZhtE9N2SLn2gogTVzKaRM7RwN8PCAY5ZkSD7HbyrEn32XPrUac?=
 =?us-ascii?Q?vW0grzGEjr+qCNUaLGyKud3w2wTuXNFv+sGGCUxbIsJ2E7ST3X2dyMct34EL?=
 =?us-ascii?Q?hhqR3PsFt/p0scuXFTbXwyN7fsLQ6C9E2ziPf0Rw8YivjHqBqropT70mAtni?=
 =?us-ascii?Q?qNfIspXwg/5aNX+/Y8JcFHo4u+SaYPtRtXeswCn3yQ581m8W5DllADyxXMvf?=
 =?us-ascii?Q?5vNZPYk4thMVU7wDVv93YmWBNQLQcqeJkNRH0IeLZq/JHhTU9KQe8XXSUhrM?=
 =?us-ascii?Q?jKS3g2Z0NfGmTuZXGIMKdIEZ4tK8ais5bTk9YN9AiN9X3UOjID66GXJbHjQX?=
 =?us-ascii?Q?H3PRXdzhFpULEM4BI4S/IoET58opFzUs779/4Vg2PORlEwWgjQ0MoCEg2PyN?=
 =?us-ascii?Q?LD78tZ/Ava7GAhwcwSzo56og7nHYuaEepPT0a3Ex35JT65xtI0n7RVrBz4Ew?=
 =?us-ascii?Q?yMXSo/v8VkqsW6U3fmSHChHNQwywHAI8GFE/PmuQZ/bjNyJ5Yw8Y6LI6RLEo?=
 =?us-ascii?Q?PSLO7lUKSf3iR6bG7Bj66UvZpMclG7HzvXnh+dFS2DgIjDyuE6kJIIA7v0Mm?=
 =?us-ascii?Q?Z8YWkjgqXksheJZGrL7JOg371ARZ1UiLYQZ3GpBRnYJ0sUex4h+1SpYWFUIA?=
 =?us-ascii?Q?V4ttVgdmvyQsNSz3qQLK88Rk1Eizd6u82/gFLogidxIIH8Fu/wF+J0Zhge33?=
 =?us-ascii?Q?rPfUzA5S/jrgj1DAFK0pfwG6AbCqM5fWfN//bRifdm6+RRGup9FrYB40RvnT?=
 =?us-ascii?Q?4fEk0FmHUdUcuVHRbHjP53TehQ9En06FPQsCQ7UjpdByy5TTJ2mUOFTaHe+d?=
 =?us-ascii?Q?yRhLpnXcarr4ahpHi8IQTSFZQjPx3XHvI8yJH97KnaU5seBqkETgGJhBw/J2?=
 =?us-ascii?Q?RqsOnn/fQL3Rl0EjbeEynfMV47NE/afXO7pfjZWFYOvCpPlddX8Z4o3kvyQ2?=
 =?us-ascii?Q?LSW5VM2t2KujIQUAF/0bmnAln1k7gkB3UUt8329l7Fbxz6o9ojfYAJ8DjIQA?=
 =?us-ascii?Q?yHwgu6/M1A1ccvN6vG+XyWmXwx/lGgboHn7tllvy2m8S5U+EvYtXBJhcTxpR?=
 =?us-ascii?Q?r5Qbz7Ve48LkyZovbn9xhgk8yG4/L9IN/6LsUH1E9SIl0hogzea/oa+HmrgV?=
 =?us-ascii?Q?7v/4VAVbmDnGENF1xVbZ3K9SetryJNHaccYypDqMM8ms15QVHtOsly3UD6z8?=
 =?us-ascii?Q?1JaRbvkV+FRwVzq7518BlSkBvi43VVqwJtOAGLcdmYV0nsDSL5bulfDM1G7P?=
 =?us-ascii?Q?P8z33xyydP7M+CFKsyALrZB0YS6/a0hDylVUZoTyig4JOt+nux13wXYc1gyf?=
 =?us-ascii?Q?P+8cFZn6yhkERJqRbHxytXSXwTyWfL/s9R8+IECDvWViLDoJzpt2sq9fvZz0?=
 =?us-ascii?Q?1r9XkmuD/ybMZmB4Q8qSBc94UcDYEfRtk/yymg8paPnQwVADXoaF1xhIIcFk?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f16c1c2-cd39-47e1-5d13-08dcbea8688e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:10.1871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwFwksqCqhoe6QCQ3hmaT4nLp9D7FHonjmPGnHHIulC5wWI4S41Z9HUeHnDnItrxD7VUeXUFVg0Q/t07PSKd8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

Bring some consistency and prepare for more xe_ggtt_node related
functions to be introduced.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  8 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 86 +++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h               | 12 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +-
 4 files changed, 54 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a93923fb8721..db74c3395ef8 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -209,8 +209,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -227,8 +226,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
-							 align, 0);
+		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
 		if (ret)
 			goto out_unlock;
 
@@ -327,7 +325,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
-		xe_ggtt_remove_node(ggtt, &vma->node, false);
+		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 1cf682d15253..e0da24bb5774 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -403,7 +403,7 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 }
 
 /**
- * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -414,15 +414,15 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				       u32 size, u32 align, u32 mm_flags)
+int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags)
 {
 	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
 /**
- * xe_ggtt_insert_special_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
@@ -430,19 +430,53 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				u32 size, u32 align)
+int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			u32 size, u32 align)
 {
 	int ret;
 
 	mutex_lock(&ggtt->lock);
-	ret = xe_ggtt_insert_special_node_locked(ggtt, node, size,
-						 align, DRM_MM_INSERT_HIGH);
+	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
+					 align, DRM_MM_INSERT_HIGH);
 	mutex_unlock(&ggtt->lock);
 
 	return ret;
 }
 
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+	if (bound)
+		xe_pm_runtime_get_noresume(xe);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		return;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	xe_pm_runtime_put(xe);
+	drm_dev_exit(idx);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
@@ -522,40 +556,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-/**
- * xe_ggtt_remove_node - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 /**
  * xe_ggtt_remove_bo - Remove a BO from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
@@ -569,7 +569,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	/* This BO is not currently in the GGTT */
 	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_node_remove(ggtt, &bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 30a521f7b075..5147930357de 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -16,12 +16,12 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
 void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
-int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-				u32 size, u32 align);
-int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
-				       struct xe_ggtt_node *node,
-				       u32 size, u32 align, u32 mm_flags);
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			u32 size, u32 align);
+int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
+			       struct xe_ggtt_node *node,
+			       u32 size, u32 align, u32 mm_flags);
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f107ae550c0f..3ca98f8a0eae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -382,7 +382,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
 		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
 		 */
-		xe_ggtt_remove_node(ggtt, node, false);
+		xe_ggtt_node_remove(ggtt, node, false);
 	}
 }
 
@@ -418,7 +418,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	err = xe_ggtt_insert_special_node(ggtt, node, size, alignment);
+	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
 	if (unlikely(err))
 		return err;
 
-- 
2.46.0

