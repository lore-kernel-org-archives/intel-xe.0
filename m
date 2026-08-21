Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99765C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2076E10E27E;
	Fri, 21 Aug 2026 11:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAh+PY0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E846910E2A1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787311551; x=1818847551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cM9c5ouSau5ycy1tU//eqP54Dz2n4zkuPLrJbyqjPjg=;
 b=oAh+PY0As5eDz5UxC/ZY/uHVlTlRyZXdDBApEKJzShIEYPtB9VmFXq8v
 7myeK0x3NyCwWMUXfWNbDqlfM1XrN7QJMjBuXhtTHiL8O8/Ea82dAAuZn
 eJLOm8ZWTq6uQ/kRNaANNMIm66w/ABUCgz0CZaLWE6hvLoCYiKNn0vqMC
 0DJNYEQkZrzv+OSgEiSBek64hatU0VCdX5gd53uDqgI8K0A3SXlwQkpXo
 x9k0jmcpCw5SsQsCpmVL9WSbS+c9fmc0b7nnFAi5fgJJ14mabPATxF5Kb
 BhMomCh6kgNFDKQVrXf0agv3M6QOHaUpImuw21Uc51T9s0lM/cxhP6+IU A==;
X-CSE-ConnectionGUID: 7PyyKmUZQNCSPH8D+4BUNA==
X-CSE-MsgGUID: U+mjuCRESt2pbjiL2fmxKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="90377568"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90377568"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:25:51 -0700
X-CSE-ConnectionGUID: +swtU7yRS6iG827144GQ8A==
X-CSE-MsgGUID: huIcevq7QcuXpsheYj32Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304523469"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 04:25:47 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
Date: Fri, 21 Aug 2026 16:53:31 +0530
Message-ID: <20260821112436.545405-10-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112436.545405-1-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
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

With bare minimum pieces in place, we can finally introduce PCIe Function
Level Reset (FLR) support which re-initializes hardware state without the
need for reloading the driver from userspace. All VRAM contents are lost
along with hardware state and driver takes care of recreating the required
kernel bos as part of re-initialization, but user still needs to recreate
user bos and reload context after PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 v2: Spell out Function Level Reset (Jani)
 v5: Prevent PM ref leak for wedged device (Matthew Brost)
 v6: Add PCIe FLR documentation (Daniele)
 v7: Refine PCIe FLR documentation (Daniele)
     Introduce xe_pci_reset_skip() helper (Lukasz)
 v9: Add 'Xe' prefix to document title (Rodrigo)
v10: Update documentation to include PCI Error Handling (Lukasz)
     Maintain wedged reference on FLR failure (Lukasz)
---
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c    | 128 +++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7be3f15bf7a0..8cbb5b747710 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -518,6 +518,9 @@ struct xe_device {
 	/** @pxp: Encapsulate Protected Xe Path support */
 	struct xe_pxp *pxp;
 
+	/** @flr_prepared: Prepared for function-reset */
+	bool flr_prepared;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 48466d726eae..81c4e55fae8f 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -12,8 +12,55 @@
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_survivability_mode.h"
 
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
+ * - Kill exec queues which signals all fences and frees in-flight jobs
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
+ * - Prepare existing xe_device_wedged() users for temporary wedging
+ * - MM corner cases
+ * - Display
+ */
+
 static void prepare_device_for_reset(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
@@ -142,9 +189,90 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
 	xe_device_wedged_put(xe);
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
+	err = xe_pci_reset_skip(xe);
+	if (err) {
+		xe_err(xe, "PCIe FLR not supported\n");
+		goto wedge;
+	}
+
+	err = xe_device_wedged(xe);
+	if (err)
+		xe_err(xe, "PCIe FLR failed, device in unexpected state\n");
+
+wedge:
+	/* Wedge the device to prevent userspace access but don't send the event yet */
+	xe_device_wedged_get(xe);
+	if (err)
+		return;
+
+	/*
+	 * The hardware could be in corrupted state and access unreliable, but we try to
+	 * update data structures and cleanup any pending work to avoid side effects during
+	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
+	 */
+	err = xe_device_suspend(xe, true);
+	if (err) {
+		xe_err(xe, "Failed to prepare for PCIe FLR\n");
+		return;
+	}
+
+	xe->flr_prepared = true;
+	xe_info(xe, "Prepared for PCIe FLR\n");
+}
+
+static void xe_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int err;
+
+	err = xe_pci_reset_skip(xe);
+	if (err)
+		goto out;
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
+		xe_err(xe, "Re-initialization failed\n");
+		goto out;
+	}
+
+	/* Unwedge to allow userspace access */
+	xe_device_wedged_put(xe);
+	xe_info(xe, "Re-initialization success\n");
+
+	return;
+out:
+	/* Most likely the device is unusable and there's nothing we can do about it */
+	xe_device_declare_wedged(xe);
+	/* Drop local reference */
+	xe_device_wedged_put(xe);
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

