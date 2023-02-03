Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BB9C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AB210E09C;
	Fri,  3 Feb 2023 20:28:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE9410E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675456110; x=1706992110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OhpjNhg73XA4DXkeXUhbwC3vGFwpB84VTRM+bUeWCkU=;
 b=g0vUmzg0MitLYtMkb8WMnXEp5sdVE9wYoOQsqxhdQ0dMH5RpKMEHAn4F
 BqsdQ7dPXapX4qef/K3qLIc/lWbtcje9sdx907YooH++aVo5XZqKkvM4P
 Drx6uQarCm3UljYIjoGLgte5oKziKDGIaO6pDkqmYLUQr4wWC3igfqsDs
 GWExsLdfmnHJ7A9DrBGbojVJ8xng+9tUvpGx3FcRk6ghVBtw5nRI1BTIc
 JNIgqpTF52djZvTUTHpCEuiXTTrY4eoQkiPZtmZvHi/3A5GuBn7ufUbEH
 NpHvX+snPxhajZi/g8YAKPwKBqhif6QKubrMMoYJaJRPxDoVyRjEv1BMh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312504033"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312504033"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789810576"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="789810576"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 12:28:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:28:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:28:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:28:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mioyLNupA3F1sb7XS5gtjHyRH7FVMxvLr+jVs8K39ZVuMLEtI9GfOXLA5uRFTHpmy8bwKqL8dca/Rer2l39DHNqjdByiIGEBqKv3+DhiP/MCDihDewu+aTlCJMZh8PElpZJSaXPXMEpA8sB82xW9eFPST/jjEyzJYNiAi1j1OqQtLiCaztrJsMZjpGDwq4SKQS7jeoQqDtelyfjR21WqrTSmkZxdXaOVFROsuaSH2aP7isDczeUmLs+4+PwpvUslfzLbqN5U8F91mPWdWuum34T0sZcwgozwD08fAZ0j7ZftIJ1yfWeOlVLvB04rbsft1LRDtWJLpYSS0U8R/b2xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xskYX8o4jjySDLWJgaVSLFmrudvKNlOnvLWWPQn63yo=;
 b=SytaSgyI0BoUeUWLcFJnuOH1NRQub1uKOcsfdCZbv6vBddVKCJy1L/OH/1K8BaoQalaHFDcE9yYYTxC+PEVdmyOzHGYSy1WJwJA2BW0lfypqmypY5SiXishsRSq619GMKErScnI5aU8WCVgOnjkQME1AyY4q6HXzV7X10oJpdrylDP4pYkRDUGaEzXJzpLQMxyWIYrdduU6UiMySnktydiTTId9wYJXqGrbElrdHjiieIHqHwr3Ad61Khv6gw/4YXIUhGEEZr/Q6WJhdTt9p/VthMLXCS1E/YhxINnk+x1M+zwtAoQLkb6Az7g1SFxqWYvvTWPI7jAhim+cZoeIy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 20:28:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:28:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:27:42 -0500
Message-ID: <20230203202742.577659-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202742.577659-1-rodrigo.vivi@intel.com>
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: dd311607-0f32-42a3-23db-08db06252b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2wOhP2kr5k4qM2kNXfk0Iv11Qnw12GsDZivGhNAmxYs98glpcA3yOdCqoBw8ziQenf+kzhxnB8OzsfjujDLFrvpCVbWN8MlGdQMETUjBMwxvoMsIKdFg9J4aRPP78oZi1x6u1Pl7Um8N76jB3xP6t4s3F5BPCFWDN0sXk+aYgQke6jcGnUg4MXLWnbGppd5beg88oEq2l+Sp3HwgR+zsS9UeI/3WYZKOWgB/qVyxP2ZvBL1EE2mkSWsZR5Bsmp+IVkK3l7CIBB3MQzUnWLTipSnnOV2IzOHLy3ogrywTMfoSS/JiFoawqgHQP4au6zQAXlT9hGAY9MIbbzfx6Av8kngBmAEMPjhe+AfhNz1g0JsXehOSpNauqG6ijMHZgA4V9zHtdQyAN9dV54EH7XQSAEoXyEB/LIiRk6ONN9mFGNQhz9JbEf5k/W/2pVD0e5ZKSdtkpPbJTpDKy4lV6Q5jHGh+DSqtRRgzygaLwBjLf+HgDoTDzk1gaKRVtCX8caoHsHcufT/PGAreERPS6WRM+UCtecz7wfXBJ6cuaHqIyIZR7U7YFVVEIBLVA3c5vmeudnZnOcP6jfO1HhyN/+OehFhzNqTTeC0dTSOat3OIrPMAnEFo5tDESXVzn3AaXIDxg1ebyMBqlYCCJd8+7c4PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199018)(82960400001)(38100700002)(41300700001)(107886003)(5660300002)(6666004)(6486002)(8676002)(1076003)(316002)(86362001)(54906003)(6506007)(83380400001)(66946007)(66476007)(6916009)(2616005)(66556008)(478600001)(4326008)(6512007)(44832011)(8936002)(26005)(2906002)(186003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/LFAij6InZFQ0vqHntSV2Naghbc6YXm0dsUb+z4XE+sEFgdKooiYfu7F/4GW?=
 =?us-ascii?Q?yl6tE8qnt8ZTxpl+12bLsdo13YB+o7PcnKgBGlIDWOkk951QrU1ZgTdUrRPB?=
 =?us-ascii?Q?ux0iay+3if14b+krqhK3iTRVY5+pN9FuEL+wSsNvuEkI1H1vGohWwrHOJJH9?=
 =?us-ascii?Q?s4oZkpqpIJAxx/iEEYPO4N+GLSNiLHEE7TyfKwokjuX8CX1sjLuGJ5pMUOLX?=
 =?us-ascii?Q?oVzqAkn9O5HFIoFXWL+eFudNYLIyG7mlU0v07BMQChVQanQWIy5lrC8Bc+Pb?=
 =?us-ascii?Q?oIvPOTrYkwozbn/liZy+encm+VJpu2DQRkwq7M9OUQuEyTbLZG8a7J3Aj8AD?=
 =?us-ascii?Q?oKdn/HGC1oT7WHDzbMPvxWxYaflmEM5Je/4DrMKsUQfjbgNDA2K6uPH4jCpu?=
 =?us-ascii?Q?q32Z8SKXErYNq0+FpC4g8XLssWnVdxR82qqC6Zn594gmaXKztN6h8HLiiKsf?=
 =?us-ascii?Q?ApzKi3eIsKVykIqx79GiAt+xYpS2ls17pyjKlArcHx05Nj1Lxm6veAHc3yG4?=
 =?us-ascii?Q?yFSuT6StQR/Q/Hakj2Gku0s03eCxtPoXQPf/76HN+ic1vsvV8I/jioiYNAG7?=
 =?us-ascii?Q?HZbrkG7RsZM4tskT1RQJixj6QLSEbDq6bXsP5qZpJ0gjOpe2J5tzTVZWEjTv?=
 =?us-ascii?Q?pEJOSQwrLtd6Nv19/1MnwIlbBiCUmxNYCkDlKndgeWkHsvz0kfvISO4SmJel?=
 =?us-ascii?Q?W50zZ88ZyTztlTaCsnC/dOJeP+nJ286FJYef2rF0CEmWhEax3KIFKXWLdvJ0?=
 =?us-ascii?Q?y8MHFEDiEtcwxvvrO3+bAxvdCTG9bL0ry45AmLK4+b0zgWwjsELzKe5j3hrq?=
 =?us-ascii?Q?Zr+dku0zn8VigD701HaZMqc3RbNbEKx5qT1FPfsOM2XgCUas/xRNSZguWKnh?=
 =?us-ascii?Q?2XOmW+5GwBxYqbexTd3YoM/7ml0q/UCLrg2YBoth+Icy00MIHGNrWraMmJK1?=
 =?us-ascii?Q?3FarqPQyZ2KG4+78HoHYSkGll/3Y+GhtY81KH0eWTRe/809n9Gb/jdqeI1nf?=
 =?us-ascii?Q?/b4hwP7Ve56l6oY4F1YQN9XHTDAUStHAusSHr/o3o9jHrtVUTeOyjv+I9nDJ?=
 =?us-ascii?Q?Xiue1mRHJNjsJkNGbE4zBnGyvVYNkaNgjjf4LZ3SKe9fND3kumE5leVhsWdF?=
 =?us-ascii?Q?YZc1lqQlp2eKyrE4oG35FnZhEhrDLsjRf5SRZsEFZo0GOLDpr7LowVmwn6/P?=
 =?us-ascii?Q?hTWy17m/eJgbCYrShiqHfcj73e4JaJYK0H2eeeLu/D2BkgOMFQcA7aJ9ggDx?=
 =?us-ascii?Q?Mrf5mmpTkiosbhPgeiEeG40f+MPJToWGxz8z+zug1BFRaJT4LoH2AJtkZaGG?=
 =?us-ascii?Q?kVL+dnTMMypWrv6qpujm+ZQjoR9ubhcKWiGxPc6DZ67Rysp5Py/5fWWkZxA8?=
 =?us-ascii?Q?shxvXpZQOjmq5kLSoHx2jsF+SQt/Ven5E7epCrPnXFNhTdiVB5C0lkKiq8ag?=
 =?us-ascii?Q?EEzDgFYd4i68DP7vKR99VyOvuL0Hfkfr/s5nxiN6TpCRZqv+D7PH+Q0tMKAm?=
 =?us-ascii?Q?FDowuouds4JrQd7WkPvz/eAWJuJhl/VByaW/GF9ZHUQXLoexcqYh5A2Gq1ze?=
 =?us-ascii?Q?xU4/sCmNV/6ebr1JYACr+5xIHfu1PyGGbcw7+QvbuasNUCexoZKkGc5kJJTG?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd311607-0f32-42a3-23db-08db06252b21
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:28:11.2393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5R2ADY6fdK3e2W9D7bsPCYCrasRnN8FkzJyzqmp8pxLM0FAyNXUdONm5hwHE6a6o3sWbi+PDHqLzpjXNp60Bxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 6/6] drm/xe: move xe PM-related display logic to
 xe_display.c
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It is very ugly to read code with lots of ifdefs. Also, it makes
harder when the display part can be disabled in runtime.

Move the PM-related core to xe_display.c, making the code
clearer and more modular.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c |  98 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_display.h |  12 ++++
 drivers/gpu/drm/xe/xe_pm.c      | 121 ++------------------------------
 3 files changed, 115 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 262d8e06b51f..47a16a3f85fa 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -5,7 +5,6 @@
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 
-#include "xe_device.h"
 #include "xe_display.h"
 #include "xe_module.h"
 
@@ -17,13 +16,18 @@
 #include "display/intel_audio.h"
 #include "display/intel_bw.h"
 #include "display/intel_display.h"
+#include "display/intel_display_types.h"
+#include "display/intel_dp.h"
 #include "display/intel_fbdev.h"
 #include "display/intel_hdcp.h"
+#include "display/intel_hotplug.h"
 #include "display/intel_opregion.h"
 #include "display/ext/i915_irq.h"
 #include "display/ext/intel_dram.h"
 #include "display/ext/intel_pm.h"
 
+#include <linux/fb.h>
+
 /* Xe device functions */
 
 int xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver)
@@ -224,4 +228,96 @@ void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 		gen11_display_irq_postinstall(xe);
 }
 
+static void intel_suspend_encoders(struct xe_device *xe)
+{
+	struct drm_device *dev = &xe->drm;
+	struct intel_encoder *encoder;
+
+	if (!xe->info.display.pipe_mask)
+		return;
+
+	drm_modeset_lock_all(dev);
+	for_each_intel_encoder(dev, encoder)
+		if (encoder->suspend)
+			encoder->suspend(encoder);
+	drm_modeset_unlock_all(dev);
+}
+
+void xe_display_pm_suspend(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	/*
+	 * We do a lot of poking in a lot of registers, make sure they work
+	 * properly.
+	 */
+	intel_power_domains_disable(xe);
+	if (xe->info.display.pipe_mask)
+		drm_kms_helper_poll_disable(&xe->drm);
+
+	intel_display_suspend(&xe->drm);
+
+	intel_dp_mst_suspend(xe);
+
+	intel_hpd_cancel_work(xe);
+
+	intel_suspend_encoders(xe);
+
+	intel_opregion_suspend(xe, PCI_D3cold);
+
+	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+
+	intel_dmc_ucode_suspend(xe);
+}
+
+void xe_display_pm_suspend_late(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_power_domains_suspend(xe, I915_DRM_SUSPEND_MEM);
+
+	intel_display_power_suspend_late(xe);
+}
+
+void xe_display_pm_resume_early(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_display_power_resume_early(xe);
+
+	intel_power_domains_resume(xe);
+}
+
+void xe_display_pm_resume(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	intel_dmc_ucode_resume(xe);
+
+	if (xe->info.display.pipe_mask)
+		drm_mode_config_reset(&xe->drm);
+
+	intel_modeset_init_hw(xe);
+	intel_init_clock_gating(xe);
+	intel_hpd_init(xe);
+
+	/* MST sideband requires HPD interrupts enabled */
+	intel_dp_mst_resume(xe);
+	intel_display_resume(&xe->drm);
+
+	intel_hpd_poll_disable(xe);
+	if (xe->info.display.pipe_mask)
+		drm_kms_helper_poll_enable(&xe->drm);
+
+	intel_opregion_resume(xe);
+
+	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
+
+	intel_power_domains_enable(xe);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 11f98ccfaf4e..03117a7067dc 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -9,6 +9,8 @@
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include <drm/drm_drv.h>
 
+#include "xe_device.h"
+
 #include "display/intel_opregion.h"
 #include "display/ext/i915_irq.h"
 
@@ -36,6 +38,11 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
+void xe_display_pm_suspend(struct xe_device *xe);
+void xe_display_pm_suspend_late(struct xe_device *xe);
+void xe_display_pm_resume_early(struct xe_device *xe);
+void xe_display_pm_resume(struct xe_device *xe);
+
 #else
 static inline int
 xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
@@ -69,5 +76,10 @@ static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 static inline void xe_display_irq_reset(struct xe_device *xe) {};
 static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {};
 
+static inline void xe_display_pm_suspend(struct xe_device *xe) {};
+static inline void xe_display_pm_suspend_late(struct xe_device *xe) {};
+static inline void xe_display_pm_resume_early(struct xe_device *xe) {};
+static inline void xe_display_pm_resume(struct xe_device *xe) {};
+
 #endif /* CONFIG_DRM_XE_DISPLAY */
 #endif /* _XE_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4b3a1d8a8adf..44c38e670587 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -10,22 +10,13 @@
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
+#include "xe_display.h"
 #include "xe_pm.h"
 #include "xe_gt.h"
 #include "xe_ggtt.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
 
-#include <linux/fb.h>
-
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-#include "display/intel_display_types.h"
-#include "display/intel_dp.h"
-#include "display/intel_fbdev.h"
-#include "display/intel_hotplug.h"
-#include "display/ext/intel_pm.h"
-#endif
-
 /**
  * DOC: Xe Power Management
  *
@@ -46,106 +37,6 @@
  * and no wait boost. Frequency optimizations should come on a next stage.
  */
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-static void intel_suspend_encoders(struct xe_device *xe)
-{
-	struct drm_device *dev = &xe->drm;
-	struct intel_encoder *encoder;
-
-	if (!xe->info.enable_display || !xe->info.display.pipe_mask)
-		return;
-
-	drm_modeset_lock_all(dev);
-	for_each_intel_encoder(dev, encoder)
-		if (encoder->suspend)
-			encoder->suspend(encoder);
-	drm_modeset_unlock_all(dev);
-}
-#endif
-
-static void xe_pm_display_suspend(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (!xe->info.enable_display)
-		return;
-
-	/* We do a lot of poking in a lot of registers, make sure they work
-	 * properly. */
-	intel_power_domains_disable(xe);
-	if (xe->info.display.pipe_mask)
-		drm_kms_helper_poll_disable(&xe->drm);
-
-	intel_display_suspend(&xe->drm);
-
-	intel_dp_mst_suspend(xe);
-
-	intel_hpd_cancel_work(xe);
-
-	intel_suspend_encoders(xe);
-
-	intel_opregion_suspend(xe, PCI_D3cold);
-
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
-
-	intel_dmc_ucode_suspend(xe);
-#endif
-}
-
-static void xe_pm_display_suspend_late(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (!xe->info.enable_display)
-		return;
-
-	intel_power_domains_suspend(xe, I915_DRM_SUSPEND_MEM);
-
-	intel_display_power_suspend_late(xe);
-#endif
-}
-
-static void xe_pm_display_resume_early(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (!xe->info.enable_display)
-		return;
-
-	intel_display_power_resume_early(xe);
-
-	intel_power_domains_resume(xe);
-#endif
-}
-
-static void xe_pm_display_resume(struct xe_device *xe)
-{
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-	if (!xe->info.enable_display)
-		return;
-
-	intel_dmc_ucode_resume(xe);
-
-	if (xe->info.display.pipe_mask)
-		drm_mode_config_reset(&xe->drm);
-
-	intel_modeset_init_hw(xe);
-	intel_init_clock_gating(xe);
-	intel_hpd_init(xe);
-
-	/* MST sideband requires HPD interrupts enabled */
-	intel_dp_mst_resume(xe);
-	intel_display_resume(&xe->drm);
-
-	intel_hpd_poll_disable(xe);
-	if (xe->info.display.pipe_mask)
-		drm_kms_helper_poll_enable(&xe->drm);
-
-	intel_opregion_resume(xe);
-
-	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
-
-	intel_power_domains_enable(xe);
-#endif
-}
-
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -166,19 +57,19 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_pm_display_suspend(xe);
+	xe_display_pm_suspend(xe);
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err) {
-			xe_pm_display_resume(xe);
+			xe_display_pm_resume(xe);
 			return err;
 		}
 	}
 
 	xe_irq_suspend(xe);
 
-	xe_pm_display_suspend_late(xe);
+	xe_display_pm_suspend_late(xe);
 
 	return 0;
 }
@@ -201,7 +92,7 @@ int xe_pm_resume(struct xe_device *xe)
 			return err;
 	}
 
-	xe_pm_display_resume_early(xe);
+	xe_display_pm_resume_early(xe);
 
 	/*
 	 * This only restores pinned memory which is the memory required for the
@@ -213,7 +104,7 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	xe_pm_display_resume(xe);
+	xe_display_pm_resume(xe);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
-- 
2.39.1

