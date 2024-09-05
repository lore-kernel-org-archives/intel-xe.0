Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FBACD5BCF
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 15:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930AC10E8F9;
	Thu,  5 Sep 2024 15:00:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7767810E8F5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 15:00:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 3/4] drm/xe: Wire up device shutdown handler
Date: Thu,  5 Sep 2024 17:00:51 +0200
Message-ID: <20240905150052.174895-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
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
 drivers/gpu/drm/xe/display/xe_display.c | 43 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display.h |  4 +++
 drivers/gpu/drm/xe/xe_device.c          | 40 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt.c              |  7 ++++
 drivers/gpu/drm/xe/xe_gt.h              |  1 +
 5 files changed, 89 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 33071ac3bc12d..0cb8eef1b095c 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -350,6 +350,36 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	__xe_display_pm_suspend(xe, false);
 }
 
+void xe_display_pm_shutdown(struct xe_device *xe)
+{
+	struct intel_display *display = &xe->display;
+
+	if (!xe->info.probe_display)
+		return;
+
+	intel_power_domains_disable(xe);
+	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
+	if (has_display(xe)) {
+		drm_kms_helper_poll_disable(&xe->drm);
+		intel_display_driver_disable_user_access(xe);
+		intel_display_driver_suspend(xe);
+	}
+
+	xe_display_flush_cleanup_work(xe);
+	intel_dp_mst_suspend(xe);
+	intel_hpd_cancel_work(xe);
+
+	if (has_display(xe))
+		intel_display_driver_suspend_access(xe);
+
+	intel_encoder_suspend_all(display);
+	intel_encoder_shutdown_all(display);
+
+	intel_opregion_suspend(display, PCI_D3cold);
+
+	intel_dmc_suspend(xe);
+}
+
 void xe_display_pm_runtime_suspend(struct xe_device *xe)
 {
 	if (!xe->info.probe_display)
@@ -372,6 +402,19 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
 	intel_display_power_suspend_late(xe);
 }
 
+void xe_display_pm_shutdown_late(struct xe_device *xe)
+{
+	if (!xe->info.probe_display)
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
 void xe_display_pm_resume_early(struct xe_device *xe)
 {
 	if (!xe->info.probe_display)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index bed55fd26f304..17afa537aee50 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -35,7 +35,9 @@ void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
 
 void xe_display_pm_suspend(struct xe_device *xe);
+void xe_display_pm_shutdown(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
+void xe_display_pm_shutdown_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
@@ -66,7 +68,9 @@ static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
 
 static inline void xe_display_pm_suspend(struct xe_device *xe) {}
+static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
+static inline void xe_display_pm_shutdown_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
 static inline void xe_display_pm_resume(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1a0d7fdd094b5..a2ce7454794f6 100644
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
+		xe_display_pm_shutdown(xe);
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
index dd96dec95b197..522f10f163c8b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -864,6 +864,13 @@ int xe_gt_suspend(struct xe_gt *gt)
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
-- 
2.45.2

