Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23DFE75433
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 08:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F70110E263;
	Tue,  3 Oct 2023 08:58:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDC510E263
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696323525; x=1727859525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jzayr6k2JmfZhvL26c9xO0VZKM1/j+JZ/HlErDq8244=;
 b=J2MQkIdNAPcgi+mwMAHdeTaN2evZkI8FT8rcVhaK0SSvsdfsQsTeLQyL
 3UkUB9LyULVwSdwl/JjeNd1OkXBMGvBV4FUiQCSM7vUpF5i/CaOECvduk
 LGz992cVj1TmWjMwBXdKj7gPeuj8Y6DqUnNBjGP+FjN8B9+QPnHZj/oyD
 cYiQ26l0Q5ldyrRyOdp2PxF0FPT7TM5qBRrYS65y+9HcwnXqcKtizVXok
 xaLR6MyNUlc0FGmXgG66n5lluvb1/l6P6eBam5WOP1ilN6KwSTLXvCAbp
 aUWMFxGZpNOBRMBpE5pgoBAc8JRctbJPKMWYHdiiwNn99ktrBtuBLfYMA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="469100738"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="469100738"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="924573861"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="924573861"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:58:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 11:58:37 +0300
Message-Id: <20231003085839.2008415-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We have an abstraction for "has display", and it's
HAS_DISPLAY(). Unfortunately, it requires access to
DISPLAY_RUNTIME_INFO(), so include compat-i915-headers/i915_drv.h too,
although it's a bit meh.

Looking at this makes me think there's a bunch of confusion in:

- the pipe_mask or now HAS_DISPLAY() checks
- the global enable_display checks
- the xe->info.enable_display checks
- redefinition of INTEL_DISPLAY_ENABLED()

I really don't understand this, but it all looks very suspicious. This
change leaves all that in place, unmodified.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 07898e0e175e..c783573585d7 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -15,6 +15,7 @@
 #include <drm/xe_drm.h>
 
 #include "soc/intel_dram.h"
+#include "i915_drv.h"
 #include "intel_acpi.h"
 #include "intel_audio.h"
 #include "intel_bw.h"
@@ -316,7 +317,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
 	struct drm_device *dev = &xe->drm;
 	struct intel_encoder *encoder;
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (HAS_DISPLAY(xe))
 		return;
 
 	drm_modeset_lock_all(dev);
@@ -346,7 +347,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
-	if (xe->info.display_runtime.pipe_mask)
+	if (HAS_DISPLAY(xe))
 		drm_kms_helper_poll_disable(&xe->drm);
 
 	intel_display_driver_suspend(xe);
@@ -392,7 +393,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	intel_dmc_resume(xe);
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (HAS_DISPLAY(xe))
 		drm_mode_config_reset(&xe->drm);
 
 	intel_display_driver_init_hw(xe);
@@ -403,7 +404,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
-	if (xe->info.display_runtime.pipe_mask)
+	if (HAS_DISPLAY(xe))
 		drm_kms_helper_poll_enable(&xe->drm);
 
 	intel_opregion_resume(xe);
@@ -424,7 +425,7 @@ void xe_display_probe(struct xe_device *xe)
 
 	intel_display_device_probe(xe);
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (HAS_DISPLAY(xe))
 		return;
 
 no_display:
-- 
2.39.2

