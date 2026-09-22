Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA96C982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62110E71A;
	Tue, 22 Sep 2026 15:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwCUucBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84D110E71A;
 Tue, 22 Sep 2026 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790089326; x=1821625326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N8a0odyxma3+BSn/bgPB+JBF6i6hizqO5aEZqu+7Jrc=;
 b=EwCUucBsmnqhWpbnqUhYDttqZ1K6Kexj6OYuCG9m2gQETAe6zzK9N7U6
 L/gUd339t1RnEYQVGb36WoxxC9/1DjNUhFZQjMgSVw2TdtJFhhwNyiv9I
 zludwE6ESqpqAhsieESKlIKMXBfxsxUvS5TjTuE2RqxinwGGjdyHiM8Fz
 iHFBzbyNb67Ywwm4GKKTItozinaTTSWF9r747K+WoWcEJ/AdDm2w04iuN
 wNsgTr3+/pjsS/x/eldXPmHQ979NMUadipKn1aj3T2rFZ/sb4lz0J/5aF
 PPqJY+x5a38AE96I8VQ6jZ7rFsbo6lpei5DmCzYv2omX8kr54X+dQJJhT w==;
X-CSE-ConnectionGUID: IrSL/8RWR+uIJna3m8KW9g==
X-CSE-MsgGUID: vRhJjZYaTzimjDztRyJ1fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90817954"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90817954"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:01:15 -0700
X-CSE-ConnectionGUID: 2vfM7D9qQLqP/OHfCNfn6Q==
X-CSE-MsgGUID: UhJhh5F1TCSRa7kMDG6bQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="271741347"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:01:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH 4/4] drm/{i915,
 xe}: keep moving stuff to intel_display_driver_pm_resume()
Date: Tue, 22 Sep 2026 18:00:52 +0300
Message-ID: <7b4acb4fcec69c22fb2f8536bfa74754998a61ef.1790089118.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790089118.git.jani.nikula@intel.com>
References: <cover.1790089118.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The calls to intel_display_driver_pm_resume() are preceded with similar
calls. Move the calls inside intel_display_driver_pm_resume().

In i915 the calls are interspersed among other things, so this is a
functional change. Fingers crossed.

There's a slight functional change in that
intel_display_driver_pm_resume() returns early for
!HAS_DISPLAY(). Assume this is what we want, and there are no cases
where display engine is present but all pipes have been fused off.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 6 ++++++
 drivers/gpu/drm/i915/i915_driver.c                  | 8 --------
 drivers/gpu/drm/xe/display/xe_display.c             | 7 -------
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index d452506ecbc4..20d082042b24 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -846,6 +846,12 @@ void intel_display_driver_pm_resume(struct intel_display *display)
 	if (!HAS_DISPLAY(display))
 		return;
 
+	intel_dmc_resume(display);
+
+	drm_mode_config_reset(display->drm);
+
+	intel_display_driver_init_hw(display);
+
 	intel_display_driver_resume_access(display);
 
 	intel_hpd_init(display);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 293099fe6639..43f15e83e827 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -56,7 +56,6 @@
 #include "display/intel_display_device.h"
 #include "display/intel_display_driver.h"
 #include "display/intel_display_power.h"
-#include "display/intel_dmc.h"
 #include "display/intel_dp.h"
 #include "display/intel_dpt.h"
 #include "display/intel_fbdev.h"
@@ -1212,8 +1211,6 @@ static int i915_drm_resume(struct drm_device *dev)
 	/* Must be called after GGTT is resumed. */
 	intel_dpt_resume(display);
 
-	intel_dmc_resume(display);
-
 	i9xx_display_sr_restore(display);
 
 	intel_gmbus_reset(display);
@@ -1234,13 +1231,8 @@ static int i915_drm_resume(struct drm_device *dev)
 	 */
 	intel_irq_resume(dev_priv);
 
-	if (intel_display_device_present(display))
-		drm_mode_config_reset(dev);
-
 	i915_gem_resume(dev_priv);
 
-	intel_display_driver_init_hw(display);
-
 	intel_clock_gating_init(&dev_priv->drm);
 
 	intel_display_driver_pm_resume(display);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 1e37b1c29bb1..9426ab836096 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -279,13 +279,6 @@ void xe_display_pm_resume(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	intel_dmc_resume(display);
-
-	if (intel_display_device_present(display))
-		drm_mode_config_reset(&xe->drm);
-
-	intel_display_driver_init_hw(display);
-
 	intel_display_driver_pm_resume(display);
 }
 
-- 
2.47.3

