Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA32CCA46D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3716B112613;
	Fri, 16 Oct 2026 07:19:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB28112639
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135145; x=1823671145;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+pOUmPY2rpZjPspfxoCiA84jMSXJKeIFErgH6nkr75o=;
 b=kRF0nWJYMz/rWJJd8GpCPSaqm0I7oUkFZfWJ08z7LL1J3xtoQr2n9Zhb
 o9TBqZgcWs447FCdv1odoEeN+aQOnnwybzXB3FGPfTE8X32VXNWuUyeH3
 LqQE5i/bKC0/PJ5BGobQzD67kOYGGxa3lT7AW5IDU/eGxr2ZE2WKotaej
 dyq5wSzr0tx35Q9E2kONQPMLuUz4WBB+PNjhzQ6brGfkclAhEhrASREGQ
 CnlBigk8If5Tj1hvlWxj75S19/QbeQIp4p5SGMwfVIUUSUDeED/hXKfwP
 PvmSuw0wpF7vuknywe/zBQo9bC73C2AXEReap4mjfvVs9xCq+uQVbG8Hq w==;
X-CSE-ConnectionGUID: sboatto9TK6Wn5DHG3vYzw==
X-CSE-MsgGUID: BN075E1/TBm2oRUkrWLt3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813658"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:55 -0700
X-CSE-ConnectionGUID: QA+83y3+Se6wTT6gK/noTA==
X-CSE-MsgGUID: KsNrf9j5QpyhKhtFUmgJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787288"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:54 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 14/18] drm/xe: Isolate a wedged device before notifying
 userspace
Date: Fri, 16 Oct 2026 12:48:24 +0530
Message-ID: <20261016071832.222574-15-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

A permanently wedged device must stop interrupt and DMA activity before
userspace is notified that recovery is required.

Run the sleepable isolation steps from the wedge worker. Shut down and
unregister the display, suspend interrupts and clear PCI bus mastering,
then invalidate VRAM mappings. Mapping teardown does not access hardware,
so it runs after DMA has stopped.

Track display and isolation state so later teardown does not repeat these
steps. Display shutdown already disables display power, so skip the
runtime PM disable when unregister follows shutdown.

System suspend may see the wedge flag before the worker is queued. Use a
completion to close this window and flush the worker before skipping
normal device suspend. The IRQ serialization keeps a racing resume from
enabling interrupts after isolation.

Resume always balances pci_disable_device() with pci_enable_device().
If the device is wedged, clear bus mastering and skip xe_pm_resume().

v2:
 - Run the common PCI suspend path for wedged devices so
   the D3Cold toggles remain paired. (Sashiko)
 - Move pci_enable_device() before the resume wedge check to
   balance pci_disable_device() even if the device wedges
   during suspend. (Sashiko)
 - Reuse the common device I/O SRCU gate
 - Remove the separate VRAM fault SRCU domain
 - Protect driver suspend and resume with the common SRCU gate
 - Wait for isolation when the device wedges during PM

v3:
 - Protect display registration with the common device I/O gate.
   (Sashiko)
 - Track display PM suspend state to avoid a second display suspend.
   (Sashiko)
 - Keep display lifecycle checks inside the display helpers. (Sashiko)
 - Suspend interrupts and clear PCI bus mastering before invalidating
   VRAM CPU mappings.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 39 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.c          | 45 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_device_types.h    | 13 +++++++
 drivers/gpu/drm/xe/xe_pci.c             | 51 +++++++++++++++++++++----
 4 files changed, 131 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index aab416485e3e..62d607afbf38 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_display.h"
+#include "xe_device.h"
 #include "regs/xe_irq_regs.h"
 
 #include <linux/acpi.h>
@@ -141,35 +142,55 @@ int xe_display_init(struct xe_device *xe)
 void xe_display_register(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
+	int io_idx;
 
 	if (!xe->info.probe_display)
 		return;
 
+	if (xe_device_io_get(xe, &io_idx))
+		return;
+
+	if (xe->display_registered)
+		goto out;
+
 	intel_display_driver_register(display);
 	intel_display_driver_runtime_pm_enable(display);
+
+	xe->display_registered = true;
+
+out:
+	xe_device_io_put(io_idx);
 }
 
 void xe_display_unregister(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!xe->info.probe_display)
+	if (!xe->info.probe_display || !xe->display_registered)
 		return;
 
-	intel_display_driver_runtime_pm_disable(display);
+	if (!xe->display_shutdown && !xe->display_pm_suspended)
+		intel_display_driver_runtime_pm_disable(display);
+
 	intel_display_driver_unregister(display);
+
+	xe->display_registered = false;
 }
 
 void xe_display_shutdown(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!xe->info.probe_display)
+	if (!xe->info.probe_display || !xe->display_registered ||
+	    xe->display_shutdown ||
+	    xe->display_pm_suspended)
 		return;
 
 	intel_display_driver_shutdown(display);
 
 	intel_opregion_suspend(display, PCI_D3cold);
+
+	xe->display_shutdown = true;
 }
 
 void xe_display_shutdown_late(struct xe_device *xe)
@@ -240,12 +261,16 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	struct intel_display *display = xe->display;
 	bool s2idle = suspend_to_idle();
 
-	if (!xe->info.probe_display)
+	if (!xe->info.probe_display || !xe->display_registered ||
+	    xe->display_shutdown ||
+	    xe->display_pm_suspended)
 		return;
 
 	intel_display_driver_pm_suspend(display);
 
 	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
+
+	xe->display_pm_suspended = true;
 }
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
@@ -273,7 +298,9 @@ void xe_display_pm_resume(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!xe->info.probe_display)
+	if (!xe->info.probe_display || !xe->display_registered ||
+	    xe->display_shutdown ||
+	    !xe->display_pm_suspended)
 		return;
 
 	intel_dmc_resume(display);
@@ -284,6 +311,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_display_driver_init_hw(display);
 
 	intel_display_driver_pm_resume(display);
+
+	xe->display_pm_suspended = false;
 }
 
 static void xe_display_enable_d3cold(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 82743ca2d3f8..3d322287e315 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -501,6 +501,7 @@ int xe_device_init_early(struct xe_device *xe)
 	int err;
 
 	INIT_WORK(&xe->wedged.work, xe_device_wedged_work);
+	init_completion(&xe->wedged.prepared);
 	xe->wedged.reported_method = ~0UL;
 
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
@@ -929,6 +930,41 @@ static void xe_uid_probe(struct xe_device *xe)
 		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);
 }
 
+/*
+ * Isolate a permanently wedged device.
+ *
+ * May sleep and must be called from process context.
+ */
+static void xe_device_wedged_isolate(struct xe_device *xe)
+{
+	/*
+	 * Wait until xe_device_declare_wedged() has finished scanning GT
+	 * submission state before isolating the device.
+	 */
+	wait_for_completion(&xe->wedged.prepared);
+
+	if (xe->wedged.isolated)
+		return;
+
+	/*
+	 * GT wedging has signalled pending fences. Drain existing hardware
+	 * users before isolation starts.
+	 */
+	xe_device_io_drain(xe);
+
+	/* Shut down display hardware before stopping device access. */
+	xe_display_shutdown(xe);
+	xe_display_unregister(xe);
+
+	/* Stop interrupt and DMA activity before changing mappings. */
+	xe_irq_suspend(xe);
+	pci_clear_master(to_pci_dev(xe->drm.dev));
+
+	xe_bo_wedged_invalidate_mmaps(xe);
+
+	xe->wedged.isolated = true;
+}
+
 static void xe_device_wedged_work(struct work_struct *work)
 {
 	struct xe_device *xe =
@@ -936,9 +972,7 @@ static void xe_device_wedged_work(struct work_struct *work)
 	unsigned long method;
 	int err;
 
-	/* Drain active faults before invalidating VRAM mappings. */
-	xe_device_io_drain(xe);
-	xe_bo_wedged_invalidate_mmaps(xe);
+	xe_device_wedged_isolate(xe);
 
 	/* Report at most one recovery method per worker invocation. */
 	method = READ_ONCE(xe->wedged.method);
@@ -1212,7 +1246,6 @@ int xe_device_probe(struct xe_device *xe)
 void xe_device_remove(struct xe_device *xe)
 {
 	xe_device_wedged_disable(xe);
-
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
@@ -1230,7 +1263,6 @@ void xe_device_shutdown(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Shutting down device\n");
 
 	xe_device_wedged_disable(xe);
-
 	xe_display_shutdown(xe);
 
 	xe_irq_suspend(xe);
@@ -1553,6 +1585,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
 	     READ_ONCE(xe->wedged.method) !=
 	     READ_ONCE(xe->wedged.reported_method)))
 		queue_work(xe->unordered_wq, &xe->wedged.work);
+
+	if (first)
+		complete_all(&xe->wedged.prepared);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0696769cf44c..0a6ca893b257 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_DEVICE_TYPES_H_
 #define _XE_DEVICE_TYPES_H_
 
+#include <linux/completion.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
 
@@ -112,6 +113,14 @@ struct xe_device {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 	/** @display: display device data, must be placed after drm device member */
 	struct intel_display *display;
+	/** @display_registered: Display userspace interfaces are registered */
+	bool display_registered;
+	/**
+	 * @display_pm_suspended: Display was suspended by system PM
+	 */
+	bool display_pm_suspended;
+	/** @display_shutdown: Display hardware shutdown has completed */
+	bool display_shutdown;
 #endif
 
 	/** @devcoredump: device coredump */
@@ -568,8 +577,12 @@ struct xe_device {
 		struct work_struct work;
 		/** @wedged.stopping: Blocks worker requeue and repeated disable */
 		atomic_t stopping;
+		/** @wedged.prepared: First wedge declaration finished and work was queued */
+		struct completion prepared;
 		/** @wedged.reported_method: Last recovery method reported to userspace */
 		unsigned long reported_method;
+		/** @wedged.isolated: Terminal device isolation has completed */
+		bool isolated;
 	} wedged;
 
 	/** @devres_group: devres group */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 57c6f778ca24..d05d7605f195 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1331,19 +1331,38 @@ static int xe_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int io_idx;
 	int err;
 
 	if (xe_survivability_mode_is_boot_enabled(xe))
 		return -EBUSY;
 
-	err = xe_pm_suspend(xe);
-	if (err)
-		return err;
+	/*
+	 * Wait until wedge work is queued, then wait for isolation to
+	 * finish before skipping driver-level suspend.
+	 */
+	err = xe_device_io_get(xe, &io_idx);
+	if (err) {
+		if (!xe_device_wedged(xe))
+			return err;
+
+		wait_for_completion(&xe->wedged.prepared);
+		flush_work(&xe->wedged.work);
+	} else {
+		err = xe_pm_suspend(xe);
+		xe_device_io_put(io_idx);
+
+		if (xe_device_wedged(xe)) {
+			wait_for_completion(&xe->wedged.prepared);
+			flush_work(&xe->wedged.work);
+		} else if (err) {
+			return err;
+		}
+	}
 
 	/*
-	 * Enabling D3Cold is needed for S2Idle/S0ix.
-	 * It is save to allow here since xe_pm_suspend has evicted
-	 * the local memory and the direct complete optimization is disabled.
+	 * Keep PCI suspend common to both paths so resume performs
+	 * matching PCI enable and D3Cold operations.
 	 */
 	d3cold_toggle(pdev, D3COLD_ENABLE);
 
@@ -1357,6 +1376,8 @@ static int xe_pci_suspend(struct device *dev)
 static int xe_pci_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int io_idx;
 	int err;
 
 	/* Give back the D3Cold decision to the runtime P M*/
@@ -1368,13 +1389,29 @@ static int xe_pci_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
+	/* Balance PCI suspend regardless of the current wedge state. */
 	err = pci_enable_device(pdev);
 	if (err)
 		return err;
 
+	err = xe_device_io_get(xe, &io_idx);
+	if (err) {
+		pci_clear_master(pdev);
+		return xe_device_wedged(xe) ? 0 : err;
+	}
+
 	pci_set_master(pdev);
 
-	err = xe_pm_resume(pdev_to_xe_device(pdev));
+	err = xe_pm_resume(xe);
+	xe_device_io_put(io_idx);
+
+	if (xe_device_wedged(xe)) {
+		wait_for_completion(&xe->wedged.prepared);
+		flush_work(&xe->wedged.work);
+		pci_clear_master(pdev);
+		return 0;
+	}
+
 	if (err)
 		return err;
 
-- 
2.43.0

