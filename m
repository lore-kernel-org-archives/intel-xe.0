Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E37C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 13:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F254410E0FA;
	Thu, 16 Mar 2023 13:01:53 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8C810E0FA
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 13:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678971711; x=1710507711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wn2l99fKSpHalNs5yBjf98IebiV8sH71879imtqFt10=;
 b=MA+Ux7MKpYRaOmrMgwbrclOkiv+EdY5fnbGcZF3VkOs++e25zxBar14H
 x003/moH9Xpem6yqv0JlOwkSm2V1gOmM0XmXHRECiP2ty8xaJgTpUqnvU
 f1Gy5Df1jrCaZbwbGqXvWFA6V5pXE0c/2AzayTnIA7TofWsPy1tNvoyax
 KBjIIQsMFV7+BYRSSzFuCo6Y5g8KdbBpK2RvnDdxzD109gTOyhCVTfDHR
 jgXJweU2eAGJP/xq4PjCpqZw7Kzb/w2pf+y5jqeglyYxNjtrOyTXgnuNt
 oaBgCtqxRjgWPpaNKCyOSzaROJc7VUr2MT505ysWyskLixSBa5nd3Fe8a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="365668594"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="365668594"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 06:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="712342405"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="712342405"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 06:01:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 06:01:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 06:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfErnBnOYF2R516vuZ6HGq9r1MvRxN5HaulIWi4ledCars4zD/ybRySSkXY0miUTsb0KIEUAiSSuon/uMa+UWwcdRcrpsqIp46e+lrrGlGf7QBXdcIf6GtsPCIMbxovaEsXxE2KtJpbZMWMIiu8Y5gwVnH9AC3cghNSt2EtKwlZwhpLnyMuCmObzv8DhRjZaT+QxIIkzqzXLPKsk64FCHtXgn6rcdKV6FidPvLuzAfzD/O7yrCf407Vkpc4DZ0UX1TR7qC7j5nwwIiIhtZenBbqkgB5By5LGpMNZgeY04TN60IuuPLR0717JSQYTqoZWYHNoDBUxF+Ch7Df1X7EyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGKhXGTvYb0g6eoSTCxBH/BM2kJzk3TkUIOI/dGVxuQ=;
 b=fK67hlxOgg1y2JfIlqf6J2RmMrUttGu0LUf7lvALY3to8HIe8SmycYj5QGvaCjfzGNRfkFbsqGb/tk1n015wahJhHpPlgxo+shV7nN/wUQ11EUEZTa5h2d+g3JSbP941UjI2Sy4l4qWZJL8HW2gVUiEFj5pRejvR0xkJ+uyuwifXOc1khaGMk0ZbwGpcXjep7LvNnVp6l8Km5V/n53do8FKokvk1wXLHAWrqV3gcMkSaqGIUO6Xe3b1E0ta0YemsbGn+FBHEmGlMl6eOH52koCirC6qhqFWkOcZ4tYMZZWrtX9BxOl4G98ZFsCt/xlsNQx9/vgzlE5FADT6gZpZs7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 13:01:46 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::efa4:91b6:58e9:a831%5]) with mapi id 15.20.6178.033; Thu, 16 Mar 2023
 13:01:46 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Mar 2023 14:01:23 +0100
Message-ID: <20230316130125.1629081-2-francois.dugast@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: fcb932ec-15e7-4197-dfec-08db261e98dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m9bVImgQXm4EhFHfP8P25ycFsujf/yjzIB/yv6RUDneJ8hH1cPbRLjceygsWQ1tJ2ikB+900IGAmKCa7p4ukAn2tBTk612d/47ZBtXPiYE2JIhvnrRESdxY56A2cgvK1cq3zEypKRmhaF3oo4sZCrU/WWhbQ4Xz5l0wEMDMH1/h/CELTQoBBc1F5hBn1hAI38+/gQK8FVw2NkKs56+/cjtXVyGNhz8bcWlYiH6bvFCYpDUMccQSS6hFyK+4BUDARSd0TFYk8AsMOmrpGJF3GM1wM4QiCP2VZzpeb0YOXqu13N6PsKit1cSlOgOl64eTEnLJcCnW4TklxeafHCk+3kgRTIFxbX68oGHNixWORpMzAeArkv5sTNe8+adnjXna37Smmi+VmpupstzlvSY4gYAkd4+XK2O04bvh0YpZiErYQZp+FIYL47CJI94UrobpfL6ccF+mO00oipoc0XMmDUvHR2FzjgNyuEBToE5Y+5erkbWYA4jJF/xFMzJ1wQk60QZK6x4yB6Gxt61+0WNzGlxykWLY/uuzZ9yQ1NnbSis6t+POCNjcnMi1dcR29xGjOZddHLag0ThB5fprnpMVrh59UnZbdvb7mSNoP5e31eFGZ1AwhR/9XLO5oQh0m01BI8dThzAiehjsu6Ykf8+YuZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199018)(186003)(6486002)(478600001)(44832011)(2616005)(6666004)(107886003)(6506007)(6512007)(316002)(26005)(1076003)(8676002)(4326008)(66476007)(66556008)(6916009)(66946007)(83380400001)(41300700001)(2906002)(8936002)(5660300002)(38100700002)(36756003)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PtR3B4f3730d7KNX0j3p0bxvjctTu2Cf2zqvmqKzsC6oBguWBR9lQinkFulJ?=
 =?us-ascii?Q?H5OicKjuWPUDKVGq2DflJzkUUkgD7yfTAEyMlBG9hkhLnr00CAdn18I8oVGk?=
 =?us-ascii?Q?BNaFj/D5sIjSqwJZeohludAganxMTCHRW2bKK1R675oWGhKikrMc3WnREMbM?=
 =?us-ascii?Q?FwVO19H4hEAye0m4+U7kjeErRl33HFUYsi+lMdzH1odwhKkDFJsh2+d9SAeX?=
 =?us-ascii?Q?NGeTqugz7tFdhP88UtE1L74X+PcQZfPGtrVJcM+fAyJABVng9yvy1U2lJg+D?=
 =?us-ascii?Q?HvsLy5vA1AdbCHvMFQM+5l6A2j33bgK9Xd3LJ7wR+YHJmkrm8RLOA1ckMpqi?=
 =?us-ascii?Q?I2LWJZy0yUBcUkb44BPBysadOz0+S2kREGxQW3xlNetc7Er4dEMFED+6j0cz?=
 =?us-ascii?Q?G+VCzp2eVhZlWpKw+IARxsV5t70KTH+oV4QA2LXd5zo848BO1rn7PFwBYrCP?=
 =?us-ascii?Q?K5+Fswoe+xN+Lp6uS8+CfmsFwlNE8scnqMexk2rIYXTr0Q8NwID0ZGzEV8D5?=
 =?us-ascii?Q?oZ1h5ChMMLzc8dBz3LuyxyGPIgZiwqMdMeBzWcdoViZjoDaoA2hHoY8hNFJm?=
 =?us-ascii?Q?K1OX5ii73PxCHCzgPrUNAFBNJ5HJzXCNkZ+80JhdJsQOJUH8brCWS2fAR36h?=
 =?us-ascii?Q?rQ3nSqCNpadVqFnEasTIsFQhGzQW34+4EDjexHEHjn3RmJS5JVznFbfLWo71?=
 =?us-ascii?Q?HmslTYCsGpGDO2/oqbTsafW8O/mCta0HcWiBl0au0Sg7JqCs4Nrszf0IowmT?=
 =?us-ascii?Q?LQgxjmRbSpkiA2Re1beno+qa519u1IGvhMxC3PY1CvlNb2Ape+d5oBn74vwH?=
 =?us-ascii?Q?jUvDjPiZ6Jji0C/0h2SR7lNTCIw5+XbO3eBJ5QV1tBouwCOkwAk/fF/05ecu?=
 =?us-ascii?Q?YLMJuRtG1NBQy/vgV2hw+ka10ueNkTGeJm+d1n4M4QHHo8VHOTOvXHQylD8O?=
 =?us-ascii?Q?ec6eBoNYvK/8LzIIwWQ83BZK8cuJTqp/2yletHhi91I26iCGXOl3AtbbhDiX?=
 =?us-ascii?Q?lxWpFz4cJUNmR466ToA4aOxwtLZjALyq9gI6giOQiHv5LktDvZosyzXGv3zs?=
 =?us-ascii?Q?IPWVK719YKSqau/NZcFFGKTflpNXmX/yWLBN0ExDUYg2ySzy+jVJV2hleZfP?=
 =?us-ascii?Q?8jMGTkXAn5S+MLweCJWVmzut+k3MgL2twnaYzpaScLCVazzjv5LRialpwU6I?=
 =?us-ascii?Q?eSIbO8c0MgGrF+kyqDfQ/yLHL1VGB5rzsBM1RzpmpCi0LTEg+nxjksI8klCh?=
 =?us-ascii?Q?Fak2ovdnlJZIADIaFKRW8JzPVQCloNY3e7NdScaXaO17/mBW98ezyNLMmGPQ?=
 =?us-ascii?Q?lRwW3E9G6tv7IR0SynYwxVkezzKtWoLJ1U4ViqNAiqCs/Rq6BbWigSsDURYa?=
 =?us-ascii?Q?ou74/DSCCVP2TA78nJdzJICYkB2/Jk2tJNS0X+0u8Timw3A/yH6OP83RRNKB?=
 =?us-ascii?Q?l5ebhb2G+cq5UC9ot1BdPSuCAl5n59Z1sMyTgmSSTfvbZZhXP5c5UvZdBjrF?=
 =?us-ascii?Q?MHatDHhzWLwZidahOnJJicjpM0xLy/D16y5z/66opa5l3YtZUY2sat7AyFJl?=
 =?us-ascii?Q?SdkxMC2U/31/7TXQvsuUgj/PJAtEuczv7S6nAVtMZyn9sJMiVXjomvdhrZue?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb932ec-15e7-4197-dfec-08db261e98dd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:01:46.0171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpNsNb/k4sZxFoH8IE/l8WrRBRX9ysbSekCpcRblYep21R2jApnntYWlmWdUVZYKRfwEq9l00/YwqYvcCE4Yn3Mo3atLmCo0zpS8KSVNnAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
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

