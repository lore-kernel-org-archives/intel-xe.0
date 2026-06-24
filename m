Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09561CDE005
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B4210EF6F;
	Wed, 24 Jun 2026 14:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bja0m9SR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1F110EF54;
 Wed, 24 Jun 2026 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782311842; x=1813847842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pUoXVzl5h68FyfNx7yOqHcbopaRBNg7oCe59DfAv4Wc=;
 b=bja0m9SRmT6A63O/whY8CbxRhqPcTAoP4wIQy5kP52tngc4o7h47HkIG
 JkD7F6sJCNXYGvTX0IhbV8w1sD9+xC3vPydwGG2yz4w8JLVxfxVp9Mo4h
 uiXXj7rPTJqv/4d1DYCrv+wN3nJt2FqzvhzatBXl0QmQjE6R4UBr/pLAc
 MMck+jkMUawopek7LswJULNiMP5Jl5YIemZFtd3BVJDBivVPHLXHQkI1l
 CA2VbPyYmWRAz/2pNj4b9ZSd1b3LCMXPHPgyU1qDg+OXFpYcwFGJpH+Ug
 mZJFKmx3v/PogbcVojOC88pB82eF2t6W5JWByp6eRAaEXZsXuhJgDqiFP A==;
X-CSE-ConnectionGUID: GRkW4CvvS7ajOR6PyisK0g==
X-CSE-MsgGUID: Qj3W3WVGRf+9uLZAzhrMgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86920317"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86920317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:22 -0700
X-CSE-ConnectionGUID: qsvOQwzDRRWkglB0QLqFiw==
X-CSE-MsgGUID: 2U8BNDMXQPuFVkDJUpJ12g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253799084"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:37:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 4/8] drm/i915: add intel_display_driver_pm_runtime*()
 functions
Date: Wed, 24 Jun 2026 17:36:51 +0300
Message-ID: <bec427c2922078f4cbacadd3ec2c5209d6157b7a.1782311749.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782311749.git.jani.nikula@intel.com>
References: <cover.1782311749.git.jani.nikula@intel.com>
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
intel_display_driver_pm_runtime_resume(). The IRQ suspend/resume is
meant to happen between the corresponding calls. For now,
intel_display_driver_pm_runtime_suspend() is empty, but is included for
completeness as a placeholder.

Initially, only migrate i915, as there are some differences with xe that
will be addressed later.

There's a functional change, which should be benign:
i915_pm_runtime_resume() moves intel_opregion_notify_adapter() call
slightly later.

In the interest of not introducing more severe functional changes, the
calls become slightly asymmetric. We might want to address this later.

v2:
- Rebase, move placement of suspend calls

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_display_driver.c   | 61 +++++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  5 ++
 drivers/gpu/drm/i915/i915_driver.c            | 52 +++-------------
 3 files changed, 74 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 462f78d5b020..0ea8a848a8e6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -868,3 +868,64 @@ void intel_display_driver_pm_resume(struct intel_display *display)
 
 	intel_display_power_enable(display);
 }
+
+/* before irq suspend */
+void intel_display_driver_pm_runtime_suspend(struct intel_display *display)
+{
+}
+
+/* after irq suspend */
+void intel_display_driver_pm_runtime_suspend_late(struct intel_display *display)
+{
+	intel_display_power_runtime_suspend(display);
+
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
+/* before irq resume */
+void intel_display_driver_pm_runtime_resume_early(struct intel_display *display)
+{
+	intel_opregion_notify_adapter(display, PCI_D0);
+
+	intel_display_power_runtime_resume(display);
+}
+
+/* after irq resume */
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
index 73616cb6ce7c..9ebafd339411 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1534,47 +1534,21 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_runtime_suspend(gt);
 
+	intel_display_driver_pm_runtime_suspend(display);
+
 	intel_irq_suspend(dev_priv);
 
 	for_each_gt(gt, dev_priv, i)
 		intel_uncore_suspend(gt->uncore);
 
-	intel_display_power_runtime_suspend(display);
-
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
-	if (!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv))
-		intel_hpd_poll_enable(display);
+	intel_display_driver_pm_runtime_suspend_late(display);
 
 	ret = vlv_suspend_complete(dev_priv);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Runtime suspend failed, disabling it (%d)\n", ret);
 
-		intel_opregion_notify_adapter(display, PCI_D0);
-
-		intel_display_power_runtime_resume(display);
+		intel_display_driver_pm_runtime_resume_early(display);
 
 		for_each_gt(gt, dev_priv, i)
 			intel_uncore_runtime_resume(gt->uncore);
@@ -1584,6 +1558,8 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 		for_each_gt(gt, dev_priv, i)
 			intel_gt_runtime_resume(gt);
 
+		intel_display_driver_pm_runtime_resume(display);
+
 		enable_rpm_wakeref_asserts(rpm);
 
 		return ret;
@@ -1629,8 +1605,6 @@ static int i915_pm_runtime_resume(struct device *kdev)
 	drm_WARN_ON_ONCE(&dev_priv->drm, atomic_read(&rpm->wakeref_count));
 	disable_rpm_wakeref_asserts(rpm);
 
-	intel_opregion_notify_adapter(display, PCI_D0);
-
 	root_pdev = pcie_find_root_port(pdev);
 	if (root_pdev)
 		pci_d3cold_enable(root_pdev);
@@ -1639,7 +1613,7 @@ static int i915_pm_runtime_resume(struct device *kdev)
 		drm_dbg(&dev_priv->drm,
 			"Unclaimed access during suspend, bios?\n");
 
-	intel_display_power_runtime_resume(display);
+	intel_display_driver_pm_runtime_resume_early(display);
 
 	ret = vlv_resume_prepare(dev_priv, true);
 
@@ -1657,17 +1631,7 @@ static int i915_pm_runtime_resume(struct device *kdev)
 
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

