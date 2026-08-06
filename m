Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B2BC55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 11:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7219F10F18B;
	Thu,  6 Aug 2026 11:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGtJVJQU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D504210F18C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786014057; x=1817550057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mDnnNwOHMzCkKeAHqFafKOToBVvRgj9DSKDqhm9WY3s=;
 b=iGtJVJQUDXIi1f0YlZJzuhBVjEwcbY6sFUXXhIeSIg4Yvq+3wLpr8622
 c/raaclB+CNVaWeUTZCl3fazaIguzcwhdgSGU8eAwZlXINYOk/Cw6nZVp
 COl4MuZpPJLSwUmzPl04eNgCd4d2kIkwORVftpMejHwWUoFSETyRv2wl5
 HvohGhjIRV5BqTu3oVQzE567Hz3PyPm4UPqpPS3/mupFQnaWP0BM4g391
 Jqi0VXjPYL7YztwM+6/YiTDC+k6ApNJKjkKclyQVmtIsYDRn5ZcHiHOhL
 eiELHqWzY5IU7PNtl5OvDwVzdhgPMM0LcgL96qS5exvu26ykkWNSwoPpg A==;
X-CSE-ConnectionGUID: S5bEqMpXQBCFQkXTipwq+w==
X-CSE-MsgGUID: TAkwe3G6QMG0H7E/FxJxog==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86614758"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86614758"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:00:57 -0700
X-CSE-ConnectionGUID: rH669kJZS1GLPBtlLwDVJA==
X-CSE-MsgGUID: 355DCmgRSPORgGQ5X7ts7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="259453642"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2026 04:00:53 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 2/4] drm/xe: Use xe_log SIGID API for probe-path error
 reporting
Date: Thu,  6 Aug 2026 16:30:42 +0530
Message-ID: <20260806110039.1245282-8-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
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

Replace ad-hoc drm_err()/xe_err() calls in the probe path with
structured SIGID logging helpers. This gives fleet tooling a stable,
machine-parseable identifier (SIGID) for each recognised fault
situation rather than relying on fragile string matching.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ++++--
 drivers/gpu/drm/xe/xe_hwmon.c  |  4 +++-
 drivers/gpu/drm/xe/xe_irq.c    |  9 +++++----
 drivers/gpu/drm/xe/xe_mmio.c   |  5 +++--
 drivers/gpu/drm/xe/xe_pat.c    |  6 ++++--
 drivers/gpu/drm/xe/xe_pci.c    | 14 +++++++++-----
 drivers/gpu/drm/xe/xe_pcode.c  |  5 +++--
 drivers/gpu/drm/xe/xe_vram.c   |  5 +++--
 8 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d25d02b24898..52bafe708d74 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -48,6 +48,7 @@
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_nvm.h"
@@ -586,7 +587,8 @@ int xe_device_init_early(struct xe_device *xe)
 		 * Cleanup done in xe_device_destroy via
 		 * drmm_add_action_or_reset register above
 		 */
-		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
+		xe_log_err_fatal(xe, PROBE, -ENOMEM, "Failed to allocate xe workqueues\n");
+
 		return -ENOMEM;
 	}
 
@@ -717,7 +719,7 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return 0;
 
 mask_err:
-	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
+	xe_log_err(xe, PROBE, err, "Can't set DMA mask/consistent mask\n");
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..e4c319598dd0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -15,6 +15,7 @@
 #include "regs/xe_pcode_regs.h"
 #include "xe_device.h"
 #include "xe_hwmon.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
@@ -1575,7 +1576,8 @@ int xe_hwmon_register(struct xe_device *xe)
 								&hwmon_chip_info,
 								hwmon_groups);
 	if (IS_ERR(hwmon->hwmon_dev)) {
-		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
+		xe_log_err(xe, PROBE, PTR_ERR(hwmon->hwmon_dev),
+			   "Failed to register xe hwmon\n");
 		xe->hwmon = NULL;
 		return PTR_ERR(hwmon->hwmon_dev);
 	}
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..74d2b63cd505 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -19,6 +19,7 @@
 #include "xe_hw_engine.h"
 #include "xe_hw_error.h"
 #include "xe_i2c.h"
+#include "xe_log.h"
 #include "xe_memirq.h"
 #include "xe_mert.h"
 #include "xe_mmio.h"
@@ -759,14 +760,14 @@ static int xe_irq_msi_request_irqs(struct xe_device *xe)
 
 	irq_handler = xe_irq_handler(xe);
 	if (!irq_handler) {
-		drm_err(&xe->drm, "No supported interrupt handler");
+		xe_log_err(xe, PROBE, -EINVAL, "No supported interrupt handler\n");
 		return -EINVAL;
 	}
 
 	irq = pci_irq_vector(pdev, 0);
 	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
 	if (err < 0) {
-		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+		xe_log_err(xe, PROBE, err, "Failed to request MSI IRQ\n");
 		return err;
 	}
 
@@ -822,7 +823,7 @@ int xe_irq_install(struct xe_device *xe)
 
 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err < 0) {
-		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
+		xe_log_err(xe, PROBE, err, "Failed to allocate IRQ vectors\n");
 		return err;
 	}
 
@@ -891,7 +892,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
 		return 0;  /* MSI */
 
 	if (nvec < 0) {
-		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
+		xe_log_err(xe, PROBE, nvec, "Failed getting MSI-X vectors count\n");
 		return nvec;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7fa18dfcb5a2..bcf36a381424 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -15,6 +15,7 @@
 #include "regs/xe_bars.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_log.h"
 #include "xe_printk.h"
 #include "xe_sriov.h"
 #include "xe_tile_printk.h"
@@ -105,13 +106,13 @@ int xe_mmio_probe_early(struct xe_device *xe)
 
 	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
-		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
+		xe_log_err(xe, PROBE, -EIO, "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
 	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	if (xe->mmio.size < SZ_16M) {
-		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
+		xe_log_err(xe, PROBE, -EIO, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
 		return -EIO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index a5fe1beec652..aad15a4b0ac3 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -16,6 +16,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
@@ -686,8 +687,9 @@ void xe_pat_init_early(struct xe_device *xe)
 		 * raise an error rather than trying to silently inherit the
 		 * most recent platform's behavior.
 		 */
-		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
-			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
+		xe_log_err(xe, PROBE, -ENODEV,
+			   "Missing PAT table for platform with graphics version %d.%02d!\n",
+			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
 	}
 
 	xe_assert(xe, xe->pat.ops->dump);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 36d62927b969..3c452f399e6d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -25,6 +25,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_error.h"
@@ -718,8 +719,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, PROBE, -ENODEV,
+			   "Hardware reports unknown graphics version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
@@ -732,8 +734,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*media_ip = find_media_ip(ver);
 	if (!*media_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, PROBE, -ENODEV,
+			   "Hardware reports unknown media version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	return 0;
@@ -1088,7 +1091,8 @@ static int xe_info_init(struct xe_device *xe,
 		 * required for VRAM management).
 		 */
 		if (!tile->primary_gt) {
-			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
+			xe_log_err_fatal(xe, PROBE, -ENODEV,
+					 "Cannot probe device without a primary GT\n");
 			return -ENODEV;
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index ccc3bdeed6bb..c492737242d3 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -14,6 +14,7 @@
 #include "regs/xe_pmt.h"
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_pm.h"
@@ -320,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 		mutex_unlock(&tile->pcode.lock);
 
 	if (ret)
-		drm_err(&xe->drm,
-			"PCODE initialization timedout after: 3 min\n");
+		xe_log_err(xe, PCODE, -ret,
+			   "PCODE initialization timedout after: 3 min\n");
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 23eb7edbdd57..dada430d7ed5 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -17,6 +17,7 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_tile_sriov_vf.h"
@@ -43,7 +44,7 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	if (!resource_is_valid(pdev, LMEM_BAR)) {
-		drm_err(&xe->drm, "pci resource is not valid\n");
+		xe_log_err(xe, PROBE, -ENXIO, "pci resource is not valid\n");
 		return -ENXIO;
 	}
 
@@ -237,7 +238,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		xe_log_err(xe, PROBE, -ENODEV, "Tile without any CPU visible VRAM. Aborting.\n");
 		return -ENODEV;
 	}
 
-- 
2.48.1

