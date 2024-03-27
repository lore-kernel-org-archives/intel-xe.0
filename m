Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FBAC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 16:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3971310FDD2;
	Wed, 27 Mar 2024 16:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5PJMb2c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF60910FDCA
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711555554; x=1743091554;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fz7eKIkTbyMRPidEa336htE0jl52yU9Iy0gVZwZ/CN8=;
 b=m5PJMb2cjgJCUxh8Aw4wIPV2j2KmOw3q9n51A87W3Nk+TzwG8ZfW59sJ
 jI6OKGyAtF2Al5Yjon7jzA658BNVDYyNDtiXIKh9cKFEl5E0pLDFsC+z6
 6mEr8PR2Q7bGmqM05tB4pMHi+W/lBl2YBj3Z6SXFX9DX/MDlcDGwRfh/z
 QVqmcV5coYBTK5fTAsoorlrHjCfwQTeXsmMn4iP5W74yD4b2Fsv143ygi
 X0xSFTqxGwYotgtBqzl3JoZAjli+EvqSdN/TVhVYJuY4M/Tc+bgiIHUHD
 F8IGZG/KQLlW2n+jxtt/yQOcVV64pp1TPi/O5DwG1plcgn+R7x3yrk2a0 Q==;
X-CSE-ConnectionGUID: 4oZXKhOkQRu9nTv826O6MA==
X-CSE-MsgGUID: cu7ZGjKLS4GS4rQyBmNY1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18056681"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="18056681"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16292699"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.184])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:05:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 7/8] drm/xe, drm/ttm: Provide a generic LRU walker helper
Date: Wed, 27 Mar 2024 17:05:35 +0100
Message-ID: <20240327160536.53597-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327160536.53597-1-thomas.hellstrom@linux.intel.com>
References: <20240327160536.53597-1-thomas.hellstrom@linux.intel.com>
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

Export the needed functions from TTM and provide a generic LRU
walker in xe, in the spirit of drm_gem_lru_scan() but building
on the restartable TTM LRU functionality.

The LRU walker optionally supports locking objects as part of
a drm_exec locking transaction, and can thus be used for both
exhaustive eviction and shrinking. And, in fact, direct
shrinking in the case where we fail to populate system memory
objects and want to retry by shrinking purgeable or evictable
local objects, which a shrinker is not capable of doing.

The LRU walker helper can easily be moved to TTM when / if used
by other drivers.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c  |   3 +
 drivers/gpu/drm/xe/Makefile         |   1 +
 drivers/gpu/drm/xe/xe_ttm_helpers.c | 106 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_helpers.h |  33 +++++++++
 4 files changed, 143 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 89f19fb6e2b3..4cad467983f8 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -106,6 +106,7 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
 	ttm_resource_cursor_fini_locked(cursor);
 	spin_unlock(lru_lock);
 }
+EXPORT_SYMBOL(ttm_resource_cursor_fini);
 
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
@@ -635,6 +636,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 
 	return NULL;
 }
+EXPORT_SYMBOL(ttm_resource_manager_next);
 
 /**
  * ttm_resource_manager_first() - Start iterating over the resources
@@ -661,6 +663,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
 
 	return ttm_resource_manager_next(cursor);
 }
+EXPORT_SYMBOL(ttm_resource_manager_first);
 
 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
 					  struct iosys_map *dmap,
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..de457db06dc2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -132,6 +132,7 @@ xe-y += xe_bb.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
 	xe_trace.o \
+	xe_ttm_helpers.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
 	xe_ttm_vram_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_ttm_helpers.c b/drivers/gpu/drm/xe/xe_ttm_helpers.c
new file mode 100644
index 000000000000..056f836ce9e4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_helpers.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/drm_exec.h>
+
+#include "xe_ttm_helpers.h"
+
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_device.h>
+
+static bool xe_ttm_lru_walk_trylock(struct xe_ttm_lru_walk *walk,
+				    struct ttm_buffer_object *bo,
+				    bool *needs_unlock)
+{
+	struct ttm_operation_ctx *ctx = walk->ctx;
+
+	*needs_unlock = false;
+
+	if (!walk->exec && dma_resv_trylock(bo->base.resv)) {
+		*needs_unlock = true;
+		return true;
+	}
+
+	if (bo->base.resv == ctx->resv && ctx->allow_res_evict) {
+		dma_resv_assert_held(bo->base.resv);
+		return true;
+	}
+
+	return false;
+}
+
+static void xe_ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool locked)
+{
+	if (locked)
+		dma_resv_unlock(bo->base.resv);
+}
+
+long xe_ttm_lru_walk_for_evict(struct xe_ttm_lru_walk *walk, struct ttm_device *bdev,
+			       struct ttm_resource_manager *man, unsigned int mem_type,
+			       long target)
+{
+	struct drm_exec *exec = walk->exec;
+	struct ttm_resource_cursor cursor;
+	struct ttm_resource *res;
+	long sofar = 0;
+	long lret;
+	int ret;
+
+	spin_lock(&bdev->lru_lock);
+	ttm_resource_manager_for_each_res(man, &cursor, res) {
+		struct ttm_buffer_object *bo = res->bo;
+		bool bo_needs_unlock = false;
+		bool bo_locked = false;
+
+		if (!bo || bo->resource != res)
+			continue;
+
+		if (xe_ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+			bo_locked = true;
+		else if (!exec)
+			continue;
+
+		if (!ttm_bo_get_unless_zero(bo)) {
+			xe_ttm_lru_walk_unlock(bo, bo_needs_unlock);
+			continue;
+		}
+
+		spin_unlock(&bdev->lru_lock);
+
+		if (!bo_locked) {
+			ret = drm_exec_lock_obj(exec, &bo->base);
+			if (ret)
+				ttm_bo_put(bo);
+		}
+
+		lret = 0;
+
+		/*
+		 * Note that in between the release of the lru lock and the
+		 * drm_exec_lock_obj, the bo may have switched resource,
+		 * and also memory type. In that case we just skip it.
+		 */
+		if (bo->resource == res && res->mem_type == mem_type &&
+		    walk->ops->allow_bo(walk, bo, mem_type))
+			lret = walk->ops->process_bo(walk, bo);
+
+		xe_ttm_lru_walk_unlock(bo, bo_needs_unlock);
+		ttm_bo_put(bo);
+		if (lret < 0) {
+			sofar = lret;
+			goto out;
+		}
+
+		sofar += lret;
+		if (sofar >= target)
+			goto out;
+
+		spin_lock(&bdev->lru_lock);
+	}
+	spin_unlock(&bdev->lru_lock);
+out:
+	ttm_resource_cursor_fini(&cursor);
+	return sofar;
+}
diff --git a/drivers/gpu/drm/xe/xe_ttm_helpers.h b/drivers/gpu/drm/xe/xe_ttm_helpers.h
new file mode 100644
index 000000000000..41d82eb7de30
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ttm_helpers.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_TTM_HELPERS_H_
+#define _XE_TTM_HELPERS_H_
+
+#include <linux/types.h>
+
+struct drm_exec;
+struct ttm_device;
+struct ttm_buffer_object;
+struct ttm_operation_ctx;
+struct ttm_resource_manager;
+
+struct xe_ttm_lru_walk;
+struct xe_ttm_lru_walk_ops {
+	bool (*allow_bo)(struct xe_ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+			 unsigned int mem_type);
+	long (*process_bo)(struct xe_ttm_lru_walk *walk, struct ttm_buffer_object *bo);
+};
+
+struct xe_ttm_lru_walk {
+	const struct xe_ttm_lru_walk_ops *ops;
+	struct ttm_operation_ctx *ctx;
+	struct drm_exec *exec;
+};
+
+long xe_ttm_lru_walk_for_evict(struct xe_ttm_lru_walk *walk, struct ttm_device *bdev,
+			       struct ttm_resource_manager *man, unsigned int mem_type,
+			       long target);
+#endif
-- 
2.44.0

