Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A0DCD6E4A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 08:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47687113930;
	Tue,  2 Jun 2026 08:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i834Bar+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8DD11392A;
 Tue,  2 Jun 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780389197; x=1811925197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2526EdYu5mI2HGjEUz1k6wkL7klH8mbVnjxzYBNr4LY=;
 b=i834Bar+X76O7TzSuVbHyZmqWM5r8DFX436iowNdjQ/68GXUEvWwwy+T
 +OW/oItAd9qIVYD49K+gnYVFXA25Pi+iNTSMqMfgy+IrtEX8ecpB6SSDO
 xG0iuQWaq2qkYtfJ8YDJRNzCKjYNACe40Mqcc6ENVA9LBu4QTMslVCOEx
 eMsfuKTxpRBqzz1DLZMyb4MBuvtDC66I0NuLk0gJ/p7nEKmRZYhO/orqV
 XfyvR2+80m968I5dMOrIr0Q2hJcK/MrwcBotvJ2maCWcfG15nXBhbdl+/
 h1DWLaUE2AscpAbMnF776Aqj9ScuJ+3uCxzz2sU3flPNUndkHhnst+mfO Q==;
X-CSE-ConnectionGUID: 3hkExCUeR2OE8y9agjmsnA==
X-CSE-MsgGUID: Xh0rDgioQsq2EJawvASBtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="85056633"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="85056633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:33:16 -0700
X-CSE-ConnectionGUID: wZsv/uS8QLCbpH3F9WrgMg==
X-CSE-MsgGUID: 31m2sCWmRc+ghakaBwz2yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="281953236"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.253])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:33:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, imre.deak@intel.com, jani.nikula@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [CI 04/12] drm/xe/display: relocate the xe_display_pm_runtime_*()
 functions
Date: Tue,  2 Jun 2026 11:32:44 +0300
Message-ID: <3e7de41c1a27ef250eb9c35c4858120bc9846301.1780389001.git.jani.nikula@intel.com>
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

Keep the xe_display_pm_runtime_*() functions together, in
suspend/suspend_late/resume order. Also relocate the dependent d3cold
functions near usage in the runtime pm functions.

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 160 ++++++++++++------------
 1 file changed, 80 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index aab3ac1b70e1..38ebcc2b712a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -289,53 +289,6 @@ static bool suspend_to_idle(void)
 	return false;
 }
 
-static void xe_display_enable_d3cold(struct xe_device *xe)
-{
-	struct intel_display *display = xe->display;
-
-	if (!xe->info.probe_display)
-		return;
-
-	/*
-	 * We do a lot of poking in a lot of registers, make sure they work
-	 * properly.
-	 */
-	intel_display_power_disable(display);
-
-	intel_display_flush_cleanup_work(display);
-
-	intel_opregion_suspend(display, PCI_D3cold);
-
-	intel_dmc_suspend(display);
-
-	if (intel_display_device_present(display))
-		intel_hpd_poll_enable(display);
-}
-
-static void xe_display_disable_d3cold(struct xe_device *xe)
-{
-	struct intel_display *display = xe->display;
-
-	if (!xe->info.probe_display)
-		return;
-
-	intel_dmc_resume(display);
-
-	if (intel_display_device_present(display))
-		drm_mode_config_reset(&xe->drm);
-
-	intel_display_driver_init_hw(display);
-
-	intel_hpd_init(display);
-
-	if (intel_display_device_present(display))
-		intel_hpd_poll_disable(display);
-
-	intel_opregion_resume(display);
-
-	intel_display_power_enable(display);
-}
-
 void xe_display_pm_suspend(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -371,21 +324,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	intel_dmc_suspend(display);
 }
 
-void xe_display_pm_runtime_suspend(struct xe_device *xe)
-{
-	struct intel_display *display = xe->display;
-
-	if (!xe->info.probe_display)
-		return;
-
-	if (xe->d3cold.allowed) {
-		xe_display_enable_d3cold(xe);
-		return;
-	}
-
-	intel_hpd_poll_enable(display);
-}
-
 void xe_display_pm_suspend_late(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -397,24 +335,6 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 	intel_display_power_suspend_late(display, s2idle);
 }
 
-void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
-{
-	struct intel_display *display = xe->display;
-
-	if (!xe->info.probe_display)
-		return;
-
-	if (xe->d3cold.allowed)
-		xe_display_pm_suspend_late(xe);
-
-	/*
-	 * If xe_display_pm_suspend_late() is not called, it is likely
-	 * that we will be on dynamic DC states with DMC wakelock enabled. We
-	 * need to flush the release work in that case.
-	 */
-	intel_dmc_wl_flush_release_work(display);
-}
-
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -462,6 +382,86 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_display_power_enable(display);
 }
 
+static void xe_display_enable_d3cold(struct xe_device *xe)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	/*
+	 * We do a lot of poking in a lot of registers, make sure they work
+	 * properly.
+	 */
+	intel_display_power_disable(display);
+
+	intel_display_flush_cleanup_work(display);
+
+	intel_opregion_suspend(display, PCI_D3cold);
+
+	intel_dmc_suspend(display);
+
+	if (intel_display_device_present(display))
+		intel_hpd_poll_enable(display);
+}
+
+static void xe_display_disable_d3cold(struct xe_device *xe)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	intel_dmc_resume(display);
+
+	if (intel_display_device_present(display))
+		drm_mode_config_reset(&xe->drm);
+
+	intel_display_driver_init_hw(display);
+
+	intel_hpd_init(display);
+
+	if (intel_display_device_present(display))
+		intel_hpd_poll_disable(display);
+
+	intel_opregion_resume(display);
+
+	intel_display_power_enable(display);
+}
+
+void xe_display_pm_runtime_suspend(struct xe_device *xe)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	if (xe->d3cold.allowed) {
+		xe_display_enable_d3cold(xe);
+		return;
+	}
+
+	intel_hpd_poll_enable(display);
+}
+
+void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	if (xe->d3cold.allowed)
+		xe_display_pm_suspend_late(xe);
+
+	/*
+	 * If xe_display_pm_suspend_late() is not called, it is likely
+	 * that we will be on dynamic DC states with DMC wakelock enabled. We
+	 * need to flush the release work in that case.
+	 */
+	intel_dmc_wl_flush_release_work(display);
+}
+
 void xe_display_pm_runtime_resume(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
-- 
2.47.3

