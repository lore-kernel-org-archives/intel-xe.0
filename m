Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944DBC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 11:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5368310EC53;
	Tue, 30 Jun 2026 11:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERSIYbuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FDF10EC53
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782820745; x=1814356745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1eGIR9jg0U09YcJ50gO9TbtbUyMve1GhP/3CdNLYk3I=;
 b=ERSIYbuFW88Zoc81xoPAyXtwxYk/NpZOafwpppuaOLB6yBkgezPnT66W
 ecUev6+whAJDcN87y3wa07645hXScwx/npn+mUmfoRHzguxrmtnNBfrwA
 09l5qP0WgCh1kIq9locL7148vrvJMieRxFIVKSo0/ugTv7+JkpVOdvGk4
 +3ugSfhKRpyK3M3AM1TrC9T2uyuRxuj2GMna5M4q+Q/TAQj6Mr0rPrGDD
 IlWF9JUK/RxWYPxCbr+GSqo0KdYMMzH7mIINTJHhv/sMmK50384gCdjCI
 GifXMEHRtNpz+T8egZVlzqglHAV+QI1f3MK4oFuROfHmJ/bIFo86lzLF6 A==;
X-CSE-ConnectionGUID: 9MehOn9eRE+km8NzP/lSWA==
X-CSE-MsgGUID: hREL3m3DQQyLEdx7dEyK+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106323583"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="106323583"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:59:05 -0700
X-CSE-ConnectionGUID: NXvafTnKTSCeQWoagPYYog==
X-CSE-MsgGUID: rK5XLb6XStmYpXqyv7V0xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="255839720"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 04:59:00 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [RFC PATCH v4 5/5] drm/xe: Replace critical drm_err log with
 xe_ras_log_probe
Date: Tue, 30 Jun 2026 17:25:09 +0530
Message-ID: <20260630115503.407158-12-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
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

From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Replace the drm_err() call with xe_ras_log_probe
starting from the xe_pci_probe considering the only considering the
init paths for the object such mmio, pcode, pci etc. are fall under
the xe_ras_log_probe() category.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_hwmon.c  |  4 +++-
 drivers/gpu/drm/xe/xe_irq.c    |  5 +++--
 drivers/gpu/drm/xe/xe_mmio.c   |  5 +++--
 drivers/gpu/drm/xe/xe_pat.c    |  6 ++++--
 drivers/gpu/drm/xe/xe_pci.c    | 14 +++++++++-----
 drivers/gpu/drm/xe/xe_pcode.c  |  5 +++--
 drivers/gpu/drm/xe/xe_vram.c   |  5 +++--
 8 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7538ac7c7dfb..208dc6e378ba 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -589,7 +589,7 @@ int xe_device_init_early(struct xe_device *xe)
 		 * Cleanup done in xe_device_destroy via
 		 * drmm_add_action_or_reset register above
 		 */
-		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
+		xe_ras_log_probe(xe, -ENOMEM, "Failed to allocate xe workqueues\n");
 		return -ENOMEM;
 	}
 
@@ -649,7 +649,7 @@ static void __xe_driver_flr(struct xe_device *xe)
 	 */
 	ret = xe_mmio_wait32(mmio, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
 	if (ret) {
-		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
+		xe_ras_log_probe(xe, -ret, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
 		return;
 	}
 	xe_mmio_write32(mmio, GU_DEBUG, DRIVERFLR_STATUS);
@@ -660,7 +660,7 @@ static void __xe_driver_flr(struct xe_device *xe)
 	/* Wait for hardware teardown to complete */
 	ret = xe_mmio_wait32(mmio, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
 	if (ret) {
-		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
+		xe_ras_log_probe(xe, -ret, "Driver-FLR-teardown wait completion failed! %d\n", ret);
 		return;
 	}
 
@@ -668,7 +668,7 @@ static void __xe_driver_flr(struct xe_device *xe)
 	ret = xe_mmio_wait32(mmio, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
 			     flr_timeout, NULL, false);
 	if (ret) {
-		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
+		xe_ras_log_probe(xe, -ret, "Driver-FLR-reinit wait completion failed! %d\n", ret);
 		return;
 	}
 
@@ -720,7 +720,7 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return 0;
 
 mask_err:
-	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
+	xe_ras_log_probe(xe, -err, "Can't set DMA mask/consistent mask (%d)\n", err);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..efca13c2a897 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -18,6 +18,7 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_ras_log.h"
 #include "xe_sriov.h"
 #include "xe_pm.h"
 #include "xe_vsec.h"
@@ -1575,7 +1576,8 @@ int xe_hwmon_register(struct xe_device *xe)
 								&hwmon_chip_info,
 								hwmon_groups);
 	if (IS_ERR(hwmon->hwmon_dev)) {
-		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
+		xe_ras_log_probe(xe, -PTR_ERR(hwmon->hwmon_dev),
+				 "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
 		xe->hwmon = NULL;
 		return PTR_ERR(hwmon->hwmon_dev);
 	}
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..8453681956c4 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -23,6 +23,7 @@
 #include "xe_mert.h"
 #include "xe_mmio.h"
 #include "xe_pxp.h"
+#include "xe_ras_log.h"
 #include "xe_sriov.h"
 #include "xe_sysctrl.h"
 #include "xe_tile.h"
@@ -822,7 +823,7 @@ int xe_irq_install(struct xe_device *xe)
 
 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err < 0) {
-		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
+		xe_ras_log_probe(xe, -EINVAL, "Failed to allocate IRQ vectors: %d\n", err);
 		return err;
 	}
 
@@ -891,7 +892,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
 		return 0;  /* MSI */
 
 	if (nvec < 0) {
-		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
+		xe_ras_log_probe(xe, -nvec, "Failed getting MSI-X vectors count: %d\n", nvec);
 		return nvec;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7fa18dfcb5a2..d10ba886dcda 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -16,6 +16,7 @@
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_printk.h"
+#include "xe_ras_log.h"
 #include "xe_sriov.h"
 #include "xe_tile_printk.h"
 #include "xe_trace.h"
@@ -105,13 +106,13 @@ int xe_mmio_probe_early(struct xe_device *xe)
 
 	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
-		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
+		xe_ras_log_probe(xe, -EIO, "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
 	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	if (xe->mmio.size < SZ_16M) {
-		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
+		xe_ras_log_probe(xe, -EIO, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
 		return -EIO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index fad5b5a5ed4a..49d2e81090d3 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -17,6 +17,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
+#include "xe_ras_log.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
 
@@ -650,8 +651,9 @@ void xe_pat_init_early(struct xe_device *xe)
 		 * raise an error rather than trying to silently inherit the
 		 * most recent platform's behavior.
 		 */
-		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
-			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		xe_ras_log_probe(xe, -ENODEV,
+				 "Missing PAT table for platform with graphics version %d.%02d!\n",
+				 GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 
 	xe_assert(xe, xe->pat.ops->dump);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9c249454cc95..58442d9eb8a0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -31,6 +31,7 @@
 #include "xe_pci_types.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
+#include "xe_ras_log.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
 #include "xe_survivability_mode.h"
@@ -708,8 +709,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_ras_log_probe(xe, -ENODEV,
+				 "Hardware reports unknown graphics version %u.%02u\n",
+				 ver / 100, ver % 100);
 	}
 
 	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
@@ -722,8 +724,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*media_ip = find_media_ip(ver);
 	if (!*media_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_ras_log_probe(xe, -ENODEV,
+				 "Hardware reports unknown media version %u.%02u\n",
+				 ver / 100, ver % 100);
 	}
 
 	return 0;
@@ -1022,7 +1025,8 @@ static int xe_info_init(struct xe_device *xe,
 		 * required for VRAM management).
 		 */
 		if (!tile->primary_gt) {
-			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
+			xe_ras_log_probe(xe, -ENODEV,
+					 "Cannot probe device with without a primary GT\n");
 			return -ENODEV;
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 866986694d9c..046336c7b378 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -15,6 +15,7 @@
 #include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
+#include "xe_ras_log.h"
 
 /**
  * DOC: PCODE
@@ -316,8 +317,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 		mutex_unlock(&tile->pcode.lock);
 
 	if (ret)
-		drm_err(&xe->drm,
-			"PCODE initialization timedout after: 3 min\n");
+		xe_ras_log_probe(xe, -ETIMEDOUT,
+				 "PCODE initialization timedout after: 3 min\n");
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 23eb7edbdd57..e81d92239934 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -18,6 +18,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
 #include "xe_mmio.h"
+#include "xe_ras_log.h"
 #include "xe_sriov.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_ttm_vram_mgr.h"
@@ -43,7 +44,7 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	if (!resource_is_valid(pdev, LMEM_BAR)) {
-		drm_err(&xe->drm, "pci resource is not valid\n");
+		xe_ras_log_probe(xe, -ENXIO, "pci resource is not valid\n");
 		return -ENXIO;
 	}
 
@@ -237,7 +238,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		xe_ras_log_probe(xe, -ENODEV, "Tile without any CPU visible VRAM. Aborting.\n");
 		return -ENODEV;
 	}
 
-- 
2.34.1

