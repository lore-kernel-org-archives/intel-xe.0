Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4706210ED654
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 10:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71A410EC9D;
	Fri, 27 Mar 2026 10:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et1WL6jW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488D810EC89
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774606319; x=1806142319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tX7A0h5YO8eeWCB9Mx8o1pZCdtzab8uSXsdrlZ+Dv3c=;
 b=Et1WL6jW5YQHHvrVyBuEGJQvCouWZhTANsD5mvQEf7oUoyBV8i20U/v2
 jQxeOcn/cOyBCtg4c98fnANLBVdHV79M0Lg6ksqg+icmI7QhqiCTmMEn2
 afT3ANTtkDQt1cZ5TtQuyHfYZXWD9MNo2YgMmyeV4GXm4khEw1jdYRbhb
 EfwoUHzRUHLqSwwIBQP9C0PqG2R+E4/5GVRmBmHb0zpOri61CjuOnva5C
 EXDV08srOQvLGUh3Fp1/coSzhYhmvbWXLTkMPl/6nwBAJSPsHVrjFTddw
 ECQmy9/d84DW/ES0D2gDgiyT+eYWh2IJ8BzuYPnjA4GEgAAEw4wOTdTeE A==;
X-CSE-ConnectionGUID: DoXwqPszTAGx/4upVL3AZA==
X-CSE-MsgGUID: yapmC5TJRxOF7our2OtcDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75792673"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="75792673"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 03:11:59 -0700
X-CSE-ConnectionGUID: qlYGpoXIRpCzG6gi71TA/w==
X-CSE-MsgGUID: GyBeYaD3S7CeXwRaRqovVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; d="scan'208";a="230197950"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa005.jf.intel.com with ESMTP; 27 Mar 2026 03:11:57 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/3] drm/xe/mm: add XE MM SUBALLOC manager with shadow
 support
Date: Fri, 27 Mar 2026 10:11:48 +0000
Message-ID: <20260327101146.3826819-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327101146.3826819-5-satyanarayana.k.v.p@intel.com>
References: <20260327101146.3826819-5-satyanarayana.k.v.p@intel.com>
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

Add a xe_mm_suballoc manager to allocate sub-ranges from a BO-backed pool
using drm_mm.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V1 -> V2:
- Renamed xe_drm_mm to xe_mm_suballoc (Thomas)
- Removed memset during manager init and insert (Matt)
---
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/xe_mm_suballoc.c       | 195 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mm_suballoc.h       |  55 ++++++
 drivers/gpu/drm/xe/xe_mm_suballoc_types.h |  42 +++++
 4 files changed, 293 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_mm_suballoc.c
 create mode 100644 drivers/gpu/drm/xe/xe_mm_suballoc.h
 create mode 100644 drivers/gpu/drm/xe/xe_mm_suballoc_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 49de1c22a469..2df958635a2d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -41,6 +41,7 @@ xe-y += xe_bb.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
 	xe_drm_client.o \
+	xe_mm_suballoc.o \
 	xe_drm_ras.o \
 	xe_eu_stall.o \
 	xe_exec.o \
diff --git a/drivers/gpu/drm/xe/xe_mm_suballoc.c b/drivers/gpu/drm/xe/xe_mm_suballoc.c
new file mode 100644
index 000000000000..a186cbe594f1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mm_suballoc.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <linux/kernel.h>
+
+#include "xe_device_types.h"
+#include "xe_mm_suballoc_types.h"
+#include "xe_mm_suballoc.h"
+#include "xe_map.h"
+
+static void xe_mm_suballoc_manager_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_mm_suballoc_manager *drm_mm_manager = arg;
+	struct xe_bo *bo = drm_mm_manager->bo;
+
+	if (!bo) {
+		drm_err(drm, "no bo for drm mm manager\n");
+		return;
+	}
+
+	drm_mm_takedown(&drm_mm_manager->base);
+
+	if (drm_mm_manager->is_iomem)
+		kvfree(drm_mm_manager->cpu_addr);
+
+	drm_mm_manager->bo = NULL;
+	drm_mm_manager->shadow = NULL;
+}
+
+/**
+ * xe_mm_suballoc_manager_init() - Create and initialize the DRM MM manager.
+ * @tile: the &xe_tile where allocate.
+ * @size: number of bytes to allocate
+ * @guard: number of bytes to exclude from allocation for guard region
+ * @flags: additional flags for configuring the DRM MM manager.
+ *
+ * Initializes a DRM MM manager for managing memory allocations on a specific
+ * XE tile. The function allocates a buffer object to back the memory region
+ * managed by the DRM MM manager.
+ *
+ * Return: a pointer to the &xe_mm_suballoc_manager, or an error pointer on failure.
+ */
+struct xe_mm_suballoc_manager *xe_mm_suballoc_manager_init(struct xe_tile *tile, u32 size,
+							   u32 guard, u32 flags)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_mm_suballoc_manager *drm_mm_manager;
+	u64 managed_size;
+	struct xe_bo *bo;
+	int ret;
+
+	xe_tile_assert(tile, size > guard);
+	managed_size = size - guard;
+
+	drm_mm_manager = drmm_kzalloc(&xe->drm, sizeof(*drm_mm_manager), GFP_KERNEL);
+	if (!drm_mm_manager)
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
+	drm_mm_manager->bo = bo;
+	drm_mm_manager->is_iomem = bo->vmap.is_iomem;
+
+	if (bo->vmap.is_iomem) {
+		drm_mm_manager->cpu_addr = kvzalloc(managed_size, GFP_KERNEL);
+		if (!drm_mm_manager->cpu_addr)
+			return ERR_PTR(-ENOMEM);
+	} else {
+		drm_mm_manager->cpu_addr = bo->vmap.vaddr;
+	}
+
+	if (flags & XE_MM_SUBALLOC_BO_MANAGER_FLAG_SHADOW) {
+		struct xe_bo *shadow;
+
+		ret = drmm_mutex_init(&xe->drm, &drm_mm_manager->swap_guard);
+		if (ret)
+			return ERR_PTR(ret);
+		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+			fs_reclaim_acquire(GFP_KERNEL);
+			might_lock(&drm_mm_manager->swap_guard);
+			fs_reclaim_release(GFP_KERNEL);
+		}
+
+		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
+						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+						      XE_BO_FLAG_GGTT |
+						      XE_BO_FLAG_GGTT_INVALIDATE |
+						      XE_BO_FLAG_PINNED_NORESTORE);
+		if (IS_ERR(shadow)) {
+			drm_err(&xe->drm,
+				"Failed to prepare %uKiB shadow BO for DRM MM manager (%pe)\n",
+				size / SZ_1K, shadow);
+			return ERR_CAST(shadow);
+		}
+		drm_mm_manager->shadow = shadow;
+	}
+
+	drm_mm_init(&drm_mm_manager->base, 0, managed_size);
+	ret = drmm_add_action_or_reset(&xe->drm, xe_mm_suballoc_manager_fini, drm_mm_manager);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return drm_mm_manager;
+}
+
+/**
+ * xe_mm_suballoc_bo_swap_shadow() - Swap the primary BO with the shadow BO.
+ * @drm_mm_manager: the DRM MM manager containing the primary and shadow BOs.
+ *
+ * Swaps the primary buffer object with the shadow buffer object in the DRM MM
+ * manager.
+ *
+ * Return: None.
+ */
+void xe_mm_suballoc_bo_swap_shadow(struct xe_mm_suballoc_manager *drm_mm_manager)
+{
+	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo->tile);
+
+	xe_assert(xe, drm_mm_manager->shadow);
+	lockdep_assert_held(&drm_mm_manager->swap_guard);
+
+	swap(drm_mm_manager->bo, drm_mm_manager->shadow);
+	if (!drm_mm_manager->bo->vmap.is_iomem)
+		drm_mm_manager->cpu_addr = drm_mm_manager->bo->vmap.vaddr;
+}
+
+/**
+ * xe_mm_suballoc_sync_shadow() - Synchronize the shadow BO with the primary BO.
+ * @drm_mm_manager: the DRM MM manager containing the primary and shadow BOs.
+ * @node: the DRM MM node representing the region to synchronize.
+ *
+ * Copies the contents of the specified region from the primary buffer object to
+ * the shadow buffer object in the DRM MM manager.
+ *
+ * Return: None.
+ */
+void xe_mm_suballoc_sync_shadow(struct xe_mm_suballoc_manager *drm_mm_manager,
+				struct drm_mm_node *node)
+{
+	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo->tile);
+
+	xe_assert(xe, drm_mm_manager->shadow);
+	lockdep_assert_held(&drm_mm_manager->swap_guard);
+
+	xe_map_memcpy_to(xe, &drm_mm_manager->shadow->vmap,
+			 node->start,
+			 drm_mm_manager->cpu_addr + node->start,
+			 node->size);
+}
+
+/**
+ * xe_mm_suballoc_insert_node() - Insert a node into the DRM MM manager.
+ * @drm_mm_manager: the DRM MM manager to insert the node into.
+ * @node: the DRM MM node to insert.
+ * @size: the size of the node to insert.
+ *
+ * Inserts a node into the DRM MM manager and clears the corresponding memory region
+ * in both the primary and shadow buffer objects.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_mm_suballoc_insert_node(struct xe_mm_suballoc_manager *drm_mm_manager,
+			       struct drm_mm_node *node, u32 size)
+{
+	struct drm_mm *mm = &drm_mm_manager->base;
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
+ * xe_mm_suballoc_remove_node() - Remove a node from the DRM MM manager.
+ * @node: the DRM MM node to remove.
+ *
+ * Return: None.
+ */
+void xe_mm_suballoc_remove_node(struct drm_mm_node *node)
+{
+	return drm_mm_remove_node(node);
+}
diff --git a/drivers/gpu/drm/xe/xe_mm_suballoc.h b/drivers/gpu/drm/xe/xe_mm_suballoc.h
new file mode 100644
index 000000000000..afc45691950b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mm_suballoc.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef _XE_MM_SUBALLOC_H_
+#define _XE_MM_SUBALLOC_H_
+
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+#include "xe_bo.h"
+#include "xe_mm_suballoc_types.h"
+
+struct dma_fence;
+struct xe_tile;
+
+#define XE_MM_SUBALLOC_BO_MANAGER_FLAG_SHADOW    BIT(0)
+
+struct xe_mm_suballoc_manager *xe_mm_suballoc_manager_init(struct xe_tile *tile, u32 size,
+							   u32 guard, u32 flags);
+void xe_mm_suballoc_bo_swap_shadow(struct xe_mm_suballoc_manager *drm_mm_manager);
+void xe_mm_suballoc_sync_shadow(struct xe_mm_suballoc_manager *drm_mm_manager,
+				struct drm_mm_node *node);
+int xe_mm_suballoc_insert_node(struct xe_mm_suballoc_manager *drm_mm_manager,
+			       struct drm_mm_node *node, u32 size);
+void xe_mm_suballoc_remove_node(struct drm_mm_node *node);
+
+/**
+ * xe_mm_suballoc_manager_gpu_addr() - Retrieve GPU address of a back storage BO
+ * within a memory manager.
+ * @drm_mm_manager: The DRM MM memory manager.
+ *
+ * Returns: GGTT address of the back storage BO
+ */
+static inline u64 xe_mm_suballoc_manager_gpu_addr(struct xe_mm_suballoc_manager
+						  *drm_mm_manager)
+{
+	return xe_bo_ggtt_addr(drm_mm_manager->bo);
+}
+
+/**
+ * xe_mm_suballoc_bo_swap_guard() - Retrieve the mutex used to guard swap operations
+ * on a memory manager.
+ * @drm_mm_manager: The DRM MM memory manager.
+ *
+ * Returns: Swap guard mutex.
+ */
+static inline struct mutex *xe_mm_suballoc_bo_swap_guard(struct xe_mm_suballoc_manager
+							 *drm_mm_manager)
+{
+	return &drm_mm_manager->swap_guard;
+}
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_mm_suballoc_types.h b/drivers/gpu/drm/xe/xe_mm_suballoc_types.h
new file mode 100644
index 000000000000..9a877f0fe2bb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mm_suballoc_types.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_MM_SUBALLOC_TYPES_H_
+#define _XE_MM_SUBALLOC_TYPES_H_
+
+#include <drm/drm_mm.h>
+
+struct xe_bo;
+
+struct xe_mm_suballoc_manager {
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
+	/** @size: Total size of the managed address space. */
+	u64 size;
+	/** @is_iomem: Whether the managed address space is I/O memory. */
+	bool is_iomem;
+};
+
+struct xe_mm_suballoc_bb {
+	/** @node: Range node for this batch buffer. */
+	struct drm_mm_node node;
+	/** @manager: Manager this batch buffer belongs to. */
+	struct xe_mm_suballoc_manager *manager;
+	/** @cs: Command stream for this batch buffer. */
+	u32 *cs;
+	/** @len: Length of the CS in dwords. */
+	u32 len;
+};
+
+#endif
+
-- 
2.43.0

