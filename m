Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF720C46CD4
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEF310E1B5;
	Thu, 28 Dec 2023 02:12:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD7B10E1B5
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729572; x=1735265572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FlnoGa63iqHr2tP6J+fc0bNlT7zSTCWTwkqQfRtiVBE=;
 b=NdJjW2XZaWbIW8JLP/znC3Ws4kwT2gPhDxpEIPk6PBANbW+jqpyYw37b
 mfYuUwzhSotFExa6swz5BE7tXnVfq9TA9a8nRV0UfLEfKS6QG3sLqM/Ns
 uNZpox5DCBNztzj3eSS0MQIz8FW529kL+v2JLAnreZBzkkM5H8y4rO6mF
 GNqUiNsFQag4+MNkKMDaCSZNizndBWcs6AY0BzlUCT+0R0+tDMMbJ+Jp9
 kNGS/USL+kgsdlTR4bxUzaTHGXD1lL4pZo0jUeEbS2yNPja/5q41lgMCo
 fptf2XDyCRdDWtk3CilNcgmpx+8CVsigaZLbnFt08YvC4ZGCzE/GVpZV0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482684572"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="482684572"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754611053"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754611053"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:12:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:12:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:12:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+SRC6JATJVlX4H/dmBYecXzf0/Vqkx5RqTsH/9ewOSPViL3g0XZBRszCQDm80+SQcJDMzutecsERNiRl1WpmSILx5b/9P1Cm3YmHxmJZyIUh1piXaSppk0Q/l44Oe0pZClsXYa4pStwBTcZUnJUAd7PYH+0OEWL8z5rPVP2mU9sqwz0INRQLoJo/93ehUNleiboQO7Vb25alDJkLj8IcyIAnrFMUFAjMc1xZVVhCGWc2MvSy1QfbXGhdCD/NpihyGMj/f/MgbC/nX8c2ptYnQrr7z/vypJU5ryPkLOy3BJALYUtZHyFcytU00SNLwxhzZTh0R2M5RrTVRbdxu/2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5KFleBizMVu+Xm/5QQKlNTQuP7MiW8BZ2c+R84j75o=;
 b=Kjj7L7gkWcy2YKT5U+png38Bo05u36gLQiKDiHGsZPUUI3rAOxbEfGrIZpTCUkwCJtB8ukmOJjwMTqgusbF1iiMZY1eZMLAVryFjcXyePR4jZCCFnTkpNqMxgPpyWO0sP3e78cGh5yaeNYymxa4C5ze14iAh14tIRIiE6REYiO6+XQg4E9Z8Py3SKpKQPVVka06dGpFDSSE9fm23x4fdQyPdFJbyVfoeigT5qnFVj9l8FChKMzwYV8l1nF1RSxt+L/v8j+CbbtbSZLEA1ddPbcGT0AtZLO6CBzOXsuUWDDd3bXcGKl+FKaedxmSsQ8/rFt4vw3D6S3Y1uXUY2Hyv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Thu, 28 Dec
 2023 02:12:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:12:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 03/20] drm/xe: Create a xe_pm_runtime_resume_and_get variant for
 display
Date: Wed, 27 Dec 2023 21:12:15 -0500
Message-ID: <20231228021232.2366249-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: 2885d8f9-a7bd-4f61-b0da-08dc074a7d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +VE0PZEL7LohCTRoPVz74xCZYwe9LBcKVUR5q27DzKkjoEe+Bwj8QNapXLSvHdBlyRsvoWpNdf8/jxAQDPji2ZsHgYciG4w1AAeVMXflvJkbd+Q/P/y/CkyWOj/v8VSA9lsycXacxh5o8zeVfxWyUjNMveXh4pdlGp1k71F6FRTIYPMU+IfZmwOLAgyby+6d4nuOenqyRjv0GKin7FmPXKe9f4Vd+eHNgKwZQTY0hpPGq9OTTcR8rPfGkZ4L2ZIOMTwWiEtNhUAKy286R+602o9LpLsSHQTu5urIyAIG/D2qJ62adsOGiSnvyMPi9usBbm8zvpE56QpcTYKoqcjw6JzehnPWDtvxme1nloPHRGoAUFCsAzeyStcZb+KXBqXcLcteRnw6rjSM3IyGfUT2QVMPPsQ74Di87eBH81gK8timWaUhAOjhrBKcUgyW1IyvWx2escg43zXq2YK9fWBPJfrPKZnrzTEU1sKI5dOA9JpYe64vLx+uaSxDDl8OnwX7inZvIDfOp3RnZFTBSSL+7vfh2q7S7IK1aiZx/bFAAnn/uKo/sIlPa5oEIJw392ZQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(107886003)(2616005)(26005)(1076003)(6666004)(6512007)(6506007)(83380400001)(6916009)(478600001)(4326008)(5660300002)(8936002)(8676002)(44832011)(6486002)(66556008)(66946007)(316002)(66476007)(38100700002)(82960400001)(86362001)(41300700001)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zoYv0oB0Y8drHr+B35uFXj0UMsTSWixZvuDZMke5NIS6MEdR4VWbdwAvPS/h?=
 =?us-ascii?Q?/JH4gpj54RAox+fmIHhgcsZNcncyTQU54reIcJaES3ofiFAAiSQkxXNpXMHC?=
 =?us-ascii?Q?ZjnCZy9cLGSj6mRe1gYboE1yGSIoSRpMGhE927IQvsroW0L3IKTEDBjOgwJp?=
 =?us-ascii?Q?rxRwFR17tZbJ8oQNMVM7yjE/94kA7mpwIvKYFM2rh/aQ5Ci/tRrnFmX7AkCZ?=
 =?us-ascii?Q?Kc+Z4RvG720W5bOkEl4Yiipx5Aj6VosDZuiJ/KGSCPnwUwL5hN/gRMjqSqz0?=
 =?us-ascii?Q?b7fpLmCm+mWhweqQgw3efmMOwlCCcHA3DfsZRmXnWASHh/B3QY8Wd+cFaJ/J?=
 =?us-ascii?Q?woifKAmE4mJLLEyeZe3KzE6xmhkPn19WTjz7pIbq0lGtmpbt+G4+zMV7jaQO?=
 =?us-ascii?Q?U7QtOy7ZShsyXWD1x7ViDTM10DffdFczB5oXP4uieOfqf4fFs+N88Yj59kZ0?=
 =?us-ascii?Q?8avkJCHWpzzCLndnwpX/TVHnXZLuv84avMnDdEFlZmN2eh9HT6+u5/HZVFcF?=
 =?us-ascii?Q?M2D7jbGvpWfIcEkwKzDn8xNfvKsSSj6VfeSeeFu9l3OApbkY38wyeo8L/R9R?=
 =?us-ascii?Q?2NjxEDekZkF3Vzi5zywLwKBysVWdRfkrEJkyH178AQaOGO0xjTNrB2+XBhYT?=
 =?us-ascii?Q?49tyXhCUbFnjHjfhM9eU0feErFBfW4aEXMztz/IdpNCNXlSDEkLqLBviJcGK?=
 =?us-ascii?Q?I854Xo6DtWzWRAQPDt5vBuP2OYMQngTCBq9cohfKFpqMQSj9p7V2Wb3hCbhf?=
 =?us-ascii?Q?Lo4o7roPI4u46ahbg9iTPfO66x6F2H1wEOkU2kALdAkzWqzGBOYWfK5VJrEP?=
 =?us-ascii?Q?8EYqKp3CQNkeMFaAj/nWvXozjOhkbplUHlCIQcI6J2Ba9ASMhGzfLkKzkQjD?=
 =?us-ascii?Q?Suw4UjVTELGWBpAh0lSY6sEnwsamxl6yexBktdthjyEwABkVJsiOOnh7f/iC?=
 =?us-ascii?Q?6yXwdhHUCySSBNPmpB5jkctD+CBQ8Fw2yUZXBBPWn6ULsj4s97Ilewc3A3D3?=
 =?us-ascii?Q?nZdDkU6ALjTKR4jEg+xYO0vKa5R6HvPSgsz7XL2ZoTHgBgbww8AOXfq+23Ww?=
 =?us-ascii?Q?AGmo54gDX/ri+2y3yckJZ7jyTi4BlSsyvcL5V6sLHYgyNObiTg2mYJV3of2b?=
 =?us-ascii?Q?l/qFx38Ght78q5kFQW4vDMV0a70Luz3Tq9JZ8iX5151EAphnFNAsLwckUxrB?=
 =?us-ascii?Q?Qlh6NEpR67WcMdRXp/oD5pjjlsDktaZEepefrYRHBowHV5lKZcjio3FzJVWK?=
 =?us-ascii?Q?Sqg+susrTAtJ2a/MxE0ERT1VK4feld0GfKwziUT2bE2QhcpCYTMb6BB+jJqs?=
 =?us-ascii?Q?cu9rFaS/7FOlw/R4Me5FT/vhzXGGWyDfx/H+jHuXzTcEoMX2R4fTidXkbTgp?=
 =?us-ascii?Q?c7TSv0dQr7D2Umnq7Wb5emCXwJqvF3TuLilqp5OehTm3umhyOJsjtLiL7Kcq?=
 =?us-ascii?Q?KKR8ICuQN02sri7aSSk92QLs5sRn66hXvz4i29mrX/adzpi23VqFulpVABe+?=
 =?us-ascii?Q?ff8fsWdqe8YqgtExhiGCspURrNnO6iKDsUjOa9NfigUax164dtTHouNC+9+R?=
 =?us-ascii?Q?94kJMPHTteZRG7zfF+B9XFwkOD5SvwyyFh+5FFjZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2885d8f9-a7bd-4f61-b0da-08dc074a7d52
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:12:49.2983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiQ6RxpcXkW4TxYAP+Ywaep3WbwvNZfmVxCxtlAQZWX1ur839g5OnhQh1KL5ek58ezekd8t8wr4f/rAHFcibog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Introduce the resume and get to fulfill the display need for checking
if the device was actually resumed (or it is awake) and the reference
was taken.

Then we can convert the remaining cases to a void function and have
individual functions for individual cases.

Also, already start this new function protected from the runtime
recursion, since runtime_pm will need to call for display functions
for a proper D3Cold flow.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  6 +-----
 drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                      |  1 +
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index f0464dfc45cf5..c0ec888b67271 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -166,11 +166,7 @@ static inline bool intel_runtime_pm_get(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
 
-	if (xe_pm_runtime_get(xe) < 0) {
-		xe_pm_runtime_put(xe);
-		return false;
-	}
-	return true;
+	return xe_pm_runtime_resume_and_get(xe);
 }
 
 static inline bool intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5a4d601ab0976..32db9068ac169 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -417,6 +417,23 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
         return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;
 }
 
+/**
+ * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
+ * @xe: xe device instance
+ *
+ * Returns: True if device is awake and the the reference was taken, false otherwise.
+ */
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) == current) {
+		/* The device is awake, grab the ref and move on */
+                pm_runtime_get_noresume(xe->drm.dev);
+		return true;
+	}
+
+        return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
+}
+
 /**
  * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 13eebd604dd96..b812281635673 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -28,6 +28,7 @@ int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
-- 
2.43.0

