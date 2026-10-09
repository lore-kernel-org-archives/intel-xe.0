Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24FCA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 06:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1CC10FEE1;
	Fri,  9 Oct 2026 06:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOz0Fmgb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA73E10FEE1
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791529080; x=1823065080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=giRZkjGpkUiHs/CliMk4u+5Hb2zTvTNdSPkqyuCqJEE=;
 b=iOz0Fmgb77P9z/Y15e5LyB6PmdY+Y7rSMVGp6pLkjTUE9WEjsQV2dvGu
 YRWYTzBGgAVFh7gNZxpgjidJLH4ORuWaCzNiGe0mGif64q0TIKIvkcpCB
 N7P4zlz8+4yj08xy0RKXiMbUoOTYVfoIX8durZFcQOwdgWZqNXm4cdl9x
 SkpnutCfNXW1VEFzrxqf7NELtX/ARykIf2XwrHF7T9iKdIekxD/jsyOh0
 Nltl3B8Cymx7rlYMDgtBB9KpXi3NNZr0Cg3pEDsdjBR5dnby2XfqCP2E2
 ZFfEX+mqv8cELCyX/eJoDcmMkPU5guxMthOwm032txd721rMV66apzg9r g==;
X-CSE-ConnectionGUID: /7aHmNQWQTKd4O8JGOIIWw==
X-CSE-MsgGUID: fT9HlsgdRKSbkPqlk9rNuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="327272"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="327272"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:58:00 -0700
X-CSE-ConnectionGUID: keqBmBT6Rna2JPtMo/zQkw==
X-CSE-MsgGUID: oHxnLEVvRE6VIhZ+NdI/9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2062825"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:57:59 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tejas.upadhyay@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe: Add wa_14028434957 to Graphics Version 35.11
Date: Fri,  9 Oct 2026 12:27:49 +0530
Message-ID: <20261009065748.1304076-2-varun.gupta@intel.com>
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

Assisted-by: LLM
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_drm_ras_types.h     |  5 +++
 drivers/gpu/drm/xe/xe_hw_error.c          | 39 +++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index d8dc41851425..36b2567994db 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -7,3 +7,4 @@
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)
+14028434957	PLATFORM(CRESCENTISLAND)
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
index 5f2abc9485ff..847ca1ae411e 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -5,6 +5,8 @@
 
 #include <linux/bitmap.h>
 
+#include <drm/drm_managed.h>
+
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_hw_error_regs.h"
 #include "regs/xe_irq_regs.h"
@@ -14,7 +16,9 @@
 #include "xe_drm_ras.h"
 #include "xe_hw_error.h"
 #include "xe_mmio.h"
+#include "xe_ras.h"
 #include "xe_survivability_mode.h"
+#include "xe_wa.h"
 
 #define GT_HW_ERROR_MAX_ERR_BITS		16
 #define HEC_UNCORR_FW_ERR_BITS			4
@@ -173,6 +177,27 @@ static void csc_hw_error_work(struct work_struct *work)
 	xe_survivability_mode_runtime_enable(xe);
 }
 
+static void nonfatal_msi_work(struct work_struct *work)
+{
+	struct xe_drm_ras *ras = container_of(work, typeof(*ras), nonfatal_msi_work);
+	struct xe_device *xe = container_of(ras, typeof(*xe), ras);
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
+static void hw_error_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	cancel_work_sync(&xe->ras.nonfatal_msi_work);
+}
+
 static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
@@ -436,6 +461,15 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
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
@@ -546,6 +580,11 @@ void xe_hw_error_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 
+	INIT_WORK(&xe->ras.nonfatal_msi_work, nonfatal_msi_work);
+
+	if (drmm_add_action_or_reset(&xe->drm, hw_error_fini, xe))
+		drm_err(&xe->drm, "Failed to register hw_error_fini\n");
+
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-- 
2.43.0

