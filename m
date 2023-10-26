Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D686C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 12:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B1410E7D3;
	Thu, 26 Oct 2023 12:34:03 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8A810E7CE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 12:33:49 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 14:33:24 +0200
Message-Id: <20231026123326.56044-8-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/15] Update compat headers.
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

Some naughty headers used I915_GEM_OBJECT_H instead of their own name,
fix it.

Update headers to move some stuff out from the messy patch.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../compat-i915-headers/gem/i915_gem_lmem.h   |  2 +
 .../compat-i915-headers/gem/i915_gem_object.h | 58 +++++++++++++++++++
 .../gem/i915_gem_object_frontbuffer.h         |  4 +-
 .../xe/compat-i915-headers/i915_gem_stolen.h  |  4 +-
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  6 ++
 5 files changed, 70 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
new file mode 100644
index 000000000000..2f55e7e951e8
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
@@ -0,0 +1,2 @@
+/* Empty */
+
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
new file mode 100644
index 000000000000..5f0545a3a99b
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -0,0 +1,58 @@
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
+#endif
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h
index 227965e5f784..6d883aca48b6 100644
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
index 32f60258ded6..888e7a87a925 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -1,5 +1,5 @@
-#ifndef _I915_GEM_OBJECT_H_
-#define _I915_GEM_OBJECT_H_
+#ifndef _I915_GEM_STOLEN_H_
+#define _I915_GEM_STOLEN_H_
 
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_res_cursor.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 9424144b1b5a..23f2d037c313 100644
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
2.40.1

