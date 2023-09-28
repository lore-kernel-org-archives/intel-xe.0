Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821CACE7B11
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 09:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D18A10E600;
	Thu, 28 Sep 2023 09:28:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC44F10E5FE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695893322; x=1727429322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fn13A+04aeRxkiRQyNf5ueWFp95fnWQ5RiWC0nmRV3Q=;
 b=I+r8qJ+11icxcgsKBGdIHIxD7MAwnZw5aV5ylg4aSciABfBW0vOsahLC
 VE1PEaeI667ZbQHc+z4VxR73/ZeRJ7P8O4p66ozHunrojbiSNvPaBUXat
 FSl/1fL76EEXG+T1vW1k7eZQVrAwwFcXaicIldcHFQwPqP1i8QpQTVEqL
 fGmpClKDKn7MQsZ6AKE9UmIBoWlgqlxijG5EERqcnaFkM31mIuj1cyAoC
 MtubYlYdOKaDF0GYYqS3v8dhBxfa2Aur36aznPWjipHdgM9VuSbaxBHtj
 lUoJEsK609XkRNDgdijpJ/9PUjFcgUBK4QpSvO7fIHZokZ3znabx+Lq7S A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448510005"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="448510005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 02:28:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752900895"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="752900895"
Received: from nlesniak-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 02:28:37 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:28:20 +0100
Message-ID: <20230928092816.375130-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928092816.375130-7-matthew.auld@intel.com>
References: <20230928092816.375130-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 3/5] drm/xe/uapi: Add support for cache and
 coherency mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Pallavi Mishra <pallavi.mishra@intel.com>

Allow userspace to specify the CPU caching mode to use in addition to
coherency modes during object creation. Modify gem create handler and
introduce xe_bo_create_user to replace xe_bo_create. In a later patch we
will support setting the pat_index as part of vm_bind, where expectation
is that the coherency mode extracted from the pat_index must match the
one set at object creation.

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

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Co-authored-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 97 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo.h       |  3 +-
 drivers/gpu/drm/xe/xe_bo_types.h | 10 ++++
 drivers/gpu/drm/xe/xe_dma_buf.c  |  5 +-
 include/uapi/drm/xe_drm.h        | 50 +++++++++++++++-
 5 files changed, 143 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 61789c0e88fb..dc1cc7d55cae 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -326,7 +326,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ttm_tt *tt;
 	unsigned long extra_pages;
-	enum ttm_caching caching = ttm_cached;
+	enum ttm_caching caching;
 	int err;
 
 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
@@ -340,13 +340,22 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
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
 
@@ -1190,9 +1199,10 @@ void xe_bo_free(struct xe_bo *bo)
 	kfree(bo);
 }
 
-struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
+struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_tile *tile, struct dma_resv *resv,
 				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    u16 cpu_caching, u16 coh_mode,
 				    enum ttm_bo_type type, u32 flags)
 {
 	struct ttm_operation_ctx ctx = {
@@ -1231,6 +1241,8 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->tile = tile;
 	bo->size = size;
 	bo->flags = flags;
+	bo->cpu_caching = cpu_caching;
+	bo->coh_mode = coh_mode;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
 	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
 	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
@@ -1316,10 +1328,11 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 }
 
 struct xe_bo *
-xe_bo_create_locked_range(struct xe_device *xe,
-			  struct xe_tile *tile, struct xe_vm *vm,
-			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags)
+__xe_bo_create_locked(struct xe_device *xe,
+		      struct xe_tile *tile, struct xe_vm *vm,
+		      size_t size, u64 start, u64 end,
+		      u16 cpu_caching, u16 coh_mode,
+		      enum ttm_bo_type type, u32 flags)
 {
 	struct xe_bo *bo = NULL;
 	int err;
@@ -1340,10 +1353,11 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		}
 	}
 
-	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
+	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
 				   vm && !xe_vm_in_fault_mode(vm) &&
 				   flags & XE_BO_CREATE_USER_BIT ?
 				   &vm->lru_bulk_move : NULL, size,
+				   cpu_caching, coh_mode,
 				   type, flags);
 	if (IS_ERR(bo))
 		return bo;
@@ -1377,11 +1391,35 @@ xe_bo_create_locked_range(struct xe_device *xe,
 	return ERR_PTR(err);
 }
 
+struct xe_bo *
+xe_bo_create_locked_range(struct xe_device *xe,
+			  struct xe_tile *tile, struct xe_vm *vm,
+			  size_t size, u64 start, u64 end,
+			  enum ttm_bo_type type, u32 flags)
+{
+	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, 0, type, flags);
+}
+
 struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
 				  enum ttm_bo_type type, u32 flags)
 {
-	return xe_bo_create_locked_range(xe, tile, vm, size, 0, ~0ULL, type, flags);
+	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, 0, type, flags);
+}
+
+static struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
+				       struct xe_vm *vm, size_t size,
+				       u16 cpu_caching, u16 coh_mode,
+				       enum ttm_bo_type type,
+				       u32 flags)
+{
+	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
+						 cpu_caching, coh_mode, type,
+						 flags | XE_BO_CREATE_USER_BIT);
+	if (!IS_ERR(bo))
+		xe_bo_unlock_vm_held(bo);
+
+	return bo;
 }
 
 struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
@@ -1764,11 +1802,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
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
 
@@ -1795,6 +1833,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
 		return -EINVAL;
 
+	bo_flags = 0;
 	if (args->flags & XE_GEM_CREATE_FLAG_DEFER_BACKING)
 		bo_flags |= XE_BO_DEFER_BACKING;
 
@@ -1810,6 +1849,26 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
 	}
 
+	if (XE_IOCTL_DBG(xe, !args->coh_mode ||
+			 args->coh_mode > DRM_XE_GEM_COH_AT_LEAST_1WAY))
+		return -EINVAL;
+
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
+	if (XE_IOCTL_DBG(xe, args->coh_mode == DRM_XE_GEM_COH_NONE &&
+			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
+		return -EINVAL;
+
 	if (args->vm_id) {
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
@@ -1821,8 +1880,10 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
-			  bo_flags);
+	bo = xe_bo_create_user(xe, NULL, vm, args->size,
+			       args->cpu_caching, args->coh_mode,
+			       ttm_bo_type_device,
+			       bo_flags);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_vm;
@@ -2114,10 +2175,12 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
 			   page_size);
 
-	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
-			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
-			  XE_BO_NEEDS_CPU_ACCESS);
+	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
+			       DRM_XE_GEM_CPU_CACHING_WC, DRM_XE_GEM_COH_NONE,
+			       ttm_bo_type_device,
+			       XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
+			       XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
+			       XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 5090bdd1e462..eccfa7d187f8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -83,9 +83,10 @@ struct sg_table;
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
-struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
+struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_tile *tile, struct dma_resv *resv,
 				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    u16 cpu_caching, u16 coh_mode,
 				    enum ttm_bo_type type, u32 flags);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 051fe990c133..56f7f9a4975f 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -76,6 +76,16 @@ struct xe_bo {
 	struct llist_node freed;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
+	/**
+	 * @coh_mode: Coherency setting. Currently only used for userspace
+	 * objects.
+	 */
+	u16 coh_mode;
+	/**
+	 * @cpu_caching: CPU caching mode. Currently only used for userspace
+	 * objects.
+	 */
+	u16 cpu_caching;
 };
 
 #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index cfde3be3b0dc..9da5cffeef13 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -214,8 +214,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 	int ret;
 
 	dma_resv_lock(resv, NULL);
-	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
-				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
+	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+				    0, 0, /* Will require 1way or 2way for vm_bind */
+				    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
 		goto error;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d48d8e3c898c..5714085f05de 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -456,8 +456,54 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
-	/** @pad: MBZ */
-	__u32 pad;
+	/**
+	 * @coh_mode: The coherency mode for this object. This will limit the
+	 * possible @smem_caching values.
+	 *
+	 * Supported values:
+	 *
+	 * DRM_XE_GEM_COH_NONE: GPU access is assumed to be not coherent with
+	 * CPU. CPU caches are not snooped.
+	 *
+	 * DRM_XE_GEM_COH_AT_LEAST_1WAY:
+	 *
+	 * CPU-GPU coherency must be at least 1WAY.
+	 *
+	 * If 1WAY then GPU access is coherent with CPU (CPU caches are snooped)
+	 * until GPU acquires. The acquire by the GPU is not tracked by CPU
+	 * caches.
+	 *
+	 * If 2WAY then should be fully coherent between GPU and CPU.  Fully
+	 * tracked by CPU caches. Both CPU and GPU caches are snooped.
+	 *
+	 * Note: On dgpu the GPU device never caches system memory. The device
+	 * should be thought of as always 1WAY coherent, with the addition that
+	 * the GPU never caches system memory. At least on current dgpu HW there
+	 * is no way to turn off snooping so likely the different coherency
+	 * modes of the pat_index make no difference for system memory.
+	 */
+#define DRM_XE_GEM_COH_NONE			1
+#define DRM_XE_GEM_COH_AT_LEAST_1WAY	2
+	__u16 coh_mode;
+
+	/**
+	 * @cpu_caching: The CPU caching mode to select for this object. If
+	 * mmaping the object the mode selected here will also be used.
+	 *
+	 * Supported values:
+	 *
+	 * DRM_XE_GEM_CPU_CACHING_WB: Allocate the pages with write-back caching.
+	 * On iGPU this can't be used for scanout surfaces. The @coh_mode must
+	 * be DRM_XE_GEM_COH_AT_LEAST_1WAY. Currently not allowed for objects placed
+	 * in VRAM.
+	 *
+	 * DRM_XE_GEM_CPU_CACHING_WC: Allocate the pages as write-combined. This is
+	 * uncached. Any @coh_mode is permitted. Scanout surfaces should likely
+	 * use this. All objects that can be placed in VRAM must use this.
+	 */
+#define DRM_XE_GEM_CPU_CACHING_WB                      1
+#define DRM_XE_GEM_CPU_CACHING_WC                      2
+	__u16 cpu_caching;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.41.0

