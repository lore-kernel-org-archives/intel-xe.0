Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA6FCD6E43
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D3610FD27;
	Fri, 29 May 2026 11:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMODZkkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5D510FD27;
 Fri, 29 May 2026 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052697; x=1811588697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sxd2jivNZsWfkLwzN0cKnABO86UDUz6mRAGWIWk44EQ=;
 b=gMODZkkUDHjUPokg8quJ3uoIS0wu2QLDNcEEc/hx9WEnK9ZgcLvyg9qe
 Qw+ko7IsCiQtDmzJ6hTeB4QbFzRRgH+4ysQtRFMRMd48B7aObxsJSw81Z
 1IL8C11MkL34WKtmg9d4JR5A455iw/LpBYsYyEJNJeL30RjbHi+F6pikW
 s0VsTzAnK0QG5S9E4jGuI+2Sa7Q618GWA8pbNBdujlyBAo1P1IHG0cD2o
 4Amz61JjElnjFCQMzkFLgM0KPB4FIFj9HcqqcnaDgOfsAt27W2sO4yTTN
 x5IYneAF6khE0VtEQDzXeylZEMYjMBHGpOwJGtr1KsNdaDiCc3KFlKYVz Q==;
X-CSE-ConnectionGUID: c+e8gpmCTZmqP4l/C2RJCw==
X-CSE-MsgGUID: 0JUshxBeSTiBEsrMl7OosQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80629249"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80629249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:57 -0700
X-CSE-ConnectionGUID: jklaF7WEREiGfJScEHUncg==
X-CSE-MsgGUID: 5wcI7YKhThWv4X9hUSLiXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="236470854"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 09/24] drm/xe/display: relocate the xe_display_pm_runtime_*()
 functions
Date: Fri, 29 May 2026 14:03:53 +0300
Message-ID: <597d9390e894c66fd4e2665e64ce16df139b2feb.1780051905.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051905.git.jani.nikula@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

