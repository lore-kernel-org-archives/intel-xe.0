Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB72C25B67
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D03B10E7F7;
	Thu, 26 Oct 2023 14:09:26 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB2F10E7F5
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:09:24 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 26 Oct 2023 16:09:12 +0200
Message-Id: <20231026140914.10649-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
 <20231026140914.10649-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/15] drm/xe: Update headers to be more
 compatible with i915
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

---
 .../xe/compat-i915-headers/gem/i915_gem_mman.h | 17 +++++++++++++++++
 .../compat-i915-headers/gem/i915_gem_object.h  | 18 ++++++++++++++++++
 .../xe/compat-i915-headers/i915_gem_stolen.h   |  9 ++++++++-
 3 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
new file mode 100644
index 000000000000..650ea2803a97
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
index 5f0545a3a99b..17620412eddd 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -55,4 +55,22 @@ static inline dma_addr_t i915_gem_object_get_dma_address(const struct xe_bo *bo,
 	return n;
 }
 
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
 #endif
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
index 888e7a87a925..19bf463cfd3d 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
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
-- 
2.40.1

