Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561A8C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 17:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1184E10E339;
	Tue, 15 Apr 2025 17:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcghRpPV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D4910E131
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744738500; x=1776274500;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=k/+Q2Nmk6KjH5/GwSeX85Gw5FihCevAAZcc9R+d1t5s=;
 b=JcghRpPVVzs/seZpWTQfFSej54ES6T/hHHmAUKDxBp2rmw/ZSOxFuBdu
 1/g3srS2Mu0PLyIhQHwqp4pMEhur4MSJ0MBIITzz0xheHnJmX6KsVg5iI
 mEOVcDOjir12as7t4l6yxjcpHlmG+IIxgWu6QjO0L3UMez1C4fLP8jSfh
 xcZAQIfISqXZ+Hyn8vVsJHAy2zatlxgI49D0pRXOqD+MG7mgPgSj0XxaP
 lFe2nSLFRvLCQ6gZ+aup6XoXFblMZ3pZLoUb6DsTj/4+GpvgJNzFbBPVw
 OztCOB87TFdCyZj5cpflCffKsY/dhkn/NvFC6CvtGnKDMO1EjXvRqeXpk A==;
X-CSE-ConnectionGUID: rWWUrc4PSs++ii8yEts/kQ==
X-CSE-MsgGUID: FKrXqBj8THiRq3FQo19XCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56441686"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56441686"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:34:59 -0700
X-CSE-ConnectionGUID: oKaJp4EqQXiU6WSGrLe1AQ==
X-CSE-MsgGUID: nBGupu/+SZ2kzGPhQ2k+2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131085218"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:34:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/xe: Update xe_ttm_access_memory to use GPU for
 non-visible access
Date: Tue, 15 Apr 2025 10:36:11 -0700
Message-Id: <20250415173613.294522-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415173613.294522-1-matthew.brost@intel.com>
References: <20250415173613.294522-1-matthew.brost@intel.com>
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

Add migrate layer functions to access VRAM and update
xe_ttm_access_memory to use for non-visible access and large (more than
16k) BO access. 8G devcoreump on BMG observed 3 minute CPU copy time vs.
3s GPU copy time.

v4:
 - Fix non-page aligned accesses
 - Add support for small / unaligned access
 - Update commit message indicating migrate used for large accesses (Auld)
 - Fix warning in xe_res_cursor for non-zero offset
v5:
 - Fix 32 bit build (CI)
v6:
 - Rebase and use SVM migration copy functions
v7:
 - Fix build error (CI)
v8:
 - Remove ifdef around VRAM copy functions (CI)
 - Use break statement in dma unmmaping (Jonathan)
 - Use if/else rather than goto (Jonathan)
 - Use single return point (Jonathan)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      |  15 ++-
 drivers/gpu/drm/xe/xe_migrate.c | 218 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h |   4 +
 3 files changed, 218 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c337790c81ae..5d3884484c9e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1455,6 +1455,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 	struct xe_res_cursor cursor;
 	struct xe_vram_region *vram;
 	int bytes_left = len;
+	int err = 0;
 
 	xe_bo_assert_held(bo);
 	xe_device_assert_mem_access(xe);
@@ -1462,9 +1463,14 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
 		return -EIO;
 
-	/* FIXME: Use GPU for non-visible VRAM */
-	if (!xe_ttm_resource_visible(ttm_bo->resource))
-		return -EIO;
+	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >= SZ_16K) {
+		struct xe_migrate *migrate =
+			mem_type_to_migrate(xe, ttm_bo->resource->mem_type);
+
+		err = xe_migrate_access_memory(migrate, bo, offset, buf, len,
+					       write);
+		goto out;
+	}
 
 	vram = res_to_mem_region(ttm_bo->resource);
 	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
@@ -1488,7 +1494,8 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 			xe_res_next(&cursor, PAGE_SIZE);
 	} while (bytes_left);
 
-	return len;
+out:
+	return err ?: len;
 }
 
 const struct ttm_device_funcs xe_ttm_funcs = {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3777cc30d688..8f8e9fdfb2a8 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -669,6 +669,7 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 	u32 mocs = 0;
 	u32 tile_y = 0;
 
+	xe_gt_assert(gt, !(pitch & 3));
 	xe_gt_assert(gt, size / pitch <= S16_MAX);
 	xe_gt_assert(gt, pitch / 4 <= S16_MAX);
 	xe_gt_assert(gt, pitch <= U16_MAX);
@@ -1546,7 +1547,6 @@ void xe_migrate_wait(struct xe_migrate *m)
 		dma_fence_wait(m->fence, false);
 }
 
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static u32 pte_update_cmd_size(u64 size)
 {
 	u32 num_dword;
@@ -1604,8 +1604,12 @@ enum xe_migrate_copy_dir {
 	XE_MIGRATE_COPY_TO_SRAM,
 };
 
+#define XE_CACHELINE_BYTES	64ull
+#define XE_CACHELINE_MASK	(XE_CACHELINE_BYTES - 1)
+
 static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
-					 unsigned long npages,
+					 unsigned long len,
+					 unsigned long sram_offset,
 					 dma_addr_t *sram_addr, u64 vram_addr,
 					 const enum xe_migrate_copy_dir dir)
 {
@@ -1615,17 +1619,21 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	struct dma_fence *fence = NULL;
 	u32 batch_size = 2;
 	u64 src_L0_ofs, dst_L0_ofs;
-	u64 round_update_size;
 	struct xe_sched_job *job;
 	struct xe_bb *bb;
 	u32 update_idx, pt_slot = 0;
+	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
+	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
+		PAGE_SIZE : 4;
 	int err;
 
-	if (npages * PAGE_SIZE > MAX_PREEMPTDISABLE_TRANSFER)
-		return ERR_PTR(-EINVAL);
+	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
+			(sram_offset | vram_addr) & XE_CACHELINE_MASK))
+		return ERR_PTR(-EOPNOTSUPP);
 
-	round_update_size = npages * PAGE_SIZE;
-	batch_size += pte_update_cmd_size(round_update_size);
+	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
+
+	batch_size += pte_update_cmd_size(len);
 	batch_size += EMIT_COPY_DW;
 
 	bb = xe_bb_new(gt, batch_size, use_usm_batch);
@@ -1635,22 +1643,21 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	}
 
 	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
-				   sram_addr, round_update_size);
+				   sram_addr, len + sram_offset);
 
 	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
-		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
 		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
 
 	} else {
 		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
-		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
 	}
 
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 	update_idx = bb->len;
 
-	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
-		  XE_PAGE_SIZE);
+	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, pitch);
 
 	job = xe_bb_create_migration_job(m->q, bb,
 					 xe_migrate_batch_base(m, use_usm_batch),
@@ -1698,7 +1705,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     dma_addr_t *src_addr,
 				     u64 dst_addr)
 {
-	return xe_migrate_vram(m, npages, src_addr, dst_addr,
+	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
 			       XE_MIGRATE_COPY_TO_VRAM);
 }
 
@@ -1719,11 +1726,192 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 				       u64 src_addr,
 				       dma_addr_t *dst_addr)
 {
-	return xe_migrate_vram(m, npages, dst_addr, src_addr,
+	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
 			       XE_MIGRATE_COPY_TO_SRAM);
 }
 
-#endif
+static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
+				 int len, int write)
+{
+	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
+
+	for (i = 0; i < npages; ++i) {
+		if (!dma_addr[i])
+			break;
+
+		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
+			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
+	}
+	kfree(dma_addr);
+}
+
+static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
+				      void *buf, int len, int write)
+{
+	dma_addr_t *dma_addr;
+	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
+
+	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
+	if (!dma_addr)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < npages; ++i) {
+		dma_addr_t addr;
+		struct page *page;
+
+		if (is_vmalloc_addr(buf))
+			page = vmalloc_to_page(buf);
+		else
+			page = virt_to_page(buf);
+
+		addr = dma_map_page(xe->drm.dev,
+				    page, 0, PAGE_SIZE,
+				    write ? DMA_TO_DEVICE :
+				    DMA_FROM_DEVICE);
+		if (dma_mapping_error(xe->drm.dev, addr))
+			goto err_fault;
+
+		dma_addr[i] = addr;
+		buf += PAGE_SIZE;
+	}
+
+	return dma_addr;
+
+err_fault:
+	xe_migrate_dma_unmap(xe, dma_addr, len, write);
+	return ERR_PTR(-EFAULT);
+}
+
+/**
+ * xe_migrate_access_memory - Access memory of a BO via GPU
+ *
+ * @m: The migration context.
+ * @bo: buffer object
+ * @offset: access offset into buffer object
+ * @buf: pointer to caller memory to read into or write from
+ * @len: length of access
+ * @write: write access
+ *
+ * Access memory of a BO via GPU either reading in or writing from a passed in
+ * pointer. Pointer is dma mapped for GPU access and GPU commands are issued to
+ * read to or write from pointer.
+ *
+ * Returns:
+ * 0 if successful, negative error code on failure.
+ */
+int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
+			     unsigned long offset, void *buf, int len,
+			     int write)
+{
+	struct xe_tile *tile = m->tile;
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_res_cursor cursor;
+	struct dma_fence *fence = NULL;
+	dma_addr_t *dma_addr;
+	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
+	int bytes_left = len, current_page = 0;
+	void *orig_buf = buf;
+
+	xe_bo_assert_held(bo);
+
+	/* Use bounce buffer for small access and unaligned access */
+	if (len & XE_CACHELINE_MASK ||
+	    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
+		int buf_offset = 0;
+
+		/*
+		 * Less than ideal for large unaligned access but this should be
+		 * fairly rare, can fixup if this becomes common.
+		 */
+		do {
+			u8 bounce[XE_CACHELINE_BYTES];
+			void *ptr = (void *)bounce;
+			int err;
+			int copy_bytes = min_t(int, bytes_left,
+					       XE_CACHELINE_BYTES -
+					       (offset & XE_CACHELINE_MASK));
+			int ptr_offset = offset & XE_CACHELINE_MASK;
+
+			err = xe_migrate_access_memory(m, bo,
+						       offset &
+						       ~XE_CACHELINE_MASK,
+						       (void *)ptr,
+						       sizeof(bounce), 0);
+			if (err)
+				return err;
+
+			if (write) {
+				memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
+
+				err = xe_migrate_access_memory(m, bo,
+							       offset & ~XE_CACHELINE_MASK,
+							       (void *)ptr,
+							       sizeof(bounce), 0);
+				if (err)
+					return err;
+			} else {
+				memcpy(buf + buf_offset, ptr + ptr_offset,
+				       copy_bytes);
+			}
+
+			bytes_left -= copy_bytes;
+			buf_offset += copy_bytes;
+			offset += copy_bytes;
+		} while (bytes_left);
+
+		return 0;
+	}
+
+	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
+	if (IS_ERR(dma_addr))
+		return PTR_ERR(dma_addr);
+
+	xe_res_first(bo->ttm.resource, offset, bo->size - offset, &cursor);
+
+	do {
+		struct dma_fence *__fence;
+		u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
+			cursor.start;
+		int current_bytes;
+
+		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
+			current_bytes = min_t(int, bytes_left,
+					      MAX_PREEMPTDISABLE_TRANSFER);
+		else
+			current_bytes = min_t(int, bytes_left, cursor.size);
+
+		if (fence)
+			dma_fence_put(fence);
+
+		__fence = xe_migrate_vram(m, current_bytes,
+					  (unsigned long)buf & ~PAGE_MASK,
+					  dma_addr + current_page,
+					  vram_addr, write ?
+					  XE_MIGRATE_COPY_TO_VRAM :
+					  XE_MIGRATE_COPY_TO_SRAM);
+		if (IS_ERR(__fence)) {
+			if (fence)
+				dma_fence_wait(fence, false);
+			fence = __fence;
+			goto out_err;
+		}
+		fence = __fence;
+
+		buf += current_bytes;
+		offset += current_bytes;
+		current_page = (int)(buf - orig_buf) / PAGE_SIZE;
+		bytes_left -= current_bytes;
+		if (bytes_left)
+			xe_res_next(&cursor, current_bytes);
+	} while (bytes_left);
+
+	dma_fence_wait(fence, false);
+	dma_fence_put(fence);
+
+out_err:
+	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
+	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
+}
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 6ff9a963425c..fb9839c1bae0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -112,6 +112,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
+			     unsigned long offset, void *buf, int len,
+			     int write);
+
 #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
 #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
 #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
-- 
2.34.1

