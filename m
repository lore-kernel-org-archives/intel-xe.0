Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D113C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 13:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538A610E271;
	Mon, 19 Aug 2024 13:31:43 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2F910E26B
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 13:31:40 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 2/3] drm/xe: Wire up device shutdown handler
Date: Mon, 19 Aug 2024 15:31:36 +0200
Message-ID: <20240819133138.147511-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
References: <20240819133138.147511-1-maarten.lankhorst@linux.intel.com>
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

The system is turning off, and we should probably put the device
in a safe power state. We don't need to evict VRAM or suspend running
jobs to a safe state, as the device is rebooted anyway.

This does not imply the system is necessarily reset, as we can
kexec into a new kernel. Without shutting down, things like
USB Type-C may mysteriously start failing.

References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3500
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 19 ++++++++++--
 drivers/gpu/drm/xe/display/xe_display.h |  3 +-
 drivers/gpu/drm/xe/xe_device.c          | 40 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt.c              |  7 +++++
 drivers/gpu/drm/xe/xe_gt.h              |  1 +
 drivers/gpu/drm/xe/xe_pm.c              |  4 +--
 6 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 79add15c6c4c7..f549aee8ec261 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -311,10 +311,10 @@ static void xe_display_flush_cleanup_work(struct xe_device *xe)
 	}
 }
 
-void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime, bool shutdown)
 {
 	struct intel_display *display = &xe->display;
-	bool s2idle = suspend_to_idle();
+	bool s2idle = suspend_to_idle() || shutdown;
 	if (!xe->info.probe_display)
 		return;
 
@@ -342,12 +342,27 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 		intel_display_driver_suspend_access(xe);
 
 	intel_encoder_suspend_all(&xe->display);
+	if (shutdown)
+		intel_encoder_shutdown_all(&xe->display);
 
 	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
 
 	intel_dmc_suspend(xe);
 }
 
+void xe_display_pm_shutdown_late(struct xe_device *xe)
+{
+	if (!xe->info.enable_display)
+		return;
+
+	/*
+	 * The only requirement is to reboot with display DC states disabled,
+	 * for now leaving all display power wells in the INIT power domain
+	 * enabled.
+	 */
+	intel_power_domains_driver_remove(xe);
+}
+
 void xe_display_pm_suspend_late(struct xe_device *xe)
 {
 	bool s2idle = suspend_to_idle();
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 000fb5799df54..64229565f0d0d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -34,8 +34,9 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
-void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
+void xe_display_pm_suspend(struct xe_device *xe, bool runtime, bool shutdown);
 void xe_display_pm_suspend_late(struct xe_device *xe);
+void xe_display_pm_shutdown_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe, bool runtime);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b6db7e082d887..18c5a2c8530eb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -383,6 +383,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	return ERR_PTR(err);
 }
 
+static bool xe_driver_flr_disabled(struct xe_device *xe)
+{
+	return xe_mmio_read32(xe_root_mmio_gt(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS;
+}
+
 /*
  * The driver-initiated FLR is the highest level of reset that we can trigger
  * from within the driver. It is different from the PCI FLR in that it doesn't
@@ -396,17 +401,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
  * if/when a new instance of i915 is bound to the device it will do a full
  * re-init anyway.
  */
-static void xe_driver_flr(struct xe_device *xe)
+static void __xe_driver_flr(struct xe_device *xe)
 {
 	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	int ret;
 
-	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
-		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
-		return;
-	}
-
 	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
 
 	/*
@@ -447,6 +447,16 @@ static void xe_driver_flr(struct xe_device *xe)
 	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
 }
 
+static void xe_driver_flr(struct xe_device *xe)
+{
+	if (xe_driver_flr_disabled(xe)) {
+		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
+		return;
+	}
+
+	__xe_driver_flr(xe);
+}
+
 static void xe_driver_flr_fini(void *arg)
 {
 	struct xe_device *xe = arg;
@@ -798,6 +808,24 @@ void xe_device_remove(struct xe_device *xe)
 
 void xe_device_shutdown(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	u8 id;
+
+	drm_dbg(&xe->drm, "Shutting down device\n");
+
+	if (xe_driver_flr_disabled(xe)) {
+		xe_display_pm_suspend(xe, false, true);
+
+		xe_irq_suspend(xe);
+
+		for_each_gt(gt, xe, id)
+			xe_gt_shutdown(gt);
+
+		xe_display_pm_shutdown_late(xe);
+	} else {
+		/* BOOM! */
+		__xe_driver_flr(xe);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 224c137967c3c..9682d32e0d87d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -863,6 +863,13 @@ int xe_gt_suspend(struct xe_gt *gt)
 	return err;
 }
 
+void xe_gt_shutdown(struct xe_gt *gt)
+{
+	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	do_gt_reset(gt);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+}
+
 /**
  * xe_gt_sanitize_freq() - Restore saved frequencies if necessary.
  * @gt: the GT object
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 8b1a5027dcf27..97def44afa4c8 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -54,6 +54,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
 
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
+void xe_gt_shutdown(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index fcfb49af8c891..0ca135d4b9214 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -93,7 +93,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
-	xe_display_pm_suspend(xe, false);
+	xe_display_pm_suspend(xe, false, false);
 
 	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
@@ -367,7 +367,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	mutex_unlock(&xe->mem_access.vram_userfault.lock);
 
 	if (xe->d3cold.allowed) {
-		xe_display_pm_suspend(xe, true);
+		xe_display_pm_suspend(xe, true, false);
 
 		err = xe_bo_evict_all(xe);
 		if (err)
-- 
2.45.2

