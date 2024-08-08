Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D27CC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187D810E00D;
	Thu,  8 Aug 2024 18:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAG2S9Re";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C45A10E00D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723140128; x=1754676128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i2OiMbfeI9dM4eniNuLk1uFjjIdrqmJDK9q5lRvsWRU=;
 b=jAG2S9ReI/inhFHylSF/6NXNfXbCnZtnUtFTUCheEcc6taV8OqcBrBVC
 8TDyEKrbjKuqb4ABUqLh3wME4JHb7qPi4GjTffY88BIHz1xLUUqKvSnn/
 HoITb6rINRIwCC11Vqy9R/nT9q7fO6OBP4nmsgcJYHXKiY732GtaoKAa0
 hjdzmS1emRFFKnggBjV1+3qPbRR+XeS7UYxgF4TlyBfttjjXd3VxGo3e0
 9sOsWqiS19uxiglD9E1KqkLjr+HsOGy8LcfP3fnqNr4N33kracp6miQ+A
 o9iQ3IiTEJEog3ASNv4EuccIOTotbqzbomsT6gfnHFyrlmhriC3p2KMS4 Q==;
X-CSE-ConnectionGUID: jASUPHRFQy2e5iQjOj41ug==
X-CSE-MsgGUID: ErQBO1bjR92eWI/BoRBcEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32694277"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="32694277"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:02:08 -0700
X-CSE-ConnectionGUID: 4fstrWq4SBq9MLDtns/Y8w==
X-CSE-MsgGUID: gDV0awlySr2E/tNjlQq7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="62260963"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:02:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Rename enable_display module param
Date: Thu,  8 Aug 2024 10:49:42 -0700
Message-ID: <20240808180154.2495634-1-lucas.demarchi@intel.com>
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
display HW has been proved a great additional for early driver bring up:
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

Rename enable_display do probe_display to try to convey the message that
the HW is being touched and improve the module param description. To
avoid confusion, the enable_display is renamed everywhere, not only in
the module param. New description for the parameters:

	disable_display:Disable display (default: false) (bool)
	probe_display:Probe display HW, otherwise it's left untouched (default: true) (bool)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Now that xe settled in upstream, maybe it's also time to consider
removing the CONFIG_DRM_XE_DISPLAY as discussed in
https://lore.kernel.org/all/oedsuayuo3wtdea6cvmzaoesji25bwbqohgemayj5ocybbzgtn@el2d34rwqfsn/

Also relevant: https://lore.kernel.org/all/87sfer1fjj.fsf@intel.com/

Jani, I think at one point you had a patch to remove enable_display
(which I was against and still am for the reasons above) or rename it
(what this patch is doing). However I couldn't find it to check if you
were trying to rename to a similar thing as I'm doing now.

 drivers/gpu/drm/xe/display/xe_display.c | 46 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_device.c          |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h    |  7 ++--
 drivers/gpu/drm/xe/xe_module.c          |  6 ++--
 drivers/gpu/drm/xe/xe_module.h          |  2 +-
 drivers/gpu/drm/xe/xe_pci.c             |  8 ++---
 6 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index ca4468c82078..e30fb482d542 100644
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
@@ -128,7 +128,7 @@ static void xe_display_fini_noirq(void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_remove_noirq(xe);
@@ -139,7 +139,7 @@ int xe_display_init_noirq(struct xe_device *xe)
 {
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	intel_display_driver_early_probe(xe);
@@ -170,7 +170,7 @@ static void xe_display_fini_noaccel(void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_remove_nogem(xe);
@@ -180,7 +180,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 {
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	err = intel_display_driver_probe_nogem(xe);
@@ -192,7 +192,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 
 int xe_display_init(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return 0;
 
 	return intel_display_driver_probe(xe);
@@ -200,7 +200,7 @@ int xe_display_init(struct xe_device *xe)
 
 void xe_display_fini(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_hpd_poll_fini(xe);
@@ -211,7 +211,7 @@ void xe_display_fini(struct xe_device *xe)
 
 void xe_display_register(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_register(xe);
@@ -221,7 +221,7 @@ void xe_display_register(struct xe_device *xe)
 
 void xe_display_unregister(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_unregister_dsm_handler();
@@ -231,7 +231,7 @@ void xe_display_unregister(struct xe_device *xe)
 
 void xe_display_driver_remove(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_remove(xe);
@@ -241,7 +241,7 @@ void xe_display_driver_remove(struct xe_device *xe)
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (master_ctl & DISPLAY_IRQ)
@@ -250,7 +250,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 
 void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (gu_misc_iir & GU_MISC_GSE)
@@ -259,7 +259,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
 
 void xe_display_irq_reset(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	gen11_display_irq_reset(xe);
@@ -267,7 +267,7 @@ void xe_display_irq_reset(struct xe_device *xe)
 
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	if (gt->info.id == XE_GT0)
@@ -286,7 +286,7 @@ static bool suspend_to_idle(void)
 void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 {
 	bool s2idle = suspend_to_idle();
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	/*
@@ -316,7 +316,7 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 void xe_display_pm_suspend_late(struct xe_device *xe)
 {
 	bool s2idle = suspend_to_idle();
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_power_domains_suspend(xe, s2idle);
@@ -326,7 +326,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_display_power_resume_early(xe);
@@ -336,7 +336,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
 
 void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 {
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		return;
 
 	intel_dmc_resume(xe);
@@ -374,7 +374,7 @@ int xe_display_probe(struct xe_device *xe)
 {
 	int err;
 
-	if (!xe->info.enable_display)
+	if (!xe->info.probe_display)
 		goto no_display;
 
 	intel_display_device_probe(xe);
@@ -387,7 +387,7 @@ int xe_display_probe(struct xe_device *xe)
 		return 0;
 
 no_display:
-	xe->info.enable_display = false;
+	xe->info.probe_display = false;
 	unset_display_features(xe);
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1aba6f9eaa19..206328387150 100644
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
index 5b7292a9a66d..82e99a3e084e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -282,8 +282,11 @@ struct xe_device {
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
-		/** @info.enable_display: display enabled */
-		u8 enable_display:1;
+		/**
+		 * @info.probe_display: probe display HW, otherwise it's left
+		 * untouched in whatever state the firmware left it
+		 */
+		u8 probe_display:1;
 		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7bb99e451fcc..923460119cec 100644
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
index 61a0d28a28c8..161a5e6f717f 100644
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
index f818aa69f3ca..b304855624ce 100644
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

