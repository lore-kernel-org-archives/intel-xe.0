Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C74BC7EE22
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 20:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5EB10E529;
	Thu,  4 May 2023 20:53:11 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1C310E1C4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 20:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683233587; x=1714769587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jIHrNMjjr7uzefoegS0XKFwHk0PWbQPO0XFp8krpz2c=;
 b=IgSFz6qAtIoS3nMap3Q8SSR67/HTNSTy4y9ptmi8qUrQmTyXXtkLUFAr
 Ba/N+8roHsR7Ta/9fthcfZLM/2vbJywwLPU35Y2lvUNMY2Caz+v942uW5
 MDF7MLyygPvI/kxm2uB6wPBIh6vYfheIlzdjDNShOZbL/sZZMdHzV6tbu
 9T9N/mfwqbxj3yfau4yjv4F8P18OGY3WJHzV0S/nbwfiwW2Y7WH/fW71D
 Y4XpiTUluMrDGWSsh5SU1NvSrv+3quXDlapH4XTAE8vOxxFJcQ9pdPVIk
 v3YCNYho5pTNiCJhnMZlb+t/nNSmya1FXQ0o4mmg4IONhVNwbiqnHziDj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347873933"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="347873933"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="727733324"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="727733324"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:53:03 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 16:52:49 -0400
Message-Id: <20230504205250.3898282-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504205250.3898282-1-michael.j.ruhl@intel.com>
References: <20230504205250.3898282-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] drm/xe: Size GT device memory correctly
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
Cc: tejas.upadhyay@intel.com, michael.j.ruhl@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The current method of sizing GT device memory is not quite right.

Update the algorithm to use the relevant HW information and offsets
to set up the sizing correctly.

Update the stolen memory sizing to reflect the changes, and to be
GT specific.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h   |  4 +-
 drivers/gpu/drm/xe/xe_gt_types.h       | 14 ++--
 drivers/gpu/drm/xe/xe_mmio.c           | 89 ++++++++++++--------------
 drivers/gpu/drm/xe/xe_mmio.h           |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  2 +
 5 files changed, 55 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2eeb10e97381..8898aea4bc2b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2022 Intel Corporation
+ * Copyright © 2022-2023 Intel Corporation
  */
 
 #ifndef _XE_DEVICE_TYPES_H_
@@ -202,6 +202,8 @@ struct xe_device {
 			 * known as small-bar.
 			 */
 			resource_size_t io_size;
+			/** @base: Offset to apply for Device Physical Address control */
+			resource_size_t base;
 			/** @mapping: pointer to VRAM mappable space */
 			void *__iomem mapping;
 		} vram;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..47f059bb8c6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2022 Intel Corporation
+ * Copyright © 2022-2023 Intel Corporation
  */
 
 #ifndef _XE_GT_TYPES_H_
@@ -148,13 +148,15 @@ struct xe_gt {
 			/**
 			 * @io_size: IO size of this VRAM instance
 			 *
-			 * This represents how much of this VRAM we can access
-			 * via the CPU through the VRAM BAR. This can be smaller
-			 * than @size, in which case only part of VRAM is CPU
-			 * accessible (typically the first 256M). This
-			 * configuration is known as small-bar.
+			 * This represents how much of the VRAM the CPU can access
+			 * via the VRAM BAR.
+			 * This can be smaller than the actual @size, in which
+			 * case only part of VRAM is CPU accessible (typically
+			 * the first 256M). This configuration is known as small-bar.
 			 */
 			resource_size_t io_size;
+			/** @base: offset of VRAM starting base */
+			resource_size_t base;
 			/** @size: size of VRAM. */
 			resource_size_t size;
 			/** @mapping: pointer to VRAM mappable space */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8ec044473886..739e04d066e4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -185,6 +185,8 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 	if (!xe->mem.vram.io_size)
 		return -EIO;
 
+	xe->mem.vram.base = 0; /* DPA offset */
+
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
 
@@ -246,6 +248,9 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64
 
 int xe_mmio_probe_vram(struct xe_device *xe)
 {
+	resource_size_t io_size;
+	u64 available_size = 0;
+	u64 total_size = 0;
 	struct xe_gt *gt;
 	u64 tile_offset;
 	u64 tile_size;
@@ -271,63 +276,54 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
 			 vram_size, (u64)xe->mem.vram.io_size);
 
-	/* Limit size to available memory to account for the current memory algorithm */
-	xe->mem.vram.io_size = min_t(u64, xe->mem.vram.io_size, vram_size);
-
 	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
 		 &xe->mem.vram.io_size);
 
-	/* FIXME: Assuming equally partitioned VRAM, incorrect */
-	if (xe->info.tile_count > 1) {
-		u8 adj_tile_count = xe->info.tile_count;
-		resource_size_t size, io_start, io_size;
+	io_size = xe->mem.vram.io_size;
 
-		for_each_gt(gt, xe, id)
-			if (xe_gt_is_media_type(gt))
-				--adj_tile_count;
+	/* gt specific ranges */
+	for_each_gt(gt, xe, id) {
+		if (xe_gt_is_media_type(gt))
+			continue;
 
-		XE_BUG_ON(!adj_tile_count);
+		err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset);
+		if (err)
+			return err;
 
-		size = xe->mem.vram.io_size / adj_tile_count;
-		io_start = xe->mem.vram.io_start;
-		io_size = xe->mem.vram.io_size;
+		gt->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
+		gt->mem.vram.io_size = min_t(u64, vram_size, io_size);
 
-		for_each_gt(gt, xe, id) {
-			if (id && !xe_gt_is_media_type(gt)) {
-				io_size -= min(io_size, size);
-				io_start += io_size;
-			}
+		if (!gt->mem.vram.io_size) {
+			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+			return -ENODEV;
+		}
 
-			gt->mem.vram.size = size;
-
-			/*
-			 * XXX: multi-tile small-bar might be wild. Hopefully
-			 * full tile without any mappable vram is not something
-			 * we care about.
-			 */
-
-			gt->mem.vram.io_size = min(size, io_size);
-			if (io_size) {
-				gt->mem.vram.io_start = io_start;
-				gt->mem.vram.mapping = xe->mem.vram.mapping +
-					(io_start - xe->mem.vram.io_start);
-			} else {
-				drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-				return -ENODEV;
-			}
+		gt->mem.vram.base = xe->mem.vram.base + tile_offset;
+		gt->mem.vram.size = vram_size;
+		gt->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
-			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
-				 id, gt->info.vram_id, &gt->mem.vram.io_start,
-				 &gt->mem.vram.size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, gt->info.vram_id,
+			 &gt->mem.vram.io_start, &gt->mem.vram.size);
+
+		if (gt->mem.vram.io_size < gt->mem.vram.size)
+			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
+				 gt->info.vram_id, &gt->mem.vram.io_size);
+
+		/* calculate total size using tile size to get the correct HW sizing */
+		total_size += tile_size;
+		available_size += vram_size;
+
+		if (total_size > xe->mem.vram.io_size) {
+			drm_warn(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
+				 &total_size, &xe->mem.vram.io_size);
 		}
-	} else {
-		gt->mem.vram.size = xe->mem.vram.io_size;
-		gt->mem.vram.io_start = xe->mem.vram.io_start;
-		gt->mem.vram.io_size = xe->mem.vram.io_size;
-		gt->mem.vram.mapping = xe->mem.vram.mapping;
 
-		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
+		io_size -= min_t(u64, tile_size, io_size);
 	}
+
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &available_size);
+
 	return 0;
 }
 
@@ -347,9 +343,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	if (xe->info.media_verx100 >= 1300)
 		xe->info.tile_count *= 2;
 
-	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
-		 xe->info.tile_count, adj_tile_count);
-
 	if (xe->info.tile_count > 1) {
 		const int mmio_bar = 0;
 		size_t size;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 9bc00b0dbc4a..424c129ae0f3 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2021 Intel Corporation
+ * Copyright © 2021-2023 Intel Corporation
  */
 
 #ifndef _XE_MMIO_H_
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 7cd0c98ab8cb..55fa728f1bd3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -12,9 +12,11 @@
 #include <drm/ttm/ttm_range_manager.h>
 
 #include "regs/xe_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_mmio.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_stolen_mgr.h"
-- 
2.39.2

