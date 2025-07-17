Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C109C83F38
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 13:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C0B10E810;
	Thu, 17 Jul 2025 13:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjT8k1Pl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F4910E80F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 13:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752759608; x=1784295608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=01RvM+5E7aQbQeIr7OxzKS4l/xQ4U3xf63pV+IqvTG0=;
 b=WjT8k1Pl5Arc5WIPjziIrooino1Czxa13XmgVNVKpMn+KLcjT47Dj/oY
 ofKNCctjojlHxXeAh/QKr3vb5yNelFDARLHoTGYy89mBzns8cmeXMIVLF
 H1Kuc7F9sudU8JLQWgNv+3iD0IQcL7//MIERq55DeqYd9YyqcbUvZzSPV
 vgnRmaoCFa8wdOX0VnvOmok+E6jPwc0ftNOZQhdiRPlkh6vyorSbYnnck
 Ce4KiqbRsrsyiEd5N7/id5V+fu3Dus+bNHcUeKkqLk1/YwATGanQ3sEsu
 YySCX/NsFKrJPabeTO45qvpynxlEGaHbbTleLshtxPNTPnETVDWEqvw+S Q==;
X-CSE-ConnectionGUID: 4Xuhwy8wTqiRAGHqOkFJqQ==
X-CSE-MsgGUID: Pl0B9NOERLGYN7el8Dk1dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54251728"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54251728"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:08 -0700
X-CSE-ConnectionGUID: aREHSPYUQ6uytWuxhufW/Q==
X-CSE-MsgGUID: fy/puYqVTcmeFClAEUstow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162328395"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.35])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 06:40:06 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v1 2/5] drm/xe/svm: Use struct drm_pagemap_device_addr
Date: Thu, 17 Jul 2025 15:38:24 +0200
Message-ID: <20250717133928.526111-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717133928.526111-1-francois.dugast@intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
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

Adapt to the new drm_gpusvm_devmem_ops type signatures using struct
drm_pagemap_device_addr, as well as the internal xe SVM functions
implementing those operations.

Besides, the use of drm_gpusvm_dma_info is propagated to xe_migrate
because it makes indexed accesses to the next DMA address but they
are no longer contiguous.

There is no functional change.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 55 ++++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_migrate.h |  5 +--
 drivers/gpu/drm/xe/xe_svm.c     | 37 ++++++++++++----------
 3 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6a80ae6104dd..33d67993f1f6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -9,6 +9,7 @@
 #include <linux/sizes.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_tt.h>
 #include <uapi/drm/xe_drm.h>
 
@@ -1585,7 +1586,8 @@ static u32 pte_update_cmd_size(u64 size)
 
 static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct xe_bb *bb, u32 pt_offset,
-				       dma_addr_t *sram_addr, u32 size)
+				       struct drm_pagemap_device_addr *sram_addr,
+				       u32 size)
 {
 	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
 	u32 ptes;
@@ -1603,7 +1605,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 		ptes -= chunk;
 
 		while (chunk--) {
-			u64 addr = sram_addr[i++] & PAGE_MASK;
+			u64 addr = sram_addr[i++].addr & PAGE_MASK;
 
 			xe_tile_assert(m->tile, addr);
 			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
@@ -1626,7 +1628,8 @@ enum xe_migrate_copy_dir {
 static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 					 unsigned long len,
 					 unsigned long sram_offset,
-					 dma_addr_t *sram_addr, u64 vram_addr,
+					 struct drm_pagemap_device_addr *sram_addr,
+					 u64 vram_addr,
 					 const enum xe_migrate_copy_dir dir)
 {
 	struct xe_gt *gt = m->tile->primary_gt;
@@ -1708,7 +1711,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
  * xe_migrate_to_vram() - Migrate to VRAM
  * @m: The migration context.
  * @npages: Number of pages to migrate.
- * @src_addr: Array of dma addresses (source of migrate)
+ * @src_addr: Array of DMA information (source of migrate)
  * @dst_addr: Device physical address of VRAM (destination of migrate)
  *
  * Copy from an array dma addresses to a VRAM device physical address
@@ -1718,7 +1721,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
  */
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-				     dma_addr_t *src_addr,
+				     struct drm_pagemap_device_addr *src_addr,
 				     u64 dst_addr)
 {
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
@@ -1730,7 +1733,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
  * @m: The migration context.
  * @npages: Number of pages to migrate.
  * @src_addr: Device physical address of VRAM (source of migrate)
- * @dst_addr: Array of dma addresses (destination of migrate)
+ * @dst_addr: Array of DMA information (destination of migrate)
  *
  * Copy from a VRAM device physical address to an array dma addresses
  *
@@ -1740,35 +1743,37 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       unsigned long npages,
 				       u64 src_addr,
-				       dma_addr_t *dst_addr)
+				       struct drm_pagemap_device_addr *dst_addr)
 {
 	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
 			       XE_MIGRATE_COPY_TO_SRAM);
 }
 
-static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
+static void xe_migrate_dma_unmap(struct xe_device *xe,
+				 struct drm_pagemap_device_addr *device_addr,
 				 int len, int write)
 {
 	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
 
 	for (i = 0; i < npages; ++i) {
-		if (!dma_addr[i])
+		if (!device_addr[i].addr)
 			break;
 
-		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
+		dma_unmap_page(xe->drm.dev, device_addr[i].addr, PAGE_SIZE,
 			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
 	}
-	kfree(dma_addr);
+	kfree(device_addr);
 }
 
-static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
-				      void *buf, int len, int write)
+static struct drm_pagemap_device_addr *xe_migrate_dma_map(struct xe_device *xe,
+							  void *buf, int len,
+							  int write)
 {
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_device_addr *device_addr;
 	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
 
-	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
-	if (!dma_addr)
+	device_addr = kcalloc(npages, sizeof(*device_addr), GFP_KERNEL);
+	if (!device_addr)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < npages; ++i) {
@@ -1787,14 +1792,14 @@ static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
 		if (dma_mapping_error(xe->drm.dev, addr))
 			goto err_fault;
 
-		dma_addr[i] = addr;
+		device_addr[i].addr = addr;
 		buf += PAGE_SIZE;
 	}
 
-	return dma_addr;
+	return device_addr;
 
 err_fault:
-	xe_migrate_dma_unmap(xe, dma_addr, len, write);
+	xe_migrate_dma_unmap(xe, device_addr, len, write);
 	return ERR_PTR(-EFAULT);
 }
 
@@ -1823,7 +1828,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_res_cursor cursor;
 	struct dma_fence *fence = NULL;
-	dma_addr_t *dma_addr;
+	struct drm_pagemap_device_addr *device_addr;
 	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
 	int bytes_left = len, current_page = 0;
 	void *orig_buf = buf;
@@ -1878,9 +1883,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		return 0;
 	}
 
-	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
-	if (IS_ERR(dma_addr))
-		return PTR_ERR(dma_addr);
+	device_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
+	if (IS_ERR(device_addr))
+		return PTR_ERR(device_addr);
 
 	xe_res_first(bo->ttm.resource, offset, xe_bo_size(bo) - offset, &cursor);
 
@@ -1901,7 +1906,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 
 		__fence = xe_migrate_vram(m, current_bytes,
 					  (unsigned long)buf & ~PAGE_MASK,
-					  dma_addr + current_page,
+					  &device_addr[current_page],
 					  vram_addr, write ?
 					  XE_MIGRATE_COPY_TO_VRAM :
 					  XE_MIGRATE_COPY_TO_SRAM);
@@ -1925,7 +1930,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	dma_fence_put(fence);
 
 out_err:
-	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
+	xe_migrate_dma_unmap(xe, device_addr, len + page_offset, write);
 	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 74c60f55004a..f8bff3f2904a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct dma_fence;
+struct drm_pagemap_device_addr;
 struct iosys_map;
 struct ttm_resource;
 
@@ -98,13 +99,13 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-				     dma_addr_t *src_addr,
+				     struct drm_pagemap_device_addr *src_addr,
 				     u64 dst_addr);
 
 struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       unsigned long npages,
 				       u64 src_addr,
-				       dma_addr_t *dst_addr);
+				       struct drm_pagemap_device_addr *dst_addr);
 
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *src_bo,
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 10c8a1bcb86e..80dfb96d5ca4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -328,7 +328,8 @@ enum xe_svm_copy_dir {
 	XE_SVM_COPY_TO_SRAM,
 };
 
-static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
+static int xe_svm_copy(struct page **pages,
+		       struct drm_pagemap_device_addr *device_addr,
 		       unsigned long npages, const enum xe_svm_copy_dir dir)
 {
 	struct xe_vram_region *vr = NULL;
@@ -360,7 +361,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		last = (i + 1) == npages;
 
 		/* No CPU page and no device pages queue'd to copy */
-		if (!dma_addr[i] && vram_addr == XE_VRAM_ADDR_INVALID)
+		if (!device_addr[i].addr && vram_addr == XE_VRAM_ADDR_INVALID)
 			continue;
 
 		if (!vr && spage) {
@@ -374,7 +375,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		 * first device page, check if physical contiguous on subsequent
 		 * device pages.
 		 */
-		if (dma_addr[i] && spage) {
+		if (device_addr[i].addr && spage) {
 			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
 			if (vram_addr == XE_VRAM_ADDR_INVALID) {
 				vram_addr = __vram_addr;
@@ -399,18 +400,20 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 				if (sram) {
 					vm_dbg(&xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
-					       vram_addr, (u64)dma_addr[pos], i - pos + incr);
+					       vram_addr,
+					       (u64)device_addr[pos].addr, i - pos + incr);
 					__fence = xe_migrate_from_vram(vr->migrate,
 								       i - pos + incr,
 								       vram_addr,
-								       dma_addr + pos);
+								       &device_addr[pos]);
 				} else {
 					vm_dbg(&xe->drm,
 					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
-					       (u64)dma_addr[pos], vram_addr, i - pos + incr);
+					       (u64)device_addr[pos].addr, vram_addr,
+					       i - pos + incr);
 					__fence = xe_migrate_to_vram(vr->migrate,
 								     i - pos + incr,
-								     dma_addr + pos,
+								     &device_addr[pos],
 								     vram_addr);
 				}
 				if (IS_ERR(__fence)) {
@@ -423,7 +426,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			}
 
 			/* Setup physical address of next device page */
-			if (dma_addr[i] && spage) {
+			if (device_addr[i].addr && spage) {
 				vram_addr = __vram_addr;
 				pos = i;
 			} else {
@@ -435,16 +438,16 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 				if (sram) {
 					vm_dbg(&xe->drm,
 					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
-					       vram_addr, (u64)dma_addr[pos], 1);
+					       vram_addr, (u64)device_addr[pos].addr, 1);
 					__fence = xe_migrate_from_vram(vr->migrate, 1,
 								       vram_addr,
-								       dma_addr + pos);
+								       &device_addr[pos]);
 				} else {
 					vm_dbg(&xe->drm,
 					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
-					       (u64)dma_addr[pos], vram_addr, 1);
+					       (u64)device_addr[pos].addr, vram_addr, 1);
 					__fence = xe_migrate_to_vram(vr->migrate, 1,
-								     dma_addr + pos,
+								     &device_addr[pos],
 								     vram_addr);
 				}
 				if (IS_ERR(__fence)) {
@@ -470,16 +473,18 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 #undef XE_VRAM_ADDR_INVALID
 }
 
-static int xe_svm_copy_to_devmem(struct page **pages, dma_addr_t *dma_addr,
+static int xe_svm_copy_to_devmem(struct page **pages,
+				 struct drm_pagemap_device_addr *device_addr,
 				 unsigned long npages)
 {
-	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_VRAM);
+	return xe_svm_copy(pages, device_addr, npages, XE_SVM_COPY_TO_VRAM);
 }
 
-static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
+static int xe_svm_copy_to_ram(struct page **pages,
+			      struct drm_pagemap_device_addr *device_addr,
 			      unsigned long npages)
 {
-	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
+	return xe_svm_copy(pages, device_addr, npages, XE_SVM_COPY_TO_SRAM);
 }
 
 static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
-- 
2.43.0

