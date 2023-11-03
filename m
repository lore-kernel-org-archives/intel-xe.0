Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBCDC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DB410EA17;
	Fri,  3 Nov 2023 15:43:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B40410EA17
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699026227; x=1730562227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n/bF8wyr/ocq+LJO9lDK8XtQCQ8ZtrSssuRoUbLOBAo=;
 b=I/92p3aGX2t5M93S/VA7vjYvjHUZ3Jgr6DZUynI6s1y8ORoXizXpOC9Q
 yz3zazarwaWrgDD/n+yMyJoczu/Z/Fkyrksyro5dU5OvpYa7djuo+cMk6
 Y3+1Uii1hNlcLZ5JNB/IX+Vxx6/97bN+cvGJQ8hm09fxEoHTklmCkedVa
 7NwEYYYc4X1WKKRZ0KrY+jtPHKwcnam8CciQrCG5+HvtlJDv7avk4po/O
 ZUApHiZT0DXsDdDWibfGM70yGevp7DBKPpTJKM0ZS7WillFTbLznRfL0k
 gP4BJSxDnQoBWdK99Gpy+3QkOdWIj+Nu8RuFZ/ZBPkm73ImStOIDcAnlC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="10501989"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="10501989"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="761654144"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="761654144"
Received: from dvlaghat-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.3.192])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:43:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 15:43:11 +0000
Message-ID: <20231103154309.402159-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103154309.402159-5-matthew.auld@intel.com>
References: <20231103154309.402159-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 1/3] drm/xe/uapi: Add support for CPU caching
 mode
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Zhengguo Xu <zhengguo.xu@intel.com>, Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Pallavi Mishra <pallavi.mishra@intel.com>

Allow userspace to specify the CPU caching mode at object creation.
Modify gem create handler and introduce xe_bo_create_user to replace
xe_bo_create. In a later patch we will support setting the pat_index as
part of vm_bind, where expectation is that the coherency mode extracted
from the pat_index must be least 1way coherent if using cpu_caching=wb.

v2
  - s/smem_caching/smem_cpu_caching/ and
    s/XE_GEM_CACHING/XE_GEM_CPU_CACHING/. (Matt Roper)
  - Drop COH_2WAY and just use COH_NONE + COH_AT_LEAST_1WAY; KMD mostly
    just cares that zeroing/swap-in can't be bypassed with the given
    smem_caching mode. (Matt Roper)
  - Fix broken range check for coh_mode and smem_cpu_caching and also
    don't use constant value, but the already defined macros. (José)
  - Prefer switch statement for smem_cpu_caching -> ttm_caching. (José)
  - Add note in kernel-doc for dgpu and coherency modes for system
    memory. (José)
v3 (José):
  - Make sure to reject coh_mode == 0 for VRAM-only.
  - Also make sure to actually pass along the (start, end) for
    __xe_bo_create_locked.
v4
  - Drop UC caching mode. Can be added back if we need it. (Matt Roper)
  - s/smem_cpu_caching/cpu_caching. Idea is that VRAM is always WC, but
    that is currently implicit and KMD controlled. Make it explicit in
    the uapi with the limitation that it currently must be WC. For VRAM
    + SYS objects userspace must now select WC. (José)
  - Make sure to initialize bo_flags. (José)
v5
  - Make to align with the other uapi and prefix uapi constants with
    DRM_ (José)
v6:
  - Make it clear that zero cpu_caching is only allowed for kernel
    objects. (José)
v7: (Oak)
  - With all the changes from the original design, it looks we can
    further simplify here and drop the explicit coh_mode. We can just
    infer the coh_mode from the cpu_caching. i.e reject cpu_caching=wb +
    coh_none. It's one less thing for userspace to maintain so seems
    worth it.

Testcase: igt@xe_mmap@cpu-caching
Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Co-developed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Zhengguo Xu <zhengguo.xu@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 102 +++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h       |   9 +--
 drivers/gpu/drm/xe/xe_bo_types.h |   5 ++
 drivers/gpu/drm/xe/xe_dma_buf.c  |   5 +-
 include/uapi/drm/xe_drm.h        |  19 +++++-
 5 files changed, 108 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1ae0543882a0..89d4bc506539 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -327,7 +327,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ttm_tt *tt;
 	unsigned long extra_pages;
-	enum ttm_caching caching = ttm_cached;
+	enum ttm_caching caching;
 	int err;
 
 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
@@ -341,13 +341,24 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
 					   PAGE_SIZE);
 
+	switch (bo->cpu_caching) {
+	case DRM_XE_GEM_CPU_CACHING_WC:
+		caching = ttm_write_combined;
+		break;
+	default:
+		caching = ttm_cached;
+		break;
+	}
+
+	WARN_ON((bo->flags & XE_BO_CREATE_USER_BIT) && !bo->cpu_caching);
+
 	/*
 	 * Display scanout is always non-coherent with the CPU cache.
 	 *
 	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
 	 * require a CPU:WC mapping.
 	 */
-	if (bo->flags & XE_BO_SCANOUT_BIT ||
+	if ((!bo->cpu_caching && bo->flags & XE_BO_SCANOUT_BIT) ||
 	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
 		caching = ttm_write_combined;
 
@@ -1191,10 +1202,11 @@ void xe_bo_free(struct xe_bo *bo)
 	kfree(bo);
 }
 
-struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				    struct xe_tile *tile, struct dma_resv *resv,
-				    struct ttm_lru_bulk_move *bulk, size_t size,
-				    enum ttm_bo_type type, u32 flags)
+struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
+				     struct xe_tile *tile, struct dma_resv *resv,
+				     struct ttm_lru_bulk_move *bulk, size_t size,
+				     u16 cpu_caching, enum ttm_bo_type type,
+				     u32 flags)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1232,6 +1244,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->tile = tile;
 	bo->size = size;
 	bo->flags = flags;
+	bo->cpu_caching = cpu_caching;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
 	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
 	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
@@ -1347,11 +1360,11 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	return 0;
 }
 
-struct xe_bo *
-xe_bo_create_locked_range(struct xe_device *xe,
-			  struct xe_tile *tile, struct xe_vm *vm,
-			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags)
+static struct xe_bo *
+__xe_bo_create_locked(struct xe_device *xe,
+		      struct xe_tile *tile, struct xe_vm *vm,
+		      size_t size, u64 start, u64 end,
+		      u16 cpu_caching, enum ttm_bo_type type, u32 flags)
 {
 	struct xe_bo *bo = NULL;
 	int err;
@@ -1372,11 +1385,11 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		}
 	}
 
-	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
-				   vm && !xe_vm_in_fault_mode(vm) &&
-				   flags & XE_BO_CREATE_USER_BIT ?
-				   &vm->lru_bulk_move : NULL, size,
-				   type, flags);
+	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
+				    vm && !xe_vm_in_fault_mode(vm) &&
+				    flags & XE_BO_CREATE_USER_BIT ?
+				    &vm->lru_bulk_move : NULL, size,
+				    cpu_caching, type, flags);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -1409,11 +1422,35 @@ xe_bo_create_locked_range(struct xe_device *xe,
 	return ERR_PTR(err);
 }
 
+struct xe_bo *
+xe_bo_create_locked_range(struct xe_device *xe,
+			  struct xe_tile *tile, struct xe_vm *vm,
+			  size_t size, u64 start, u64 end,
+			  enum ttm_bo_type type, u32 flags)
+{
+	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type, flags);
+}
+
 struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
 				  enum ttm_bo_type type, u32 flags)
 {
-	return xe_bo_create_locked_range(xe, tile, vm, size, 0, ~0ULL, type, flags);
+	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, type, flags);
+}
+
+static struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
+				       struct xe_vm *vm, size_t size,
+				       u16 cpu_caching,
+				       enum ttm_bo_type type,
+				       u32 flags)
+{
+	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
+						 cpu_caching, type,
+						 flags | XE_BO_CREATE_USER_BIT);
+	if (!IS_ERR(bo))
+		xe_bo_unlock_vm_held(bo);
+
+	return bo;
 }
 
 struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
@@ -1795,11 +1832,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_gem_create *args = data;
 	struct xe_vm *vm = NULL;
 	struct xe_bo *bo;
-	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
+	unsigned int bo_flags;
 	u32 handle;
 	int err;
 
-	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -1826,6 +1863,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
 		return -EINVAL;
 
+	bo_flags = 0;
 	if (args->flags & XE_GEM_CREATE_FLAG_DEFER_BACKING)
 		bo_flags |= XE_BO_DEFER_BACKING;
 
@@ -1841,6 +1879,18 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
 	}
 
+	if (XE_IOCTL_DBG(xe, !args->cpu_caching ||
+			 args->cpu_caching > DRM_XE_GEM_CPU_CACHING_WC))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_CREATE_VRAM_MASK &&
+			 args->cpu_caching != DRM_XE_GEM_CPU_CACHING_WC))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_SCANOUT_BIT &&
+			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
+		return -EINVAL;
+
 	if (args->vm_id) {
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
@@ -1852,8 +1902,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
-			  bo_flags);
+	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
+			       ttm_bo_type_device, bo_flags);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_vm;
@@ -2145,10 +2195,12 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
 			   page_size);
 
-	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
-			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
-			  XE_BO_NEEDS_CPU_ACCESS);
+	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
+			       DRM_XE_GEM_CPU_CACHING_WC,
+			       ttm_bo_type_device,
+			       XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+			       XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
+			       XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 98ed35cf39a3..dcbea71f50ed 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -85,10 +85,11 @@ struct sg_table;
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
-struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				    struct xe_tile *tile, struct dma_resv *resv,
-				    struct ttm_lru_bulk_move *bulk, size_t size,
-				    enum ttm_bo_type type, u32 flags);
+struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
+				     struct xe_tile *tile, struct dma_resv *resv,
+				     struct ttm_lru_bulk_move *bulk, size_t size,
+				     u16 cpu_caching, enum ttm_bo_type type,
+				     u32 flags);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_tile *tile, struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 051fe990c133..18a90527e394 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -76,6 +76,11 @@ struct xe_bo {
 	struct llist_node freed;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
+	/**
+	 * @cpu_caching: CPU caching mode. Currently only used for userspace
+	 * objects.
+	 */
+	u16 cpu_caching;
 };
 
 #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index cfde3be3b0dc..64ed303728fd 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -214,8 +214,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 	int ret;
 
 	dma_resv_lock(resv, NULL);
-	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
-				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
+	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+				    0, /* Will require 1way or 2way for vm_bind */
+				    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
 		goto error;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9bd7092a7ea4..e064ed475bf6 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -548,8 +548,25 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+	/**
+	 * @cpu_caching: The CPU caching mode to select for this object. If
+	 * mmaping the object the mode selected here will also be used.
+	 *
+	 * Supported values:
+	 *
+	 * DRM_XE_GEM_CPU_CACHING_WB: Allocate the pages with write-back
+	 * caching.  On iGPU this can't be used for scanout surfaces. Currently
+	 * not allowed for objects placed in VRAM.
+	 *
+	 * DRM_XE_GEM_CPU_CACHING_WC: Allocate the pages as write-combined. This
+	 * is uncached. Scanout surfaces should likely use this. All objects
+	 * that can be placed in VRAM must use this.
+	 */
+#define DRM_XE_GEM_CPU_CACHING_WB                      1
+#define DRM_XE_GEM_CPU_CACHING_WC                      2
+	__u16 cpu_caching;
 	/** @pad: MBZ */
-	__u32 pad;
+	__u16 pad;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.41.0

