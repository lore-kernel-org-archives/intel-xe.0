Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C785FC5DF87
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892E310EEA9;
	Wed, 19 Aug 2026 19:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StVBo2PE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382F610EEAA
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166904; x=1818702904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XjLkT8YX2Du6zdrPSGpHmzzb5JEOgUr8XSYd1DAMfxU=;
 b=StVBo2PE0qjhPCqJFQNfnHyTeNHBPz6NL/PvsUWQn4y2aZHeCZ3CUSc+
 HLsjK8NHSYM7xRFpNxqKf08t3JeJuZekhBW4mnuikk3QY88RxspFWMVAN
 Cnk83OiFSLb0AEMMT5FXFxNN04HSqfTmWwpONiogM5ZN7f6LitQSq5aIW
 3UT769q7AqP806h3vhDVhgMrI4op8gXAaLpC/RYi8nKqPnonqkqqMKFUO
 kkyc2r+ZlucRmcM6WQ3lZpEEle64AwpJJNcOVqOBX2TnFEPel5uOv4GTP
 C3IlpqS14RhzgkwLnY/NRBjdWGcf7zb4DQgm+0mv51xX8Vqc6OVZplt/i A==;
X-CSE-ConnectionGUID: DwpcxO+7SU2pUvXnR/ixcQ==
X-CSE-MsgGUID: vwTtSFRtSm++oX/ARWUt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647303"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647303"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:15:04 -0700
X-CSE-ConnectionGUID: hQJoiKMuTMauqk5vyu3FMA==
X-CSE-MsgGUID: fN+QRiGsTTWFPydwYVjbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556786"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:15:03 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 12/12] drm/xe/vram: Report VRAM errors using structured xe_log
 API
Date: Thu, 20 Aug 2026 00:44:41 +0530
Message-ID: <20260819191442.1957986-13-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
using the VRAM component tag.

Move the "no CPU visible VRAM" error out of vram_region_init() into its
callers so that tile-based usage logs with the tile as location while
device-level usage logs with the device. This gives better diagnostics
by identifying which tile has no visible VRAM.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 23eb7edbdd57..9fae593b0741 100644
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
+		xe_log_err_fatal(xe, VRAM, -ENXIO, "pci resource is not valid\n");
 		return -ENXIO;
 	}
 
@@ -236,10 +237,8 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_start = lmem_bar->io_start + offset;
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
-	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+	if (!vram->io_size)
 		return -ENODEV;
-	}
 
 	vram->dpa_base = lmem_bar->dpa_base + offset;
 	vram->mapping = lmem_bar->mapping + offset;
@@ -295,7 +294,8 @@ int xe_vram_probe(struct xe_device *xe)
 	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
+	xe_log_info(xe, VRAM, "VISIBLE VRAM: %pa, %pa\n",
+		    &lmem_bar.io_start, &lmem_bar.io_size);
 
 	remain_io_size = lmem_bar.io_size;
 
@@ -311,14 +311,18 @@ int xe_vram_probe(struct xe_device *xe)
 		total_size += region_size;
 		available_size += usable_size;
 
-		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar,
+				       tile_offset, usable_size,
 				       region_size, remain_io_size);
-		if (err)
+		if (err) {
+			xe_log_err_fatal(tile, VRAM, -ENODEV,
+					 "without any CPU visible VRAM. Aborting.\n");
 			return err;
+		}
 
 		if (total_size > lmem_bar.io_size) {
-			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &lmem_bar.io_size);
+			xe_log_info(xe, VRAM, "%pa is larger than resource %pa\n",
+				    &total_size, &lmem_bar.io_size);
 		}
 
 		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
@@ -326,8 +330,11 @@ int xe_vram_probe(struct xe_device *xe)
 
 	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
 			       lmem_bar.io_size);
-	if (err)
+	if (err) {
+		xe_log_err_fatal(xe, VRAM, -ENODEV,
+				 "without any CPU visible VRAM. Aborting.\n");
 		return err;
+	}
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
-- 
2.54.0

