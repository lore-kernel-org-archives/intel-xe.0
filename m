Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0ABC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 15:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EF610EA90;
	Tue, 14 Mar 2023 15:51:50 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6E410EA94
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678809108; x=1710345108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9RjGO4XU/5/gvqF59p/tPZquyN9bzXaa2W7ls1TkrNQ=;
 b=Mjp6C2j7MUdCzftSacrpKP9W73R5S7XfN04Q1P6sriRcMMkB+VqqC+Sh
 V38NLZj2r/FtDc8EHdbvm1hbyUB61zWPhMlsdBJjNZ2QwDbS6T6+WzPpV
 o3XGdN99cnPTcxYuQrRShP7XGBn5ZSvmuAE88wtqLVKnpZIAbBQSYv8sI
 wdjbYZzKS/HEqbf0lOnS5HgCAcojO053jgEHGVU4WXegTRRjfYXhgcSnj
 lz15u/NrbCWSfT+PASZ2vFSjU4D9pI5HkSiwNkXid2WqpVGZKtuBg8tuM
 rQyx31C32nS4h1o6KMfvyxrrZPI72vUiufzOYsJ32WCQnEQhvyE/6eL8z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339007810"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="339007810"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 08:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="709332782"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="709332782"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 14 Mar 2023 08:51:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:47 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 08:51:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 08:51:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rt7mbD1wTLPoRJ8UvmHFOqTAensodizmbFZe6rPzd9YchHQV5p+0MeeAIk24JaheHVWjzMOJbBSyMJQ/OHosYIWhLNINxvwcZgySgNrDmsNWLGz3mPNp/ZUQWeKDG2eaY1prPXsMSp+2w5zF1BrxnmvqtvciPNWzrkcYSbwdL898b6Mg8OrS42jckI4bTbeOgeVS2r/he2BWkKcjxJ037xJ3EdD4b+7/14N1EEJR5YkZumRBMtKEnypZ75WL+Ip4pJgbIWhIfzjDavgqkoyJ1HPNqhcVNA14md0a+wpu2B4OOgPzeCfbzYH5rzZ7rWAGbDc5Mrm2nq7sea1qN7UeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Pi7bIB0Lz9G7n9nnsHJbu/vRgrCe4YlxRVHlMKisQ4=;
 b=GNxqvlkT85/tS8XWFIgBoC0oOG07RZ0wWzZP6XAhbPaI1F3llsmmNXY06mUgxBztS9wsvEkQjZnzNbWbbLWUBybMCE8Opi1JcEc+9u6BCHhMdaEe76h8++t2opmSVbmUnekyqvzVjHHsuTv8GKkm0W7UMAWpNZBLFFdSioLixdOBBT7cjMeKssQqzoSW4VX/bkfJM9G3wk338/y/ShpoAj6ecnCoxCvwu3O7/+8FrEg/LlKoiGdydhdvCX0KlHZohCkhZwtEgVGyuGyYLrDHEYtnwLDlTXqTpPPQWs3QmIN0I5UF2Ld9Dj2nOLxH/zQ5o1ad2o5J93ORbaTJIElXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 15:51:44 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:51:44 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Mar 2023 16:51:09 +0100
Message-ID: <20230314155111.1546283-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314155111.1546283-1-francois.dugast@intel.com>
References: <20230314155111.1546283-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0318.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::17) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 11def1c1-78c3-4478-3e29-08db24a40288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O3mmV+TyIy3KJh1kL+nZE9v12ivnNRmDI8OHm5PKw1kR38/xr+yRRdT14gdh5gfSfz8tO6+lYFknpbSxMSI9Zmx07T/pZQlN4KXHwtZu2gNRYYEzImE8oLIa1WxynZbr4Glljb9nIw7sr8LHwpeoKwGUI76XYsEVPqcM867f3KNFaP5dHV47WnreyQtCM6p1jYZ4F6SKIy6X7Fpa8mKcy607T832vGrM3uR6YeY6xsrEaSKv1Si0Y6qtz8G7bPwHS+LQ/izacE8typ2dJz95Gq0DlgMU3pR4R4vmuSj+Ng7nSeQUgr4zs31PLu3lHVBq5kTfUmOpfvJiPAxhmZvv7S3/6UA1NsQc2TDgq78UrrSpEFNw1klKxIzukXVpZCljkRu3zpWQ4zLRCsWR48gC7I+rcgafmZ1ZGDqJko3+Fk3mPbhjR+aqlcMZsi6i7I+/3Y6MdpGevF1irNOhphVyJyJgYOyLAR98efEJqpvK5u0T5ntaYdHs6rJVsNx+sT0EUTajPh52oDatVa4I2UGNuPo9ccI6NUFIVFSZ/NEEgwfIvMDTmmCs4FtYtDmn+yA3DG5y6Tsz6Vsa5OBeAsxxEhTTvUvP3VtFqq4nMjROdqP8KhFZT5yfBeO52wDH2rU7ssmKC49QY2CmL6QdXa6jYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199018)(86362001)(36756003)(82960400001)(38100700002)(41300700001)(66476007)(8676002)(66556008)(6916009)(66946007)(4326008)(8936002)(478600001)(316002)(44832011)(2906002)(2616005)(5660300002)(83380400001)(6666004)(6486002)(186003)(107886003)(6512007)(1076003)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CxKamRM0I4ds7bRhhy07bBrR+1pwdA/nnbKckD3YJOwCH2ADK8hbQrHdlGX+?=
 =?us-ascii?Q?KFmUGmWT2brWGFFMNSk2DtqKOUgKXu5fHP8NPZ2PRkrRNEdLNBaIWSviTBbf?=
 =?us-ascii?Q?la8DCYNJkobN6N7PvzU2nRo7kEbEtNePUgZ2q657gFCV10TnW4fQSzrfauDT?=
 =?us-ascii?Q?M9vf7lajhgpzWejZynwQPpfvf9bUPlHQV+fyqIDLHP83A7T4nP2J3Fd9LrPO?=
 =?us-ascii?Q?kJP42P54n8n+V41IntGizXnFf2blSBBGaF1HqBRfvIMczCP7ILobYgyVGJNk?=
 =?us-ascii?Q?Jy8T08F2cZ4dzoB/fI/LuogWv6nxFVwZcUEs8ieRKZW//lJ2j0XfTnCxKXJ9?=
 =?us-ascii?Q?8qbzkTUczskCuuHP8LCID2Ve1MbJWviGLXH+qwCblzEHYXNeVft1IQjrtU+q?=
 =?us-ascii?Q?M3qBq2YMaYNiRdPpcSnDeEfgpm3KpaMow9tbTuAcWZpC6dcqysLk3r5+f2DP?=
 =?us-ascii?Q?x3H03XXf6FSI3k38oX+2wqAv4RPn8VV2YDCR9gVta8Vnbv2b81B2xP2cq0HT?=
 =?us-ascii?Q?xzlDNlkPD9ppAFIGbisacg+qZvh28yCf4deaHu99McBFOrR2DPAdOOgEGVB/?=
 =?us-ascii?Q?JEyod4j6vSSTWQmgJbU+ShHxnMiougUrcZlqUwoq3Op6nNsrT5c/aPICdgyP?=
 =?us-ascii?Q?jFeX1UYzIvplUvTLrlSyuLI7yNq+cn/asD62WZ3/2ppvcfGSj4RLB+A7CD5k?=
 =?us-ascii?Q?tDaXnluVDziN6BPZx8UmSzCbQPC5dQyfYEmlax5P20uC4YXNsJCJ1UMzgn9C?=
 =?us-ascii?Q?twv7SZsIJtyeudHowdGJxZ8Vjj4eTSqst8fb+6TAjunmOMEZFXmLiM/gtfTd?=
 =?us-ascii?Q?uRRbyteftYnGpEr3upwWziiFrTuwEDx1fIv36ERvI32mlNZAhkVBvOMmXaY4?=
 =?us-ascii?Q?qoWBRwMX4BN/i3MS44PlaazuNq9G+Ei3rIQT/okcKlt/uWwWpz5CjFerNoPe?=
 =?us-ascii?Q?6lLe8sLlF5DFz9VRiOJR25ZDA0x8p3qajwcSKnVIExoLGkQnjqr+7cpj44fe?=
 =?us-ascii?Q?OmScce72uGldGSoPXNG0avNPIj3LXQ+tJu4Zi0iCgWwEKZksd1rvlp7eebk4?=
 =?us-ascii?Q?kgnIb2B3AGpT0Yra4zEpbwRhGKLPFzpa9ygqe6upYVQPvDyDb/5P361sys//?=
 =?us-ascii?Q?G0LfPAEr2YPyp+qXFrJ/teOHqv336oEYrHXTVIwsxv7dXDwwv8zWGDW/y/eT?=
 =?us-ascii?Q?qXtUfFwVorogBlhTEfkSV6rvAhnYbp3MuxdyMmEmt6MrQz+OMAMrxMjYGxPY?=
 =?us-ascii?Q?6Z2Y6HwZfAReCvK13KDnPacM2be7PmzD7fvPmcVhKgbEdhPGa/yCYFBONCsz?=
 =?us-ascii?Q?DXriMSOtR7fU6XzeKWWH4DzN/XdQXH8Cb0ECt4uIDfpSkG/ElZzByeQ4nklG?=
 =?us-ascii?Q?F3OHE3BAyHs9pQvhq33duQ0lBy/na94Dzscbf0pTqaM1yB9Z9bZToEDa/Psg?=
 =?us-ascii?Q?AY1cJcYpHrvziYyUHcSflpz1lmwaR6/27zkjdU6Nw1qsZfq2C+CaW3QclaXP?=
 =?us-ascii?Q?1DFPWztl/5JKjUqTyskSVZh/YRHBzrJ8OkpfdW/Qs6DZaf4jZuoLdot0IxRF?=
 =?us-ascii?Q?vy0a8A/BVolAXe3Q+zddKmI6sk6dzg8B021dA9/bBNF6jgo17zEZppQK2oDV?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11def1c1-78c3-4478-3e29-08db24a40288
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:51:44.0651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cI7INgYwEPyOP2QPMx2Uzcu2quSMc/WZVDFkU4nlkAzG//V65dffW0qgfC5MvzO3MJu4EWPN5Rgu5uhrtMhVOCX97RB6wtYQJxDb8USW1H8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v2 1/3] drm/xe: Introduce function pointers
 in xe_gt.c with local structure
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

A local structure of function pointers is used as a minimal
hardware abstraction layer to split between common and platform
specific code. This structure is initialized once with the
functions matching the platform, then it is used in the common
code with no need for switch or if/else to detect the platform.
For now only the function setup_private_ppat() is refactored.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c           | 46 +++++++++++++++++++---------
 2 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 034e0956f4ea..411e7a62d28a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -311,6 +311,7 @@ struct xe_device {
 		u32 lvds_channel_mode;
 	} params;
 #endif
+	struct xe_gt_platform_funcs *gt_funcs;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index daa433d0f2f5..3b092f951378 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -42,6 +42,10 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+struct xe_gt_platform_funcs {
+	void (*setup_private_ppat)(struct xe_gt *gt);
+};
+
 struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
 {
 	struct xe_gt *search;
@@ -157,18 +161,6 @@ static void mtl_setup_private_ppat(struct xe_gt *gt)
 			MTL_PPAT_0_WB | MTL_3_COH_2W);
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
@@ -380,6 +372,28 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	xe->gt_funcs = kzalloc(sizeof(*xe->gt_funcs), GFP_KERNEL);
+	switch (xe->info.platform) {
+	case XE_METEORLAKE:
+		xe->gt_funcs->setup_private_ppat = mtl_setup_private_ppat;
+		break;
+	case XE_PVC:
+		xe->gt_funcs->setup_private_ppat = pvc_setup_private_ppat;
+		break;
+	case XE_ROCKETLAKE:
+	case XE_DG1:
+	case XE_DG2:
+	case XE_ALDERLAKE_S:
+	case XE_ALDERLAKE_P:
+	case XE_TIGERLAKE:
+		xe->gt_funcs->setup_private_ppat = tgl_setup_private_ppat;
+		break;
+	default:
+		DRM_ERROR("Unsupported platform\n");
+		break;
+	}
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 
@@ -441,13 +455,15 @@ int xe_gt_init_noalloc(struct xe_gt *gt)
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
+	struct xe_device *xe = gt_to_xe(gt);
 
 	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
 
-	setup_private_ppat(gt);
+	if (xe->gt_funcs->setup_private_ppat)
+		xe->gt_funcs->setup_private_ppat(gt);
 
 	if (!xe_gt_is_media_type(gt)) {
 		err = xe_ggtt_init(gt, gt->mem.ggtt);
@@ -630,8 +646,10 @@ static int do_gt_restart(struct xe_gt *gt)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	int err;
+	struct xe_device *xe = gt_to_xe(gt);
 
-	setup_private_ppat(gt);
+	if (xe->gt_funcs->setup_private_ppat)
+		xe->gt_funcs->setup_private_ppat(gt);
 
 	xe_gt_mcr_set_implicit_defaults(gt);
 	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
-- 
2.25.1

