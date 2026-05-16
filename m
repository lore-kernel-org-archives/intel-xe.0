Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E900CD4F21
	for <intel-xe@archiver.kernel.org>; Sat, 16 May 2026 09:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3242D10E189;
	Sat, 16 May 2026 09:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pa4AfKIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68FB10E189
 for <intel-xe@lists.freedesktop.org>; Sat, 16 May 2026 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778924160; x=1810460160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KMjNvovxZQMkKPa7p0A7EfQEvLUD6GQZfyb0jR1+oR8=;
 b=Pa4AfKISPORqVUZyM0v8MstErm/O705fOlYmX5fvTaENJGUieprgKCzf
 mPp0UaQX9shTBeZsuwGYcV9TTK004pSBQ/todinw8uPAvxAmkqYZa/XN9
 KTsLcrXC4aCNwpFqbNYzvjjLY4d96FZRKn9ecuKUudxuQ0WHUUib3p2W/
 xrEsnpGOguAENi9WyjoMxK2W0XUUqwBtQxSBhcJ8f1NwS0Ny75q7Dihne
 sqaAjpQbosJmK8ckZU8PqHZAX2BAqoH2YuMav8i1+KViphzTOz9VJSS0s
 8O1DPM5h/rW9Oka5u23qpPcStSBG96RD4VA3e/jpQpSNFG90c19IrAHJO A==;
X-CSE-ConnectionGUID: kYJlLqShT5ajwAM+xiUZuQ==
X-CSE-MsgGUID: Gmq384MuSji2hOyhT6ItHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90441953"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="90441953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 02:36:00 -0700
X-CSE-ConnectionGUID: xx+ilf4URDaQeqGoNhndXw==
X-CSE-MsgGUID: ANpGv13RQpmGCvtpMeAVyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; d="scan'208";a="243911696"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 16 May 2026 02:35:55 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 8/8] drm/xe/pci: Introduce PCIe FLR
Date: Sat, 16 May 2026 15:01:31 +0530
Message-ID: <20260516093131.27442-9-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516093131.27442-1-raag.jadav@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
---
v2: Spell out Function Level Reset (Jani)
v5: Prevent PM ref leak for wedged device (Matthew Brost)
v6: Add PCIe FLR documentation (Daniele)
v7: Refine PCIe FLR documentation (Daniele)
    Introduce xe_pci_reset_skip() helper (Lukasz)
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_pci.c          |   1 +
 drivers/gpu/drm/xe/xe_pci.h          |   2 +
 drivers/gpu/drm/xe/xe_pci_error.c    | 121 +++++++++++++++++++++++++++
 5 files changed, 128 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 09661f079d03..091872771e98 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -101,6 +101,7 @@ xe-y += xe_bb.o \
 	xe_page_reclaim.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_error.o \
 	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..062fd7eb17e6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -480,6 +480,9 @@ struct xe_device {
 	/** @pxp: Encapsulate Protected Xe Path support */
 	struct xe_pxp *pxp;
 
+	/** @flr_prepared: Prepared for function-reset */
+	bool flr_prepared;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1243c7d8ed10..4bce90341c3c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1340,6 +1340,7 @@ static struct pci_driver xe_pci_driver = {
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
+	.err_handler = &xe_pci_error_handlers,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 11bcc5fe2c5b..24e51a71a959 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -8,6 +8,8 @@
 
 struct pci_dev;
 
+extern const struct pci_error_handlers xe_pci_error_handlers;
+
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
new file mode 100644
index 000000000000..9f0efe5f0ae2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_device.h"
+#include "xe_printk.h"
+#include "xe_sriov_pf_helpers.h"
+
+/**
+ * DOC: PCI Error Handling
+ *
+ * Xe driver registers PCI callbacks which are called by PCI core in case of
+ * bus errors or resets.
+ *
+ * Currently only Function Level Reset (FLR) callbacks are supported. PCIe FLR
+ * wipes the VRAM and resets the state of all the hardware units. Therefore, the
+ * contents of all exec queues and BOs in VRAM are lost and the hardware needs a
+ * full re-initialization. The way Xe driver handles it, is pretty much similar
+ * to system suspend/resume flow with a few notable exceptions.
+ *
+ * Prepare phase:
+ * - Temporarily wedge the device to prevent userspace access
+ * - Kill exec queues which signals all fences and frees in-flight jobs
+ * - Stop the scheduler and all submissions to GuC
+ * - The fact that FLR is needed is because hardware could be in corrupted state
+ *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
+ *   contents
+ * - Remove all memory mappings since VRAM contents will be lost
+ *
+ * Re-initialization phase:
+ * - Recreate kernel BOs due to skipped memory eviction in prepare phase
+ * - Restore kernel queues which were killed in prepare phase
+ * - Reload all uC firmwares
+ * - Bring up all hardware units
+ * - Unwedge the device to allow userspace access
+ *
+ * Since VRAM contents are lost, the user is expected to recreate user memory
+ * and reload context.
+ *
+ * TODO: Add PCIe error handling callbacks using similar flow.
+ *
+ * Current implementation is only limited to re-initializing GT. This needs to
+ * be extended for a lot of components listed below.
+ *
+ * - Proper re-initialization of GSC and PXP for integrated platforms
+ * - SR-IOV cases which need PF and VF synchronization
+ * - Re-initialization of all child devices registered by Xe
+ * - User memory handling and MM corner cases
+ * - Display
+ */
+
+static inline bool xe_pci_reset_skip(struct xe_device *xe)
+{
+	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
+}
+
+static void xe_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	if (xe_pci_reset_skip(xe)) {
+		xe_err(xe, "PCIe FLR not supported\n");
+		return;
+	}
+
+	if (xe_device_wedged(xe)) {
+		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
+		return;
+	}
+
+	/* Wedge the device to prevent userspace access but don't send the event yet */
+	atomic_set(&xe->wedged.flag, 1);
+
+	/*
+	 * The hardware could be in corrupted state and access unreliable, but we try to
+	 * update data structures and cleanup any pending work to avoid side effects during
+	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
+	 */
+	if (xe_device_suspend(xe, true)) {
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
+
+	if (xe_pci_reset_skip(xe))
+		return;
+
+	if (!xe_device_wedged(xe) || !xe->flr_prepared)
+		return;
+
+	/* Unprepare early in case we fail */
+	xe->flr_prepared = false;
+
+	/*
+	 * We already have the data structures intact, so try to re-initialize the device.
+	 * This will be similar to system resume flow, except we'll also need to recreate
+	 * kernel bos and restore kernel queues.
+	 */
+	if (xe_device_resume(xe, true)) {
+		xe_err(xe, "Re-initialization failed\n");
+		return;
+	}
+
+	/* Unwedge to allow userspace access */
+	atomic_set(&xe->wedged.flag, 0);
+
+	xe_info(xe, "Re-initialization success\n");
+}
+
+const struct pci_error_handlers xe_pci_error_handlers = {
+	.reset_prepare = xe_pci_reset_prepare,
+	.reset_done = xe_pci_reset_done,
+};
-- 
2.43.0

