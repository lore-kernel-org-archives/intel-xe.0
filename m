Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6980BCD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 12:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D9310E3E8;
	Mon, 15 Jun 2026 12:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuVTFaTN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C34510E3E9;
 Mon, 15 Jun 2026 12:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781527259; x=1813063259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3wOHlKwS2boSROcsuKek700uPOe5ruCE0wdtnLzj5E=;
 b=IuVTFaTNh5vfxFhxtKfJZZQEX4c7ZwodBauJPFQQMbV4c7qIxKldl0sz
 e8mMsxysJK1Idi+EL8nhrK3CH2edA4rGoXOwbvWe+7BEQZkf0pdr1gntM
 tnaV5Of61DGyVH7eSf/8+cTnVq8ZG96lWtMkb9uHvUFnRPkTp2+Gvt8Cl
 NbQovESISu7oMsw6Tg0oMx9UUR9w33AGJkxPdgK4pm91TYlMwFQLPcxhV
 RPupdXWBXlwmxh8MsimFQMR874uJUeO8VehcVDN/mJQKelHY1Xi7W1rr/
 TYyamo30Em73XDGY3NuqxVKCqO9Qt2ewmsC9kPtheIPd9O4YjzXE8kkiv Q==;
X-CSE-ConnectionGUID: wvvaytLmRlWI8yWHIQ6fbw==
X-CSE-MsgGUID: 7KfCKGDpSSyqYh+4vKThpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="104935003"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="104935003"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:40:59 -0700
X-CSE-ConnectionGUID: 6AsB9kx/TrmpCjIZl0mJhA==
X-CSE-MsgGUID: dvsG+eO5QSGBfVKlf4N7iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246349790"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:40:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 1/4] drm/i915: add intel_display_driver_pm_runtime*() functions
Date: Mon, 15 Jun 2026 15:40:45 +0300
Message-ID: <d8c061c8ab5e3f02cbd732ef3fc58a87d2c113d9.1781527161.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781527161.git.jani.nikula@intel.com>
References: <cover.1781527161.git.jani.nikula@intel.com>
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

Add new functions intel_display_driver_pm_runtime_suspend(),
intel_display_driver_pm_runtime_suspend_late(),
intel_display_driver_pm_runtime_resume_early(), and
intel_display_driver_pm_runtime_resume(). Initially, only migrate i915,
as there are some differences with xe that will be addressed later.

There are a few functional changes, which should be benign:

- i915_pm_runtime_suspend() moves assert_forcewakes_inactive() call
  before opregion calls.

- i915_pm_runtime_resume() moves intel_opregion_notify_adapter() call
  slightly later.

In the interest of not introducing more severe functional changes, the
calls become slightly asymmetric. We might want to address this later.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_driver.c   | 56 +++++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  5 ++
 drivers/gpu/drm/i915/i915_driver.c            | 44 ++-------------
 3 files changed, 65 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 462f78d5b020..67f416070fe0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -868,3 +868,59 @@ void intel_display_driver_pm_resume(struct intel_display *display)
 
 	intel_display_power_enable(display);
 }
+
+void intel_display_driver_pm_runtime_suspend(struct intel_display *display)
+{
+	intel_display_power_runtime_suspend(display);
+}
+
+void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display)
+{
+	/*
+	 * FIXME: We really should find a document that references the arguments
+	 * used below!
+	 */
+	if (display->platform.broadwell) {
+		/*
+		 * On Broadwell, if we use PCI_D1 the PCH DDI ports will stop
+		 * being detected, and the call we do at i915_pm_runtime_resume()
+		 * won't be able to restore them. Since PCI_D3hot matches the
+		 * actual specification and appears to be working, use it.
+		 */
+		intel_opregion_notify_adapter(display, PCI_D3hot);
+	} else {
+		/*
+		 * current versions of firmware which depend on this opregion
+		 * notification have repurposed the D1 definition to mean
+		 * "runtime suspended" vs. what you would normally expect (D3)
+		 * to distinguish it from notifications that might be sent via
+		 * the suspend path.
+		 */
+		intel_opregion_notify_adapter(display, PCI_D1);
+	}
+
+	if (!display->platform.valleyview && !display->platform.cherryview)
+		intel_hpd_poll_enable(display);
+}
+
+void intel_display_driver_pm_runtime_resume_early(struct intel_display *display)
+{
+	intel_opregion_notify_adapter(display, PCI_D0);
+
+	intel_display_power_runtime_resume(display);
+}
+
+void intel_display_driver_pm_runtime_resume(struct intel_display *display)
+{
+	/*
+	 * On VLV/CHV display interrupts are part of the display
+	 * power well, so hpd is reinitialized from there. For
+	 * everyone else do it here.
+	 */
+	if (!display->platform.valleyview && !display->platform.cherryview) {
+		intel_hpd_init(display);
+		intel_hpd_poll_disable(display);
+	}
+
+	skl_watermark_ipc_update(display);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 7eca3d17dd82..1b494337d629 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -43,5 +43,10 @@ void intel_display_driver_suspend_access(struct intel_display *display);
 void intel_display_driver_resume_access(struct intel_display *display);
 bool intel_display_driver_check_access(struct intel_display *display);
 
+void intel_display_driver_pm_runtime_suspend(struct intel_display *display);
+void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display);
+void intel_display_driver_pm_runtime_resume_early(struct intel_display *display);
+void intel_display_driver_pm_runtime_resume(struct intel_display *display);
+
 #endif /* __INTEL_DISPLAY_DRIVER_H__ */
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 0520cd124686..01aaa66e7cab 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1539,7 +1539,7 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 	for_each_gt(gt, dev_priv, i)
 		intel_uncore_suspend(gt->uncore);
 
-	intel_display_power_runtime_suspend(display);
+	intel_display_driver_pm_runtime_suspend(display);
 
 	ret = vlv_suspend_complete(dev_priv);
 	if (ret) {
@@ -1573,33 +1573,9 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 	if (root_pdev)
 		pci_d3cold_disable(root_pdev);
 
-	/*
-	 * FIXME: We really should find a document that references the arguments
-	 * used below!
-	 */
-	if (IS_BROADWELL(dev_priv)) {
-		/*
-		 * On Broadwell, if we use PCI_D1 the PCH DDI ports will stop
-		 * being detected, and the call we do at i915_pm_runtime_resume()
-		 * won't be able to restore them. Since PCI_D3hot matches the
-		 * actual specification and appears to be working, use it.
-		 */
-		intel_opregion_notify_adapter(display, PCI_D3hot);
-	} else {
-		/*
-		 * current versions of firmware which depend on this opregion
-		 * notification have repurposed the D1 definition to mean
-		 * "runtime suspended" vs. what you would normally expect (D3)
-		 * to distinguish it from notifications that might be sent via
-		 * the suspend path.
-		 */
-		intel_opregion_notify_adapter(display, PCI_D1);
-	}
-
 	assert_forcewakes_inactive(&dev_priv->uncore);
 
-	if (!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv))
-		intel_hpd_poll_enable(display);
+	intel_display_driver_pm_runtime_suspend_late(display);
 
 	drm_dbg(&dev_priv->drm, "Device suspended\n");
 	return 0;
@@ -1623,8 +1599,6 @@ static int i915_pm_runtime_resume(struct device *kdev)
 	drm_WARN_ON_ONCE(&dev_priv->drm, atomic_read(&rpm->wakeref_count));
 	disable_rpm_wakeref_asserts(rpm);
 
-	intel_opregion_notify_adapter(display, PCI_D0);
-
 	root_pdev = pcie_find_root_port(pdev);
 	if (root_pdev)
 		pci_d3cold_enable(root_pdev);
@@ -1633,7 +1607,7 @@ static int i915_pm_runtime_resume(struct device *kdev)
 		drm_dbg(&dev_priv->drm,
 			"Unclaimed access during suspend, bios?\n");
 
-	intel_display_power_runtime_resume(display);
+	intel_display_driver_pm_runtime_resume_early(display);
 
 	ret = vlv_resume_prepare(dev_priv, true);
 
@@ -1651,17 +1625,7 @@ static int i915_pm_runtime_resume(struct device *kdev)
 
 	intel_pxp_runtime_resume(dev_priv->pxp);
 
-	/*
-	 * On VLV/CHV display interrupts are part of the display
-	 * power well, so hpd is reinitialized from there. For
-	 * everyone else do it here.
-	 */
-	if (!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv)) {
-		intel_hpd_init(display);
-		intel_hpd_poll_disable(display);
-	}
-
-	skl_watermark_ipc_update(display);
+	intel_display_driver_pm_runtime_resume(display);
 
 	enable_rpm_wakeref_asserts(rpm);
 
-- 
2.47.3

