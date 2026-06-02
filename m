Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D591CD6E4A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 08:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2036113930;
	Tue,  2 Jun 2026 08:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VstjUcjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC009113940;
 Tue,  2 Jun 2026 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780389215; x=1811925215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6G/AfSqIukvlsAwJCKnDidSmS3/qmLo+GIUY7lP7dls=;
 b=VstjUcjh5+m6wTtwC8mfOoz9cNHbluDRBluq0YSjzr1sNszte1JpJJid
 RVeIJzyCMIgWNyf/kxwPDUuiTImhKxv4XL3GyJBReE9o6rtoOw73Gcqfg
 fAYHVsXpDIF07vrPH7yhtSTUWhxpq2qepuaopubOivJpZu4y9aAc41tfb
 ztWx+ddBneIHaOCYexRvaj4/XdWBRJk5ZObqfXwSXT732/QVosivAmZ+x
 m1ePnG01CwtuHAIg19O3FjLMPpOaaAI2hYfXybrHlqrDY8V39tIYF7nG+
 eiQL0N29zcET0kKeyZeyjXg2LbOe6dhT553gtJXjfwzCma3VzvqsyC4ss A==;
X-CSE-ConnectionGUID: Vx2+VLfaQlqiakfnFK+Gog==
X-CSE-MsgGUID: EWy8nipjSQ+iFPpLY1S3fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="103830274"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="103830274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:33:34 -0700
X-CSE-ConnectionGUID: Dc8oumrTTQmHor+iHDtuSQ==
X-CSE-MsgGUID: pH67TK3dQAu5N0Z4uzYGgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="267484387"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.253])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:33:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, imre.deak@intel.com, jani.nikula@intel.com
Subject: [CI 08/12] drm/{i915,xe}: add intel_display_driver_shutdown_late()
Date: Tue,  2 Jun 2026 11:32:48 +0300
Message-ID: <d200966191a3845e6b9586d20884e285670734d1.1780389001.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780389001.git.jani.nikula@intel.com>
References: <cover.1780389001.git.jani.nikula@intel.com>
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

Add new function intel_display_driver_shutdown_late() to be called
"later" in the struct pci_driver .shutdown hook.

There's a slight functional change in that
intel_display_driver_shutdown_late() returns early for
!HAS_DISPLAY(). Assume this is what we want, and there are no cases
where display engine is present but all pipes have been fused off.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display_driver.h |  1 +
 drivers/gpu/drm/i915/i915_driver.c                  |  7 ++-----
 drivers/gpu/drm/xe/display/xe_display.c             |  7 +------
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 77fa4497b442..0326a292ee1e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -675,6 +675,19 @@ void intel_display_driver_unregister(struct intel_display *display)
 	intel_vga_unregister(display);
 }
 
+void intel_display_driver_shutdown_late(struct intel_display *display)
+{
+	if (!HAS_DISPLAY(display))
+		return;
+
+	/*
+	 * The only requirement is to reboot with display DC states disabled,
+	 * for now leaving all display power wells in the INIT power domain
+	 * enabled.
+	 */
+	intel_display_power_driver_remove(display);
+}
+
 /*
  * turn all crtc's off, but do not adjust state
  * This has to be paired with a call to intel_modeset_setup_hw_state.
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index adfde02465ea..61515577758b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -24,6 +24,7 @@ void intel_display_driver_remove(struct intel_display *display);
 void intel_display_driver_remove_noirq(struct intel_display *display);
 void intel_display_driver_remove_nogem(struct intel_display *display);
 void intel_display_driver_unregister(struct intel_display *display);
+void intel_display_driver_shutdown_late(struct intel_display *display);
 
 int intel_display_driver_pm_suspend(struct intel_display *display);
 void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2idle);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 6fd3e8b155b1..99fa42561989 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1075,17 +1075,14 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
 	i915_gem_suspend(i915);
 
 	/*
-	 * The only requirement is to reboot with display DC states disabled,
-	 * for now leaving all display power wells in the INIT power domain
-	 * enabled.
-	 *
 	 * TODO:
 	 * - unify the pci_driver::shutdown sequence here with the
 	 *   pci_driver.driver.pm.poweroff,poweroff_late sequence.
 	 * - unify the driver remove and system/runtime suspend sequences with
 	 *   the above unified shutdown/poweroff sequence.
 	 */
-	intel_display_power_driver_remove(display);
+
+	intel_display_driver_shutdown_late(display);
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
 
 	intel_runtime_pm_driver_last_release(&i915->runtime_pm);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index bbd4f527d5e3..28bcfaacc240 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -221,12 +221,7 @@ void xe_display_shutdown_late(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	/*
-	 * The only requirement is to reboot with display DC states disabled,
-	 * for now leaving all display power wells in the INIT power domain
-	 * enabled.
-	 */
-	intel_display_power_driver_remove(display);
+	intel_display_driver_shutdown_late(display);
 }
 
 /* IRQ-related functions */
-- 
2.47.3

