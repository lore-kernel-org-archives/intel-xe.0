Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB541CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FB310F071;
	Mon, 12 Oct 2026 12:25:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3DA10F078
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791807945; x=1823343945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GHK5e773Ww6WNVD7APGVEcZWeTyZv2YuYo59zRvIvCQ=;
 b=LtjcDZTS7W2lklLETs1WR4cbqYw5wRMnrtSV4d1HZzH+MdUmKyZ9zocy
 V11Uh5ZsJHyh/3hU0QS05rPr9CYJmGAoCnsrFw3yDvsfdes1NgXpdCmTV
 FMnhlh+CEiptPhHICyUwM6kATqU4sqP95uKcYLxJFa6sHc+OTOr+1K83g
 495ikX7e9R+GBq802BUtItBUZIIPvKsXLjcGJBbO5KjYrdpxEbZQqnKwt
 NLlZgW3dZ0OHQ9l9YgdQhwXP0MDMC6kTZcQ0A+4vCTAWvc363sX/lWfwS
 2ORVl2wTjSPQnDlW41nLlOXPp0rsCkapP3fHmAKZ79jJS0Nc+7EjHtZDX Q==;
X-CSE-ConnectionGUID: A29a1gnrTy+/o2c6wiDJbQ==
X-CSE-MsgGUID: NDerYw7uQliBzflvRUuXZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="522921"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522921"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:25:40 -0700
X-CSE-ConnectionGUID: gpidqn8GSbW+tUHcRWvPFQ==
X-CSE-MsgGUID: tTZPz8RORXqFqTk8R6EW9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962817"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 05:25:39 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v7 12/12] drm/xe/vram: Report VRAM errors using structured
 xe_log API
Date: Mon, 12 Oct 2026 17:55:21 +0530
Message-ID: <20261012122522.2307625-13-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
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

While at it, print the u64 total VRAM size with %#llx instead of %pa.
%pa expects a phys_addr_t, which is only 32 bits wide on configs
without CONFIG_PHYS_ADDR_T_64BIT, so the value could be truncated.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

---
v2:
 - Update the ternary condition (Mallesh)

v3:
 - Rephrase the log message. (Mallesh)
 - Update format specifiers for total VRAM size. (Mallesh)
---
 drivers/gpu/drm/xe/xe_vram.c | 37 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 73aef047eb38..1c02889ba29b 100644
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
 
@@ -227,17 +229,15 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 
 static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct drm_device *drm = &xe->drm;
-
 	if (vram->io_size < vram->usable_size)
-		drm_info(drm, "Small BAR device\n");
-
-	drm_info(drm,
-		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
-	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
-		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+		xe_log_info(xe, VRAM, "Small BAR device\n");
+
+	xe_log_info(xe, VRAM,
+		    "[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		    vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	xe_log_info(xe, VRAM, "[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		    vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		    &vram->io_start, vram->io_start + (u64)vram->io_size);
 }
 
 static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
@@ -255,8 +255,11 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
-			tile ? "Tile" : "Device");
+		if (tile)
+			xe_log_err_fatal(tile, VRAM, -ENODEV, "No CPU visible VRAM. Aborting.\n");
+		else
+			xe_log_err_fatal(xe, VRAM, -ENODEV, "No CPU visible VRAM. Aborting.\n");
+
 		return -ENODEV;
 	}
 
@@ -321,7 +324,8 @@ int xe_vram_probe(struct xe_device *xe)
 	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
+	xe_log_info(xe, VRAM, "VISIBLE VRAM: start %pa, size %#llx\n",
+		    &lmem_bar.io_start, (u64)lmem_bar.io_size);
 
 	remain_io_size = lmem_bar.io_size;
 
@@ -343,8 +347,9 @@ int xe_vram_probe(struct xe_device *xe)
 			return err;
 
 		if (total_size > lmem_bar.io_size) {
-			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &lmem_bar.io_size);
+			xe_log_info(xe, VRAM,
+				    "Total size %#llx is larger than resource %#llx\n",
+				    total_size, (u64)lmem_bar.io_size);
 		}
 
 		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
-- 
2.54.0

