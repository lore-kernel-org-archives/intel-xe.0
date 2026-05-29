Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A7FCD6E52
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6108310FD38;
	Fri, 29 May 2026 11:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zk1gjaPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F4C10FD43;
 Fri, 29 May 2026 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052693; x=1811588693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TCLmU8lio1Uw42gnoyBa7rsgrUKhINqgypGM6DUiDpA=;
 b=Zk1gjaPBXyEhjy/0m0PxwLMmMCpeFc1MSLVCh9o2PQSDz17SHf5Q/Glv
 mqLC9rUwiXxcpf3GBsyABpDY9NQ9qrM0Xtl2NbgVqeMfMVx9W7pu+BgW0
 Isv0IBp6AUV2qWAq4QTqICdbOejo9RIpY9egpEBoOsKNQYtYUy6+y5O/m
 r3aPkXNehYTBvqa1nx9oLzBEHCT170fGRtWNNWFomaPL/s6akzYbHnkby
 CtRcDWir8wiwR/ZOZyi912jPbmYuTaL4WpQKfqHv/Y6gHTqaXwniN+CZJ
 F4IKY4fwP1scdUJDA5lkOSzp1PnqhTeEY11tZd4cZ4/LSTGWN54mik/aH A==;
X-CSE-ConnectionGUID: eflBr2nzRWSwR8MbCrokig==
X-CSE-MsgGUID: YiskkfTnTZ2I+vLduaY7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80629247"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80629247"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:53 -0700
X-CSE-ConnectionGUID: unojGXsRQhui+g5eonBkvw==
X-CSE-MsgGUID: dDfX2k58Tx2F6lc4Hvp6Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="236470847"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 08/24] drm/xe/display: relocate the xe_display_shutdown*()
 functions
Date: Fri, 29 May 2026 14:03:52 +0300
Message-ID: <e56ff63e94eacdf60340a0808d758d2854a1a31f.1780051905.git.jani.nikula@intel.com>
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

Group the xe_display_shutdown() and xe_display_shutdown_late() functions
together, away from the pm hooks.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 90 ++++++++++++-------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 3567b3018083..aab3ac1b70e1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -191,6 +191,51 @@ void xe_display_unregister(struct xe_device *xe)
 	intel_display_driver_unregister(display);
 }
 
+void xe_display_shutdown(struct xe_device *xe)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	intel_display_power_disable(display);
+	drm_client_dev_suspend(&xe->drm);
+
+	if (intel_display_device_present(display)) {
+		drm_kms_helper_poll_disable(&xe->drm);
+		intel_display_driver_disable_user_access(display);
+		intel_display_driver_pm_suspend(display);
+	}
+
+	intel_encoder_block_all_hpds(display);
+	intel_hpd_cancel_work(display);
+
+	if (intel_display_device_present(display))
+		intel_display_driver_suspend_access(display);
+
+	intel_encoder_suspend_all(display);
+	intel_encoder_shutdown_all(display);
+
+	intel_opregion_suspend(display, PCI_D3cold);
+
+	intel_dmc_suspend(display);
+}
+
+void xe_display_shutdown_late(struct xe_device *xe)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
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
 /* IRQ-related functions */
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
@@ -326,36 +371,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	intel_dmc_suspend(display);
 }
 
-void xe_display_shutdown(struct xe_device *xe)
-{
-	struct intel_display *display = xe->display;
-
-	if (!xe->info.probe_display)
-		return;
-
-	intel_display_power_disable(display);
-	drm_client_dev_suspend(&xe->drm);
-
-	if (intel_display_device_present(display)) {
-		drm_kms_helper_poll_disable(&xe->drm);
-		intel_display_driver_disable_user_access(display);
-		intel_display_driver_pm_suspend(display);
-	}
-
-	intel_encoder_block_all_hpds(display);
-	intel_hpd_cancel_work(display);
-
-	if (intel_display_device_present(display))
-		intel_display_driver_suspend_access(display);
-
-	intel_encoder_suspend_all(display);
-	intel_encoder_shutdown_all(display);
-
-	intel_opregion_suspend(display, PCI_D3cold);
-
-	intel_dmc_suspend(display);
-}
-
 void xe_display_pm_runtime_suspend(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
@@ -400,21 +415,6 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	intel_dmc_wl_flush_release_work(display);
 }
 
-void xe_display_shutdown_late(struct xe_device *xe)
-{
-	struct intel_display *display = xe->display;
-
-	if (!xe->info.probe_display)
-		return;
-
-	/*
-	 * The only requirement is to reboot with display DC states disabled,
-	 * for now leaving all display power wells in the INIT power domain
-	 * enabled.
-	 */
-	intel_display_power_driver_remove(display);
-}
-
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
-- 
2.47.3

