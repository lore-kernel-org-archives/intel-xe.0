Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0C0CA6004
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F6910F7C6;
	Wed,  7 Oct 2026 21:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlsuB158";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29ECF10F7C6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407681; x=1822943681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5pCtUUpycjCeMHKTNOXf2drXo+OJMQJwMt729gDUZE=;
 b=HlsuB15800qPEC/g/R8/u5gBvV0l6QoAwS24IheXfYkEkA5WDIvoG2Up
 w+WlJ32YMiCj1batYY/gR3SLF2gq1hqk9E7RWBm8G4UeXtB60SOE8wqlG
 OO3PWO3RzZf9HiZf2yI9R4y99v5fHueNgufVgMZz/Fvpt/WzOaAq3HZWb
 6XVyYmW77BVlD7N+dXGRgKn2SqJvNwKRe7fUMgaK1a6cR2pAWiNwxk/Ie
 9IqJYzMmClynZ7PDLkazNMZajknxRtn5A6M0NlWeQNyi8L7NyR7jA147n
 LeaKsgdD0xQ7N236HPa8Ffy8Vh7Cf+oyB5Y00meAy0WEKSO5UcZHzmg36 g==;
X-CSE-ConnectionGUID: X/BpT/grSzO7fLrzbbtlQw==
X-CSE-MsgGUID: Hfc13iqfSp2xvVkfwK4Mcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="77189"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="77189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:14:37 -0700
X-CSE-ConnectionGUID: +ajI2Hz3TyKkVFYjx2gxVw==
X-CSE-MsgGUID: 9vGiNHlzSbGWun2ji4+j0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="305526933"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa001.fm.intel.com with ESMTP; 07 Oct 2026 14:14:36 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v5 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
Date: Thu,  8 Oct 2026 02:44:17 +0530
Message-ID: <20261007211417.2093611-13-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
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

Replace few drm_err()/drm_info() with xe_log_err_fatal()/xe_log_info()
using the VRAM component tag. The "no CPU visible VRAM" error uses
tile or device as the log location depending on the caller context.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

---
v2:
 - Update the ternary condition (Mallesh)
---
---
 drivers/gpu/drm/xe/xe_vram.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 2441ffe77edb..d44a92e97195 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -17,6 +17,7 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
+#include "xe_log.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_mmio.h"
@@ -46,7 +47,8 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	if (!resource_is_valid(pdev, LMEM_BAR)) {
-		drm_err(&xe->drm, "pci resource is not valid\n");
+		xe_log_err_fatal(xe, VRAM, -ENXIO,
+				 "PCI resource is not valid\n");
 		return -ENXIO;
 	}
 
@@ -227,15 +229,14 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 
 static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct drm_device *drm = &xe->drm;
 
 	if (vram->io_size < vram->usable_size)
-		drm_info(drm, "Small BAR device\n");
+		xe_log_info(xe, VRAM, "Small BAR device\n");
 
-	drm_info(drm,
-		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
-	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+	xe_log_info(xe, VRAM,
+		    "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		    vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	xe_log_info(xe, VRAM, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
 		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
 		 &vram->io_start, vram->io_start + (u64)vram->io_size);
 }
@@ -254,8 +255,9 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
-			tile ? "Tile" : "Device");
+		xe_log_err_fatal(xe, VRAM, -ENODEV,
+				 "%s without any CPU visible VRAM. Aborting.\n",
+				 tile ? "Tile" : "Device");
 		return -ENODEV;
 	}
 
@@ -320,7 +322,7 @@ int xe_vram_probe(struct xe_device *xe)
 	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
+	xe_log_info(xe, VRAM, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
 	remain_io_size = lmem_bar.io_size;
 
@@ -342,8 +344,9 @@ int xe_vram_probe(struct xe_device *xe)
 			return err;
 
 		if (total_size > lmem_bar.io_size) {
-			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &lmem_bar.io_size);
+			xe_log_info(xe, VRAM,
+				    "Total size %pa is larger than resource %pa\n",
+				    &total_size, &lmem_bar.io_size);
 		}
 
 		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
-- 
2.54.0

