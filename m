Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57225C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 19:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244D810E3E0;
	Tue, 13 Aug 2024 19:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="br3/TGuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FB210E3E0
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723576639; x=1755112639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ocHYn9p2OhkdZB/KON9/x6dLnHtiVNi7/+hRgTDKHeA=;
 b=br3/TGuIu2wjqqZVTuz6/PfcUzKS5Ig1HgN8mDd7k2VEnJPbf8lLeQ/a
 ZK39K/JD4NLdlZzoX1OAQlbZDX5l2bu/FNagQElVPfiTqq46Ycu0La/YL
 OKMoNKFz4FUkDpgu8yqKm4SIEa7BQr9KxKL5izoD1VG+T+4d5k7ehvQxg
 Rwbnvvnjn7CERKrzFaQnEfg/5NRRNJ8vmJumAARyBYSFHna/EDSx165OW
 2XdCIv22q1ai1Gg8fyQi8EWB/z+WaBdHm6TH4+K6Wm1R5rJtCapiiMCwU
 QZrEMeSVzPEjGqLJucxdRrNTlP2VORToDDaFFcZBxy5UydStlwbKS6KEV g==;
X-CSE-ConnectionGUID: J0jCx2tjT6KrJNPlpZYKQg==
X-CSE-MsgGUID: WMZbI71sSeW0hy6jYUrhog==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21734446"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="21734446"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:17:19 -0700
X-CSE-ConnectionGUID: qwE6+w1zSQulnGBI5sxaSA==
X-CSE-MsgGUID: HU2NRRsjTKqgWkkA6uDaXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="63620906"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:17:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [CI] drm/xe: Rename enable_display module param
Date: Tue, 13 Aug 2024 12:17:09 -0700
Message-ID: <20240813191709.3285685-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

The different approach used by xe regarding the initialization of
display HW has been proved a great addition for early driver bring up:
core xe can be tested without having all the bits sorted out on the
display side.

On the other hand, the approach exposed by i915-display is to *actively*
disable the display by programming it if needed, i.e. if it was left
enabled by firmware. It also has its use to make sure the HW is actually
disabled and not wasting power.

However having both the way it is in xe doesn't expose a good interface
wrt module params. From modinfo:

	disable_display:Disable display (default: false) (bool)
	enable_display:Enable display (bool)

Rename enable_display to probe_display to try to convey the message that
the HW is being touched and improve the module param description. To
avoid confusion, the enable_display is renamed everywhere, not only in
the module param. New description for the parameters:

	disable_display:Disable display (default: false) (bool)
	probe_display:Probe display HW, otherwise it's left untouched (default: true) (bool)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240808180154.2495634-1-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 46 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_device.c          |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h    | 11 ++++--
 drivers/gpu/drm/xe/xe_module.c          |  6 ++--
 drivers/gpu/drm/xe/xe_module.h          |  2 +-
 drivers/gpu/drm/xe/xe_pci.c             |  8 ++---
 6 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0e4adde84cb29..982b9c5b440f2 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -46,7 +46,7 @@ static bool has_display(struct xe_device *xe)
  */
 bool xe_display_driver_probe_defer(struct pci_dev *pdev)
 {
-	if (!xe_modparam.enable_display)
+	if (!xe_modparam.probe_display)
 		return 0;
 
 	return intel_display_driver_probe_defer(pdev);
@@ -62,7 +62,7 @@ bool xe_display_driver_probe_defer(struct pci_dev *pdev)
  */
 void xe_display_driver_set_hooks(struct drm_driver *driver)
 {
-	if (!xe_modparam.enable_display)
+	if (!xe_modparam.probe_display)
 		return;
 
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
@@ -104,7 +104,7 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_power_domains_cleanup(xe);
@@ -112,7 +112,7 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
 
 int xe_display_init_nommio(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	/* Fake uncore lock */
@@ -129,7 +129,7 @@ static void xe_display_fini_noirq(void *arg)
 	struct xe_device *xe = arg;
 	struct intel_display *display = &xe->display;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_remove_noirq(xe);
@@ -141,7 +141,7 @@ int xe_display_init_noirq(struct xe_device *xe)
 	struct intel_display *display = &xe->display;
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	intel_display_driver_early_probe(xe);
@@ -172,7 +172,7 @@ static void xe_display_fini_noaccel(void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_remove_nogem(xe);
@@ -182,7 +182,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 {
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	err = intel_display_driver_probe_nogem(xe);
@@ -194,7 +194,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 
 int xe_display_init(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	return intel_display_driver_probe(xe);
@@ -202,7 +202,7 @@ int xe_display_init(struct xe_device *xe)
 
 void xe_display_fini(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_hpd_poll_fini(xe);
@@ -213,7 +213,7 @@ void xe_display_fini(struct xe_device *xe)
 
 void xe_display_register(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_register(xe);
@@ -223,7 +223,7 @@ void xe_display_register(struct xe_device *xe)
 
 void xe_display_unregister(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_unregister_dsm_handler();
@@ -233,7 +233,7 @@ void xe_display_unregister(struct xe_device *xe)
 
 void xe_display_driver_remove(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_remove(xe);
@@ -243,7 +243,7 @@ void xe_display_driver_remove(struct xe_device *xe)
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (master_ctl & DISPLAY_IRQ)
@@ -254,7 +254,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 {
 	struct intel_display *display = &xe->display;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (gu_misc_iir & GU_MISC_GSE)
@@ -263,7 +263,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 
 void xe_display_irq_reset(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	gen11_display_irq_reset(xe);
@@ -271,7 +271,7 @@ void xe_display_irq_reset(struct xe_device *xe)
 
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (gt->info.id == XE_GT0)
@@ -291,7 +291,7 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	struct intel_display *display = &xe->display;
 	bool s2idle = suspend_to_idle();
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	/*
@@ -321,7 +321,7 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 void xe_display_pm_suspend_late(struct xe_device *xe)
 {
 	bool s2idle = suspend_to_idle();
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_power_domains_suspend(xe, s2idle);
@@ -331,7 +331,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_power_resume_early(xe);
@@ -343,7 +343,7 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 {
 	struct intel_display *display = &xe->display;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_dmc_resume(xe);
@@ -381,7 +381,7 @@ int xe_display_probe(struct xe_device *xe)
 {
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		goto no_display;
 
 	intel_display_device_probe(xe);
@@ -394,7 +394,7 @@ int xe_display_probe(struct xe_device *xe)
 		return 0;
 
 no_display:
-	xe->info.enable_display = false;
+	xe->info.probe_display = false;
 	unset_display_features(xe);
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1aba6f9eaa192..2063283871503 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -543,7 +543,7 @@ static void update_device_info(struct xe_device *xe)
 {
 	/* disable features that are not available/applicable to VFs */
 	if (IS_SRIOV_VF(xe)) {
-		xe->info.enable_display = 0;
+		xe->info.probe_display = 0;
 		xe->info.has_heci_gscfi = 0;
 		xe->info.skip_guc_pc = 1;
 		xe->info.skip_pcode = 1;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5b7292a9a66dc..16a24eadd94bd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -282,8 +282,15 @@ struct xe_device {
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
-		/** @info.enable_display: display enabled */
-		u8 enable_display:1;
+		/**
+		 * @info.probe_display: Probe display hardware.  If set to
+		 * false, the driver will behave as if there is no display
+		 * hardware present and will not try to read/write to it in any
+		 * way.  The display hardware, if it exists, will not be
+		 * exposed to userspace and will be left untouched in whatever
+		 * state the firmware or bootloader left it in.
+		 */
+		u8 probe_display:1;
 		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7bb99e451fcc5..923460119cec5 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -15,7 +15,7 @@
 #include "xe_sched_job.h"
 
 struct xe_modparam xe_modparam = {
-	.enable_display = true,
+	.probe_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
 #ifdef CONFIG_PCI_IOV
@@ -28,8 +28,8 @@ struct xe_modparam xe_modparam = {
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
-module_param_named(enable_display, xe_modparam.enable_display, bool, 0444);
-MODULE_PARM_DESC(enable_display, "Enable display");
+module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
+MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched (default: true)");
 
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, uint, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 61a0d28a28c8f..161a5e6f717fb 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -11,7 +11,7 @@
 /* Module modprobe variables */
 struct xe_modparam {
 	bool force_execlist;
-	bool enable_display;
+	bool probe_display;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7bb811b4a057b..3c34b032ebf41 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -621,9 +621,9 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
 
-	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  xe_modparam.enable_display &&
-				  desc->has_display;
+	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
+				 xe_modparam.probe_display &&
+				 desc->has_display;
 
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
 	if (err)
@@ -834,7 +834,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe->info.media_name,
 		xe->info.media_verx100 / 100,
 		xe->info.media_verx100 % 100,
-		str_yes_no(xe->info.enable_display),
+		str_yes_no(xe->info.probe_display),
 		xe->info.dma_mask_size, xe->info.tile_count,
 		xe->info.has_heci_gscfi, xe->info.has_heci_cscfi);
 
-- 
2.43.0

