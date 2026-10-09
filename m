Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF65CA5FED
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 07:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26A010E759;
	Fri,  9 Oct 2026 07:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSsg3zZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ED210E759
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 07:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791532355; x=1823068355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QiOT+sx58P8sYp/RDFZsU0KE8wAxJEeoLd09MvOJDKc=;
 b=SSsg3zZSIuDAeFFuP4yAWyvGLMDso9kjCEpGtAzpcrLJ6S4bv+t9mQWg
 IG+uov/lw3SYSPJAM+ta6g+2+bTrjfZK0H7iJsLlQ8i2HUfXZ8tQH+7Ag
 /gTG7jYmPlX9zB9FFAVB366p/GcA94GvOQ/yy0SbIOtuuRQteSURoR1Bp
 1fhfBdxLaAriGew2OGggaMj5xPYfttr87FItIQkutAHKXlyJu/1aHcCVW
 ABUUu8NANCZ3KhLbMDkEb6GLTQ3fr85BHpbSsyZ1oamIGR6CGWNH+M8Ix
 oyGC7yRzYFxcI1qgz8z9tf6VDN3FQu4EB5Tqh4QB10BvJ2OtjeN2NZqGE w==;
X-CSE-ConnectionGUID: xPWxMu1ZS1mRKjUMOYoZaA==
X-CSE-MsgGUID: 4TiahzCkSVip1Eh11PaVuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="210810"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="210810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 00:52:34 -0700
X-CSE-ConnectionGUID: QVygXWxcRrmiK0SAwm2oKg==
X-CSE-MsgGUID: jAAHYGPdRBqS3Z1I7N3GSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="588792"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 00:52:33 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v2] drm/xe: Add wa_14028434957 to Graphics Version 35.11
Date: Fri,  9 Oct 2026 13:22:25 +0530
Message-ID: <20261009075224.1316885-2-varun.gupta@intel.com>
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

Prevent the SNIB AER latch from swallowing back-to-back uncorrectable
non-fatal errors.

Firmware bypasses the faulty AER path by routing these errors directly
via MSI. This patch intercepts the MSI and reuses the existing GFSP
error containment logic.

Because GFSP mailbox queries can sleep, handling is deferred to a
workqueue (nonfatal_msi_work) to ensure hardirq safety. If a reset is
required, the device is wedged (a stopgap until VR driver quiescing
support allows for an actual Secondary Bus Reset).

v2:
 - Return 'int' from xe_hw_error_init() to propagate failures.(Sashiko)
 - Use devm_add_action_or_reset() for teardown to prevent MMIO faults
   during PCI unbind.(Sashiko)
 - Add xe_pm_runtime guard in the worker thread.(Sashiko)

Assisted-by: LLM
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 +
 drivers/gpu/drm/xe/xe_drm_ras_types.h     |  5 +++
 drivers/gpu/drm/xe/xe_hw_error.c          | 52 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_error.h          |  2 +-
 drivers/gpu/drm/xe/xe_irq.c               |  4 +-
 5 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index d8dc41851425..29a7d96a5666 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -7,3 +7,5 @@
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)
+14028434957	PLATFORM(CRESCENTISLAND)
+
diff --git a/drivers/gpu/drm/xe/xe_drm_ras_types.h b/drivers/gpu/drm/xe/xe_drm_ras_types.h
index 0be218ba2db7..7a35390a9ffd 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_drm_ras_types.h
@@ -9,6 +9,8 @@
 #include <linux/atomic.h>
 #include <drm/xe_drm.h>
 
+#include <linux/workqueue.h>
+
 struct drm_ras_node;
 
 /* Error categories reported by hardware */
@@ -46,6 +48,9 @@ struct xe_drm_ras {
 
 	/** @disable_vram_page_offline: cached configfs policy, immutable after init */
 	bool disable_vram_page_offline;
+
+	/** @nonfatal_msi_work: Worker to process uncorrectable non-fatal errors */
+	struct work_struct nonfatal_msi_work;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 5f2abc9485ff..bde707a3fb64 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -5,6 +5,8 @@
 
 #include <linux/bitmap.h>
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
@@ -14,7 +16,10 @@
 #include "xe_drm_ras.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
+#include "xe_wa.h"
 
 #define GT_HW_ERROR_MAX_ERR_BITS		16
 #define HEC_UNCORR_FW_ERR_BITS			4
@@ -173,6 +178,29 @@ static void csc_hw_error_work(struct work_struct *work)
 	xe_survivability_mode_runtime_enable(xe);
 }
 
+static void nonfatal_msi_work(struct work_struct *work)
+{
+	struct xe_drm_ras *ras = container_of(work, typeof(*ras), nonfatal_msi_work);
+	struct xe_device *xe = container_of(ras, typeof(*xe), ras);
+
+	guard(xe_pm_runtime)(xe);
+	enum xe_ras_recovery_action action = xe_ras_process_errors(xe);
+
+	/*
+	 * TODO: Request an SBR instead of wedging, once VR driver
+	 * quiescing support is in place.
+	 */
+	if (action != XE_RAS_RECOVERY_ACTION_RECOVERED)
+		xe_device_declare_wedged(xe);
+}
+
+static void hw_error_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	cancel_work_sync(&xe->ras.nonfatal_msi_work);
+}
+
 static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
@@ -436,6 +464,15 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	 * here for those platforms.
 	 */
 	if (xe->info.has_sysctrl) {
+		/*
+		 * Defer non-fatal MSI handling to process context because the GFSP
+		 * query can sleep.
+		 */
+		if (hw_err == HARDWARE_ERROR_NONFATAL && XE_DEVICE_WA(xe, 14028434957)) {
+			schedule_work(&xe->ras.nonfatal_msi_work);
+			return;
+		}
+
 		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
 		return;
 	}
@@ -541,15 +578,26 @@ static void process_hw_errors(struct xe_device *xe)
  *
  * Initialize and check for errors that occurred during boot
  * prior to driver load
+ *
+ * Return: 0 on success, negative error code on failure.
  */
-void xe_hw_error_init(struct xe_device *xe)
+int xe_hw_error_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	int err;
+
+	INIT_WORK(&xe->ras.nonfatal_msi_work, nonfatal_msi_work);
+
+	err = devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
+	if (err)
+		return err;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
-		return;
+		return 0;
 
 	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
 
 	process_hw_errors(xe);
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
index 5e3a11424108..a9af4c947d77 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.h
+++ b/drivers/gpu/drm/xe/xe_hw_error.h
@@ -11,5 +11,5 @@ struct xe_tile;
 struct xe_device;
 
 void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
-void xe_hw_error_init(struct xe_device *xe);
+int xe_hw_error_init(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..5ea50d203db1 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -811,7 +811,9 @@ int xe_irq_install(struct xe_device *xe)
 	int nvec = 1;
 	int err;
 
-	xe_hw_error_init(xe);
+	err = xe_hw_error_init(xe);
+	if (err)
+		return err;
 
 	xe_irq_reset(xe);
 
-- 
2.43.0

