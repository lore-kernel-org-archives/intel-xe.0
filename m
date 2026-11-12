Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C784606C710
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKXZ5EYB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2C211216D;
	Thu, 12 Nov 2026 14:02:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42CE11216D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794492148; x=1826028148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i5Rp0my19qJAykTH81qAykVwC2LCsGMTubfOIKdGq4g=;
 b=bKXZ5EYBsW/TViHw4wBeQ9W8h+3CmhyrpebCfcIzEwkmtgM5ze08C2FI
 fZwji8XhbV5jAuzS/kAh+UjkTAW18bgngW2lqpgLxg4O0qdCSiJJNT1Aj
 ERZJjpIuh8iWWlgyB8asquYUzeW2BaZg8NE2g0t9MHFBm3L1Vt+J97rQf
 yy+DSRhDcuU1F61KBbcGnti61pSBD6Hn9FvsRIDpfDP9f6agGC+QSr9po
 rW3i5WCIauWMP+IG0hQJaOFxuA9hSCYY/Sx5rlLaKFrKpS5OsDSJrU8Su
 J9bCjGMO4G6H2kt3EJZhETe+UhK4ZqFCrDxAdjsSb0Ol1Ac4A6zl411xF g==;
X-CSE-ConnectionGUID: NjgnHxEqToiMs043E2smQw==
X-CSE-MsgGUID: ni+wxmiCQnKa+F1Jy3jXmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3154886"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3154886"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 06:02:27 -0800
X-CSE-ConnectionGUID: DKqVFdPdRS2UUZB2itEAzw==
X-CSE-MsgGUID: Si17yBxHSw2qqv/tO+Sn4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="9009483"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2026 06:02:23 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, lukas@wunner.de, daniele.ceraolospurio@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v16 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
Date: Thu, 12 Nov 2026 19:30:07 +0530
Message-ID: <20261112140126.1861005-10-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112140126.1861005-1-raag.jadav@intel.com>
References: <20261112140126.1861005-1-raag.jadav@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With bare minimum pieces in place, we can finally introduce PCIe Function
Level Reset (FLR) support which re-initializes hardware state without the
need for reloading the driver from userspace. All VRAM contents are lost
along with hardware state and driver takes care of recreating the required
kernel bos as part of re-initialization, but user still needs to recreate
user bos and reload context after PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 v2: Spell out Function Level Reset (Jani)
 v5: Prevent PM ref leak for wedged device (Matthew Brost)
 v6: Add PCIe FLR documentation (Daniele)
 v7: Refine PCIe FLR documentation (Daniele)
     Introduce xe_pci_reset_skip() helper (Lukasz)
 v9: Add 'Xe' prefix to document title (Rodrigo)
v10: Update documentation to include PCI Error Handling (Lukasz)
     Maintain wedge reference on FLR failure (Lukasz)
v11: Cleanup wedge reference logic in ->reset_prepare() (Lukasz)
     Use 'PCI reset' in logs (Riana)
v12: Refine error logging (Riana)
v14: Early return on survivability mode (Riana)
---
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c    | 132 +++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 933f5d27aa62..8f2a31949073 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -537,6 +537,9 @@ struct xe_device {
 	/** @pxp: Encapsulate Protected Xe Path support */
 	struct xe_pxp *pxp;
 
+	/** @flr_prepared: Prepared for function-reset */
+	bool flr_prepared;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 0e89f320f7be..d288bb291aa1 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -16,10 +16,56 @@
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_survivability_mode.h"
 #include "xe_wa.h"
 #include "xe_wedge.h"
 
+/**
+ * DOC: Xe PCI Error Handling
+ *
+ * Xe driver registers PCI callbacks which are called by PCI core in case of
+ * bus errors or resets.
+ *
+ * Currently both Function Level Reset (FLR) and bus error handling callbacks are
+ * supported. Both wipe the VRAM and resets the state of all the hardware units.
+ * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
+ * hardware needs a full re-initialization. The way Xe driver handles it, is
+ * pretty much similar to system suspend/resume flow with a few notable exceptions.
+ *
+ * Prepare phase:
+ *
+ * - Temporarily wedge the device to prevent userspace access
+ * - Kill exec queues which signals the fences and frees in-flight jobs
+ * - Stop the scheduler and all submissions to GuC
+ * - The fact that FLR is needed is because hardware could be in corrupted state
+ *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
+ *   contents
+ * - Remove all memory mappings since VRAM contents will be lost
+ *
+ * Re-initialization phase:
+ *
+ * - Recreate kernel BOs due to skipped memory eviction in prepare phase
+ * - Restore kernel queues which were killed in prepare phase
+ * - Reload all uC firmwares
+ * - Bring up all hardware units
+ * - Unwedge the device to allow userspace access
+ *
+ * Since VRAM contents are lost, the user is expected to recreate user memory
+ * and reload context.
+ *
+ * TODO: Reuse FLR callbacks for bus error handling.
+ *
+ * Current implementation is only limited to re-initializing GT. This needs to
+ * be extended for a lot of components listed below.
+ *
+ * - Proper re-initialization of GSC and PXP for integrated platforms
+ * - SR-IOV cases which need PF and VF synchronization
+ * - Re-initialization of all child devices registered by Xe
+ * - MM corner cases
+ * - Display
+ */
+
 static void prepare_device_for_reset(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -186,9 +232,95 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
 	xe_info(xe, "PCI error: resume\n");
 }
 
+static inline bool xe_pci_reset_skip(struct xe_device *xe)
+{
+	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
+}
+
+static void xe_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int err;
+
+	err = xe_survivability_mode_is_boot_enabled(xe);
+	if (err) {
+		xe_err(xe, "PCI reset: device in survivability mode\n");
+		return;
+	}
+
+	err = xe_wedged(xe);
+	if (err)
+		xe_err(xe, "PCI reset: device in unexpected state\n");
+
+	/* Wedge the device to prevent userspace access but don't send the event yet */
+	xe_wedge_get(xe);
+	if (err)
+		return;
+
+	err = xe_pci_reset_skip(xe);
+	if (err) {
+		xe_err(xe, "PCI reset: not supported\n");
+		return;
+	}
+
+	/*
+	 * The hardware could be in corrupted state and access unreliable, but we try to
+	 * update data structures and cleanup any pending work to avoid side effects during
+	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
+	 */
+	err = xe_device_suspend(xe, false, true);
+	if (err) {
+		xe_err(xe, "PCI reset: failed to prepare\n");
+		return;
+	}
+
+	xe->flr_prepared = true;
+	xe_info(xe, "PCI reset: prepared\n");
+}
+
+static void xe_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int err;
+
+	err = xe_survivability_mode_is_boot_enabled(xe);
+	if (err)
+		return;
+
+	if (!xe->flr_prepared)
+		goto out;
+
+	/* Unprepare early in case we fail */
+	xe->flr_prepared = false;
+
+	/*
+	 * We already have the data structures intact, so try to re-initialize the device.
+	 * This will be similar to system resume flow, except we'll also need to recreate
+	 * kernel bos and restore kernel queues.
+	 */
+	err = xe_device_resume(xe, true);
+	if (err) {
+		xe_err(xe, "PCI reset: re-initialization failed\n");
+		goto out;
+	}
+
+	/* Unwedge to allow userspace access */
+	xe_wedge_put(xe);
+	xe_info(xe, "PCI reset: done\n");
+
+	return;
+out:
+	/* Most likely the device is unusable and there's nothing we can do about it */
+	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+	/* Drop local reference */
+	xe_wedge_put(xe);
+}
+
 const struct pci_error_handlers xe_pci_error_handlers = {
 	.error_detected	= xe_pci_error_detected,
 	.mmio_enabled	= xe_pci_error_mmio_enabled,
 	.slot_reset	= xe_pci_error_slot_reset,
 	.resume		= xe_pci_error_resume,
+	.reset_prepare	= xe_pci_reset_prepare,
+	.reset_done	= xe_pci_reset_done,
 };
-- 
2.43.0

