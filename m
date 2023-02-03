Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53352C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3661310E09C;
	Fri,  3 Feb 2023 20:25:26 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D297710E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455923; x=1706991923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FDNieX6iyc6EeLuIhHjYGmvh/ldA4OwcMD27DrxmUY8=;
 b=F5UxT+o5Vt3lAKvNvLTiW43gEkBDFyFcAkSl3I8KoRCslkQSqmYnXT8Y
 wMoMkVOfgzt6+nSmCjM5sFg+36RsSCE1wHpu0YDXZHZ8UJgs7+vtHxFXW
 VoIH+Zzwv+t1hvgP5nWm1DOlwJWJ+4mPzvh/dl06jESIhtAcyqpq/GD45
 w4C1GzjPi3O9PEvyv0TOJahIqfbAOLFIt96Zisd6NS76IHL0uoSx8rQgN
 GbnMo7wpMwqjvEKL/5gNSCNet/KOeIPcoFHB/HjbhLBB6U2NX/ib98RJv
 /L4Ib62TCGRAEI8uj7sDoDTkPyeoqb9WNfAGMfKQjkzroQ0qyb68Ae/9b A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415059274"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="415059274"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659206840"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="659206840"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 03 Feb 2023 12:25:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8rcCuF/EpPzZhcvVAxe/zTh8WC2m5HPTRP5u+pEW6xmHmevrKhumiosd26cwgCBSECPPysGqzaMoxaX0ICMhAEyhgj2hQWt4RL4g6emS1G5wBqK1V/AKPJpsEMpvITKnjjsoygJqn0al/D4guQ+SAY8O/KVwustzu4A/UIeon36syCyRvqsOk/CjFaEwpEA0f0NzMoNFpCCjBBhzkXnADUl/rZTck/iDFhTuPTZmp/OvwhL4WdqBnRIZVnQQRh30V9is2t36E4BWhHJuh9TpPSXv4GYgtgvS20O/eWU42vLKjrt5uE6YY0QzLbiMq9uffH1BDrFiBV3v33XORf67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKBZ7o0lA1Dvw5hqUceDM9TWIdEOBuaA2DFCnEcaM0k=;
 b=n/Ut6cZNvRrEE24SpWKEg9KBPCehabI7xw/DBw5XGZJdJ7f7tz/Ai99/y4l3cU+UEixfwQ5mYjzFSEXw4jvtfiYX1RXwYP1qvmkYdWItwsEW0CDZqXiPljUFdkJk/X0wgLa5XW6XhJfNH5NyVP3RqoCO2x1Jxzc0IoRWdycj/PPXLXAbEISMlYvwcXaW9lYLE/MzlKnq6LiduVom+BvAAdtlWKkErzG7l9ANXJU5f5022Nl0S8bdudFwstZ4dCcKqeTKfABf0Or6AeD2lIA1qrBu12/DsQo1B/0d4eypH86UQsZw1Z8qda1VrylHtl9tenbDzy/KENl8lNrWPnBZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:25:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:02 -0500
Message-ID: <20230203202409.577032-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 468f2a05-5ef6-4e4e-f57b-08db0624c022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 53gttwkKCUlhFlZq+EZPMdZ0vdD9G785x7To6Y7qw9YTnbEQ0jK674CZjZEGIgbEiB+qIqi7XTpntrqLv3BeEh0Qx2clhe+0TGLfioa0qHrRjWQePcGQjTR9V7Q5zqf0UUCHB3NT1LfkKI1k7WPFE0PAilzz+Fy7tsOCS2PSzI8N1s4Oa+E+VFJ/Abh7BnWnMl3NnRoNqieYTguvWfUdOmCMhG5bQlHE8RYrCXPTehHdHMYgpj4I1rmTUa/jWvA0KmvJWbjY1YUiK+W4U9PuAFKIjUhFn82iDJLXj18/8BoloIhxg3CN3OthXFN9Jr9CN6+fiwUKC2Te6i4pzxErJOQ+btOrUO9eB3ca/0NKBqp6cEI26Bm17pxlZf5AgW1J9uHlKLiSo1olx+q8YVAmY0qHHTmJS3OUTzsy2G54fs5ySEFxHH+KpBJ2THdGSKRObi+rR3560a4WVjWuyYXVkbxdXv//BRkxi89LR17YUQxlLejlSbPoDEjApk4HUnJqFCgFiVjKlcy5C9dqeVF9voUhDBHY5NTNrsUStYNvjK5g2FGRcBBMI3jy/yZ5kFy2k7p+vNISa3HAqx8ZhqbQGZh3o2s/o0cfF39xCoUAWeGrgHsDPzoxXUTGdaApkph58EJf6deahU0C0DT6ENLWoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6666004)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(30864003)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hv7QwJL2CqEZxTwG9k0a+3AEIAgMWgLz1ORTUbSn2IqtYI4q1DS8fznyca2u?=
 =?us-ascii?Q?UKN8l2uSJbtWI4myzKul3M/LsvsoEyxqzmVLBvkwXzcuTQzPCcBtpUyEqbjM?=
 =?us-ascii?Q?lytwXNrKZ+DvYIjJE4pRsaLjTnN4VKIERroq/DW7XyeUABYdoKmY2agEdOAo?=
 =?us-ascii?Q?IQxtdDnG9b9wUMXrzVw0w/28Dz8jAOXULC+awFCproTP+MmkALngxeuncBPu?=
 =?us-ascii?Q?7qkG+OX+NgisrKZjLWfyxRFAcctXxyT47V20/HNmLAcuy7HiOPnYuVULzB3y?=
 =?us-ascii?Q?2ayR0Xvl/Cxa8/mzMp9xcRSOcAVTWe6njYrdP91GCyDzcxedRF1p6ItmbbFG?=
 =?us-ascii?Q?WMycA1grwP4gsnb0AaHt3EDhSxQgdfnqTHITKc93w4nc5Shav8ErYqFvFJLH?=
 =?us-ascii?Q?GQmfcpMrmPOvlf4y7J9rFGZ12DHXEIaDe6nRA0EPuMi/uXP5t2zjj+WX+o8z?=
 =?us-ascii?Q?UR3CeNuKwtLgw/2l8mf+22s/uwJvb97p2LSIGBChMRfo3MNk5+MUEBeIvG5/?=
 =?us-ascii?Q?yuli1azmEf8aJtt5L9ggoGWqCCi/O7JTELHb2OD7j4UwXkj2Jv7TuyWKd1Ly?=
 =?us-ascii?Q?K0XlvcB5SODTBqbow+mrELOqo1tBNA1KjF/J8inLF/Sc6BcHtjug99bGr6rj?=
 =?us-ascii?Q?hkCyjJAaDCI7HjoUfe3FqM1RHRyad6qIgoqLV1fBIHAKhVkPZUlEuyDWZUE5?=
 =?us-ascii?Q?dQ8oAkTDqtc2Kf1+TGfzA6ffDPehNO090Cf9D5onzHkV68T1ILJ5sW0Y8JCN?=
 =?us-ascii?Q?L4fnY7tEGNm6f/6eDvvi6hYCHjf1toKoQ2Mjtg+Imb5bu39clhXQQcVEpriu?=
 =?us-ascii?Q?hdwnOE8jFI3TZUQ2fqNRZIXz+/9k2BLviGIEVYXFGX9TUG+zpJSi6Xu93sz8?=
 =?us-ascii?Q?b9RhfxT7sjQD/0r9/52ntM9giWl18OwrI5NgXHr19fvZS//psMDaf+xxj4lV?=
 =?us-ascii?Q?Qn/hrXoBsnTzCfodffLJ0GDeTqNsBqbSUSJWGHGWAvG7E4uoIJ94gg04rlQe?=
 =?us-ascii?Q?obVI5ipnU8dxSKtHpcfkUeYrzfL8o+2U7Cd+0j6sfFymGkbWCw4ir56b1qmg?=
 =?us-ascii?Q?fBo+ksEd9AxWStaYphef3wN9F8s+dNSRCTh7GYCwc+CubtTwg0N6P9KAFd//?=
 =?us-ascii?Q?2RTj+TuuamCzxB2fBgWHJHkFcX5PHcWTrTt6JaBTsx7R9UZ4MGkoa+giw6Bt?=
 =?us-ascii?Q?qrgX/x95VN0PQ9H5iu33z3W92JLu4gtXX/LjLX72Zdvb0Er85uyZyxkv4hio?=
 =?us-ascii?Q?BBaTJf9Xq5FURz4cTN8szkJRnh/wyTnR9ho74cyVvUgpkjz/8vznau6/OYZQ?=
 =?us-ascii?Q?Mb9zdiJbMq53oo4v0cq5If/RboTsy4trVrj5abitXVjbNwqbhQwmrSRJBjdr?=
 =?us-ascii?Q?iP6Q1Nu1mHyLYUP5Sw1Q05hIQ/ns1CBoBQdslzS9tQVDGOEpDhujeXYxvwq6?=
 =?us-ascii?Q?mbtaF4AOfZ5gZJRJtVjfgOcoL/o7KGg3tYZgq3s57PXLNEsegJmmbmlGZujZ?=
 =?us-ascii?Q?OIErQTRvTuuDHLkxpyS4Z50Kz1Dph7RNmSR7KygEHJ6LRPSb8gGBguX+wNSZ?=
 =?us-ascii?Q?iEM3XUXhy2TJvihECQM3SN/ib88KNSPMcp+mq5/kTjn11tpGAUwEhmlR4sKy?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 468f2a05-5ef6-4e4e-f57b-08db0624c022
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:11.7662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoQP+QpSJAS+hH+YvcBkyndYfGx/QK7inJISW977SMpF6ASluv/yyShTf0VpyINbmiQVXvDw3mUEtScOSoEE/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 15/22] drm/xe: Use GuC to do GGTT invalidations
 for the GuC firmware
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Only the GuC should be issuing TLB invalidations if it is enabled. Part
of this patch is sanitize the device on driver unload to ensure we do
not send GuC based TLB invalidations during driver unload.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c              | 14 +++++++
 drivers/gpu/drm/xe/xe_ggtt.c                | 12 +++++-
 drivers/gpu/drm/xe/xe_gt.c                  | 13 +++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  1 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 43 +++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  7 ++--
 drivers/gpu/drm/xe/xe_guc.c                 |  2 +
 drivers/gpu/drm/xe/xe_guc_types.h           |  2 +
 drivers/gpu/drm/xe/xe_pt.c                  |  2 +-
 drivers/gpu/drm/xe/xe_uc.c                  |  9 ++++-
 drivers/gpu/drm/xe/xe_uc.h                  |  1 +
 drivers/gpu/drm/xe/xe_vm.c                  |  2 +-
 13 files changed, 89 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d7b2b41bc7a8..62f54b4806dc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -380,6 +380,16 @@ static void xe_device_unlink_display(struct xe_device *xe)
 #endif
 }
 
+static void xe_device_sanitize(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		xe_gt_sanitize(gt);
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_gt *gt;
@@ -466,6 +476,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
+	if (err)
+		return err;
+
 	return 0;
 
 err_fini_display:
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index baa080cd1133..20450ed8400b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_wopcm.h"
@@ -200,10 +201,17 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
 	 * therefore flushing WC buffers.  Is that really true here?
 	 */
 	xe_mmio_write32(gt, GFX_FLSH_CNTL_GEN6.reg, GFX_FLSH_CNTL_EN);
-	if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
+
+	if (gt->uc.guc.submission_state.enabled) {
+		int seqno;
+
+		seqno = xe_gt_tlb_invalidation_guc(gt);
+		XE_WARN_ON(seqno <= 0);
+		if (seqno > 0)
+			xe_gt_tlb_invalidation_wait(gt, seqno);
+	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
 		struct xe_device *xe = gt_to_xe(gt);
 
-		/* TODO: also use vfunc here */
 		if (xe->info.platform == XE_PVC) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1.reg,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0be75f8afe4b..36b5da2c5977 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -196,6 +196,15 @@ static int gt_ttm_mgr_init(struct xe_gt *gt)
 	return 0;
 }
 
+void xe_gt_sanitize(struct xe_gt *gt)
+{
+	/*
+	 * FIXME: if xe_uc_sanitize is called here, on TGL driver will not
+	 * reload
+	 */
+	gt->uc.guc.submission_state.enabled = false;
+}
+
 static void gt_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_gt *gt = arg;
@@ -661,6 +670,8 @@ static int gt_reset(struct xe_gt *gt)
 
 	drm_info(&xe->drm, "GT reset started\n");
 
+	xe_gt_sanitize(gt);
+
 	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
@@ -741,6 +752,8 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
 		return -ENODEV;
 
+	xe_gt_sanitize(gt);
+
 	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 5dc08a993cfe..5635f2803170 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -26,6 +26,7 @@ int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_migrate_wait(struct xe_gt *gt);
+void xe_gt_sanitize(struct xe_gt *gt);
 
 struct xe_gt *xe_find_full_gt(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e1a5a3a70c92..ce79eb48feb8 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -240,7 +240,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto retry_userptr;
 
 	if (!ret) {
-		ret = xe_gt_tlb_invalidation(gt, NULL, vma);
+		ret = xe_gt_tlb_invalidation_vma(gt, NULL, vma);
 		if (ret >= 0)
 			ret = 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 0b37cd09a59a..f6a2dd26cad4 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -135,8 +135,34 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	return ret;
 }
 
+#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
+		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
+		XE_GUC_TLB_INVAL_FLUSH_CACHE)
+
 /**
- * xe_gt_tlb_invalidation - Issue a TLB invalidation on this GT
+ * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
+ * @gt: graphics tile
+ *
+ * Issue a TLB invalidation for the GuC. Completion of TLB is asynchronous and
+ * caller can use seqno + xe_gt_tlb_invalidation_wait to wait for completion.
+ *
+ * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
+ * negative error code on error.
+ */
+int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_TLB_INVALIDATION,
+		0,  /* seqno, replaced in send_tlb_invalidation */
+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
+	};
+
+	return send_tlb_invalidation(&gt->uc.guc, NULL, action,
+				     ARRAY_SIZE(action));
+}
+
+/**
+ * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
  * @gt: graphics tile
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion, can be NULL
@@ -150,9 +176,9 @@ static int send_tlb_invalidation(struct xe_guc *guc,
  * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
  * negative error code on error.
  */
-int xe_gt_tlb_invalidation(struct xe_gt *gt,
-			   struct xe_gt_tlb_invalidation_fence *fence,
-			   struct xe_vma *vma)
+int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
+			       struct xe_gt_tlb_invalidation_fence *fence,
+			       struct xe_vma *vma)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 #define MAX_TLB_INVALIDATION_LEN	7
@@ -161,12 +187,9 @@ int xe_gt_tlb_invalidation(struct xe_gt *gt,
 
 	XE_BUG_ON(!vma);
 
+	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
+	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
 	if (!xe->info.has_range_tlb_invalidation) {
-		action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
-		action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
-#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
-		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
-		XE_GUC_TLB_INVAL_FLUSH_CACHE)
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
 		u64 start = vma->start;
@@ -205,8 +228,6 @@ int xe_gt_tlb_invalidation(struct xe_gt *gt,
 		XE_BUG_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));
 		XE_BUG_ON(!IS_ALIGNED(start, length));
 
-		action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
-		action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
 		action[len++] = vma->vm->usm.asid;
 		action[len++] = lower_32_bits(start);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index b4c4f717bc8a..b333c1709397 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -16,9 +16,10 @@ struct xe_vma;
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
-int xe_gt_tlb_invalidation(struct xe_gt *gt,
-			   struct xe_gt_tlb_invalidation_fence *fence,
-			   struct xe_vma *vma);
+int xe_gt_tlb_invalidation_guc(struct xe_gt *gt);
+int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
+			       struct xe_gt_tlb_invalidation_fence *fence,
+			       struct xe_vma *vma);
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 88a3a96da084..5cdfdfd0de40 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -309,6 +309,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 int xe_guc_post_load_init(struct xe_guc *guc)
 {
 	xe_guc_ads_populate_post_load(&guc->ads);
+	guc->submission_state.enabled = true;
 
 	return 0;
 }
@@ -795,6 +796,7 @@ void xe_guc_sanitize(struct xe_guc *guc)
 {
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
 	xe_guc_ct_disable(&guc->ct);
+	guc->submission_state.enabled = false;
 }
 
 int xe_guc_reset_prepare(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index c2a484282ef2..ac7eec28934d 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -60,6 +60,8 @@ struct xe_guc {
 			/** @patch: patch version of GuC submission */
 			u32 patch;
 		} version;
+		/** @enabled: submission is enabled */
+		bool enabled;
 	} submission_state;
 	/** @hwconfig: Hardware config state */
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5a3a0ca224e9..9da5ee4b31f8 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1510,7 +1510,7 @@ static void invalidation_fence_work_func(struct work_struct *w)
 		container_of(w, struct invalidation_fence, work);
 
 	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
-	xe_gt_tlb_invalidation(ifence->gt, &ifence->base, ifence->vma);
+	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
 }
 
 static int invalidation_fence_init(struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 938d14698003..7886c8b85397 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -88,10 +88,15 @@ static int uc_reset(struct xe_uc *uc)
 	return 0;
 }
 
-static int uc_sanitize(struct xe_uc *uc)
+void xe_uc_sanitize(struct xe_uc *uc)
 {
 	xe_huc_sanitize(&uc->huc);
 	xe_guc_sanitize(&uc->guc);
+}
+
+static int xe_uc_sanitize_reset(struct xe_uc *uc)
+{
+	xe_uc_sanitize(uc);
 
 	return uc_reset(uc);
 }
@@ -129,7 +134,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
 		return 0;
 
-	ret = uc_sanitize(uc);
+	ret = xe_uc_sanitize_reset(uc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 380e722f95fc..d6efc9ef00d3 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -17,5 +17,6 @@ void xe_uc_stop_prepare(struct xe_uc *uc);
 int xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
+void xe_uc_sanitize(struct xe_uc *uc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1bc680cdc249..541629293683 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3332,7 +3332,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		if (xe_pt_zap_ptes(gt, vma)) {
 			gt_needs_invalidate |= BIT(id);
 			xe_device_wmb(xe);
-			seqno[id] = xe_gt_tlb_invalidation(gt, NULL, vma);
+			seqno[id] = xe_gt_tlb_invalidation_vma(gt, NULL, vma);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
-- 
2.39.1

