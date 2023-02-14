Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6899BC64ED6
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495CE10E88E;
	Tue, 14 Feb 2023 11:23:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ADA10E88F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373837; x=1707909837;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m+nLrb/Drlilt9jIcjoMvW+MHxyPQBu1pR9q1Vn/OnI=;
 b=Jg2OqnbnsqxOfi9l+vWmXNLkHUoNipTTEetR+1589oEzKFiovuDlUMEI
 lIGePx0IA8AciOqQNfCpp5ABaAdiOKJ18V1lVOQSbyEzIcUzd7ViqZStv
 /IUUThW7fHS/iLW0YI1XY2kooTYrv7/kWvwZcgPAPVnkTO9nQnWb1k8uv
 nz+XKiJsulaUcwbhTecMoTcb70uZ0o533V4sb820F7jtbN24myFXtoSQ8
 ZsUTNuzRkdSfJGzitLeQ1H9PuLThNi14BlqtXcioFhcmLFW1fHuA6aNch
 35oFfDGxRslcSPrf/ArO5f3Tu+begVH/j+NOGqhFsFf8db6TDTslEPNzY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450062"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450062"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863224"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863224"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:52 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:28 +0000
Message-Id: <20230214112136.162380-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/15] drm/xe/vram: start tracking the io_size
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

First step towards supporting small-bar is to track the io_size for
vram. We can longer assume that the io_size == vram size. This way we
know how much is CPU accessible via the BAR, and how much is not.
Effectively giving us a two tiered vram, where in some later patches we
can support different allocation strategies depending on if the memory
needs to be CPU accessible or not.

Note as this stage we still clamp the vram size to the usable vram size.
Only in the final patch do we turn this on for real, and allow distinct
io_size and vram_size.

v2: (Lucas):
  - Improve the commit message, plus improve the kernel-doc for the
    io_size to give a better sense of what it actually is.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 14 +++++++--
 drivers/gpu/drm/xe/xe_gt_types.h     | 14 +++++++--
 drivers/gpu/drm/xe/xe_mmio.c         | 44 ++++++++++++++++++++--------
 3 files changed, 55 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6c71e1b2dbf4..9d5a21252da3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -175,9 +175,19 @@ struct xe_device {
 	struct {
 		/** @vram: VRAM info for device */
 		struct {
-			/** @io_start: start address of VRAM */
+			/** @io_start: IO start address of VRAM */
 			resource_size_t io_start;
-			/** @size: size of VRAM */
+			/**
+			 * @io_size: IO size of VRAM.
+			 *
+			 * This represents how much of VRAM we can access via
+			 * the CPU through the VRAM BAR. This can be smaller
+			 * than @size, in which case only part of VRAM is CPU
+			 * accessible (typically the first 256M). This
+			 * configuration is known as small-bar.
+			 */
+			resource_size_t io_size;
+			/** @size: Total size of VRAM */
 			resource_size_t size;
 			/** @mapping: pointer to VRAM mappable space */
 			void *__iomem mapping;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index b01edd3fdc4d..00c43f3a33a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -143,9 +143,19 @@ struct xe_gt {
 		 * (virtual split), can be subset of global device VRAM
 		 */
 		struct {
-			/** @io_start: start address of VRAM */
+			/** @io_start: IO start address of this VRAM instance */
 			resource_size_t io_start;
-			/** @size: size of VRAM */
+			/**
+			 * @io_size: IO size of this VRAM instance
+			 *
+			 * This represents how much of this VRAM we can access
+			 * via the CPU through the VRAM BAR. This can be smaller
+			 * than @size, in which case only part of VRAM is CPU
+			 * accessible (typically the first 256M). This
+			 * configuration is known as small-bar.
+			 */
+			resource_size_t io_size;
+			/** @size: size of VRAM. */
 			resource_size_t size;
 			/** @mapping: pointer to VRAM mappable space */
 			void *__iomem mapping;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index e9ff5b9577fa..4c8b77caeb43 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -183,7 +183,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	u8 id;
 	u64 vram_size;
 	u64 original_size;
-	u64 current_size;
 	u64 usable_size;
 	int resize_result, err;
 
@@ -191,11 +190,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		xe->mem.vram.mapping = 0;
 		xe->mem.vram.size = 0;
 		xe->mem.vram.io_start = 0;
+		xe->mem.vram.io_size = 0;
 
 		for_each_gt(gt, xe, id) {
 			gt->mem.vram.mapping = 0;
 			gt->mem.vram.size = 0;
 			gt->mem.vram.io_start = 0;
+			gt->mem.vram.io_size = 0;
 		}
 		return 0;
 	}
@@ -213,10 +214,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		return err;
 
 	resize_result = xe_resize_vram_bar(xe, vram_size);
-	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
 	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
-
-	xe->mem.vram.size = min(current_size, vram_size);
+	xe->mem.vram.io_size = min(usable_size,
+				   pci_resource_len(pdev, GEN12_LMEM_BAR));
+	xe->mem.vram.size = xe->mem.vram.io_size;
 
 	if (!xe->mem.vram.size)
 		return -EIO;
@@ -224,15 +225,15 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	if (resize_result > 0)
 		drm_info(&xe->drm, "Successfully resize VRAM from %lluMiB to %lluMiB\n",
 			 (u64)original_size >> 20,
-			 (u64)current_size >> 20);
-	else if (xe->mem.vram.size < vram_size && !xe_force_vram_bar_size)
+			 (u64)xe->mem.vram.io_size >> 20);
+	else if (xe->mem.vram.io_size < usable_size && !xe_force_vram_bar_size)
 		drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. Consider enabling 'Resizable BAR' support in your BIOS.\n",
 			 (u64)xe->mem.vram.size >> 20);
 	if (xe->mem.vram.size < vram_size)
 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
 			 vram_size, (u64)xe->mem.vram.size);
 
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.size);
+	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
 	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
 
 	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
@@ -240,7 +241,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	/* FIXME: Assuming equally partitioned VRAM, incorrect */
 	if (xe->info.tile_count > 1) {
 		u8 adj_tile_count = xe->info.tile_count;
-		resource_size_t size, io_start;
+		resource_size_t size, io_start, io_size;
 
 		for_each_gt(gt, xe, id)
 			if (xe_gt_is_media_type(gt))
@@ -250,15 +251,31 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 		size = xe->mem.vram.size / adj_tile_count;
 		io_start = xe->mem.vram.io_start;
+		io_size = xe->mem.vram.io_size;
 
 		for_each_gt(gt, xe, id) {
-			if (id && !xe_gt_is_media_type(gt))
-				io_start += size;
+			if (id && !xe_gt_is_media_type(gt)) {
+				io_size -= min(io_size, size);
+				io_start += io_size;
+			}
 
 			gt->mem.vram.size = size;
-			gt->mem.vram.io_start = io_start;
-			gt->mem.vram.mapping = xe->mem.vram.mapping +
-				(io_start - xe->mem.vram.io_start);
+
+			/*
+			 * XXX: multi-tile small-bar might be wild. Hopefully
+			 * full tile without any mappable vram is not something
+			 * we care about.
+			 */
+
+			gt->mem.vram.io_size = min(size, io_size);
+			if (io_size) {
+				gt->mem.vram.io_start = io_start;
+				gt->mem.vram.mapping = xe->mem.vram.mapping +
+					(io_start - xe->mem.vram.io_start);
+			} else {
+				drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+				return -ENODEV;
+			}
 
 			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
 				 id, gt->info.vram_id, &gt->mem.vram.io_start,
@@ -267,6 +284,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	} else {
 		gt->mem.vram.size = xe->mem.vram.size;
 		gt->mem.vram.io_start = xe->mem.vram.io_start;
+		gt->mem.vram.io_size = xe->mem.vram.io_size;
 		gt->mem.vram.mapping = xe->mem.vram.mapping;
 
 		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
-- 
2.39.1

