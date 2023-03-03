Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161EEC7EE2F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 14:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AE010E0FE;
	Fri,  3 Mar 2023 14:50:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1002C10E0FE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677855032; x=1709391032;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=p/gpOT+n3zCR6jHXe+QJlULHj6VjfTYd+d9Rh2Qb5+I=;
 b=MWQRQyi9crD4Q57SF7hwkZlCgjXKDv+xmSxcbZeCcGSzxbPTsLomKg0a
 SLO4z8a/I3alnqm9knsLDXOFNknTrFz+TXEDy/QWYkxut79quJQ8Ng7B+
 LnoKMRlnzG+eogRtTRpL77ieQ4WS3WWuCannOqaN+bU/e/k23v66zdbUf
 pt3vvzn9b9mpVXK8csYDfrctXJAJ4ZeesDFfcYbijYhdAVxSMBWJ5UTN5
 XAd8gjHw0kLdlkn7JkEhCYDEc4wj8dCnm6GipFRI/L0THCljud4A3C9lW
 JmZYwO/tmdEOaE7G97gOlBn5a2iBvNu31ZvBZg6v0+1gLSlGveJStQJcP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399866402"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="399866402"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 06:50:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="677673167"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="677673167"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 03 Mar 2023 06:50:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 3 Mar 2023 06:50:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 3 Mar 2023 06:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hiijlp2Jj5d1NLL/PrdQwL/x9SKmT0ITlorwdHIr5g/PxcK/v6wnwkfuMFQgRNoVbs01kSa3nw+rRKe8eVdKCTL5pfsScuGP5l+gzu7fFqJkGxR5IJLNMWBUZdiXM6XJn2gUBrEssvO8e+zWTy0HPh23kZO29mobXHBxi71bLrhweeqOAKvp0E7UzexCBi+PKL8j1hQ/FXdSG3AxnJB38XY7qAnQdMUzfK2fVCSfG7WQ1RFT3on0xeAcqWdzduqBuIeroBsSlnCk/aH97qYzxi74i8Ndwu6MtuiwLZcBnb81J1u+LC7LjeriAFOLrinywGxU3COIVflwkUvw4rSf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmkHISLXupNFdD84dCal4phC1gClyyCk8L+wPbqJUII=;
 b=KfwK+jqRr62QzP2g28CQhKcLtwDVjy2Es27SeIqd8B0tl5/2i03waLuZWw0i8u1RwPlvf34iNc5tXHuqb3aTP5ptZ/gJeuQaVjhG/NeGup7TaU81swmUMF9YdN/Y+9uHRyR6xMcVqtON5Tyf+DSKBKHCskKXVMukn6EVpzWF8k7OxHbTYWVgpT5jNdjdWj8z4DgrdVOlHfjhqO1tcP7if/j6A0VPHOWQ6XfNjl8yYjbL3f7htWOUYudzIXzH19X/2Vlm6DpIaJWxFfSMGmCj9SnHdr6GUOdSxT6aJwlE/qFRFqDV7os1CO89EDrcSEpnTpz3KwMy8SLCRxBsTmG5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 14:50:28 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 14:50:28 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Mar 2023 15:50:14 +0100
Message-ID: <20230303145015.1018870-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145015.1018870-1-francois.dugast@intel.com>
References: <20230303145015.1018870-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ce8ca7-c5bf-476a-cea1-08db1bf6a12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j88zqif1HLGxIuYOaXCfwSAWosTHLz8lAQnr49Yk6s7GRHxVgF208bYJmep52edIIZAJbU9evfFQjoVrcduBjEzKeC1RI4H2QdRCOJrgI00NxyglglGHrKaUONSIWrkWe6j4TCBPp56avd7NCyTHkHy1to+NL0qFkscul8vtJSTZEe9oHcqcQ9xPuzQxqy5Ohzr+s6WYG9mNb939WX2IDSkBnHbDlTMUYaHDE0p+KkSF4xJ51KMIOG4/uwqaBJ27nDMAQw90nmQROGlv47F1aEviLqRPzUViQvBQd4iIKCVdEXZ/IT3lFAMD+1kRjNGiiNRkY27ZasJ3RCR53Qc5sWic3o+sxaIQ4wGIMzQYws55gSkUM7qo+PD8Dw0+6Hea5WwBDqAT+if/m3vkomvF4hmW/vVSxIxwNDbm9X0vKu4oRzyjHS2Cwh6+S6qac4qnFwmIJfflyIGzLp2hQDXI5iG6A03JZy6HpqlFqr4pLr6bng7zYqzklmcx827U5GUxrKoPY/8mr2nM6qlDsU94pGkHebPpXCLrMphrXDsI4jE/eR9fA5/nrPSKNCNXEwwTuvHApLvte7Ixcnj3t9OmMx9jvc3WVmOLJDtIyzBL+t2pgfoTNrK4BHjopL3q1w7Hn/XUVWBj5XWSm/bbes0RZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199018)(36756003)(83380400001)(478600001)(316002)(66476007)(82960400001)(8676002)(6916009)(38100700002)(26005)(6666004)(6512007)(1076003)(6486002)(2616005)(66556008)(186003)(44832011)(6506007)(66946007)(5660300002)(8936002)(41300700001)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pcvExLjcbbwLypx7WceT8w1+wGd2qFABQK/21MjrNcEQH8y9AxeJAm+09Cbd?=
 =?us-ascii?Q?PIxiFuIqg2NAxrh7clJZa9iMUZ0Raukdq/9T7QEL1+GquQ53NOYcVkbdtk65?=
 =?us-ascii?Q?mIjcZGRTTASCKsdCqlm5mdhzBL+oRgur2pE0uIG6mBmlGdfBTN7+BMlsdyAa?=
 =?us-ascii?Q?QSHmCgxdqbsyFqk/H9QWCs4AKBNMz9R5Iiw7IUhkn/HduCS3L7MRQt2JJ7zQ?=
 =?us-ascii?Q?ei789HUPhvqG3fGy0zGCgDRWPR9nOZ5CPnmE/vxC6N7liXTtdw0B/NVVA2+q?=
 =?us-ascii?Q?Xz9J6zDnGCHKbtfS8jQ1omGgQ8emSZT4pwfs9FSSaTFcbqBTrqF31z3li/E2?=
 =?us-ascii?Q?0I5NTTMy6BXAZkiHUK4K1M/dFEd75v8DRRxMNEudFslHpYk/DXaYJ66l+2Xy?=
 =?us-ascii?Q?31LwNaxYZ/waX53ceo0j0Yj3iEGFzilW3KNqOWxrcqmjg890CUrgbi4fkkYV?=
 =?us-ascii?Q?w+9gzwB3hPSW6sgCJ/ftFSzZ8iDWG4c/4BqHAYrU9gmCJKXQZNtBDxpkP4cP?=
 =?us-ascii?Q?oOlQSrRXmpbqTBN8ZrdFBZgLf0uzqdUs0Wtf8p/tiIZbbfgWSonDAGrmy2AX?=
 =?us-ascii?Q?tm5DUt652WwEfGRo9OsawDOAY6/gWZy/XTvhK0n9jqhCApLt7Dzf09jt7Q6G?=
 =?us-ascii?Q?YaCmznYnjXJqv8fXEVALqOee5HaRkpWR4a28l+hFL3mk345rc0+cQ3G/I2gN?=
 =?us-ascii?Q?zdACM7k0o+54Int6s7BzkHOQCuB4UDhjnT2xLWh3u9l9or5HH5hRtqGo3weK?=
 =?us-ascii?Q?7fGj6qbNvlUcFxgHOzLRtiPKEBhBeyYstVHh9Q6GryJAY+YWvTrzAqDXVR88?=
 =?us-ascii?Q?6nlMThhMfIYzqfluIFgwBzcgf8dFH/gZYt5brnC1jMVBOTMKGIpvQ+bvVkO3?=
 =?us-ascii?Q?51msKkuBmcghCxju1QyBAQ90fo2vP/LqHJE8PMHcZNeHiI03gbOcfqK0ICav?=
 =?us-ascii?Q?DsXF2x10gtYUrEn8kbnMuNIJyhRm2ecRCvl3NoHacDjDPTP93pNi6wjwSqq3?=
 =?us-ascii?Q?QacxBQR10OydgvStGfQX6/42nX4entJnmVAzppt2j3oJCbjz1ZXGdCh51YfS?=
 =?us-ascii?Q?vvFGmOBJyeHGVLqikf1pPrciqEnm891n/CBPGxjTZqhy6SAG/L34ac8Dke7y?=
 =?us-ascii?Q?HdiSHRhbyIq+/hEA/p/o9HgfQp3m5qj86Le1qpu7firUL/4YxXShZayPlbpw?=
 =?us-ascii?Q?Uy31HQeOv6TcDJJ1zLteOWeyT47MjvoA2QmCae0umcR+t7RKVkGcO2p+piH3?=
 =?us-ascii?Q?e6wjzthYNryJifMWi77UYKeG2hFa7oc4XuwFOG3H7Dp4J61XyrHfswTNsEiW?=
 =?us-ascii?Q?7avhcZqGbKVXRMRdcyZKtOPVgVf85UVnyNzhApA+zVToH5wD6X4gFNU8+E2Z?=
 =?us-ascii?Q?hd9BI6KOPKR3KdTwt7wyWQorb5Z5w84L21EeMIG+Lz6mg0ILmef0rebpqZ2w?=
 =?us-ascii?Q?pXQ/PAgRMi69O5p0+vcaouEkJItR6e+VP9c9HYBcTs0t7JvYXBYzTqUwyG18?=
 =?us-ascii?Q?nT2UcZqrhgxh6rbNKSBAXVVC2yX9C1ZO1l7ui4zErzoE/AQHP1+rBv6p00MB?=
 =?us-ascii?Q?IlIvM3kL0Fp5WvcWXdfyFdviPkEqTj/ygasTy0q9dXqqC6RuFR4Xc3riwlev?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ce8ca7-c5bf-476a-cea1-08db1bf6a12e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 14:50:28.4567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7qKVnnNnvM4SC9JQxaR3x5mVvssJzxp/tI/VQcJEpLBdYj1tHWPZ7ydWBnLcrvcSDKZr2I8ZF7EmAqkdufoFMrLshu7jPdWkF5ERxfc7iM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH 3/4] drm/xe: Add function pointers for
 platform specific code
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

A new structure xe_platform_funcs holds pointers to platform
specific functions in separate files which contain the actual
implementation. It is initialized at probe time with the structure
that matches the platform.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_gt.c           | 20 ++++++--------------
 drivers/gpu/drm/xe/xe_platform.h     | 19 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_platform_mtl.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_platform_pvc.c | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_platform_tgl.c | 13 ++++++++++++-
 7 files changed, 77 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45e3c740fda2..f1f7a50d92c7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -24,6 +24,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pcode.h"
+#include "xe_platform.h"
 #include "xe_pm.h"
 #include "xe_query.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -261,6 +262,22 @@ int xe_device_probe(struct xe_device *xe)
 	int err;
 	u8 id;
 
+	switch (xe->info.platform) {
+	case XE_TIGERLAKE:
+		tgl_set_funcs(xe);
+		break;
+	case XE_PVC:
+		pvc_set_funcs(xe);
+		break;
+	case XE_METEORLAKE:
+		mtl_set_funcs(xe);
+		break;
+	default:
+		DRM_ERROR("Unsupported platform\n");
+		unsupported_platform_set_funcs(xe);
+		break;
+	}
+
 	xe->info.mem_region_mask = 1;
 	err = xe_display_init_nommio(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9743987fc883..151c6e574cb0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -308,6 +308,8 @@ struct xe_device {
 		const char *vbt_firmware;
 		u32 lvds_channel_mode;
 	} params;
+
+        const struct xe_platform_funcs *platform_funcs;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0eceb5789d15..7a777dcc41f9 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -94,18 +94,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 	return 0;
 }
 
-static void setup_private_ppat(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-
-	if (xe->info.platform == XE_METEORLAKE)
-		mtl_setup_private_ppat(gt);
-	else if (xe->info.platform == XE_PVC)
-		pvc_setup_private_ppat(gt);
-	else
-		tgl_setup_private_ppat(gt);
-}
-
 static int gt_ttm_mgr_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -378,13 +366,15 @@ int xe_gt_init_noalloc(struct xe_gt *gt)
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
+	struct xe_device *xe = gt_to_xe(gt);
 
 	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
 
-	setup_private_ppat(gt);
+	if (xe->platform_funcs->setup_private_ppat)
+		xe->platform_funcs->setup_private_ppat(gt);
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt, gt->mem.ggtt);
@@ -567,8 +557,10 @@ static int do_gt_restart(struct xe_gt *gt)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	int err;
+	struct xe_device *xe = gt_to_xe(gt);
 
-	setup_private_ppat(gt);
+	if (xe->platform_funcs->setup_private_ppat)
+		xe->platform_funcs->setup_private_ppat(gt);
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
diff --git a/drivers/gpu/drm/xe/xe_platform.h b/drivers/gpu/drm/xe/xe_platform.h
index d00377e807db..f2bf48fac3f4 100644
--- a/drivers/gpu/drm/xe/xe_platform.h
+++ b/drivers/gpu/drm/xe/xe_platform.h
@@ -6,8 +6,21 @@
 #ifndef _XE_PLATFORM_H_
 #define _XE_PLATFORM_H_
 
-void tgl_setup_private_ppat(struct xe_gt *gt);
-void pvc_setup_private_ppat(struct xe_gt *gt);
-void mtl_setup_private_ppat(struct xe_gt *gt);
+#include "xe_device_types.h"
+
+struct xe_platform_funcs {
+	void (*setup_private_ppat)(struct xe_gt *gt);
+};
+
+static const struct xe_platform_funcs empty_funcs;
+
+static inline void unsupported_platform_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &empty_funcs;
+}
+
+void mtl_set_funcs(struct xe_device *xe);
+void pvc_set_funcs(struct xe_device *xe);
+void tgl_set_funcs(struct xe_device *xe);
 
 #endif /* _XE_PLATFORM_H_ */
diff --git a/drivers/gpu/drm/xe/xe_platform_mtl.c b/drivers/gpu/drm/xe/xe_platform_mtl.c
index acc244a6a257..f1990bf69ca5 100644
--- a/drivers/gpu/drm/xe/xe_platform_mtl.c
+++ b/drivers/gpu/drm/xe/xe_platform_mtl.c
@@ -4,10 +4,12 @@
  */
 
 #include "regs/xe_gt_regs.h"
+#include "xe_gt.h"
 #include "xe_gt_ppat.h"
 #include "xe_mmio.h"
+#include "xe_platform.h"
 
-void mtl_setup_private_ppat(struct xe_gt *gt)
+static void mtl_setup_private_ppat(struct xe_gt *gt)
 {
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg,
@@ -19,3 +21,12 @@ void mtl_setup_private_ppat(struct xe_gt *gt)
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
 			MTL_PPAT_0_WB | MTL_3_COH_2W);
 }
+
+static const struct xe_platform_funcs mtl_funcs = {
+	.setup_private_ppat = mtl_setup_private_ppat,
+};
+
+void mtl_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &mtl_funcs;
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_pvc.c b/drivers/gpu/drm/xe/xe_platform_pvc.c
index fcee1426f395..32167fbbabb1 100644
--- a/drivers/gpu/drm/xe/xe_platform_pvc.c
+++ b/drivers/gpu/drm/xe/xe_platform_pvc.c
@@ -4,10 +4,12 @@
  */
 
 #include "regs/xe_gt_regs.h"
+#include "xe_gt.h"
 #include "xe_gt_ppat.h"
 #include "xe_mmio.h"
+#include "xe_platform.h"
 
-void pvc_setup_private_ppat(struct xe_gt *gt)
+static void pvc_setup_private_ppat(struct xe_gt *gt)
 {
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_UC);
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
@@ -22,3 +24,12 @@ void pvc_setup_private_ppat(struct xe_gt *gt)
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg,
 			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
 }
+
+static const struct xe_platform_funcs pvc_funcs = {
+	.setup_private_ppat = pvc_setup_private_ppat,
+};
+
+void pvc_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &pvc_funcs;
+}
diff --git a/drivers/gpu/drm/xe/xe_platform_tgl.c b/drivers/gpu/drm/xe/xe_platform_tgl.c
index 7b909a1a90f4..616c20b97844 100644
--- a/drivers/gpu/drm/xe/xe_platform_tgl.c
+++ b/drivers/gpu/drm/xe/xe_platform_tgl.c
@@ -4,10 +4,12 @@
  */
 
 #include "regs/xe_gt_regs.h"
+#include "xe_gt.h"
 #include "xe_gt_ppat.h"
 #include "xe_mmio.h"
+#include "xe_platform.h"
 
-void tgl_setup_private_ppat(struct xe_gt *gt)
+static void tgl_setup_private_ppat(struct xe_gt *gt)
 {
 	/* TGL doesn't support LLC or AGE settings */
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
@@ -19,3 +21,12 @@ void tgl_setup_private_ppat(struct xe_gt *gt)
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg, GEN8_PPAT_WB);
 	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg, GEN8_PPAT_WB);
 }
+
+static const struct xe_platform_funcs tgl_funcs = {
+	.setup_private_ppat = tgl_setup_private_ppat,
+};
+
+void tgl_set_funcs(struct xe_device *xe)
+{
+	xe->platform_funcs = &tgl_funcs;
+}
-- 
2.25.1

