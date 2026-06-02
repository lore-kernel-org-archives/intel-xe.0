Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBCFC5DF71
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 08:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D948113932;
	Tue,  2 Jun 2026 08:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrEMYNdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAA3113930;
 Tue,  2 Jun 2026 08:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780389210; x=1811925210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kpPSIW+pElm88PtxQC1DW4wLymWR6LdFOH7xu1chTIU=;
 b=HrEMYNdRr55ZY/G5+WQy0I6CRtjxfOZl7IJEdJvrgIJKmbXSvOyhhK2R
 Vd6JgjO/RZEkmRFmQBmczg0xIuloqsy7f59uhM/UrmDJeVGtNIp6pIC5e
 ma6q6LsRDZ2G9WC/yVWulxR1FxIi+3fBQMFMmQyDFiNnaaLBJTwJ6lRlR
 yyw5LBMQerqbo0LA52Md1rgg+hAWUHHc/50PjXHlWu1IC8900sOU7KdPR
 Do70h6X+j97o8KISEEDQE2QM79RevKH2vZEJPZAODC95aMDcMM+gjO/t7
 MbmlJnjWOGCXe6SJkY33f0Atb5PB2XiXG8dymZ407snJceoNBAc2/vTSn w==;
X-CSE-ConnectionGUID: U/u//Y9gSYGCwL1ycmdPWg==
X-CSE-MsgGUID: vLSeF30IT4Or/zDxhA0/Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="85056652"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="85056652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:33:30 -0700
X-CSE-ConnectionGUID: oY0QocGTRS66mlBOEJ5bPg==
X-CSE-MsgGUID: OALa+eGTQYajLYEgdL5s9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="281953291"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.253])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:33:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, imre.deak@intel.com, jani.nikula@intel.com
Subject: [CI 07/12] drm/{i915, xe}: add intel_display_driver_pm_{suspend_late,
 resume_early}()
Date: Tue,  2 Jun 2026 11:32:47 +0300
Message-ID: <a429a0ea7ac8e97a98c26ffe5be5db934267ec8d.1780389001.git.jani.nikula@intel.com>
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

Add new functions intel_display_driver_pm_suspend_late() and
intel_display_driver_pm_resume_early(), to be called from the
corresponding struct dev_pm_ops hooks.

There's a slight functional change for !HAS_DISPLAY() in that the new
functions return early. Assume this is what we want, and there are no
cases where display engine is present but all pipes have been fused off.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_display_driver.c  | 16 ++++++++++++++++
 .../gpu/drm/i915/display/intel_display_driver.h  |  2 ++
 drivers/gpu/drm/i915/i915_driver.c               |  6 +++---
 drivers/gpu/drm/xe/display/xe_display.c          |  4 ++--
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index f362532c6834..77fa4497b442 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -714,6 +714,22 @@ int intel_display_driver_pm_suspend(struct intel_display *display)
 	return ret;
 }
 
+void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2idle)
+{
+	if (!HAS_DISPLAY(display))
+		return;
+
+	intel_display_power_suspend_late(display, s2idle);
+}
+
+void intel_display_driver_pm_resume_early(struct intel_display *display)
+{
+	if (!HAS_DISPLAY(display))
+		return;
+
+	intel_display_power_resume_early(display);
+}
+
 int
 __intel_display_driver_resume(struct intel_display *display,
 			      struct drm_atomic_commit *state,
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index d8a08ca68d4e..adfde02465ea 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -26,6 +26,8 @@ void intel_display_driver_remove_nogem(struct intel_display *display);
 void intel_display_driver_unregister(struct intel_display *display);
 
 int intel_display_driver_pm_suspend(struct intel_display *display);
+void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2idle);
+void intel_display_driver_pm_resume_early(struct intel_display *display);
 void intel_display_driver_pm_resume(struct intel_display *display);
 
 /* interface for intel_display_reset.c */
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 063d4bdec2d9..6fd3e8b155b1 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1181,12 +1181,12 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 	for_each_gt(gt, dev_priv, i)
 		intel_uncore_suspend(gt->uncore);
 
-	intel_display_power_suspend_late(display, s2idle);
+	intel_display_driver_pm_suspend_late(display, s2idle);
 
 	ret = vlv_suspend_complete(dev_priv);
 	if (ret) {
 		drm_err(&dev_priv->drm, "Suspend complete failed: %d\n", ret);
-		intel_display_power_resume_early(display);
+		intel_display_driver_pm_resume_early(display);
 	}
 
 	enable_rpm_wakeref_asserts(rpm);
@@ -1345,7 +1345,7 @@ static int i915_drm_resume_early(struct drm_device *dev)
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_resume_early(gt);
 
-	intel_display_power_resume_early(display);
+	intel_display_driver_pm_resume_early(display);
 
 	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index f34a9d2ffc16..bbd4f527d5e3 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -314,7 +314,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	intel_display_power_suspend_late(display, s2idle);
+	intel_display_driver_pm_suspend_late(display, s2idle);
 }
 
 void xe_display_pm_resume_early(struct xe_device *xe)
@@ -324,7 +324,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	intel_display_power_resume_early(display);
+	intel_display_driver_pm_resume_early(display);
 }
 
 void xe_display_pm_resume(struct xe_device *xe)
-- 
2.47.3

