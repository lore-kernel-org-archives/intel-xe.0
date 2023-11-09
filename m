Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626B6C4167D
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B8E10E21C;
	Thu,  9 Nov 2023 15:08:20 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A5510E8C5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:08:05 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 16:07:55 +0100
Message-Id: <20231109150759.44549-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
References: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/9] drm/xe: Update headers to be more compatible
 with i915
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

Add more compatibility changes to decrease delta with i915.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../compat-i915-headers/gem/i915_gem_lmem.h   |  2 +
 .../compat-i915-headers/gem/i915_gem_mman.h   | 17 +++++
 .../compat-i915-headers/gem/i915_gem_object.h | 76 +++++++++++++++++++
 .../gem/i915_gem_object_frontbuffer.h         |  4 +-
 .../xe/compat-i915-headers/i915_gem_stolen.h  | 13 +++-
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  6 ++
 6 files changed, 113 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
new file mode 100644
index 0000000000000..2f55e7e951e8c
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
@@ -0,0 +1,2 @@
+/* Empty */
+
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
new file mode 100644
index 0000000000000..650ea2803a97c
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _I915_GEM_MMAN_H_
+#define _I915_GEM_MMAN_H_
+
+#include "xe_bo_types.h"
+#include <drm/drm_prime.h>
+
+static inline int i915_gem_fb_mmap(struct xe_bo *bo, struct vm_area_struct *vma)
+{
+	return drm_gem_prime_mmap(&bo->ttm.base, vma);
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
new file mode 100644
index 0000000000000..17620412eddde
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _I915_GEM_OBJECT_H_
+#define _I915_GEM_OBJECT_H_
+
+/* For tiling definitions */
+#include <uapi/drm/i915_drm.h>
+
+#undef I915_TILING_X
+#undef I915_TILING_Y
+#define I915_TILING_X 0
+#define I915_TILING_Y 0
+
+#include "xe_bo.h"
+#include <linux/types.h>
+
+static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
+						 u32 ofs, u64 *ptr, u32 size)
+{
+	struct ttm_bo_kmap_obj map;
+	void *virtual;
+	bool is_iomem;
+	int ret;
+
+	WARN_ON(size != 8);
+
+	ret = xe_bo_lock(bo, true);
+	if (ret)
+		return ret;
+
+	ret = ttm_bo_kmap(&bo->ttm, ofs >> PAGE_SHIFT, 1, &map);
+	if (ret)
+		goto out_unlock;
+
+	ofs &= ~PAGE_MASK;
+	virtual = ttm_kmap_obj_virtual(&map, &is_iomem);
+	if (is_iomem)
+		*ptr = readq((void __iomem *)(virtual + ofs));
+	else
+		*ptr = *(u64 *)(virtual + ofs);
+
+	ttm_bo_kunmap(&map);
+out_unlock:
+	xe_bo_unlock(bo);
+	return ret;
+}
+
+static inline dma_addr_t i915_gem_object_get_dma_address(const struct xe_bo *bo, pgoff_t n)
+{
+	/* Should never be called */
+	WARN_ON(1);
+	return n;
+}
+
+/* Useful for kernel managed objects only */
+static inline bool i915_gem_object_is_shmem(const struct xe_bo *bo)
+{
+	return bo->flags & XE_BO_CREATE_SYSTEM_BIT;
+}
+
+static inline bool i915_gem_object_is_tiled(const struct xe_bo *bo)
+{
+	/* legacy tiling is unused */
+	return false;
+}
+
+static inline bool i915_gem_object_is_userptr(const struct xe_bo *bo)
+{
+	/* legacy tiling is unused */
+	return false;
+}
+
+#endif
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
index 227965e5f7846..6d883aca48b6e 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _I915_GEM_OBJECT_H_
-#define _I915_GEM_OBJECT_H_
+#ifndef _I915_GEM_OBJECT_FB_H_
+#define _I915_GEM_OBJECT_FB_H_
 
 #define i915_gem_object_get_frontbuffer(obj)		NULL
 #define i915_gem_object_set_frontbuffer(obj, front)	(front)
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
index 32f60258ded69..19bf463cfd3d2 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -1,5 +1,5 @@
-#ifndef _I915_GEM_OBJECT_H_
-#define _I915_GEM_OBJECT_H_
+#ifndef _I915_GEM_STOLEN_H_
+#define _I915_GEM_STOLEN_H_
 
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_res_cursor.h"
@@ -70,7 +70,14 @@ static inline u32 i915_gem_stolen_node_offset(struct i915_stolen_fb *fb)
 /* Used for < gen4. These are not supported by Xe */
 #define i915_gem_stolen_area_address(xe) (!WARN_ON(1))
 /* Used for gen9 specific WA. Gen9 is not supported by Xe */
-#define i915_gem_stolen_area_size(xe) (!WARN_ON(1))
+static inline u64 i915_gem_stolen_area_size(struct xe_device *xe)
+{
+	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
+
+	if (!ttm_mgr)
+		return 0;
+	return ttm_mgr->size;
+}
 
 #define i915_gem_stolen_node_address(xe, fb) (xe_ttm_stolen_gpu_offset(xe) + \
 					 i915_gem_stolen_node_offset(fb))
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 9424144b1b5aa..23f2d037c313e 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -19,4 +19,10 @@ struct i915_vma {
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
 
 #define i915_vma_fence_id(vma) -1
+
+static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
+{
+	return vma->node.start;
+}
+
 #endif
-- 
2.39.2

