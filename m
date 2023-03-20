Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE81EC6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 08:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE010E23D;
	Mon, 20 Mar 2023 08:13:15 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093CA10E247
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679299994; x=1710835994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wn2l99fKSpHalNs5yBjf98IebiV8sH71879imtqFt10=;
 b=ZTV57E0h3WxlaYVMu1IHpSoRYjWizL5S9bvteUkG7mjL+7cuUsd2juXJ
 dqiXtpFIbY5GLPgLYkGHbuWMHhoV1+xk4MHCPN7OacjhDf1cI4yGEq+Kz
 dThNJOeV0YUqb44h8UKg1dz/fMK0iHT0LZEFY0ZHN0jXkrkes90a8D2BA
 nGwqI6YadYjG46GAdVk3qo/6cR7fRIXwK7d8FJZW+Ms2+pDtNqENwbaUK
 Nkq6IPNBjarPtbeHYinSMxT48k0n9VbeS7c6gDHiF9zLo8lwQxsc2D8a0
 9UErkb/KalktO44GgNTX8lqeIHtdrz4O5ahlDfDxPS0+JVJrL87rVd7cf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="322444198"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="322444198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 01:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="674270116"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="674270116"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 20 Mar 2023 01:13:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 01:13:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 01:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gV0Y8n8Md7cjAk29g/aOgoh1PoyrVsl7shSrKzdPnuy/9FY9Rf1LOVFVMyOjqjC7CgM8+0wHdIHk2y/Ni0j/6RcBBNKcA0C7Hq+O+HgpTGZDNxcvm45fA253+CeZKpfjvJ9piOcreLy8gi3O+/lwHfCOdqhzhDWBZO8fm3JB56M7NRHPjn7QV35yT2Kq1h58YEOU7ORmrIpYlnWA1BrY8hVtC+gxPK9xkonhNSULxi/Uw633Usdvl+2EgG+rVcdRQ428XyKGO3W0ZDcDFBwjtZXz9zxndMYfq2piecn8uBk0scTZp00VywxJXHshh7R+myze6msZP8S3jrHjN5/xTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGKhXGTvYb0g6eoSTCxBH/BM2kJzk3TkUIOI/dGVxuQ=;
 b=kO1dG7IONdZx8H9dzs1EaBQ8tSD3u/itwWnRkpwhw4+KrOzh76znVZOHU9lTyTlP9vcyS7i/XVkQinpRREw1Mjo4MENwtmhx+7wmZHIkSt7IAntDMKcnPbHDaXbd2GpxDcI6wSDiyM5gncWBbte6QiNuWiKS6HwjAc2ReFqAqb4FN50lj7jqeiopqweYxQtC4jYh8YGfAblMM/jX5K1z9W1KAJMSjdX0GzH5tFLvtX5AaPFv5jfhq94r3G1X9fejCR5NkoG/XIVCWs5mV6p+kwpi490ovCowjmqBuh2WPPzJVUo3pFxdKQO6lToEsDIWGpferIKlh4+PLixctsGEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:13:11 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:13:11 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 20 Mar 2023 09:12:55 +0100
Message-ID: <20230320081257.1788039-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320081257.1788039-1-francois.dugast@intel.com>
References: <20230320081257.1788039-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SN7PR11MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: d0438e2a-d4d3-4a31-32d6-08db291af21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: drbC2abhIDMrQAn0cWY4hl/qmc+3R/d2fVM0zHaDrEIwwH3ic1tr6QvnPhM0RsxAWR2ftXPkl9xowbWaCeAPJ3t7gX3NPOPU5137wVgwswFxYxn7CXmCJx2Ot7szzU8wN2yhQdKg3K94kuLaJ59JHaOc74X+4JD4n+WxcCxx/THuuW+4Kq0rhiPfh1dLNCAJ3mmQaoirGlk4BpHZLetbgeFPHjeYM4tTzVO7op4n0p2q/njSvJvMglJAN5sIzs1GupKEMHFNCG56q3RsFzvRijN46L3orAIuYwaEqt01EcZfE1dHrHrbQxxdnFB5Wjg9n6SlHNUZBj8tHOjZ0lk+XZgC2XyB7dRHGFnCpKH5gbHQpJxu+LOZBVqnKHhf4d+ZbPYbFfI0KushW592+/GBdaurdAEmYTcy78xcVps8tmi+Ti4T0oBMBwvjAxjgqF1Czng0dv0JZH8Zn4pUYrHkFN0TrL/pcJSWcRPka5WiZrsg0qgbTbxUTJGPHaRtgyADdvbBRYw+44cQbZ+FtZ7AfCJa/73YntGMZ94TEbIPAZVqUccgydkmHpQ+n2oePsKJYJ2cJ8Xf4ezR3vga9oLz0YKKH9BUNCnTTVNAJpvCyXWSgMmlaGg1wPnZwm9efZr5TUu9eTVoVGgrcmXUpBNstw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199018)(478600001)(6486002)(107886003)(316002)(66476007)(66556008)(6666004)(6916009)(4326008)(8676002)(66946007)(8936002)(186003)(26005)(1076003)(6512007)(6506007)(41300700001)(5660300002)(44832011)(2616005)(2906002)(83380400001)(36756003)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wshgFTLb+GKALD13dNPD0Gq57yEcEz8fDC9sEnk8POLa0hfhsFcO9q00lJHa?=
 =?us-ascii?Q?F8Qp/6s3/lKrUGal15Crnv2QQj80Jb901ZlDAdyu3u3Hpv51nCY0+2OjfJR7?=
 =?us-ascii?Q?WQG65Mx21jOut6GJ9wI0ngMl7BrFN79jfyXxkm3Ld2X0T9rqlgOb9OjwQ9U/?=
 =?us-ascii?Q?CxQm3XK5KcVIV6oeXSLVbuZYjtkJTfBvBHim/QE2QsP6y5QVqD5e9Hp7Sk9m?=
 =?us-ascii?Q?lKQ9c9ZfZZTri9ZJVyPcvuZTyuceYb8v8GmgR4Yr1m6Wp2BRI7gH5IHl0fZc?=
 =?us-ascii?Q?syR+BtmUFsc2GEtDAkTaGF9/uxaCuBrYnJ5xDUbJWNvyjR2AijP9v5AWPBh3?=
 =?us-ascii?Q?mr5XxgQiQRHVv6NSRZ45g6MRiJYtXFp1okgqrG0+YdwhI2w9uzTMT1ipLix0?=
 =?us-ascii?Q?o8qMa55WyHLJwMZaHuQVHZMU5x3y+3li2FNJMPEksVz0p2l6pAzE2nu68VZ/?=
 =?us-ascii?Q?j/baVYp7I5PJRVwfx8b6AqEXqhQWFR6ZshzJuBJ6yIIhrPNVba37X5bNtmdh?=
 =?us-ascii?Q?THnsu+mvRdUumovod0eMCqC81gwgteYCxha0TnxFVXGsdD2WixYadwTvWyx1?=
 =?us-ascii?Q?70Cb2Fs0kQfjEXn/YUmjUrDzIpJ0kwswRDNABvJ0tOGiT46djkh09OpTD260?=
 =?us-ascii?Q?oKqtlh25Q+1tipgP+XMXDjrXmdgS88Xp1yI3SvkXjBpWsEPIivG9PCKEK5C4?=
 =?us-ascii?Q?pDwcgT7xIH0KcQOsaMD3By9lTnpd4oAHwKjzwjU0f59H4oMCkvD1cV9p2ATP?=
 =?us-ascii?Q?mDaFVt2uQ7rUrs8/ouv9hfC3EBygF9VrEuF45EGS19v78K1bFhQZ1n1eyPwJ?=
 =?us-ascii?Q?0umQggyYZFYX9Ze96wzc3WK8XyQ3blrdm32bdnAaLn/vIquERHJMcZfwNOPd?=
 =?us-ascii?Q?MmxDfLVbwgYNBivwx0VM3N0nlDRlBcTaspQkcYfVG9BVuU7cmDkO4MjsNraF?=
 =?us-ascii?Q?sKsA/iRB84OkYDcUQ4UzBIksf/iGdAsktzeP5fEkdjIkCDIHaA7StaPR3Wcp?=
 =?us-ascii?Q?SRyilfq/yi4qiuSrjovb95koUh3Ry54Y0fIhhP05oxd0g8mdI1Lny1juA/Kx?=
 =?us-ascii?Q?nf8sIHQyb88cbzQPUjI2jnbvL6YZPVvYjJyGg4mhOr7T4EA4j1EqjgE2V6ZS?=
 =?us-ascii?Q?j8HKMf7SR+WlPvfcGF1IhXMcdMliButOgTI2UvwmprgHd/MrQ7Du7s2jtVIa?=
 =?us-ascii?Q?4EyOiNiYa6yZEG/lTEO3IRGLfo606+d3ryEEq9x1SwbI1WnrHy0QB6/N2D63?=
 =?us-ascii?Q?cCiU4D7EcbeRNyM4IM2MdoAtd+9w7rcyMgQ9fNTI1Ktl6CDHR0Kek/gBtT7l?=
 =?us-ascii?Q?pOPesuEcIbdFn7UrR+T2itb2Dm1eaGSR4dVmweGJVCjXdCIeiGIYbaly8hfr?=
 =?us-ascii?Q?ldmeifkpKbQZAllnrqGsOPnng8I0vQlm+21Cq2BM+EvQfCnHaDRYxMv4qp82?=
 =?us-ascii?Q?Mv+eFdQacJKd0Onb9TIc+uEUkjzQUbajZ67roi3zW+5xosAw1oZB/pf7nJ06?=
 =?us-ascii?Q?sEEaq+G5YOCoN0evStFreOYE0qnwjIlzw9nxDHUj5RXGIrm86SuYF+6Bc6lt?=
 =?us-ascii?Q?0UZXd9Cab8MUaU+8Wxbo6og3rXDquLajpYjc6tUI3F1w1Iial86cq0ZeRQsk?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0438e2a-d4d3-4a31-32d6-08db291af21a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:13:11.2011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMN5Gg14/icjYVNnVfiiHgM71k4IPxlcyAAszexngJ/Qlbjpa2MAXOA2bAFAWt4ssBwpDgW+BOUSS7eZNZTVJQLwQull/qEAtlbjaUjY1kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH v3 1/3] drm/xe: Introduce function pointers
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
 drivers/gpu/drm/xe/xe_gt.c           | 49 ++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4c65598652e8..7d72fb3ff08d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -313,6 +313,7 @@ struct xe_device {
 		u32 lvds_channel_mode;
 	} params;
 #endif
+	const struct xe_gt_platform_funcs *gt_funcs;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index daa433d0f2f5..718cd18b6421 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -42,6 +42,26 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+struct xe_gt_platform_funcs {
+	void (*setup_private_ppat)(struct xe_gt *gt);
+};
+
+static void mtl_setup_private_ppat(struct xe_gt *gt);
+static void pvc_setup_private_ppat(struct xe_gt *gt);
+static void tgl_setup_private_ppat(struct xe_gt *gt);
+
+static const struct xe_gt_platform_funcs mtl_funcs = {
+	.setup_private_ppat = mtl_setup_private_ppat,
+};
+
+static const struct xe_gt_platform_funcs pvc_funcs = {
+	.setup_private_ppat = pvc_setup_private_ppat,
+};
+
+static const struct xe_gt_platform_funcs tgl_funcs = {
+	.setup_private_ppat = tgl_setup_private_ppat,
+};
+
 struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
 {
 	struct xe_gt *search;
@@ -161,12 +181,8 @@ static void setup_private_ppat(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe->info.platform == XE_METEORLAKE)
-		mtl_setup_private_ppat(gt);
-	else if (xe->info.platform == XE_PVC)
-		pvc_setup_private_ppat(gt);
-	else
-		tgl_setup_private_ppat(gt);
+	if (xe->gt_funcs->setup_private_ppat)
+		xe->gt_funcs->setup_private_ppat(gt);
 }
 
 static int gt_ttm_mgr_init(struct xe_gt *gt)
@@ -380,6 +396,27 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	switch (xe->info.platform) {
+	case XE_METEORLAKE:
+		xe->gt_funcs = &mtl_funcs;
+		break;
+	case XE_PVC:
+		xe->gt_funcs = &pvc_funcs;
+		break;
+	case XE_ROCKETLAKE:
+	case XE_DG1:
+	case XE_DG2:
+	case XE_ALDERLAKE_S:
+	case XE_ALDERLAKE_P:
+	case XE_TIGERLAKE:
+		xe->gt_funcs = &tgl_funcs;
+		break;
+	default:
+		DRM_ERROR("Unsupported platform\n");
+		break;
+	}
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 
-- 
2.25.1

