Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B968C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 16:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6F710E452;
	Wed, 17 May 2023 16:15:08 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6438710E450
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684340105; x=1715876105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aTZ0gHQz7KlnuzhfoMFPv+kPWPmfFlzE34eMmRMTDtM=;
 b=imdn3Jws3pRx2pAYg75iuaX6HiSMeiKfmJSmpDG2oPNXgvRQnnYz5xLQ
 pD4HvCj+lv005Xpa7g/utwROgweRjsBuZaiB+RjrGAuwkHqzFBaa9mEpw
 kXRsPMHA6tlg/zR1+K6kl8c3fENKFTWgXnKOKMjQNZX8GgckSVQy3xCQi
 tg+CKVtrtXF/+LpOhwqozJqw0dWoFbAVplHarn8dDseWJGZRr9uZKrV5X
 kaZF8ANRx9OvRwk2tz5or2AGh3OsBWfTTGg8EpcbdET9N3xIe6cmg8aDo
 Bc9Nz5tTD8jrsHse7/6w50IJk4pbFFX26xJcu4muy6RsYk7wcg9yQwYKU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="351823463"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="351823463"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734744835"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="734744835"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:09:07 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 17 May 2023 12:08:55 -0400
Message-Id: <20230517160857.2791619-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517160857.2791619-1-michael.j.ruhl@intel.com>
References: <20230517160857.2791619-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Simplify rebar sizing
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

"Right sizing" the PCI BAR is not necessary.  If rebar is needed
size to the maximum available.

Preserve the force_vram_bar_size sizing.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  14 +--
 drivers/gpu/drm/xe/xe_gt_types.h     |  12 +--
 drivers/gpu/drm/xe/xe_mmio.c         | 134 ++++++++++++++++-----------
 3 files changed, 92 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index cbd18b839236..1682cfc83cee 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2022 Intel Corporation
+ * Copyright © 2022-2023 Intel Corporation
  */
 
 #ifndef _XE_DEVICE_TYPES_H_
@@ -192,11 +192,13 @@ struct xe_device {
 			/**
 			 * @io_size: IO size of VRAM.
 			 *
-			 * This represents how much of VRAM we can access via
-			 * the CPU through the VRAM BAR. This can be smaller
-			 * than @size, in which case only part of VRAM is CPU
-			 * accessible (typically the first 256M). This
-			 * configuration is known as small-bar.
+			 * This represents how much of VRAM the CPU can access
+			 * via the VRAM BAR.
+			 * On systems that do not support large BAR IO space,
+			 * this can be smaller than the actual memory size, in
+			 * which case only part of VRAM is CPU accessible
+			 * (typically the first 256M).  This configuration is
+			 * known as small-bar.
 			 */
 			resource_size_t io_size;
 			/** @size: Total size of VRAM */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..4b66e059ba9b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2022 Intel Corporation
+ * Copyright © 2022-2023 Intel Corporation
  */
 
 #ifndef _XE_GT_TYPES_H_
@@ -148,11 +148,11 @@ struct xe_gt {
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
 			/** @size: size of VRAM. */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 435e8246802c..5a2223b34bc2 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -3,6 +3,8 @@
  * Copyright © 2021-2023 Intel Corporation
  */
 
+#include <linux/minmax.h>
+
 #include "xe_mmio.h"
 
 #include <drm/drm_managed.h>
@@ -20,6 +22,8 @@
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
 
+#define BAR_SIZE_SHIFT 20
+
 static int xe_set_dma_info(struct xe_device *xe)
 {
 	unsigned int mask_size = xe->info.dma_mask_size;
@@ -60,50 +64,65 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 	if (ret) {
 		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
 			 resno, 1 << bar_size, ERR_PTR(ret));
-		return -1;
+		return ret;
 	}
 
 	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
-	return 1;
+	return ret;
 }
 
-static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
+/*
+ * if force_vram_bar_size is set, attempt to set to the requested size
+ * else set to maximum possible size
+ */
+static int xe_resize_vram_bar(struct xe_device *xe)
 {
+	u64 force_vram_bar_size = xe_force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct pci_bus *root = pdev->bus;
-	struct resource *root_res;
-	resource_size_t rebar_size;
 	resource_size_t current_size;
+	resource_size_t rebar_size;
+	struct resource *root_res;
+	u32 bar_size_mask;
 	u32 pci_cmd;
 	int i;
 	int ret;
-	u64 force_vram_bar_size = xe_force_vram_bar_size;
 
-	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
+	/* gather some relevant info */
+	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
+	bar_size_mask = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
 
+	if (!bar_size_mask)
+		return 0;
+
+	/* set to a specific size? */
 	if (force_vram_bar_size) {
-		u32 bar_sizes;
+		u32 bar_size_bit;
 
 		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
-		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
 
-		if (rebar_size == current_size)
-			return 0;
+		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
 
-		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
-		    rebar_size >= roundup_pow_of_two(vram_size)) {
-			rebar_size = vram_size;
+		if (!bar_size_bit) {
 			drm_info(&xe->drm,
-				 "Given bar size is not within supported size, setting it to default: %lluMiB\n",
-				 (u64)vram_size >> 20);
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
+				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
+			return 0;
 		}
+
+		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
+
+		if (rebar_size == current_size)
+			return 0;
 	} else {
-		rebar_size = current_size;
+		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
 
-		if (rebar_size != roundup_pow_of_two(vram_size))
-			rebar_size = vram_size;
-		else
+		/* only resize if larger than current */
+		if (rebar_size <= current_size) {
+			drm_info(&xe->drm, "Rebar size: 0x%llx vs. actual size: 0x%llx\n",
+				 rebar_size, current_size);
 			return 0;
+		}
 	}
 
 	drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
@@ -147,6 +166,31 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
+static int xe_determine_lmem_bar_size(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int err;
+
+	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
+		drm_err(&xe->drm, "pci resource is not valid\n");
+		return -ENXIO;
+	}
+
+	err = xe_resize_vram_bar(xe);
+	if (err)
+		return err;
+
+	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
+	xe->mem.vram.io_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
+	if (!xe->mem.vram.io_size)
+		return -EIO;
+
+	/* set up a map to the total memory area. */
+	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+
+	return 0;
+}
+
 /**
  * xe_mmio_tile_vram_size() - Collect vram size and offset information
  * @gt: tile to get info for
@@ -202,59 +246,37 @@ int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64
 
 int xe_mmio_probe_vram(struct xe_device *xe)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct xe_gt *gt;
-	u64 original_size;
 	u64 tile_offset;
 	u64 tile_size;
 	u64 vram_size;
 	int err;
 	u8 id;
 
-	if (!IS_DGFX(xe)) {
-		xe->mem.vram.mapping = 0;
-		xe->mem.vram.size = 0;
-		xe->mem.vram.io_start = 0;
-		xe->mem.vram.io_size = 0;
-
-		for_each_gt(gt, xe, id) {
-			gt->mem.vram.mapping = 0;
-			gt->mem.vram.size = 0;
-			gt->mem.vram.io_start = 0;
-			gt->mem.vram.io_size = 0;
-		}
+	if (!IS_DGFX(xe))
 		return 0;
-	}
-
-	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
-		drm_err(&xe->drm, "pci resource is not valid\n");
-		return -ENXIO;
-	}
 
+	/* Get the size of the gt0 vram for later accessibility comparison */
 	gt = xe_device_get_gt(xe, 0);
-	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
-
 	err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset);
 	if (err)
 		return err;
 
-	xe_resize_vram_bar(xe, vram_size);
-	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
-	xe->mem.vram.io_size = min(vram_size,
-				   pci_resource_len(pdev, GEN12_LMEM_BAR));
-	xe->mem.vram.size = xe->mem.vram.io_size;
-
-	if (!xe->mem.vram.size)
-		return -EIO;
+	err = xe_determine_lmem_bar_size(xe);
+	if (err)
+		return err;
 
-	if (vram_size > xe->mem.vram.io_size)
-		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (%lluMiB->%lluMiB)\n",
-			 (u64)vram_size >> 20, (u64)xe->mem.vram.io_size >> 20);
+	/* small bar issues will only cover gt0 sizes */
+	if (xe->mem.vram.io_size < vram_size)
+		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
+			 vram_size, (u64)xe->mem.vram.io_size);
 
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
-	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, vram_size);
+	/* Limit size to available memory to account for the current memory algorithm */
+	xe->mem.vram.io_size = min_t(u64, xe->mem.vram.io_size, vram_size);
+	xe->mem.vram.size = xe->mem.vram.io_size;
 
-	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &xe->mem.vram.io_size);
 
 	/* FIXME: Assuming equally partitioned VRAM, incorrect */
 	if (xe->info.tile_count > 1) {
-- 
2.39.2

