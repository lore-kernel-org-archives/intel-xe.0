Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D9AC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 13:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BA010E0FA;
	Thu, 16 Mar 2023 13:02:01 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC8210E0FA
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678971719; x=1710507719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zkVNNarmQCaFVv+OYtJjN5koWTqKWxaysY0yB8BnZMI=;
 b=ke0/Xj2QxRi6uUSpK7uJcz68w+yDA0KbxJIdyz7AMWVioLHJhA4m6ipr
 A9BhWPk1A/LJ+sZT1z40hjxBgftKxkNuz9rmK65oBPeB9T08nZia6Ly5E
 TbYwscaF9pYqXLHlS/ROwbY8DuURuiz8vdHx148WCQ+QGCHm71OeEg/Nm
 mEid+PJhDGHSmPNB2/5tfj2/RyxGmG+27KSKCocqdyJyxMOejchyNlxy4
 //YpT3PrVJotR0HsIgbXwnsfCm7JLC++lYUvHHhT+dFvAqi8tQRAifsqc
 ReWq/zmaB7WxjOfy3tH2SqoHOImFARyctXTVfma31czpoy5TUPKaKWvsM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="317631090"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="317631090"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 06:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="803724295"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="803724295"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 16 Mar 2023 06:01:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 06:01:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYArFjxt7pwCOQ//GA1O8YOFDcnK3n0rR9TV2CTvc4Tz1qbbbXSQNfQRUeKNns3bhJs1fNWNrfch2RfPwpJOKj44qw00P379ikcHfWVnn64zgHn0ij+NeOCShNfVXwVw13Bqe0C8xAm7bwzgSZ3pp17EIh1PEa03nTvI1If5T4JAMKJTYLOy08v6XzdWs2X2WLVNDP0xi/luE/GFAp2nWgCdrUlF11QOJ5tNRHpou1dJMVsOmzSnq7Ku6iuy0iPek3FbuKqrpra6eh51pFz7ZBqeHY4Z0h7X7QQSURUAxzepaMyvJz3sP73eTZPpWi82VhWB2iySHGRJwqhvOINThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjeTgrOjT3fuBliyhqs/7gtNdxaVms8kbpfJdSOwSz0=;
 b=mdC4XwOJYrYr7qj24nTwTowJPR+QP4PFYh8MsapOlmum1vnU5e2l4Iz35FrB5etd2WOeF2kviTkD5hKvPIfofqVYSB0vyx2lv2VtILDWf78NhtpW3r9iaMh5l2puDbWYDcJ13mO9LHHMdAXqXLXm2MoFnQyyRO+giIyf31BMpIsb5frRa+NahvzyeTM3nq9IXpFunejOU4WYiu6UOyDdNLMWfUKm8JI6fEmwwvX5BA3Qn9XGGHS3xgJURkE6ffrST8o2UtQXgjJQr3JqdVMnfhkMekXaIrbjftEm3V3+LrkYfNxASZ4AMRbJcrSQank+uDrBYSQs/IC0CqfnJ3lGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 13:01:49 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 13:01:49 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Mar 2023 14:01:24 +0100
Message-ID: <20230316130125.1629081-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316130125.1629081-1-francois.dugast@intel.com>
References: <20230316130125.1629081-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::6) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6ab28b-f37d-42e8-6ed9-08db261e9ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U3fS5wpFDqS5PYmaNcz5a4wu81u8nW5fa8lkVa8NG/M+GxqaEdnS7aUVMDMfBBYhM85uwzFOZBB57Aev4m8IPZig38tjfT/OZcQ+5X181QJURlpj3O0tn37hkWNxwE7ScR4XaM2Mlu6rk49CitWFp/jqEgL8WGWJnQ9qkk+nNY24EbznlFwiFOVoQVCReRQKkkAQTHGXZ1ZIRX92wlLxBtIqhxDwUzAMmCgi7Y23NDcn4wZg6u01MoM4zv6f82EC1FEYgutkUGPu99naJiQ3XHkDdNg5PeZVmuL/8VCrWHe0Nwo3iexHHlbM928vMl0XTOJLAJTiq5GTTFdpR1UzO2wh5otTFFnX4zWD7i/eiKVegEfyXDn8w+M+9tBC9ImJbKx9HPBoHu3lfVWRfdPBEX4qgDWWUegJ5SLebxBMnAezZw0I6bFn0GnKQAabEGCSpOKuCLHiczvTdEBBIJFGbSNen/9RhF28Jh1ftpkGSCO8FdfLQr9Afpgw/18AXyC4+uwme8v3C0XfuBXFosF/99E+vfar14zVs8opNgJtBKpzxDAWvSkmfs1sUoYI3qImpNtWPFP7hSPgYp9FL5rnhKYY8Zmt2jjbkH7agZfhxKHG/YLnVrsvSo/77xuU18rQ7pYA54eHV2dcGld7NAUMxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199018)(186003)(6486002)(478600001)(44832011)(2616005)(6666004)(107886003)(6506007)(6512007)(316002)(26005)(1076003)(8676002)(4326008)(66476007)(66556008)(6916009)(66946007)(83380400001)(41300700001)(2906002)(8936002)(5660300002)(38100700002)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RLSS20NWBGRQ8M+wiPxaFbNaMro4+P47uSibXuRT95n6IiVFyxe6JWrNelgP?=
 =?us-ascii?Q?Mz5TJwRpHzRkzMa98sLjqZEZrZ6thsikOoezlMu/g9BFGoEk0QBh7QO3OVaX?=
 =?us-ascii?Q?w9rcEbHIo4ULpldU3fatL0pXOfqMLVbHMITw+sNrLtWp2tqhDsBizCq2mxCA?=
 =?us-ascii?Q?+ugspddFHcH4EiJ9VQmCFsCIeMqDsLodwWdJVEQ92PkXzeXoRahMTNPyctJt?=
 =?us-ascii?Q?2cJXVHARnaTKRwbeSeDU51HDOxe9Gj+ntJxg1IqPuLiZyYvhCF7Lt8v4JV5b?=
 =?us-ascii?Q?5G5QPgHrqU6RiPvCB8mf+SbW0qrostkOHvlm+olQRTaOu1NCLjdPs/G8h2bj?=
 =?us-ascii?Q?Rqyk39CoEC965V8oiHjKLjBI4dthekVOHHX3hwXCygQOs9bZZRlg/YM8eVv4?=
 =?us-ascii?Q?DyIG+09I0LjHMCgiOhaGvV2eXT+qGo+kOjKfP7SXiOlaCmzx/YyuveqlyFIb?=
 =?us-ascii?Q?J4Abxe/wm9MM1gGXghoGoEsH2ujfjRzALK/lVQXwIuX9Pw9UZOIRWKnnwqNG?=
 =?us-ascii?Q?AIWuP+k1XYnQw39eNK3kpCm688/AkyNOWxH5tTVKx3RNSMdzQSl6+RnprPtr?=
 =?us-ascii?Q?i9UTcSsapQ+jC39CEryTDOnVgVnpXcZAWvA3p8+rLyZDQ0KwJfdyFDEkLphx?=
 =?us-ascii?Q?zGXT/s8tJCkghKN5OwQRrnJEaN6fItca+VtdCAMMzanE889fECTpM4tv/XPn?=
 =?us-ascii?Q?Ci5OkEZ7BCBhdKnP7MXdAXJjsH5TeoCDXUq63QPUU+UMgJzbC7mxYsJ7kRiJ?=
 =?us-ascii?Q?/ZDlJ0ALrsPP1Q3T4yVmbNqDnjF8AjnBnfkR/pkQ+aygRGlyiJfT/RDyJ+mt?=
 =?us-ascii?Q?nBsAuqDo6I+26MlDF5pG81h6g1PiWZqKisfUVl+0FTzIwFf5hVcdmeaSVrfg?=
 =?us-ascii?Q?2/XWkV/565mRrNrae8QB0nvpflsfe063+DzsFQ45hKmDrTZAXC2Z4n9w9pzw?=
 =?us-ascii?Q?p9WJRWE10rRUfFA2JDrSJ8mz3nF1+HUKrL+gD0BW3OUT764//tBdmU60nQm/?=
 =?us-ascii?Q?KEeMA8L+QHSWF8wZRad8NQ8sR8LNXsmoX1YiVoPdqCzNSmMYcw2M5LP0E3P8?=
 =?us-ascii?Q?Bg5YNirMR+mqPAbQmI3aS/7bVD5wzU4Wgm2IbQL267Z0USjADLyMzSu2rQ9o?=
 =?us-ascii?Q?slekwdLkleeMcfRWUWBPtVy8FDcMCP7N0QG63VoX6zNgUj1E3LuZ80ET4y4s?=
 =?us-ascii?Q?BIk34Gpcq0Q1eZ5SvtjdreAbv1pnjduF+PlxaGWIhxUmNAYFR4BGafIMLP3y?=
 =?us-ascii?Q?WM6ChjIqSr5dCOQYRR8vo1iB5GPJhe0YkbqWw2jRF0ADKJU8gBUXspG12XZS?=
 =?us-ascii?Q?J9scuhcqDELkZ89TVOe8C4U0iXdrBpcWLupAFgb0WvTOy+Sv17rH3fxcjuEB?=
 =?us-ascii?Q?ow5ASwpIkzmcdeh+hIhdWCfT4lUCKzqvmrgI3xf514dW2wtHZD5WoofoCuad?=
 =?us-ascii?Q?Rg8qRQAjAtYWspICuWffTUt6/m2TSh5vL7h3ib+q5c3D1aBLljRgvqSuX8Vs?=
 =?us-ascii?Q?Ucr78cwWv0IyldNMaBpUBHeZ4nxeQmkWvXLjLQ2XlMEm6b/IcZ4T7G8nBmxs?=
 =?us-ascii?Q?nBgj62NkmDubUOanGaFX/q0fBdWWpvZfDJ9iDnFHyPK9gjdv1DQz4bameIdF?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6ab28b-f37d-42e8-6ed9-08db261e9ad5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:01:49.3016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ITbxwKlgCLNhyv5k9bpB19MRcpbZ0Lqk5Xey1iOXGftddl7DvUdeaM7FhAWfLRDeXxoWoCqIhfsrkj0FbWcFXHm+7E7KXbn4h74/jIYfQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v3 2/3] drm/xe: Introduce function pointers
 in xe_guc_pc.c with local structure
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

This is similar to the previous commit which was for xe_gt.c.
A local structure of function pointers is used as a minimal
hardware abstraction layer to split between common and platform
specific code. This structure is initialized once with the
functions matching the platform, then it is used in the common
code with no need for switch or if/else to detect the platform.
For now only the functions init_fused_rp_values() and
update_rpe_value() are refactored.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c       | 51 +++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7d72fb3ff08d..f4b007bd0ee0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -314,6 +314,7 @@ struct xe_device {
 	} params;
 #endif
 	const struct xe_gt_platform_funcs *gt_funcs;
+	const struct xe_guc_pc_platform_funcs *guc_pc_funcs;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5a8d827ba770..ef3ccf83ea3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -117,6 +117,26 @@ pc_to_maps(struct xe_guc_pc *pc)
 	return &pc->bo->vmap;
 }
 
+struct xe_guc_pc_platform_funcs {
+	void (*init_fused_rp_values)(struct xe_guc_pc *pc);
+	void (*update_rpe_value)(struct xe_guc_pc *pc);
+};
+
+static void mtl_init_fused_rp_values(struct xe_guc_pc *pc);
+static void tgl_init_fused_rp_values(struct xe_guc_pc *pc);
+static void mtl_update_rpe_value(struct xe_guc_pc *pc);
+static void tgl_update_rpe_value(struct xe_guc_pc *pc);
+
+static const struct xe_guc_pc_platform_funcs mtl_funcs = {
+	.init_fused_rp_values = mtl_init_fused_rp_values,
+	.update_rpe_value = mtl_update_rpe_value,
+};
+
+static const struct xe_guc_pc_platform_funcs tgl_funcs = {
+	.init_fused_rp_values = tgl_init_fused_rp_values,
+	.update_rpe_value = tgl_update_rpe_value,
+};
+
 #define slpc_shared_data_read(pc_, field_) \
 	xe_map_rd_field(pc_to_xe(pc_), pc_to_maps(pc_), 0, \
 			struct slpc_shared_data, field_)
@@ -348,10 +368,8 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
-		mtl_update_rpe_value(pc);
-	else
-		tgl_update_rpe_value(pc);
+	if (xe->guc_pc_funcs->update_rpe_value)
+		xe->guc_pc_funcs->update_rpe_value(pc);
 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
@@ -676,11 +694,10 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
-		mtl_init_fused_rp_values(pc);
-	else
-		tgl_init_fused_rp_values(pc);
+	if (xe->guc_pc_funcs->init_fused_rp_values)
+		xe->guc_pc_funcs->init_fused_rp_values(pc);
 }
+
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	int ret;
@@ -893,6 +910,24 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
+	switch (xe->info.platform) {
+	case XE_METEORLAKE:
+		xe->guc_pc_funcs = &mtl_funcs;
+		break;
+	case XE_PVC:
+	case XE_ROCKETLAKE:
+	case XE_DG1:
+	case XE_DG2:
+	case XE_ALDERLAKE_S:
+	case XE_ALDERLAKE_P:
+	case XE_TIGERLAKE:
+		xe->guc_pc_funcs = &tgl_funcs;
+		break;
+	default:
+		DRM_ERROR("Unsupported platform\n");
+		break;
+	}
+
 	mutex_init(&pc->freq_lock);
 
 	bo = xe_bo_create_pin_map(xe, gt, NULL, size,
-- 
2.25.1

