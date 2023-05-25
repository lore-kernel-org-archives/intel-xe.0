Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229C2C7EE2C
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 19:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F7510E741;
	Thu, 25 May 2023 19:43:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1A710E741
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685043823; x=1716579823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1R+q1XGPHq+7sUI8cAho7R9Lw41SMlq2qnhkIX03Rok=;
 b=WNjFIg7XpVwLp+ZvHytk3mtbjd0Qv0p+RTpxjD/fRYYTyPT1GnPQkSRf
 Kk99C5HKZDmWghg4i7mGDEGBaSUtC/id2WRgMXGFvzqzEM6mPP2EdLCZk
 AKlIpU7ojUl445dGB0tCTF46eovzOagMeWAdtXU/ehM9Ubo8KpvI1198x
 kJWnlrYjOiY3BB7VAuLBUVnI9nrtzSYWRP1Y+uIvuAteG2neV1B7ju58u
 EfDNheLf7oMIo/YDcBoRXiQWoF+egVc7tsQtrbomH/N0Ik0HrBOhly7zh
 fCF0x2z+mDGpzwsLosMpBuYPwSsw0GLD2x2kdkgCm/PC0HMAK3sNwvnLf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="351514352"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="351514352"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774799889"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="774799889"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:43:42 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 15:43:25 -0400
Message-Id: <20230525194326.1648781-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525194326.1648781-1-michael.j.ruhl@intel.com>
References: <20230525194326.1648781-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The current method of sizing GT device memory is not quite right.

Update the algorithm to use the relevant HW information and offsets
to set up the sizing correctly.

Update the stolen memory sizing to reflect the changes, and to be
GT specific.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_gt_types.h     |  2 +
 drivers/gpu/drm/xe/xe_mmio.c         | 93 ++++++++++++++--------------
 3 files changed, 51 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a53b44d14b25..51c16d207780 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -207,6 +207,8 @@ struct xe_device {
 			resource_size_t io_size;
 			/** @size: Total size of VRAM */
 			resource_size_t size;
+			/** @base: Offset to apply for Device Physical Address control */
+			resource_size_t base;
 			/** @mapping: pointer to VRAM mappable space */
 			void *__iomem mapping;
 		} vram;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 4b66e059ba9b..47f059bb8c6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -155,6 +155,8 @@ struct xe_gt {
 			 * the first 256M). This configuration is known as small-bar.
 			 */
 			resource_size_t io_size;
+			/** @base: offset of VRAM starting base */
+			resource_size_t base;
 			/** @size: size of VRAM. */
 			resource_size_t size;
 			/** @mapping: pointer to VRAM mappable space */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d04fb84e84ff..25ac84d72c7e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -182,6 +182,8 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 	if (!xe->mem.vram.io_size)
 		return -EIO;
 
+	xe->mem.vram.base = 0; /* DPA offset */
+
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
 
@@ -243,6 +245,9 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64
 
 int xe_mmio_probe_vram(struct xe_device *xe)
 {
+	resource_size_t io_size;
+	u64 available_size = 0;
+	u64 total_size = 0;
 	struct xe_gt *gt;
 	u64 tile_offset;
 	u64 tile_size;
@@ -268,64 +273,60 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
 			 vram_size, (u64)xe->mem.vram.io_size);
 
-	/* Limit size to available memory to account for the current memory algorithm */
-	xe->mem.vram.io_size = min_t(u64, xe->mem.vram.io_size, vram_size);
-	xe->mem.vram.size = xe->mem.vram.io_size;
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
 
-		size = xe->mem.vram.size / adj_tile_count;
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
+		gt->mem.vram.base = tile_offset;
+
+		/* small bar can limit the visible size.  size accordingly */
+		gt->mem.vram.size = min_t(u64, vram_size, io_size);
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
-		gt->mem.vram.size = xe->mem.vram.size;
-		gt->mem.vram.io_start = xe->mem.vram.io_start;
-		gt->mem.vram.io_size = xe->mem.vram.io_size;
-		gt->mem.vram.mapping = xe->mem.vram.mapping;
 
-		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
+		io_size -= min_t(u64, tile_size, io_size);
 	}
+
+	xe->mem.vram.size = total_size;
+
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &xe->mem.vram.size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &available_size);
+
 	return 0;
 }
 
-- 
2.39.2

