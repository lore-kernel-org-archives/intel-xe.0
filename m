Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8C6C5DF66
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 22:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D29B10E341;
	Sun, 16 Aug 2026 22:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlPwYv01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A81110E37C;
 Sun, 16 Aug 2026 22:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786920038; x=1818456038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QrkVCV9zWBoaxcs51WNjopKo2asolU459DOer6D3cW8=;
 b=MlPwYv01dhkw/jjdVv6Tk4l2GtC2J5XL8UvYw8po40vKd5yDLQmh7qjb
 plnzP8ooXGFg49ZC00jI66m1D5NtpfjhmuU82ARvT3NviByIt0i24PxLw
 BH6uuwA37MzhlDrJdFr5hnJPHS4cHmk7vi95OvoFPMouXln0GQ/WrlAbi
 pdAmve4a74JcX1I0S05nakSaD5si35Yr972abaEuHZ6v5DRl2ca7aM1DC
 imqNHFVBNMEC5vl8rxULL/T9VGb94DX1BtPPnr770fVabeHpzBdccl2yF
 MZG2+4Kf6ola75EPIaV/PUmhnpyADZiHgklr26kqvguLAf0G0b9Klk0ol g==;
X-CSE-ConnectionGUID: BGqhYkr4R22LaemSz5woIw==
X-CSE-MsgGUID: 4RIwWmWGTFCAJXl0rJtOUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98761697"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="98761697"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:37 -0700
X-CSE-ConnectionGUID: Ylz+gvPqQ4WBwo6HVJcN/Q==
X-CSE-MsgGUID: 51E7xL0VQwmd0PCoUTRd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="269948387"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.249.236])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:35 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	imre.deak@intel.com
Subject: [RFC PATCH 5/5] drm/i915/display: skip HPD polling if PME is supported
Date: Mon, 17 Aug 2026 01:40:04 +0300
Message-ID: <20260816224005.886035-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816224005.886035-1-vinod.govindapillai@intel.com>
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
Content-Transfer-Encoding: 8bit
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

A display hotplug can generate a PM_PME which in turn will
trigger pm_runtime_resume call on a device. So we don't need
to resort to HPD polling on pm_runtime_suspend calls. But on
pm_runtime_resume call we would need to still resort to the
intel_hpd_poll_disable() as the i915_hpd_poll_detect_connectors()
catches the hotplugs that occurred during suspend.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 .../drm/i915/display/intel_display_driver.c   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 70d112fd4287..b7e25b7ea32e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -34,6 +34,7 @@
 #include "intel_display_driver.h"
 #include "intel_display_irq.h"
 #include "intel_display_power.h"
+#include "intel_display_rpm.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
 #include "intel_display_wa.h"
@@ -931,6 +932,10 @@ void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display)
 		intel_opregion_notify_adapter(display, PCI_D1);
 	}
 
+	/* No need of HPD polling if the device is PME capable */
+	if (intel_display_rpm_pme_capable(display))
+		return;
+
 	if (!display->platform.valleyview && !display->platform.cherryview)
 		intel_hpd_poll_enable(display);
 }
@@ -951,10 +956,20 @@ void intel_display_driver_pm_runtime_resume(struct intel_display *display)
 	 * power well, so hpd is reinitialized from there. For
 	 * everyone else do it here.
 	 */
-	if (!display->platform.valleyview && !display->platform.cherryview) {
+	if (display->platform.valleyview || display->platform.cherryview)
+		goto out;
+
+	/* For PME capable devices we would not have resorted into HPD polling */
+	if (intel_hpd_polling_enabled(display))
 		intel_hpd_init(display);
-		intel_hpd_poll_disable(display);
-	}
 
+	/*
+	 * Regardless of PME capable path, call the HPD polling disable, the
+	 * poll_init_work, i915_hpd_poll_detect_connectors reprobe catches the
+	 * hotplug that occurred while suspended
+	 */
+	intel_hpd_poll_disable(display);
+
+out:
 	skl_watermark_ipc_update(display);
 }
-- 
2.43.0

