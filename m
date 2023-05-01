Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E214CC7EE21
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 11:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283310E25B;
	Mon,  1 May 2023 11:58:43 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D34E10E0FA
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682942321; x=1714478321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1yNo+Wqqm8oo16z+Tx+StkltY7XmHwLTR0uQ/hnJdo=;
 b=b4ioOUGSMAjuXvVnI0nglyIjOPwFrT5U6H0nLy6Qb6iJPCX85AKQCp1c
 UnjDLM1ovhuFxeWJqZRVYUQtXX9tcwio+7SMv9AVRwBMDFtp7uLu+9hAL
 0KDFLF46JfbEWtHbPmNjl4nK7AwrEaFbu+IntWDfSxhpghsEqTK5x0tX6
 +oky5n9vDYuUMvy5YRcuaNp5ZVxeA+aQbmcBO3crw0+vf0tj2FOQI0jlt
 xg1/rFvQt95rzdu9v1EI1kA9HUoXceWjM1CZN9LM4G9PKzBtGfqgX8R2D
 Or3jk/mFRaMONAg692OYXW3R6WJjTBFHD9028TNBg217zfeDq+kef16yB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="327762989"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; d="scan'208";a="327762989"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 04:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="765276213"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200"; d="scan'208";a="765276213"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 04:58:40 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  1 May 2023 07:58:25 -0400
Message-Id: <20230501115826.4191472-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501115826.4191472-1-michael.j.ruhl@intel.com>
References: <20230501115826.4191472-1-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_mmio.c           | 91 +++++++++++++-------------
 drivers/gpu/drm/xe/xe_mmio.h           |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  2 +
 5 files changed, 60 insertions(+), 53 deletions(-)

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
index 7a5fce0ae7ab..2c35a1b79be7 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -186,6 +186,8 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 	if (!xe->mem.vram.io_size)
 		return -EIO;
 
+	xe->mem.vram.base = 0; /* DPA offset */
+
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
 
@@ -247,6 +249,9 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64
 
 int xe_mmio_probe_vram(struct xe_device *xe)
 {
+	resource_size_t io_size;
+	u64 available_size = 0;
+	u64 total_size = 0;
 	struct xe_gt *gt;
 	u64 tile_offset;
 	u64 tile_size;
@@ -275,57 +280,56 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
 		 &xe->mem.vram.io_size);
 
-	/* FIXME: Assuming equally partitioned VRAM, incorrect */
-	if (xe->info.tile_count > 1) {
-		u8 adj_tile_count = xe->info.tile_count;
-		resource_size_t size, io_start, io_size;
+	/* small bar issues will only cover gt0 sizes */
+	if (xe->mem.vram.io_size < vram_size)
+		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
+			 vram_size, (u64)xe->mem.vram.io_size);
 
-		for_each_gt(gt, xe, id)
-			if (xe_gt_is_media_type(gt))
-				--adj_tile_count;
+	io_size = xe->mem.vram.io_size;
 
-		XE_BUG_ON(!adj_tile_count);
+	/* gt specific ranges */
+	for_each_gt(gt, xe, id) {
+		if (xe_gt_is_media_type(gt))
+			continue;
 
-		size = xe->mem.vram.io_size / adj_tile_count;
-		io_start = xe->mem.vram.io_start;
-		io_size = xe->mem.vram.io_size;
+		err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset);
+		if (err)
+			return err;
 
-		for_each_gt(gt, xe, id) {
-			if (id && !xe_gt_is_media_type(gt)) {
-				io_size -= min(io_size, size);
-				io_start += io_size;
-			}
+		gt->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
+		gt->mem.vram.io_size = min_t(u64, vram_size, io_size);
 
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
+		if (!gt->mem.vram.io_size) {
+			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+			return -ENODEV;
+		}
+
+		gt->mem.vram.base = xe->mem.vram.base + tile_offset;
+		gt->mem.vram.size = vram_size;
+		gt->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+
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
 
-			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
-				 id, gt->info.vram_id, &gt->mem.vram.io_start,
-				 &gt->mem.vram.size);
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
 
@@ -345,9 +349,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	if (xe->info.media_verx100 >= 1300)
 		xe->info.tile_count *= 2;
 
-	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
-		 xe->info.tile_count, adj_tile_count);
-
 	if (xe->info.tile_count > 1) {
 		const int mmio_bar = 0;
 		size_t size;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 556cf3d9e4f5..d284f84a2e60 100644
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
index a329f12f14fe..72e0a65b1d71 100644
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

