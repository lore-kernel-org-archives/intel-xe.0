Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE5610F6FBF
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 16:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF54F10E272;
	Wed,  1 Apr 2026 16:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heQwYrQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B325410E272
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775060083; x=1806596083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kMgsOXoD3Z6x9mejQpeHYn26WsnYolJSZbQOMJDldu0=;
 b=heQwYrQwlPwIffbYufrsHIOrdoXmVYJD4XOApGNu4tTZwzikDifmPN6U
 XDMbcCb/5nE5CpEV4AJWMJBrPNNXcI2xbLxRz8WmUETfKtxWyL1bc9tLQ
 Pc1oZEYgC4nOPal4leBmWg/URZDYS9GE1oXhX5D7tL+fufvSnamlkpd7s
 Pec3onx50YGXoA7ZH37LY+SyFvqfDP3k2mDfkabdNKDg8qcIC/mkUgFtR
 Kq5aPjsdzP5VW+YwpQAwS2gJbySgN43jEgK18CWD5zdzgQRwUkYwn84Wp
 H8+I7n7RTTdhg5q6gPnN61dB23XLk/IkK8JbZF470SO/W1dmgn2r/7Riz Q==;
X-CSE-ConnectionGUID: iutMkylCQ7yGJKBelHNrcA==
X-CSE-MsgGUID: +kmwAMhXQBOtIwKXvNsKHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98717136"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="98717136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:14:42 -0700
X-CSE-ConnectionGUID: caa2wxHfRAyX3lOJeyP7MQ==
X-CSE-MsgGUID: fgvX6W/1Tq2mKwPxcXNU6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="222354397"
Received: from ksatya-dev.iind.intel.com ([10.190.229.161])
 by fmviesa010.fm.intel.com with ESMTP; 01 Apr 2026 09:14:40 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 1/3] drm/xe/mm: add XE MEM POOL manager with shadow support
Date: Wed,  1 Apr 2026 16:15:26 +0000
Message-ID: <20260401161528.1990499-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
References: <20260401161528.1990499-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a xe_mem_pool manager to allocate sub-ranges from a BO-backed pool
using drm_mm.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V2 -> V3:
- Renamed xe_mm_suballoc to xe_mem_pool_manager.
- Splitted xe_mm_suballoc_manager_init() into xe_mem_pool_init() and
xe_mem_pool_shadow_init() (Michal)
- Made xe_mm_sa_manager structure private. (Matt)
- Introduced init flags to initialize allocated pools.

V1 -> V2:
- Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
- Removed memset during manager init and insert (Matt)
---
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_mem_pool.c       | 379 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mem_pool.h       |  33 +++
 drivers/gpu/drm/xe/xe_mem_pool_types.h |  30 ++
 4 files changed, 443 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.c
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool.h
 create mode 100644 drivers/gpu/drm/xe/xe_mem_pool_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9dacb0579a7d..8e31b14239ec 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -88,6 +88,7 @@ xe-y += xe_bb.o \
 	xe_irq.o \
 	xe_late_bind_fw.o \
 	xe_lrc.o \
+	xe_mem_pool.o \
 	xe_migrate.o \
 	xe_mmio.o \
 	xe_mmio_gem.o \
diff --git a/drivers/gpu/drm/xe/xe_mem_pool.c b/drivers/gpu/drm/xe/xe_mem_pool.c
new file mode 100644
index 000000000000..335a70876bf1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mem_pool.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/kernel.h>
+
+#include <drm/drm_managed.h>
+
+#include "instructions/xe_mi_commands.h"
+#include "xe_bo.h"
+#include "xe_device_types.h"
+#include "xe_map.h"
+#include "xe_mem_pool.h"
+#include "xe_mem_pool_types.h"
+
+/**
+ * struct xe_mem_pool_manager - Memory Suballoc manager.
+ */
+
+struct xe_mem_pool_manager {
+	/** @base: Range allocator over [0, @size) in bytes */
+	struct drm_mm base;
+	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
+	struct xe_bo *bo;
+	/** @shadow: Shadow BO for atomic command updates. */
+	struct xe_bo *shadow;
+	/** @swap_guard: Timeline guard updating @bo and @shadow */
+	struct mutex swap_guard;
+	/** @cpu_addr: CPU virtual address of the active BO. */
+	void *cpu_addr;
+	/** @resv_alloc: Reserved allocation. */
+	struct drm_mm_node *resv_alloc;
+	/** @size: Total size of the managed address space. */
+	u64 size;
+};
+
+static void xe_mem_pool_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_mem_pool_manager *pool_manager = arg;
+
+	drm_mm_takedown(&pool_manager->base);
+
+	if (pool_manager->resv_alloc) {
+		drm_mm_remove_node(pool_manager->resv_alloc);
+		kfree(pool_manager->resv_alloc);
+	}
+
+	if (pool_manager->bo->vmap.is_iomem)
+		kvfree(pool_manager->cpu_addr);
+
+	pool_manager->bo = NULL;
+	pool_manager->shadow = NULL;
+}
+
+static int xe_mem_pool_init_flags(struct xe_mem_pool_manager *mm_pool, u32 size, int flags)
+{
+	struct xe_bo *bo = mm_pool->bo;
+	struct drm_mm_node *node;
+	struct xe_device *xe;
+	u32 initializer;
+	int err;
+
+	if (!flags)
+		return 0;
+
+	if (flags & XE_MEM_POOL_BO_FLAG_INIT_ZERO_FILL)
+		initializer = 0;
+	else if (flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_NOOP ||
+		 flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST)
+		initializer = MI_NOOP;
+	else
+		return -EINVAL;
+
+	xe = tile_to_xe(bo->tile);
+	if (flags & XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY) {
+		bo = mm_pool->shadow;
+		xe_map_memset(xe, &bo->vmap, 0, initializer, size);
+
+		node = mm_pool->resv_alloc;
+		xe_map_memcpy_to(xe, &mm_pool->shadow->vmap,
+				 node->start,
+				 mm_pool->cpu_addr + node->start,
+				 node->size);
+		return 0;
+	}
+
+	xe_map_memset(xe, &bo->vmap, 0, initializer, size);
+
+	if (flags & XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST) {
+		node = kzalloc_obj(*node);
+		if (!node)
+			return -ENOMEM;
+
+		err = drm_mm_insert_node_in_range(&mm_pool->base, node, SZ_4,
+						  0, 0, 0, size, DRM_MM_INSERT_HIGHEST);
+		if (err) {
+			kfree(node);
+			return err;
+		}
+		xe_map_wr(xe, &mm_pool->bo->vmap, node->start, u32, MI_BATCH_BUFFER_END);
+		mm_pool->resv_alloc = node;
+	}
+	return 0;
+}
+
+/**
+ * xe_mem_pool_init() - Initialize a DRM MM pool.
+ * @tile: the &xe_tile where allocate.
+ * @size: number of bytes to allocate.
+ * @flags: flags to use for BO creation.
+ *
+ * Initializes a DRM MM manager for managing memory allocations on a specific
+ * XE tile. The function allocates a buffer object to back the memory region
+ * managed by the DRM MM manager.
+ *
+ * Return: a pointer to the &xe_mem_pool_manager, or an error pointer on failure.
+ */
+struct xe_mem_pool_manager *xe_mem_pool_init(struct xe_tile *tile, u32 size, int flags)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_mem_pool_manager *pool_manager;
+	struct xe_bo *bo;
+	int ret;
+
+	pool_manager = drmm_kzalloc(&xe->drm, sizeof(*pool_manager), GFP_KERNEL);
+	if (!pool_manager)
+		return ERR_PTR(-ENOMEM);
+
+	bo = xe_managed_bo_create_pin_map(xe, tile, size,
+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_GGTT_INVALIDATE |
+					  XE_BO_FLAG_PINNED_NORESTORE);
+	if (IS_ERR(bo)) {
+		drm_err(&xe->drm, "Failed to prepare %uKiB BO for DRM MM manager (%pe)\n",
+			size / SZ_1K, bo);
+		return ERR_CAST(bo);
+	}
+	pool_manager->bo = bo;
+	pool_manager->size = size;
+
+	if (bo->vmap.is_iomem) {
+		pool_manager->cpu_addr = kvzalloc(size, GFP_KERNEL);
+		if (!pool_manager->cpu_addr)
+			return ERR_PTR(-ENOMEM);
+	} else {
+		pool_manager->cpu_addr = bo->vmap.vaddr;
+	}
+
+	drm_mm_init(&pool_manager->base, 0, size);
+	ret = drmm_add_action_or_reset(&xe->drm, xe_mem_pool_fini, pool_manager);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = xe_mem_pool_init_flags(pool_manager, size, flags);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pool_manager;
+}
+
+/**
+ * xe_mem_pool_shadow_init() - Initialize the shadow BO for a DRM MM manager.
+ * @pool_manager: the DRM MM manager to initialize the shadow BO for.
+ * @flags: flags to use for BO creation.
+ *
+ * Initializes the shadow buffer object for the specified DRM MM manager. The
+ * shadow BO is used for atomic command updates and is created with the same
+ * size and properties as the primary BO.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_mem_pool_shadow_init(struct xe_mem_pool_manager *pool_manager, int flags)
+{
+	struct xe_tile *tile = pool_manager->bo->tile;
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_bo *shadow;
+	int ret;
+
+	xe_assert(xe, !pool_manager->shadow);
+
+	ret = drmm_mutex_init(&xe->drm, &pool_manager->swap_guard);
+	if (ret)
+		return ret;
+
+	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+		fs_reclaim_acquire(GFP_KERNEL);
+		might_lock(&pool_manager->swap_guard);
+		fs_reclaim_release(GFP_KERNEL);
+	}
+	shadow = xe_managed_bo_create_pin_map(xe, tile, pool_manager->size,
+					      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					      XE_BO_FLAG_GGTT |
+					      XE_BO_FLAG_GGTT_INVALIDATE |
+					      XE_BO_FLAG_PINNED_NORESTORE);
+	if (IS_ERR(shadow))
+		return PTR_ERR(shadow);
+
+	pool_manager->shadow = shadow;
+
+	ret = xe_mem_pool_init_flags(pool_manager, pool_manager->size,
+				     flags | XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * xe_mem_pool_swap_shadow_locked() - Swap the primary BO with the shadow BO.
+ * @pool_manager: the DRM MM manager containing the primary and shadow BOs.
+ *
+ * Swaps the primary buffer object with the shadow buffer object in the DRM MM
+ * manager. This function must be called with the swap_guard mutex held to
+ * ensure synchronization with any concurrent operations that may be accessing
+ * the BOs.
+ *
+ * Return: None.
+ */
+void xe_mem_pool_swap_shadow_locked(struct xe_mem_pool_manager *pool_manager)
+{
+	struct xe_tile *tile = pool_manager->bo->tile;
+
+	xe_tile_assert(tile, pool_manager->shadow);
+	lockdep_assert_held(&pool_manager->swap_guard);
+
+	swap(pool_manager->bo, pool_manager->shadow);
+	if (!pool_manager->bo->vmap.is_iomem)
+		pool_manager->cpu_addr = pool_manager->bo->vmap.vaddr;
+}
+
+/**
+ * xe_mem_pool_sync_shadow_locked() - Synchronize the shadow BO with the primary BO.
+ * @pool_manager: the DRM MM manager containing the primary and shadow BOs.
+ * @node: the DRM MM node representing the region to synchronize.
+ *
+ * Copies the contents of the specified region from the primary buffer object to
+ * the shadow buffer object in the DRM MM manager.
+ * Swap_guard must be held to ensure synchronization with any concurrent swap
+ * operations.
+ *
+ * Return: None.
+ */
+void xe_mem_pool_sync_shadow_locked(struct xe_mem_pool_manager *pool_manager,
+				    struct drm_mm_node *node)
+{
+	struct xe_tile *tile = pool_manager->bo->tile;
+	struct xe_device *xe = tile_to_xe(tile);
+
+	xe_tile_assert(tile, pool_manager->shadow);
+	lockdep_assert_held(&pool_manager->swap_guard);
+
+	xe_map_memcpy_to(xe, &pool_manager->shadow->vmap,
+			 node->start,
+			 pool_manager->cpu_addr + node->start,
+			 node->size);
+}
+
+/**
+ * xe_mem_pool_insert_node() - Insert a node into the DRM MM manager.
+ * @pool_manager: the DRM MM manager to insert the node into.
+ * @node: the DRM MM node to insert.
+ * @size: the size of the node to insert.
+ *
+ * Inserts a node into the DRM MM manager and clears the corresponding memory region
+ * in both the primary and shadow buffer objects.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_mem_pool_insert_node(struct xe_mem_pool_manager *pool_manager,
+			    struct drm_mm_node *node, u32 size)
+{
+	struct drm_mm *mm = &pool_manager->base;
+	int ret;
+
+	ret = drm_mm_insert_node(mm, node, size);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * xe_mem_pool_remove_node() - Remove a node from the DRM MM manager.
+ * @node: the DRM MM node to remove.
+ *
+ * Return: None.
+ */
+void xe_mem_pool_remove_node(struct drm_mm_node *node)
+{
+	return drm_mm_remove_node(node);
+}
+
+/**
+ * xe_mem_pool_manager_gpu_addr() - Retrieve GPU address of BO within a memory manager.
+ * @pool_manager: The DRM MM memory manager.
+ *
+ * Returns: GGTT address of the back storage BO
+ */
+u64 xe_mem_pool_manager_gpu_addr(struct xe_mem_pool_manager *pool_manager)
+{
+	return xe_bo_ggtt_addr(pool_manager->bo);
+}
+
+/**
+ * xe_mem_pool_manager_cpu_addr() - Retrieve CPU address of BO within a memory manager.
+ * @pool_manager: The DRM MM memory manager.
+ *
+ * Returns: CPU virtual address of BO.
+ */
+void *xe_mem_pool_manager_cpu_addr(struct xe_mem_pool_manager *pool_manager)
+{
+	return pool_manager->cpu_addr;
+}
+
+/**
+ * xe_mem_pool_bo_swap_guard() - Retrieve the mutex used to guard swap operations
+ * on a memory manager.
+ * @pool_manager: The DRM MM memory manager.
+ *
+ * Returns: Swap guard mutex.
+ */
+struct mutex *xe_mem_pool_bo_swap_guard(struct xe_mem_pool_manager *pool_manager)
+{
+	return &pool_manager->swap_guard;
+}
+
+/**
+ * xe_mem_pool_dump() - Dump the state of the DRM MM manager for debugging.
+ * @pool_manager: The DRM MM manager to dump.
+ * @p: The DRM printer to use for output.
+ *
+ * Returns: None.
+ */
+void xe_mem_pool_dump(struct xe_mem_pool_manager *pool_manager, struct drm_printer *p)
+{
+	drm_mm_print(&pool_manager->base, p);
+}
+
+static inline struct xe_mem_pool_manager *to_xe_mem_pool_manager(struct drm_mm *mng)
+{
+	return container_of(mng, struct xe_mem_pool_manager, base);
+}
+
+/**
+ * xe_mem_pool_bo_flush_write() - Copy the data from the sub-allocation
+ * to the GPU memory.
+ * @node: the &drm_mm_node to flush
+ */
+void xe_mem_pool_bo_flush_write(struct drm_mm_node *node)
+{
+	struct xe_mem_pool_manager *pool_manager = to_xe_mem_pool_manager(node->mm);
+	struct xe_device *xe = tile_to_xe(pool_manager->bo->tile);
+
+	if (!pool_manager->bo->vmap.is_iomem)
+		return;
+
+	xe_map_memcpy_to(xe, &pool_manager->bo->vmap, node->start,
+			 pool_manager->cpu_addr + node->start,
+			 node->size);
+}
+
+/**
+ * xe_mem_pool_bo_sync_read() - Copy the data from GPU memory to the
+ * sub-allocation.
+ * @node: the &&drm_mm_node to sync
+ */
+void xe_mem_pool_bo_sync_read(struct drm_mm_node *node)
+{
+	struct xe_mem_pool_manager *pool_manager = to_xe_mem_pool_manager(node->mm);
+	struct xe_device *xe = tile_to_xe(pool_manager->bo->tile);
+
+	if (!pool_manager->bo->vmap.is_iomem)
+		return;
+
+	xe_map_memcpy_from(xe, pool_manager->cpu_addr + node->start,
+			   &pool_manager->bo->vmap, node->start, node->size);
+}
diff --git a/drivers/gpu/drm/xe/xe_mem_pool.h b/drivers/gpu/drm/xe/xe_mem_pool.h
new file mode 100644
index 000000000000..f9c5d1e56dd9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mem_pool.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef _XE_MEM_POOL_H_
+#define _XE_MEM_POOL_H_
+
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+#include "drm/drm_mm.h"
+#include "xe_mem_pool_types.h"
+
+struct drm_printer;
+struct xe_mem_pool_manager;
+struct xe_tile;
+
+struct xe_mem_pool_manager *xe_mem_pool_init(struct xe_tile *tile, u32 size, int flags);
+int xe_mem_pool_shadow_init(struct xe_mem_pool_manager *drm_mm_manager, int flags);
+void xe_mem_pool_swap_shadow_locked(struct xe_mem_pool_manager *drm_mm_manager);
+void xe_mem_pool_sync_shadow_locked(struct xe_mem_pool_manager *drm_mm_manager,
+				    struct drm_mm_node *node);
+int xe_mem_pool_insert_node(struct xe_mem_pool_manager *drm_mm_manager,
+			    struct drm_mm_node *node, u32 size);
+void xe_mem_pool_remove_node(struct drm_mm_node *node);
+u64 xe_mem_pool_manager_gpu_addr(struct xe_mem_pool_manager *drm_mm_manager);
+void *xe_mem_pool_manager_cpu_addr(struct xe_mem_pool_manager *mm_manager);
+struct mutex *xe_mem_pool_bo_swap_guard(struct xe_mem_pool_manager *drm_mm_manager);
+void xe_mem_pool_dump(struct xe_mem_pool_manager *mm_manager, struct drm_printer *p);
+void xe_mem_pool_bo_flush_write(struct drm_mm_node *node);
+void xe_mem_pool_bo_sync_read(struct drm_mm_node *node);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_mem_pool_types.h b/drivers/gpu/drm/xe/xe_mem_pool_types.h
new file mode 100644
index 000000000000..bae7706aa8d2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mem_pool_types.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_MEM_POOL_TYPES_H_
+#define _XE_MEM_POOL_TYPES_H_
+
+#include <drm/drm_mm.h>
+
+struct xe_mem_pool_manager;
+
+#define XE_MEM_POOL_BO_FLAG_INIT_ZERO_FILL			BIT(0)
+#define XE_MEM_POOL_BO_FLAG_INIT_CMD_NOOP			BIT(1)
+#define XE_MEM_POOL_BO_FLAG_INIT_CMD_BB_END_HIGHEST		BIT(2)
+#define XE_MEM_POOL_BO_FLAG_INIT_SHADOW_COPY			BIT(3)
+
+/**
+ * struct xe_mem_pool_bb - Sub allocated batch buffer from mem pool.
+ */
+struct xe_mem_pool_bb {
+	/** @node: Range node for this batch buffer. */
+	struct drm_mm_node node;
+	/** @cs: Command stream for this batch buffer. */
+	u32 *cs;
+	/** @len: Length of the CS in dwords. */
+	u32 len;
+};
+
+#endif
-- 
2.43.0

