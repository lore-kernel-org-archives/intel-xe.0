Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC37CE92FFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F49910E0B5;
	Fri,  6 Oct 2023 10:38:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ED410E0B5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696588697; x=1728124697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8UXSsSOqHl5DH4yRo3ipSxZu8YDC6yEbZcpJkFFEcjU=;
 b=K7zddWlArVCsLa3jc+q9hSammrGO1royzeJtlVQ9zz8Nd78W+TaBOeVL
 58uS0Q1T9GrHK3MYtavcmmqgnH0Zceqfg3e5cYdDkSVAvWik+7aRqRtyj
 KQ7V8f5mIjCjEVEjTlYz23iHEuUmYLk92KAVeNFc5mEvX0hGqqEIqWgIG
 z7jqgerWzP5RuT9GUbSWg2XTQ5WuGEPhGh/RZNwuziNtAEGb72TCcBgjc
 i94L7xgMsqp4Q2QqMJHAQI1K91P7fzBrIYwrOdqzvIUITtgKca5xKSf42
 nPrPIEF9JKJfBqptnyir9zoAYmNAltqHu4cd9DEuoVT90L6ry7QhqjcSg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2329024"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2329024"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755812856"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755812856"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.239])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:37:57 +0300
Message-Id: <2f66428501322e7e12eb62be3cc0f0727530d409.1696588392.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696588392.git.jani.nikula@intel.com>
References: <cover.1696588392.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/6] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We have an abstraction for "has display", and it's
HAS_DISPLAY(). Unfortunately, it requires access to
DISPLAY_RUNTIME_INFO(), so include compat-i915-headers/i915_drv.h too,
although it's a bit meh.

v2: define local has_display() to make this a bit cleaner

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 07898e0e175e..68729997e1fe 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -15,6 +15,7 @@
 #include <drm/xe_drm.h>
 
 #include "soc/intel_dram.h"
+#include "i915_drv.h"		/* FIXME: HAS_DISPLAY() depends on this */
 #include "intel_acpi.h"
 #include "intel_audio.h"
 #include "intel_bw.h"
@@ -32,6 +33,11 @@
 
 /* Xe device functions */
 
+static bool has_display(struct xe_device *xe)
+{
+	return HAS_DISPLAY(xe);
+}
+
 /**
  * xe_display_driver_probe_defer - Detect if we need to wait for other drivers
  *				   early on
@@ -316,7 +322,7 @@ static void intel_suspend_encoders(struct xe_device *xe)
 	struct drm_device *dev = &xe->drm;
 	struct intel_encoder *encoder;
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		return;
 
 	drm_modeset_lock_all(dev);
@@ -346,7 +352,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		drm_kms_helper_poll_disable(&xe->drm);
 
 	intel_display_driver_suspend(xe);
@@ -392,7 +398,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	intel_dmc_resume(xe);
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		drm_mode_config_reset(&xe->drm);
 
 	intel_display_driver_init_hw(xe);
@@ -403,7 +409,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_display_driver_resume(xe);
 
 	intel_hpd_poll_disable(xe);
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		drm_kms_helper_poll_enable(&xe->drm);
 
 	intel_opregion_resume(xe);
@@ -424,7 +430,7 @@ void xe_display_probe(struct xe_device *xe)
 
 	intel_display_device_probe(xe);
 
-	if (xe->info.display_runtime.pipe_mask)
+	if (has_display(xe))
 		return;
 
 no_display:
-- 
2.39.2

