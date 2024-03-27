Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F58C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 16:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E16310FDCF;
	Wed, 27 Mar 2024 16:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBV9sgFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6534C10FDD3
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711555555; x=1743091555;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gatQwwXo5Rli+bDW30sE9lcr5ZidJ1dIUIggfn1fLjQ=;
 b=NBV9sgFhudZ4w5Q8tJ5j9e3CzJFNAds5FbEI5wHbKrGEXTtk1m/rYCxY
 MTy40GfgX8/uNHQgQx3FISMSqE32w1X8EMyT7e/tSXKar4zqw0Tx5xF6v
 Lgi22T04TLD03+B6mgZWnm1CYZK5fBYvX8NALl9wTeiNPkPkGj/yBSIz1
 TxRFI28WPxj2EW5ytmknjLuU0a8rMB9T59Gqd+6fSNHlVMKfwETixC0jm
 oh9z2ELTPHsLtXYww16Vy4ZeQmeaKzKosQp2BHMBoB4iC1/Ydx1HoIzbb
 nhZ81FfdH7g9/hAc/beRpTGrAgwKoFIal4GmXrpdbjLjb32eZvYnV424z Q==;
X-CSE-ConnectionGUID: UqXm++txR7uIVceO1ntqpw==
X-CSE-MsgGUID: TWeP3JNyTo+v5t/ttD+Flg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18056685"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="18056685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16292700"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.184])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:05:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 8/8] drm/xe: Add a shrinker for xe bos
Date: Wed, 27 Mar 2024 17:05:36 +0100
Message-ID: <20240327160536.53597-9-thomas.hellstrom@linux.intel.com>
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

Rather than relying on the TTM watermark accounting add a shrinker
for xe_bos in TT or system memory.

Leverage the newly added TTM per-page shrinking and shmem backup
support.

Although xe doesn't fully support WONTNEED (purgeable) bos yet,
introduce and add shrinker support for purgeable ttm_tts.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_bo.c           | 106 +++++++++++---
 drivers/gpu/drm/xe/xe_bo.h           |   3 +
 drivers/gpu/drm/xe/xe_device.c       |   8 ++
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c     | 204 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h     |  18 +++
 drivers/gpu/drm/xe/xe_ttm_helpers.c  |  60 ++++++++
 drivers/gpu/drm/xe/xe_ttm_helpers.h  |   3 +
 9 files changed, 388 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index de457db06dc2..0c849783126e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -127,6 +127,7 @@ xe-y += xe_bb.o \
 	xe_ring_ops.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_shrinker.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9298546909b5..b5e043aaef01 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -10,6 +10,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
@@ -24,7 +25,9 @@
 #include "xe_migrate.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
+#include "xe_shrinker.h"
 #include "xe_trace.h"
+#include "xe_ttm_helpers.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
 
@@ -265,9 +268,10 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 
 struct xe_ttm_tt {
 	struct ttm_tt ttm;
-	struct device *dev;
+	struct xe_device *xe;
 	struct sg_table sgt;
 	struct sg_table *sg;
+	bool purgeable;
 };
 
 static int xe_tt_map_sg(struct ttm_tt *tt)
@@ -276,7 +280,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	unsigned long num_pages = tt->num_pages;
 	int ret;
 
-	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
+	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+		   !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE));
 
 	if (xe_tt->sg)
 		return 0;
@@ -284,13 +289,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
 						num_pages, 0,
 						(u64)num_pages << PAGE_SHIFT,
-						xe_sg_segment_size(xe_tt->dev),
+						xe_sg_segment_size(xe_tt->xe->drm.dev),
 						GFP_KERNEL);
 	if (ret)
 		return ret;
 
 	xe_tt->sg = &xe_tt->sgt;
-	ret = dma_map_sgtable(xe_tt->dev, xe_tt->sg, DMA_BIDIRECTIONAL,
+	ret = dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg, DMA_BIDIRECTIONAL,
 			      DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret) {
 		sg_free_table(xe_tt->sg);
@@ -309,21 +314,37 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
 	return xe_tt->sg;
 }
 
+static void xe_ttm_tt_account(struct ttm_tt *tt, bool add)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	long num_pages = tt->num_pages;
+
+	if (!add)
+		num_pages = -num_pages;
+
+	if (xe_tt->purgeable)
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, num_pages);
+	else
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, num_pages, 0);
+}
+
 static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 				       u32 page_flags)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_ttm_tt *tt;
+	struct xe_ttm_tt *xe_tt;
+	struct ttm_tt *tt;
 	unsigned long extra_pages;
 	enum ttm_caching caching;
 	int err;
 
-	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
-	if (!tt)
+	xe_tt = kzalloc(sizeof(*xe_tt), GFP_KERNEL);
+	if (!xe_tt)
 		return NULL;
 
-	tt->dev = xe->drm.dev;
+	tt = &xe_tt->ttm;
+	xe_tt->xe = xe;
 
 	extra_pages = 0;
 	if (xe_bo_needs_ccs_pages(bo))
@@ -351,13 +372,23 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
 		caching = ttm_write_combined;
 
-	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
+	if (ttm_bo->type != ttm_bo_type_sg)
+		page_flags |= TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE;
+
+	err = ttm_tt_init(tt, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
-		kfree(tt);
+		kfree(xe_tt);
 		return NULL;
 	}
 
-	return &tt->ttm;
+	tt->backup = ttm_backup_shmem_create(tt->num_pages << PAGE_SHIFT);
+	if (IS_ERR(tt->backup)) {
+		ttm_tt_fini(tt);
+		kfree(xe_tt);
+		return NULL;
+	}
+
+	return tt;
 }
 
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
@@ -369,7 +400,8 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 	 * dma-bufs are not populated with pages, and the dma-
 	 * addresses are set up when moved to XE_PL_TT.
 	 */
-	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
+	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 		return 0;
 
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
@@ -378,27 +410,58 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 
 	/* A follow up may move this xe_bo_move when BO is moved to XE_PL_TT */
 	err = xe_tt_map_sg(tt);
-	if (err)
+	if (err) {
 		ttm_pool_free(&ttm_dev->pool, tt);
+		return err;
+	}
 
-	return err;
+	xe_ttm_tt_account(tt, true);
+
+	return 0;
 }
 
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 {
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	struct xe_device *xe = xe_tt->xe;
 
-	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
+	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 		return;
 
 	if (xe_tt->sg) {
-		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
+		dma_unmap_sgtable(xe->drm.dev, xe_tt->sg,
 				  DMA_BIDIRECTIONAL, 0);
 		sg_free_table(xe_tt->sg);
 		xe_tt->sg = NULL;
 	}
 
-	return ttm_pool_free(&ttm_dev->pool, tt);
+	ttm_pool_free(&ttm_dev->pool, tt);
+	xe_ttm_tt_account(tt, false);
+}
+
+long xe_bo_shrinker_process(struct xe_ttm_lru_walk *walk, struct ttm_buffer_object *bo)
+{
+	struct ttm_tt *tt = bo->ttm;
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	struct xe_device *xe = xe_tt->xe;
+	long lret;
+
+	lret = xe_ttm_bo_try_shrink(walk, bo, xe_tt->purgeable);
+	if (lret > 0) {
+		xe_assert(xe, !ttm_tt_is_populated(tt));
+
+		xe_ttm_tt_account(tt, false);
+
+		if (xe_tt->sg) {
+			dma_unmap_sgtable(xe->drm.dev, xe_tt->sg,
+					  DMA_BIDIRECTIONAL, 0);
+			sg_free_table(xe_tt->sg);
+			xe_tt->sg = NULL;
+		}
+	}
+
+	return lret;
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -1644,6 +1707,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account(bo->ttm.ttm, false);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1702,6 +1767,8 @@ int xe_bo_pin(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account(bo->ttm.ttm, false);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1737,6 +1804,9 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 	}
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account(bo->ttm.ttm, true);
+
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1766,6 +1836,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 	}
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account(bo->ttm.ttm, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 52e441f77e96..3866ba9d4523 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -93,6 +93,7 @@
 #define XE_BO_PROPS_INVALID	(-1)
 
 struct sg_table;
+struct xe_ttm_lru_walk;
 
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
@@ -344,6 +345,8 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 
 #define i915_gem_object_flush_if_display(obj)		((void)(obj))
 
+long xe_bo_shrinker_process(struct xe_ttm_lru_walk *walk, struct ttm_buffer_object *bo);
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b0bfe75eb59f..f05a9d8ed23d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -38,6 +38,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_shrinker.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -232,6 +233,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
+	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
+		xe_shrinker_destroy(xe->mem.shrinker);
+
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -261,6 +265,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
+	xe->mem.shrinker = xe_shrinker_create(xe);
+	if (IS_ERR(xe->mem.shrinker))
+		return ERR_CAST(xe->mem.shrinker);
+
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..c9b51a4e5365 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -315,6 +315,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.sys_mgr: system memory shrinker. */
+		struct xe_shrinker *shrinker;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
new file mode 100644
index 000000000000..7340229d11a0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/shrinker.h>
+#include <linux/swap.h>
+
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_tt.h>
+
+#include "xe_bo.h"
+#include "xe_shrinker.h"
+#include "xe_ttm_helpers.h"
+
+struct xe_shrinker {
+	struct xe_device *xe;
+	rwlock_t lock;
+	long shrinkable_pages;
+	long purgeable_pages;
+	struct shrinker *shrink;
+};
+
+struct xe_shrink_lru_walk {
+	struct xe_ttm_lru_walk walk;
+	struct xe_shrinker *shrinker;
+	bool purge;
+};
+
+static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
+{
+	return shrink->private_data;
+}
+
+static struct xe_shrink_lru_walk *
+to_xe_shrink_lru_walk(struct xe_ttm_lru_walk *walk)
+{
+	return container_of(walk, struct xe_shrink_lru_walk, walk);
+}
+
+void
+xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable)
+{
+	write_lock(&shrinker->lock);
+	shrinker->shrinkable_pages += shrinkable;
+	shrinker->purgeable_pages += purgeable;
+	write_unlock(&shrinker->lock);
+}
+
+static bool xe_shrinker_allow_bo(struct xe_ttm_lru_walk *walk,
+				 struct ttm_buffer_object *bo,
+				 unsigned int mem_type)
+{
+	struct xe_shrink_lru_walk *shrink_walk = to_xe_shrink_lru_walk(walk);
+	struct ttm_place place = {.mem_type = mem_type};
+	struct ttm_tt *tt = bo->ttm;
+	bool ret;
+
+	if (!tt || !ttm_tt_is_populated(tt) ||
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
+		return false;
+
+	if (shrink_walk->purge)
+		return false;
+
+	ret = ttm_bo_eviction_valuable(bo, &place);
+
+	return ret;
+}
+
+static long xe_shrinker_walk(struct xe_shrink_lru_walk *shrink_walk, long target)
+{
+	struct xe_device *xe = shrink_walk->shrinker->xe;
+	struct ttm_resource_manager *man;
+	unsigned int mem_type;
+	long sofar = 0;
+	long lret;
+
+	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
+		man = ttm_manager_type(&xe->ttm, mem_type);
+		if (!man || !man->use_tt)
+			continue;
+
+		lret = xe_ttm_lru_walk_for_evict(&shrink_walk->walk,
+						 &xe->ttm, man,
+						 mem_type, target);
+		if (lret < 0)
+			return lret;
+
+		sofar += lret;
+		if (sofar >= target)
+			break;
+	}
+
+	return sofar;
+}
+
+static unsigned long
+xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	unsigned long num_pages;
+
+	num_pages = get_nr_swap_pages();
+	read_lock(&shrinker->lock);
+	num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
+	num_pages += shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
+static const struct xe_ttm_lru_walk_ops xe_shrink_ops = {
+	.process_bo = xe_bo_shrinker_process,
+	.allow_bo = xe_shrinker_allow_bo,
+};
+
+static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	bool is_kswapd = current_is_kswapd();
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = !is_kswapd,
+	};
+	unsigned long nr_to_scan, freed = 0;
+	struct xe_shrink_lru_walk shrink_walk = {
+		.walk = {
+			.ops = &xe_shrink_ops,
+			.ctx = &ctx,
+		},
+		.purge = true,
+		.shrinker = shrinker,
+	};
+	bool purgeable;
+	long ret;
+
+	sc->nr_scanned = 0;
+	nr_to_scan = sc->nr_to_scan;
+
+	read_lock(&shrinker->lock);
+	purgeable = !!shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	while (purgeable && freed < nr_to_scan) {
+		ret = xe_shrinker_walk(&shrink_walk, nr_to_scan);
+		if (ret <= 0)
+			break;
+
+		freed += ret;
+	}
+
+	sc->nr_scanned = freed;
+	if (freed < nr_to_scan)
+		nr_to_scan -= freed;
+	else
+		nr_to_scan = 0;
+	if (!nr_to_scan)
+		return freed ? freed : SHRINK_STOP;
+
+	shrink_walk.purge = false;
+	while (freed < nr_to_scan) {
+		ret = xe_shrinker_walk(&shrink_walk, nr_to_scan);
+		if (ret <= 0)
+			break;
+
+		freed += ret;
+	}
+
+	sc->nr_scanned = freed;
+
+	return freed ? freed : SHRINK_STOP;
+}
+
+struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
+{
+	struct xe_shrinker *shrinker = kzalloc(sizeof(*shrinker), GFP_KERNEL);
+
+	if (!shrinker)
+		return ERR_PTR(-ENOMEM);
+
+	shrinker->shrink = shrinker_alloc(0, "xe system shrinker");
+	if (!shrinker->shrink) {
+		kfree(shrinker);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	shrinker->xe = xe;
+	rwlock_init(&shrinker->lock);
+	shrinker->shrink->count_objects = xe_shrinker_count;
+	shrinker->shrink->scan_objects = xe_shrinker_scan;
+	shrinker->shrink->private_data = shrinker;
+	shrinker_register(shrinker->shrink);
+
+	return shrinker;
+}
+
+void xe_shrinker_destroy(struct xe_shrinker *shrinker)
+{
+	pr_info("Shrinkable at exit %ld\n", shrinker->shrinkable_pages);
+	pr_info("Purgeable at exit %ld\n", shrinker->purgeable_pages);
+	shrinker_free(shrinker->shrink);
+	kfree(shrinker);
+}
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
new file mode 100644
index 000000000000..28a038f4fcbf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_SHRINKER_H_
+#define _XE_SHRINKER_H_
+
+struct xe_shrinker;
+struct xe_device;
+
+void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
+
+struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
+
+void xe_shrinker_destroy(struct xe_shrinker *shrinker);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_helpers.c b/drivers/gpu/drm/xe/xe_ttm_helpers.c
index 056f836ce9e4..bbef00369a63 100644
--- a/drivers/gpu/drm/xe/xe_ttm_helpers.c
+++ b/drivers/gpu/drm/xe/xe_ttm_helpers.c
@@ -9,6 +9,66 @@
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
+#include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_tt.h>
+
+long xe_ttm_bo_try_shrink(struct xe_ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+			  bool purge)
+{
+	static const struct ttm_place sys_placement_flags = {
+		.fpfn = 0,
+		.lpfn = 0,
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = 0,
+	};
+	static struct ttm_placement sys_placement = {
+		.num_placement = 1,
+		.placement = &sys_placement_flags,
+	};
+	struct ttm_operation_ctx *ctx = walk->ctx;
+	struct ttm_tt *tt = bo->ttm;
+	long lret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (tt || !ttm_tt_is_populated(tt))
+		return 0;
+
+	if (bo->resource->mem_type != TTM_PL_SYSTEM) {
+		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
+
+		if (ret) {
+			if (ret == -EINTR || ret == -EDEADLK ||
+			    ret == -ERESTARTSYS)
+				return ret;
+			return 0;
+		}
+	}
+
+	if (ctx->no_wait_gpu &&
+	    !dma_resv_test_signaled(bo->base.resv,
+				    DMA_RESV_USAGE_BOOKKEEP))
+		return 0;
+
+	lret = dma_resv_wait_timeout(bo->base.resv,
+				     DMA_RESV_USAGE_BOOKKEEP,
+				     walk->ctx->interruptible,
+				     MAX_SCHEDULE_TIMEOUT);
+	if (lret < 0) {
+		if (lret == -ERESTARTSYS)
+			return lret;
+		return 0;
+	}
+
+	if (bo->deleted)
+		lret = ttm_tt_shrink(bo->bdev, tt, true);
+	else
+		lret = ttm_tt_shrink(bo->bdev, tt, purge);
+	if (lret < 0 && lret != -EINTR)
+		return 0;
+
+	return lret;
+}
 
 static bool xe_ttm_lru_walk_trylock(struct xe_ttm_lru_walk *walk,
 				    struct ttm_buffer_object *bo,
diff --git a/drivers/gpu/drm/xe/xe_ttm_helpers.h b/drivers/gpu/drm/xe/xe_ttm_helpers.h
index 41d82eb7de30..eb5ed7613059 100644
--- a/drivers/gpu/drm/xe/xe_ttm_helpers.h
+++ b/drivers/gpu/drm/xe/xe_ttm_helpers.h
@@ -27,6 +27,9 @@ struct xe_ttm_lru_walk {
 	struct drm_exec *exec;
 };
 
+long xe_ttm_bo_try_shrink(struct xe_ttm_lru_walk *walk, struct ttm_buffer_object *bo,
+			  bool purge);
+
 long xe_ttm_lru_walk_for_evict(struct xe_ttm_lru_walk *walk, struct ttm_device *bdev,
 			       struct ttm_resource_manager *man, unsigned int mem_type,
 			       long target);
-- 
2.44.0

