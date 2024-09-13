Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D63FA3755
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 14:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B04710ED22;
	Fri, 13 Sep 2024 14:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuIctxXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C045810E26E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 14:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726236932; x=1757772932;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j1GrPJ+dUxJE5GmJHwks6lkj5xMxaQ53xiDanvFfg1U=;
 b=CuIctxXvs6qRWzxpAUNgj9PCguWyv2VdWGL5FHHHLbf3lt8pYhy/i/I9
 Mo/hhN00l/GlzS04/WHuYkjjQ0y4csniwlfZuQV29LYQWWeXAG+qooQym
 S0K3XeCHh6q/c5I7aBPXO62CuXvhAVGnpqdmWW2Y8DmMGbR4i/nCnl28m
 kBOE9oGL1Z2R6gSicL0TSOL6s8jK6GEOqJhbEh/3fQRDQmOlibty9D5IF
 /1rlAttlGG1HtZRkwUwjpJcTqxArOgnVlVljNYBnbjSe5TE7VFUGzlRKV
 ljYRM62khbsAxWSLvZ/MgqAfS6IfzXHtAp2knfQ32+wO1AplqfiTMK7bP w==;
X-CSE-ConnectionGUID: T4l9nxjyQ6mymFatyEtR2g==
X-CSE-MsgGUID: T7144OKXRXmdZuyQvSoUAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25017657"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="25017657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 07:15:30 -0700
X-CSE-ConnectionGUID: ok30MFeyRIq9CC4itP3RJw==
X-CSE-MsgGUID: iHLLMUZMRNG3caYdko1JmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="91328530"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.171])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 07:15:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Shrinker series squashed
Date: Fri, 13 Sep 2024 16:15:19 +0200
Message-ID: <20240913141519.3141-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |   4 +-
 drivers/gpu/drm/ttm/Makefile                  |   2 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |   4 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |   6 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c        | 139 ++++++
 drivers/gpu/drm/ttm/ttm_bo.c                  |  70 ++-
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 190 +++++++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |   2 +-
 drivers/gpu/drm/ttm/ttm_device.c              |   4 +-
 drivers/gpu/drm/ttm/ttm_pool.c                | 419 +++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c            |  61 ++-
 drivers/gpu/drm/ttm/ttm_tt.c                  |  40 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c              |   8 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 198 ++++++++-
 drivers/gpu/drm/xe/xe_bo.h                    |  37 ++
 drivers/gpu/drm/xe/xe_device.c                |   8 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c              | 248 +++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h              |  18 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   3 +-
 include/drm/ttm/ttm_backup.h                  | 137 ++++++
 include/drm/ttm/ttm_bo.h                      |  49 ++
 include/drm/ttm/ttm_device.h                  |   5 +-
 include/drm/ttm/ttm_pool.h                    |   6 +
 include/drm/ttm/ttm_resource.h                |  12 +-
 include/drm/ttm/ttm_tt.h                      |  36 ++
 29 files changed, 1628 insertions(+), 85 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 5c72462d1f57..7de284766f82 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -808,7 +808,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 	}
 
 	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
-		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
+		ret = ttm_bo_populate(bo, &ctx);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 03b00a03a634..041dab543b78 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -624,7 +624,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 
 	/* Populate ttm with pages if needed. Typically system memory. */
 	if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_TT_FLAG_SWAPPED))) {
-		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
+		ret = ttm_bo_populate(bo, ctx);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index ad649523d5e0..61596cecce4d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -90,7 +90,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 		goto out_no_lock;
 
 	backup_bo = i915_gem_to_ttm(backup);
-	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
+	err = ttm_bo_populate(backup_bo, &ctx);
 	if (err)
 		goto out_no_populate;
 
@@ -189,7 +189,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
 	if (!backup_bo->resource)
 		err = ttm_bo_validate(backup_bo, i915_ttm_sys_placement(), &ctx);
 	if (!err)
-		err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
+		err = ttm_bo_populate(backup_bo, &ctx);
 	if (!err) {
 		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
 					    false);
diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index dad298127226..5e980dd90e41 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -4,7 +4,7 @@
 
 ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
 	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
-	ttm_device.o ttm_sys_manager.o
+	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 obj-$(CONFIG_DRM_TTM) += ttm.o
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index f0a7eb62116c..3139fd9128d8 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -308,11 +308,11 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
 	err = ttm_resource_alloc(bo, place, &res2);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	KUNIT_ASSERT_EQ(test,
-			list_is_last(&res2->lru.link, &priv->ttm_dev->pinned), 1);
+			list_is_last(&res2->lru.link, &priv->ttm_dev->unevictable), 1);
 
 	ttm_bo_unreserve(bo);
 	KUNIT_ASSERT_EQ(test,
-			list_is_last(&res1->lru.link, &priv->ttm_dev->pinned), 1);
+			list_is_last(&res1->lru.link, &priv->ttm_dev->unevictable), 1);
 
 	ttm_resource_free(bo, &res1);
 	ttm_resource_free(bo, &res2);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index 22260e7aea58..a9f4b81921c3 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -164,18 +164,18 @@ static void ttm_resource_init_pinned(struct kunit *test)
 
 	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, res);
-	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
+	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->unevictable));
 
 	dma_resv_lock(bo->base.resv, NULL);
 	ttm_bo_pin(bo);
 	ttm_resource_init(bo, place, res);
-	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
+	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->unevictable));
 
 	ttm_bo_unpin(bo);
 	ttm_resource_fini(man, res);
 	dma_resv_unlock(bo->base.resv);
 
-	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
+	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->unevictable));
 }
 
 static void ttm_resource_fini_basic(struct kunit *test)
diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
new file mode 100644
index 000000000000..cfe4140cc59d
--- /dev/null
+++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/ttm/ttm_backup.h>
+#include <linux/page-flags.h>
+
+/**
+ * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
+ * @backup: The base struct ttm_backup
+ * @filp: The associated shmem object
+ */
+struct ttm_backup_shmem {
+	struct ttm_backup backup;
+	struct file *filp;
+};
+
+static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup *backup)
+{
+	return container_of(backup, struct ttm_backup_shmem, backup);
+}
+
+static void ttm_backup_shmem_drop(struct ttm_backup *backup, unsigned long handle)
+{
+	handle -= 1;
+	shmem_truncate_range(file_inode(to_backup_shmem(backup)->filp), handle,
+			     handle + 1);
+}
+
+static int ttm_backup_shmem_copy_page(struct ttm_backup *backup, struct page *dst,
+				      unsigned long handle, bool intr)
+{
+	struct file *filp = to_backup_shmem(backup)->filp;
+	struct address_space *mapping = filp->f_mapping;
+	struct folio *from_folio;
+
+	handle -= 1;
+	from_folio = shmem_read_folio(mapping, handle);
+	if (IS_ERR(from_folio))
+		return PTR_ERR(from_folio);
+
+	/* Note: Use drm_memcpy_from_wc? */
+	copy_highpage(dst, folio_file_page(from_folio, handle));
+	folio_put(from_folio);
+
+	return 0;
+}
+
+static unsigned long
+ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct page *page,
+			     bool writeback, pgoff_t i, gfp_t page_gfp,
+			     gfp_t alloc_gfp)
+{
+	struct file *filp = to_backup_shmem(backup)->filp;
+	struct address_space *mapping = filp->f_mapping;
+	unsigned long handle = 0;
+	struct folio *to_folio;
+	int ret;
+
+	to_folio = shmem_read_folio_gfp(mapping, i, alloc_gfp);
+	if (IS_ERR(to_folio))
+		return handle;
+
+	folio_mark_accessed(to_folio);
+	folio_lock(to_folio);
+	folio_mark_dirty(to_folio);
+	copy_highpage(folio_file_page(to_folio, i), page);
+	handle = i + 1;
+
+	if (writeback && !folio_mapped(to_folio) && folio_clear_dirty_for_io(to_folio)) {
+		struct writeback_control wbc = {
+			.sync_mode = WB_SYNC_NONE,
+			.nr_to_write = SWAP_CLUSTER_MAX,
+			.range_start = 0,
+			.range_end = LLONG_MAX,
+			.for_reclaim = 1,
+		};
+		folio_set_reclaim(to_folio);
+		ret = mapping->a_ops->writepage(folio_file_page(to_folio, i), &wbc);
+		if (!folio_test_writeback(to_folio))
+			folio_clear_reclaim(to_folio);
+		/* If writepage succeeds, it unlocks the folio */
+		if (ret)
+			folio_unlock(to_folio);
+	} else {
+		folio_unlock(to_folio);
+	}
+
+	folio_put(to_folio);
+
+	return handle;
+}
+
+static void ttm_backup_shmem_fini(struct ttm_backup *backup)
+{
+	struct ttm_backup_shmem *sbackup = to_backup_shmem(backup);
+
+	fput(sbackup->filp);
+	kfree(sbackup);
+}
+
+static const struct ttm_backup_ops ttm_backup_shmem_ops = {
+	.drop = ttm_backup_shmem_drop,
+	.copy_backed_up_page = ttm_backup_shmem_copy_page,
+	.backup_page = ttm_backup_shmem_backup_page,
+	.fini = ttm_backup_shmem_fini,
+};
+
+/**
+ * ttm_backup_shmem_create() - Create a shmem-based struct backup.
+ * @size: The maximum size (in bytes) to back up.
+ *
+ * Create a backup utilizing shmem objects.
+ *
+ * Return: A pointer to a struct ttm_backup on success,
+ * an error pointer on error.
+ */
+struct ttm_backup *ttm_backup_shmem_create(loff_t size)
+{
+	struct ttm_backup_shmem *sbackup =
+		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
+	struct file *filp;
+
+	if (!sbackup)
+		return ERR_PTR(-ENOMEM);
+
+	filp = shmem_file_setup("ttm shmem backup", size, 0);
+	if (IS_ERR(filp)) {
+		kfree(sbackup);
+		return ERR_CAST(filp);
+	}
+
+	sbackup->filp = filp;
+	sbackup->backup.ops = &ttm_backup_shmem_ops;
+
+	return &sbackup->backup;
+}
+EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 320592435252..06d6a452c4f4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -139,7 +139,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			goto out_err;
 
 		if (mem->mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
+			ret = ttm_bo_populate(bo, ctx);
 			if (ret)
 				goto out_err;
 		}
@@ -450,7 +450,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
 	int ret = 0;
 
 	spin_lock(&bdev->lru_lock);
-	res = ttm_resource_manager_first(man, &cursor);
+	ttm_resource_cursor_init(&cursor, man);
+	res = ttm_resource_manager_first(&cursor);
 	ttm_resource_cursor_fini(&cursor);
 	if (!res) {
 		ret = -ENOENT;
@@ -594,7 +595,8 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
-	++bo->pin_count;
+	if (!bo->pin_count++ && bo->resource)
+		ttm_resource_move_to_lru_tail(bo->resource);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_pin);
@@ -613,9 +615,10 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
 		return;
 
 	spin_lock(&bo->bdev->lru_lock);
-	--bo->pin_count;
-	if (bo->resource)
+	if (!--bo->pin_count && bo->resource) {
 		ttm_resource_add_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+	}
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_unpin);
@@ -1128,9 +1131,20 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 	if (bo->bdev->funcs->swap_notify)
 		bo->bdev->funcs->swap_notify(bo);
 
-	if (ttm_tt_is_populated(bo->ttm))
+	if (ttm_tt_is_populated(bo->ttm)) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_del_bulk_move(bo->resource, bo);
+		spin_unlock(&bo->bdev->lru_lock);
+
 		ret = ttm_tt_swapout(bo->bdev, bo->ttm, swapout_walk->gfp_flags);
 
+		spin_lock(&bo->bdev->lru_lock);
+		if (ret)
+			ttm_resource_add_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
 out:
 	/* Consider -ENOMEM and -ENOSPC non-fatal. */
 	if (ret == -ENOMEM || ret == -ENOSPC)
@@ -1180,3 +1194,47 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
+
+/**
+ * ttm_bo_populate() - Ensure that a buffer object has backing pages
+ * @bo: The buffer object
+ * @ctx: The ttm_operation_ctx governing the operation.
+ *
+ * For buffer objects in a memory type whose manager uses
+ * struct ttm_tt for backing pages, ensure those backing pages
+ * are present and with valid content. The bo's resource is also
+ * placed on the correct LRU list if it was previously swapped
+ * out.
+ *
+ * Return: 0 if successful, negative error code on failure.
+ * Note: May return -EINTR or -ERESTARTSYS if @ctx::interruptible
+ * is set to true.
+ */
+int ttm_bo_populate(struct ttm_buffer_object *bo,
+		    struct ttm_operation_ctx *ctx)
+{
+	struct ttm_tt *tt = bo->ttm;
+	bool swapped;
+	int ret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (!tt)
+		return 0;
+
+	swapped = ttm_tt_is_swapped(tt);
+	ret = ttm_tt_populate(bo->bdev, tt, ctx);
+	if (ret)
+		return ret;
+
+	if (swapped && !ttm_tt_is_swapped(tt) && !bo->pin_count &&
+	    bo->resource) {
+		spin_lock(&bo->bdev->lru_lock);
+		ttm_resource_add_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+		spin_unlock(&bo->bdev->lru_lock);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(ttm_bo_populate);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 3c07f4712d5c..85b0f83867f8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 	src_man = ttm_manager_type(bdev, src_mem->mem_type);
 	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
 		    dst_man->use_tt)) {
-		ret = ttm_tt_populate(bdev, ttm, ctx);
+		ret = ttm_bo_populate(bo, ctx);
 		if (ret)
 			return ret;
 	}
@@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 
 	BUG_ON(!ttm);
 
-	ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
+	ret = ttm_bo_populate(bo, &ctx);
 	if (ret)
 		return ret;
 
@@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		pgprot_t prot;
 		void *vaddr;
 
-		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
+		ret = ttm_bo_populate(bo, &ctx);
 		if (ret)
 			return ret;
 
@@ -769,12 +769,10 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	return ret;
 }
 
-static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
+static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
 				 struct ttm_buffer_object *bo,
 				 bool *needs_unlock)
 {
-	struct ttm_operation_ctx *ctx = walk->ctx;
-
 	*needs_unlock = false;
 
 	if (dma_resv_trylock(bo->base.resv)) {
@@ -865,7 +863,8 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 	s64 lret;
 
 	spin_lock(&bdev->lru_lock);
-	ttm_resource_manager_for_each_res(man, &cursor, res) {
+	ttm_resource_cursor_init(&cursor, man);
+	ttm_resource_manager_for_each_res(&cursor, res) {
 		struct ttm_buffer_object *bo = res->bo;
 		bool bo_needs_unlock = false;
 		bool bo_locked = false;
@@ -876,7 +875,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 		 * since if we do it the other way around, and the trylock fails,
 		 * we need to drop the lru lock to put the bo.
 		 */
-		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
+		if (ttm_lru_walk_trylock(walk->ctx, bo, &bo_needs_unlock))
 			bo_locked = true;
 		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
 			 walk->trylock_only)
@@ -906,6 +905,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 		ttm_lru_walk_unlock(bo, bo_needs_unlock);
 		ttm_bo_put(bo);
+
 		if (lret == -EBUSY || lret == -EALREADY)
 			lret = 0;
 		progress = (lret < 0) ? lret : progress + lret;
@@ -919,3 +919,177 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 
 	return progress;
 }
+EXPORT_SYMBOL(ttm_lru_walk_for_evict);
+
+/**
+ * ttm_bo_try_shrink - LRU walk helper to shrink a ttm buffer object.
+ * @walk: The struct xe_ttm_lru_walk that describes the walk.
+ * @bo: The buffer object.
+ * @flags: Flags governing the shrinking behaviour.
+ *
+ * The function uses the ttm_tt_back_up functionality to back up or
+ * purge a struct ttm_tt. If the bo is not in system, it's first
+ * moved there.
+ *
+ * Return: The number of pages shrunken or purged, or
+ * negative error code on failure.
+ */
+long ttm_bo_try_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		       const struct ttm_bo_shrink_flags flags)
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
+	struct ttm_tt *tt = bo->ttm;
+	long lret;
+
+	dma_resv_assert_held(bo->base.resv);
+
+	if (!tt || !ttm_tt_is_populated(tt))
+		return 0;
+
+	if (flags.allow_move && bo->resource->mem_type != TTM_PL_SYSTEM) {
+		int ret = ttm_bo_validate(bo, &sys_placement, ctx);
+
+		/* Consider -ENOMEM and -ENOSPC non-fatal. */
+		if (ret) {
+			if (ret == -ENOMEM || ret == -ENOSPC)
+				ret = -EBUSY;
+			return ret;
+		}
+	}
+
+	ttm_bo_unmap_virtual(bo);
+	lret = ttm_bo_wait_ctx(bo, ctx);
+	if (lret < 0) {
+		if (lret == -ERESTARTSYS)
+			return lret;
+		return 0;
+	}
+
+	spin_lock(&bo->bdev->lru_lock);
+	ttm_resource_del_bulk_move(bo->resource, bo);
+	spin_unlock(&bo->bdev->lru_lock);
+
+	lret = ttm_tt_backup(bo->bdev, tt, (struct ttm_backup_flags)
+			     {.purge = flags.purge,
+			      .writeback = flags.writeback});
+
+	spin_lock(&bo->bdev->lru_lock);
+	if (!ttm_tt_is_swapped(tt))
+		ttm_resource_add_bulk_move(bo->resource, bo);
+	ttm_resource_move_to_lru_tail(bo->resource);
+	spin_unlock(&bo->bdev->lru_lock);
+
+	if (lret < 0 && lret != -EINTR)
+		return 0;
+
+	return lret;
+}
+EXPORT_SYMBOL(ttm_bo_try_shrink);
+
+
+static void ttm_bo_lru_cursor_cleanup_bo(struct ttm_bo_lru_cursor *curs)
+{
+	struct ttm_buffer_object *bo = curs->bo;
+
+	if (bo) {
+		if (curs->needs_unlock)
+			dma_resv_unlock(bo->base.resv);
+		ttm_bo_put(bo);
+		curs->bo = NULL;
+	}
+}
+
+void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+
+	ttm_bo_lru_cursor_cleanup_bo(curs);
+	spin_lock(lru_lock);
+	ttm_resource_cursor_fini(&curs->res_curs);
+	spin_unlock(lru_lock);
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
+
+struct ttm_bo_lru_cursor *
+ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
+		       struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx)
+{
+	memset(curs, 0, sizeof(*curs));
+	ttm_resource_cursor_init(&curs->res_curs, man);
+	curs->ctx = ctx;
+
+	return curs;
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
+
+static struct ttm_buffer_object *
+ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *curs)
+{
+	struct ttm_buffer_object *bo = res->bo;
+
+	if (!ttm_lru_walk_trylock(curs->ctx, bo, &curs->needs_unlock))
+		return NULL;
+
+	if (!ttm_bo_get_unless_zero(bo)) {
+		if (curs->needs_unlock)
+			dma_resv_unlock(bo->base.resv);
+		return NULL;
+	}
+
+	curs->bo = bo;
+	return bo;
+}
+
+struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+	struct ttm_resource *res = NULL;
+	struct ttm_buffer_object *bo;
+
+	ttm_bo_lru_cursor_cleanup_bo(curs);
+
+	spin_lock(lru_lock);
+	for (;;) {
+		res = ttm_resource_manager_next(&curs->res_curs);
+		if (!res)
+			break;
+
+		bo = ttm_bo_from_res_reserved(res, curs);
+		if (bo)
+			break;
+	}
+
+	spin_unlock(lru_lock);
+	return res ? bo : NULL;
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
+
+struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs)
+{
+	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
+	struct ttm_buffer_object *bo;
+	struct ttm_resource *res;
+
+	spin_lock(lru_lock);
+	res = ttm_resource_manager_first(&curs->res_curs);
+	if (!res) {
+		spin_unlock(lru_lock);
+		return NULL;
+	}
+
+	bo = ttm_bo_from_res_reserved(res, curs);
+	spin_unlock(lru_lock);
+
+	return bo ? bo : ttm_bo_lru_cursor_next(curs);
+}
+EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 4212b8c91dd4..2c699ed1963a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -224,7 +224,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		};
 
 		ttm = bo->ttm;
-		err = ttm_tt_populate(bdev, bo->ttm, &ctx);
+		err = ttm_bo_populate(bo, &ctx);
 		if (err) {
 			if (err == -EINTR || err == -ERESTARTSYS ||
 			    err == -EAGAIN)
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7cc4954c1bc..02e797fd1891 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -216,7 +216,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
-	INIT_LIST_HEAD(&bdev->pinned);
+	INIT_LIST_HEAD(&bdev->unevictable);
 	bdev->dev_mapping = mapping;
 	mutex_lock(&ttm_global_mutex);
 	list_add_tail(&bdev->device_list, &glob->device_list);
@@ -283,7 +283,7 @@ void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
 	struct ttm_resource_manager *man;
 	unsigned int i, j;
 
-	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
+	ttm_device_clear_lru_dma_mappings(bdev, &bdev->unevictable);
 
 	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
 		man = ttm_manager_type(bdev, i);
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 8504dbe19c1a..b2718aef2edf 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -41,12 +41,20 @@
 #include <asm/set_memory.h>
 #endif
 
+#include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_pool.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_bo.h>
 
 #include "ttm_module.h"
 
+#ifdef CONFIG_FAULT_INJECTION
+#include <linux/fault-inject.h>
+static DECLARE_FAULT_ATTR(backup_fault_inject);
+#else
+#define should_fail(...) false
+#endif
+
 /**
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
@@ -58,6 +66,32 @@ struct ttm_pool_dma {
 	unsigned long vaddr;
 };
 
+/**
+ * struct ttm_pool_tt_restore - State representing restore from backup
+ * @alloced_pages: Total number of already allocated pages for the ttm_tt.
+ * @restored_pages: Number of (sub) pages restored from swap for this
+ *		     chunk of 1 << @order pages.
+ * @first_page: The ttm page ptr representing for @old_pages[0].
+ * @caching_divide: Page pointer where subsequent pages are cached.
+ * @old_pages: Backup copy of page pointers that were replaced by the new
+ *	       page allocation.
+ * @pool: The pool used for page allocation while restoring.
+ * @order: The order of the last page allocated while restoring.
+ *
+ * Recovery from backup might fail when we've recovered less than the
+ * full ttm_tt. In order not to loose any data (yet), keep information
+ * around that allows us to restart a failed ttm backup recovery.
+ */
+struct ttm_pool_tt_restore {
+	pgoff_t alloced_pages;
+	pgoff_t restored_pages;
+	struct page **first_page;
+	struct page **caching_divide;
+	struct ttm_pool *pool;
+	unsigned int order;
+	struct page *old_pages[];
+};
+
 static unsigned long page_pool_size;
 
 MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
@@ -354,11 +388,109 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 	return p->private;
 }
 
+/*
+ * To be able to insert single pages into backup directly,
+ * we need to split multi-order page allocations and make them look
+ * like single-page allocations.
+ */
+static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct page *p)
+{
+	unsigned int order = ttm_pool_page_order(pool, p);
+	pgoff_t nr;
+
+	if (!order)
+		return;
+
+	split_page(p, order);
+	nr = 1UL << order;
+	while (nr--)
+		(p++)->private = 0;
+}
+
+/**
+ * DOC: Partial backup and restoration of a struct ttm_tt.
+ *
+ * Swapout using ttm_backup::ops::backup_page() and swapin using
+ * ttm_backup::ops::copy_backed_up_page() may fail.
+ * The former most likely due to lack of swap-space or memory, the latter due
+ * to lack of memory or because of signal interruption during waits.
+ *
+ * Backupfailure is easily handled by using a ttm_tt pages vector that holds
+ * both swap entries and page pointers. This has to be taken into account when
+ * restoring such a ttm_tt from backup, and when freeing it while backed up.
+ * When restoring, for simplicity, new pages are actually allocated from the
+ * pool and the contents of any old pages are copied in and then the old pages
+ * are released.
+ *
+ * For restoration failures, the struct ttm_pool_tt_restore holds sufficient state
+ * to be able to resume an interrupted restore, and that structure is freed once
+ * the restoration is complete. If the struct ttm_tt is destroyed while there
+ * is a valid struct ttm_pool_tt_restore attached, that is also properly taken
+ * care of.
+ */
+
+static bool ttm_pool_restore_valid(const struct ttm_pool_tt_restore *restore)
+{
+	return restore && restore->restored_pages < (1 << restore->order);
+}
+
+static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
+			       struct ttm_backup *backup,
+			       struct ttm_operation_ctx *ctx)
+{
+	static unsigned long __maybe_unused swappedin;
+	unsigned int i, nr = 1 << restore->order;
+	int ret = 0;
+
+	if (!ttm_pool_restore_valid(restore))
+		return 0;
+
+	for (i = restore->restored_pages; i < nr; ++i) {
+		struct page *p = restore->old_pages[i];
+
+		if (ttm_backup_page_ptr_is_handle(p)) {
+			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
+
+			if (handle == 0)
+				continue;
+
+			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
+			    should_fail(&backup_fault_inject, 1)) {
+				ret = -EINTR;
+				break;
+			}
+
+			ret = backup->ops->copy_backed_up_page
+				(backup, restore->first_page[i],
+				 handle, ctx->interruptible);
+			if (ret)
+				break;
+
+			backup->ops->drop(backup, handle);
+		} else if (p) {
+			/*
+			 * We could probably avoid splitting the old page
+			 * using clever logic, but ATM we don't care.
+			 */
+			ttm_pool_split_for_swap(restore->pool, p);
+			copy_highpage(restore->first_page[i], p);
+			__free_pages(p, 0);
+		}
+
+		restore->restored_pages++;
+		restore->old_pages[i] = NULL;
+		cond_resched();
+	}
+
+	return ret;
+}
+
 /* Called when we got a page, either from a pool or newly allocated */
 static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
 				   struct page *p, dma_addr_t **dma_addr,
 				   unsigned long *num_pages,
-				   struct page ***pages)
+				   struct page ***pages,
+				   struct ttm_pool_tt_restore *restore)
 {
 	unsigned int i;
 	int r;
@@ -369,6 +501,16 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
 			return r;
 	}
 
+	if (restore) {
+		memcpy(restore->old_pages, *pages,
+		       (1 << order) * sizeof(*restore->old_pages));
+		memset(*pages, 0, (1 << order) * sizeof(**pages));
+		restore->order = order;
+		restore->restored_pages = 0;
+		restore->first_page = *pages;
+		restore->alloced_pages += 1UL << order;
+	}
+
 	*num_pages -= 1 << order;
 	for (i = 1 << order; i; --i, ++(*pages), ++p)
 		**pages = p;
@@ -394,22 +536,39 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
 				pgoff_t start_page, pgoff_t end_page)
 {
 	struct page **pages = &tt->pages[start_page];
+	struct ttm_backup *backup = tt->backup;
 	unsigned int order;
 	pgoff_t i, nr;
 
 	for (i = start_page; i < end_page; i += nr, pages += nr) {
 		struct ttm_pool_type *pt = NULL;
+		struct page *p = *pages;
 
-		order = ttm_pool_page_order(pool, *pages);
-		nr = (1UL << order);
-		if (tt->dma_address)
-			ttm_pool_unmap(pool, tt->dma_address[i], nr);
+		if (ttm_backup_page_ptr_is_handle(p)) {
+			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
+
+			nr = 1;
+			if (handle != 0)
+				backup->ops->drop(backup, handle);
+			continue;
+		}
+
+		if (pool) {
+			order = ttm_pool_page_order(pool, p);
+			nr = (1UL << order);
+			if (tt->dma_address)
+				ttm_pool_unmap(pool, tt->dma_address[i], nr);
+
+			pt = ttm_pool_select_type(pool, caching, order);
+		} else {
+			order = p->private;
+			nr = (1UL << order);
+		}
 
-		pt = ttm_pool_select_type(pool, caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, *pages);
+			ttm_pool_type_give(pt, p);
 		else
-			ttm_pool_free_page(pool, caching, order, *pages);
+			ttm_pool_free_page(pool, caching, order, p);
 	}
 }
 
@@ -453,9 +612,36 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	else
 		gfp_flags |= GFP_HIGHUSER;
 
-	for (order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
-	     num_pages;
-	     order = min_t(unsigned int, order, __fls(num_pages))) {
+	order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
+
+	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
+		if (!tt->restore) {
+			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
+
+			if (ctx->gfp_retry_mayfail)
+				gfp |= __GFP_RETRY_MAYFAIL;
+
+			tt->restore =
+				kvzalloc(struct_size(tt->restore, old_pages,
+						     (size_t)1 << order), gfp);
+			if (!tt->restore)
+				return -ENOMEM;
+		} else if (ttm_pool_restore_valid(tt->restore)) {
+			struct ttm_pool_tt_restore *restore = tt->restore;
+
+			num_pages -= restore->alloced_pages;
+			order = min_t(unsigned int, order, __fls(num_pages));
+			pages += restore->alloced_pages;
+			r = ttm_pool_restore_tt(restore, tt->backup, ctx);
+			if (r)
+				return r;
+			caching = restore->caching_divide;
+		}
+
+		tt->restore->pool = pool;
+	}
+
+	for (; num_pages; order = min_t(unsigned int, order, __fls(num_pages))) {
 		struct ttm_pool_type *pt;
 
 		page_caching = tt->caching;
@@ -472,11 +658,19 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 				r = ttm_pool_page_allocated(pool, order, p,
 							    &dma_addr,
 							    &num_pages,
-							    &pages);
+							    &pages,
+							    tt->restore);
 				if (r)
 					goto error_free_page;
 
 				caching = pages;
+				if (ttm_pool_restore_valid(tt->restore)) {
+					r = ttm_pool_restore_tt(tt->restore, tt->backup,
+								ctx);
+					if (r)
+						goto error_free_all;
+				}
+
 				if (num_pages < (1 << order))
 					break;
 
@@ -496,9 +690,17 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 				caching = pages;
 			}
 			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
-						    &num_pages, &pages);
+						    &num_pages, &pages,
+						    tt->restore);
 			if (r)
 				goto error_free_page;
+
+			if (ttm_pool_restore_valid(tt->restore)) {
+				r = ttm_pool_restore_tt(tt->restore, tt->backup, ctx);
+				if (r)
+					goto error_free_all;
+			}
+
 			if (PageHighMem(p))
 				caching = pages;
 		}
@@ -517,12 +719,26 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	if (r)
 		goto error_free_all;
 
+	if (tt->restore) {
+		kvfree(tt->restore);
+		tt->restore = NULL;
+	}
+
+	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP)
+		tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
+				    TTM_TT_FLAG_SWAPPED);
+
 	return 0;
 
 error_free_page:
 	ttm_pool_free_page(pool, page_caching, order, p);
 
 error_free_all:
+	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
+		tt->restore->caching_divide = caching;
+		return r;
+	}
+
 	num_pages = tt->num_pages - num_pages;
 	caching_divide = caching - tt->pages;
 	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
@@ -549,6 +765,179 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 }
 EXPORT_SYMBOL(ttm_pool_free);
 
+/**
+ * ttm_pool_release_backed_up() - Release content of a swapped-out struct ttm_tt
+ * @tt: The struct ttm_tt.
+ *
+ * Release handles with associated content or any remaining pages of
+ * a backed-up struct ttm_tt.
+ */
+void ttm_pool_release_backed_up(struct ttm_tt *tt)
+{
+	struct ttm_backup *backup = tt->backup;
+	struct ttm_pool_tt_restore *restore;
+	pgoff_t i, start_page = 0;
+	unsigned long handle;
+
+	if (!(tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
+		return;
+
+	restore = tt->restore;
+
+	if (ttm_pool_restore_valid(restore)) {
+		pgoff_t nr = 1UL << restore->order;
+
+		for (i = restore->restored_pages; i < nr; ++i) {
+			struct page *p = restore->old_pages[i];
+
+			if (ttm_backup_page_ptr_is_handle(p)) {
+				handle = ttm_backup_page_ptr_to_handle(p);
+				if (handle == 0)
+					continue;
+
+				backup->ops->drop(backup, handle);
+			} else if (p) {
+				ttm_pool_split_for_swap(restore->pool, p);
+				__free_pages(p, 0);
+			}
+		}
+	}
+
+	if (restore) {
+		pgoff_t mid = restore->caching_divide - tt->pages;
+
+		start_page = restore->alloced_pages;
+		/* Pages that might be dma-mapped and non-cached */
+		ttm_pool_free_range(restore->pool, tt, tt->caching,
+				    0, mid);
+		/* Pages that might be dma-mapped but cached */
+		ttm_pool_free_range(restore->pool, tt, ttm_cached,
+				    mid, restore->alloced_pages);
+	}
+
+	/* Shrunken pages. Cached and not dma-mapped. */
+	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt->num_pages);
+
+	if (restore) {
+		kvfree(restore);
+		tt->restore = NULL;
+	}
+
+	tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP | TTM_TT_FLAG_SWAPPED);
+}
+
+/**
+ * ttm_pool_backup_tt() - Back up or purge a struct ttm_tt
+ * @pool: The pool used when allocating the struct ttm_tt.
+ * @ttm: The struct ttm_tt.
+ * @flags: Flags to govern the backup behaviour.
+ *
+ * Back up or purge a struct ttm_tt. If @purge is true, then
+ * all pages will be freed directly to the system rather than to the pool
+ * they were allocated from, making the function behave similarly to
+ * ttm_pool_free(). If @purge is false the pages will be backed up instead,
+ * exchanged for handles.
+ * A subsequent call to ttm_pool_alloc() will then read back the content and
+ * a subsequent call to ttm_pool_release_shrunken() will drop it.
+ * If backup of a page fails for whatever reason, @ttm will still be
+ * partially backed up, retaining those pages for which backup fails.
+ *
+ * Return: Number of pages actually backed up or freed, or negative
+ * error code on error.
+ */
+long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
+			const struct ttm_backup_flags *flags)
+{
+	struct ttm_backup *backup = ttm->backup;
+	struct page *page;
+	unsigned long handle;
+	gfp_t alloc_gfp;
+	gfp_t gfp;
+	int ret = 0;
+	pgoff_t shrunken = 0;
+	pgoff_t i, num_pages;
+
+	if ((!get_nr_swap_pages() && !flags->purge) ||
+	    pool->use_dma_alloc ||
+	    (ttm->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
+		return -EBUSY;
+
+#ifdef CONFIG_X86
+	/* Anything returned to the system needs to be cached. */
+	if (ttm->caching != ttm_cached)
+		set_pages_array_wb(ttm->pages, ttm->num_pages);
+#endif
+
+	if (ttm->dma_address || flags->purge) {
+		for (i = 0; i < ttm->num_pages; i += num_pages) {
+			unsigned int order;
+
+			page = ttm->pages[i];
+			if (unlikely(!page)) {
+				num_pages = 1;
+				continue;
+			}
+
+			order = ttm_pool_page_order(pool, page);
+			num_pages = 1UL << order;
+			if (ttm->dma_address)
+				ttm_pool_unmap(pool, ttm->dma_address[i],
+					       num_pages);
+			if (flags->purge) {
+				shrunken += num_pages;
+				page->private = 0;
+				__free_pages(page, order);
+				memset(ttm->pages + i, 0,
+				       num_pages * sizeof(*ttm->pages));
+			}
+		}
+	}
+
+	if (flags->purge)
+		return shrunken;
+
+	if (pool->use_dma32)
+		gfp = GFP_DMA32;
+	else
+		gfp = GFP_HIGHUSER;
+
+	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
+
+	num_pages = ttm->num_pages;
+
+	/* Pretend doing fault injection by shrinking only half of the pages. */
+
+	if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
+		num_pages = DIV_ROUND_UP(num_pages, 2);
+
+	for (i = 0; i < num_pages; ++i) {
+		page = ttm->pages[i];
+		if (unlikely(!page))
+			continue;
+
+		ttm_pool_split_for_swap(pool, page);
+
+		handle = backup->ops->backup_page(backup, page, flags->writeback, i,
+						  gfp, alloc_gfp);
+		if (handle) {
+			ttm->pages[i] = ttm_backup_handle_to_page_ptr(handle);
+			put_page(page);
+			shrunken++;
+		} else {
+			/* We allow partially shrunken tts */
+			ret = -ENOMEM;
+			break;
+		}
+		cond_resched();
+	}
+
+	if (shrunken)
+		ttm->page_flags |= (TTM_TT_FLAG_PRIV_BACKED_UP |
+				    TTM_TT_FLAG_SWAPPED);
+
+	return shrunken ? shrunken : ret;
+}
+
 /**
  * ttm_pool_init - Initialize a pool
  *
@@ -810,6 +1199,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 			    &ttm_pool_debugfs_globals_fops);
 	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
 			    &ttm_pool_debugfs_shrink_fops);
+#ifdef CONFIG_FAULT_INJECTION
+	fault_create_debugfs_attr("backup_fault_inject", ttm_debugfs_root,
+				  &backup_fault_inject);
+#endif
 #endif
 
 	mm_shrinker = shrinker_alloc(0, "drm-ttm_pool");
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 6d764ba88aab..961da3762326 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -30,6 +30,7 @@
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_resource.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_util.h>
 
@@ -80,6 +81,23 @@ static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
 		ttm_resource_cursor_clear_bulk(cursor);
 }
 
+/**
+ * ttm_resource_cursor_init() - Initialize a struct ttm_resource_cursor
+ * @cursor: The cursor to initialize.
+ * @man: The resource manager.
+ *
+ * Initialize the cursor before using it for iteration.
+ */
+void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
+			      struct ttm_resource_manager *man)
+{
+	cursor->priority = 0;
+	cursor->man = man;
+	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
+	INIT_LIST_HEAD(&cursor->bulk_link);
+	INIT_LIST_HEAD(&cursor->hitch.link);
+}
+
 /**
  * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
  * @cursor: The struct ttm_resource_cursor to finalize.
@@ -235,11 +253,25 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
 	}
 }
 
+static bool ttm_resource_is_swapped(struct ttm_resource *res, struct ttm_buffer_object *bo)
+{
+	dma_resv_assert_held(bo->base.resv);
+
+	/*
+	 * Take care when creating a new resource for a bo, that it is not considered
+	 * swapped if the bo has another swapped resource attached already.
+	 */
+	if (bo->resource != res || !bo->ttm)
+		return false;
+
+	return ttm_tt_is_swapped(bo->ttm);
+}
+
 /* Add the resource to a bulk move if the BO is configured for it */
 void ttm_resource_add_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo)
 {
-	if (bo->bulk_move && !bo->pin_count)
+	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
 		ttm_lru_bulk_move_add(bo->bulk_move, res);
 }
 
@@ -247,7 +279,7 @@ void ttm_resource_add_bulk_move(struct ttm_resource *res,
 void ttm_resource_del_bulk_move(struct ttm_resource *res,
 				struct ttm_buffer_object *bo)
 {
-	if (bo->bulk_move && !bo->pin_count)
+	if (bo->bulk_move && !bo->pin_count && !ttm_resource_is_swapped(res, bo))
 		ttm_lru_bulk_move_del(bo->bulk_move, res);
 }
 
@@ -259,8 +291,8 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
 
 	lockdep_assert_held(&bo->bdev->lru_lock);
 
-	if (bo->pin_count) {
-		list_move_tail(&res->lru.link, &bdev->pinned);
+	if (bo->pin_count || ttm_resource_is_swapped(res, bo)) {
+		list_move_tail(&res->lru.link, &bdev->unevictable);
 
 	} else	if (bo->bulk_move) {
 		struct ttm_lru_bulk_move_pos *pos =
@@ -301,8 +333,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 
 	man = ttm_manager_type(bo->bdev, place->mem_type);
 	spin_lock(&bo->bdev->lru_lock);
-	if (bo->pin_count)
-		list_add_tail(&res->lru.link, &bo->bdev->pinned);
+	if (bo->pin_count || ttm_resource_is_swapped(res, bo))
+		list_add_tail(&res->lru.link, &bo->bdev->unevictable);
 	else
 		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
 	man->usage += res->size;
@@ -586,17 +618,16 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
  * Return: The first resource from the resource manager.
  */
 struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor)
+ttm_resource_manager_first(struct ttm_resource_cursor *cursor)
 {
-	lockdep_assert_held(&man->bdev->lru_lock);
+	struct ttm_resource_manager *man = cursor->man;
 
-	cursor->priority = 0;
-	cursor->man = man;
-	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
-	INIT_LIST_HEAD(&cursor->bulk_link);
-	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
+	if (WARN_ON_ONCE(!man))
+		return NULL;
 
+	lockdep_assert_held(&man->bdev->lru_lock);
+
+	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
 	return ttm_resource_manager_next(cursor);
 }
 
@@ -632,8 +663,6 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
 		ttm_resource_cursor_clear_bulk(cursor);
 	}
 
-	ttm_resource_cursor_fini(cursor);
-
 	return NULL;
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 4b51b9023126..9322fa5f1973 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -40,6 +40,7 @@
 #include <drm/drm_cache.h>
 #include <drm/drm_device.h>
 #include <drm/drm_util.h>
+#include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_tt.h>
 
@@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 	ttm->swap_storage = NULL;
 	ttm->sg = bo->sg;
 	ttm->caching = caching;
+	ttm->restore = NULL;
+	ttm->backup = NULL;
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -182,6 +185,12 @@ void ttm_tt_fini(struct ttm_tt *ttm)
 		fput(ttm->swap_storage);
 	ttm->swap_storage = NULL;
 
+	ttm_pool_release_backed_up(ttm);
+	if (ttm->backup) {
+		ttm->backup->ops->fini(ttm->backup);
+		ttm->backup = NULL;
+	}
+
 	if (ttm->pages)
 		kvfree(ttm->pages);
 	else
@@ -253,6 +262,34 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
 }
 EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
 
+/**
+ * ttm_tt_backup() - Helper to back up a struct ttm_tt.
+ * @bdev: The TTM device.
+ * @tt: The struct ttm_tt.
+ * @flags: Flags that govern the backup behaviour.
+ *
+ * Update the page accounting and call ttm_pool_shrink_tt to free pages
+ * or back them up.
+ *
+ * Return: Number of pages freed or swapped out, or negative error code on
+ * error.
+ */
+long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
+		   const struct ttm_backup_flags flags)
+{
+	long ret;
+
+	if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
+		return 0;
+
+	ret = ttm_pool_backup_tt(&bdev->pool, tt, &flags);
+
+	if (ret > 0)
+		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
+
+	return ret;
+}
+
 /**
  * ttm_tt_swapout - swap out tt object
  *
@@ -367,7 +404,10 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	}
 	return ret;
 }
+
+#if IS_ENABLED(CONFIG_DRM_TTM_KUNIT_TEST)
 EXPORT_SYMBOL(ttm_tt_populate);
+#endif
 
 void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index edfd812e0f41..3d3c627bd1ba 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -93,6 +93,7 @@ xe-y += xe_bb.o \
 	xe_ring_ops.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_shrinker.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 7d3fd720478b..38f526b6b221 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -507,8 +507,13 @@ static int shrink_test_run_device(struct xe_device *xe)
 		 * other way around, they may not be subject to swapping...
 		 */
 		if (alloced < purgeable) {
+			xe_ttm_tt_account_subtract(&xe_tt->ttm);
 			xe_tt->purgeable = true;
+			xe_ttm_tt_account_add(&xe_tt->ttm);
 			bo->ttm.priority = 0;
+			spin_lock(&bo->ttm.bdev->lru_lock);
+			ttm_bo_move_to_lru_tail(&bo->ttm);
+			spin_unlock(&bo->ttm.bdev->lru_lock);
 		} else {
 			int ret = shrink_test_fill_random(bo, &prng, link);
 
@@ -534,7 +539,7 @@ static int shrink_test_run_device(struct xe_device *xe)
 			failed = true;
 		}
 		cond_resched();
-		if (signal_pending(current))
+		if (signal_pending(current) || failed)
 			break;
 	}
 
@@ -563,7 +568,6 @@ static int shrink_test_run_device(struct xe_device *xe)
 				if (ret == -EINTR)
 					intr = true;
 			} while (ret == -EINTR && !signal_pending(current));
-
 			if (!ret && !purgeable)
 				failed = shrink_test_verify(test, bo, count, &prng, link);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5f2f1ec46b57..d6091f5df34f 100644
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
@@ -25,6 +26,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
+#include "xe_shrinker.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -278,9 +280,11 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	}
 }
 
+/* struct xe_ttm_tt - Subclassed ttm_tt for xe */
 struct xe_ttm_tt {
 	struct ttm_tt ttm;
-	struct device *dev;
+	/** @xe - The xe device */
+	struct xe_device *xe;
 	struct sg_table sgt;
 	struct sg_table *sg;
 	/** @purgeable: Whether the content of the pages of @ttm is purgeable. */
@@ -293,7 +297,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	unsigned long num_pages = tt->num_pages;
 	int ret;
 
-	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
+	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+		   !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE));
 
 	if (xe_tt->sg)
 		return 0;
@@ -301,13 +306,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
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
@@ -323,7 +328,7 @@ static void xe_tt_unmap_sg(struct ttm_tt *tt)
 	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 
 	if (xe_tt->sg) {
-		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
+		dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
 				  DMA_BIDIRECTIONAL, 0);
 		sg_free_table(xe_tt->sg);
 		xe_tt->sg = NULL;
@@ -338,21 +343,47 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
 	return xe_tt->sg;
 }
 
+/*
+ * Account ttm pages against the device shrinker's shrinkable and
+ * purgeable counts.
+ */
+static void xe_ttm_tt_account_add(struct ttm_tt *tt)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (xe_tt->purgeable)
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, tt->num_pages);
+	else
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, tt->num_pages, 0);
+}
+
+static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
+{
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
+	if (xe_tt->purgeable)
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0, -(long)tt->num_pages);
+	else
+		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
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
 	enum ttm_caching caching = ttm_cached;
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
@@ -398,42 +429,60 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		caching = ttm_uncached;
 	}
 
-	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
+	if (ttm_bo->type != ttm_bo_type_sg)
+		page_flags |= TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE;
+
+	err = ttm_tt_init(tt, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
-		kfree(tt);
+		kfree(xe_tt);
+		return NULL;
+	}
+
+	tt->backup = ttm_backup_shmem_create((loff_t)tt->num_pages << PAGE_SHIFT);
+	if (IS_ERR(tt->backup)) {
+		tt->backup = NULL;
+		ttm_tt_fini(tt);
+		kfree(xe_tt);
 		return NULL;
 	}
 
-	return &tt->ttm;
+	return tt;
 }
 
 static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
 			      struct ttm_operation_ctx *ctx)
 {
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
 	int err;
 
 	/*
 	 * dma-bufs are not populated with pages, and the dma-
 	 * addresses are set up when moved to XE_PL_TT.
 	 */
-	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
+	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 		return 0;
 
 	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
 	if (err)
 		return err;
 
-	return err;
+	xe_tt->purgeable = false;
+	xe_ttm_tt_account_add(tt);
+
+	return 0;
 }
 
 static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
 {
-	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
+	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
 		return;
 
 	xe_tt_unmap_sg(tt);
 
-	return ttm_pool_free(&ttm_dev->pool, tt);
+	ttm_pool_free(&ttm_dev->pool, tt);
+	xe_ttm_tt_account_subtract(tt);
 }
 
 static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
@@ -854,6 +903,111 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	return ret;
 }
 
+static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
+			       struct ttm_buffer_object *bo,
+			       unsigned long *scanned)
+{
+	long lret;
+
+	/* Fake move to system, without copying data. */
+	if (bo->resource->mem_type != XE_PL_SYSTEM) {
+		struct ttm_resource *new_resource;
+
+		lret = ttm_bo_wait_ctx(bo, ctx);
+		if (lret)
+			return lret;
+
+		lret = ttm_bo_mem_space(bo, &sys_placement, &new_resource, ctx);
+		if (lret)
+			return lret;
+
+		xe_tt_unmap_sg(bo->ttm);
+		ttm_bo_move_null(bo, new_resource);
+	}
+
+	*scanned += bo->ttm->num_pages;
+	lret = ttm_bo_try_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
+				 {.purge = true,
+				  .writeback = false,
+				  .allow_move = false});
+
+	if (lret > 0)
+		xe_ttm_tt_account_subtract(bo->ttm);
+
+	return lret;
+}
+
+/**
+ * xe_bo_shrink() - Try to shrink an xe bo.
+ * @walk:  - The walk parameters
+ * @bo: The TTM buffer object
+ * @flags: Flags governing the shrink behaviour.
+ *
+ * Try to shrink- or purge a bo, and if it succeeds, unmap dma.
+ * Note that we need to be able to handle also non xe bos
+ * (ghost bos), but only if the struct ttm_tt is embedded in
+ * a struct xe_ttm_tt.
+ *
+ * Return: The number of pages shrunken or purged, or negative error
+ * code on failure.
+ */
+long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		  const struct xe_bo_shrink_flags flags,
+		  unsigned long *scanned)
+{
+	struct ttm_tt *tt = bo->ttm;
+	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+	struct ttm_place place = {.mem_type = bo->resource->mem_type};
+	struct xe_bo *xe_bo = ttm_to_xe_bo(bo);
+	struct xe_device *xe = xe_tt->xe;
+	bool needs_rpm;
+	long lret = 0L;
+
+	if (!tt || !ttm_tt_is_populated(tt) ||
+	    !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) ||
+	    (flags.purge && !xe_tt->purgeable))
+		return 0L;
+
+	if (!ttm_bo_eviction_valuable(bo, &place))
+		return 0L;
+
+	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
+		return xe_bo_shrink_purge(ctx, bo, scanned);
+
+	if (xe_tt->purgeable) {
+		if (bo->resource->mem_type != XE_PL_SYSTEM)
+			lret = xe_bo_move_notify(xe_bo, ctx);
+		if (!lret)
+			lret = xe_bo_shrink_purge(ctx, bo, scanned);
+		goto out_unref;
+	}
+
+	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM */
+	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type != XE_PL_SYSTEM &&
+		     xe_bo_needs_ccs_pages(xe_bo));
+	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
+		goto out_unref;
+
+	*scanned += tt->num_pages;
+	lret = ttm_bo_try_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
+				 {.purge = false,
+				  .writeback = flags.writeback,
+				  .allow_move = true});
+	if (needs_rpm)
+		xe_pm_runtime_put(xe);
+
+	if (lret > 0) {
+		xe_assert(xe, ttm_tt_is_swapped(tt));
+
+		xe_ttm_tt_account_subtract(tt);
+	}
+
+out_unref:
+	xe_bo_put(xe_bo);
+
+	return lret;
+}
+
 /**
  * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
  * @bo: The buffer object to move.
@@ -903,7 +1057,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		}
 	}
 
-	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
+	ret = ttm_bo_populate(&bo->ttm, &ctx);
 	if (ret)
 		goto err_res_free;
 
@@ -956,7 +1110,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	if (ret)
 		return ret;
 
-	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
+	ret = ttm_bo_populate(&bo->ttm, &ctx);
 	if (ret)
 		goto err_res_free;
 
@@ -1737,6 +1891,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_subtract(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1795,6 +1951,8 @@ int xe_bo_pin(struct xe_bo *bo)
 	}
 
 	ttm_bo_pin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_subtract(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1829,6 +1987,8 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 	spin_unlock(&xe->pinned.lock);
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_add(bo->ttm.ttm);
 
 	/*
 	 * FIXME: If we always use the reserve / unreserve functions for locking
@@ -1857,6 +2017,8 @@ void xe_bo_unpin(struct xe_bo *bo)
 	}
 
 	ttm_bo_unpin(&bo->ttm);
+	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
+		xe_ttm_tt_account_add(bo->ttm.ttm);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6e4be52306df..6c40ecf52d5b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -64,6 +64,7 @@
 #define XE_BO_PROPS_INVALID	(-1)
 
 struct sg_table;
+struct xe_ttm_lru_walk;
 
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
@@ -128,6 +129,28 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
 
 void xe_bo_put(struct xe_bo *bo);
 
+/*
+ * xe_bo_get_unless_zero() - Conditionally obtain a GEM object refcount on an
+ * xe bo
+ * @bo: The bo for which we want to obtain a refcount.
+ *
+ * There is a short window between where the bo's GEM object refcount reaches
+ * zero and where we put the final ttm_bo reference. Code in the eviction- and
+ * shrinking path should therefore attempt to grab a gem object reference before
+ * trying to use members outside of the base class ttm object. This function is
+ * intended for that purpose. On successful return, this function must be paired
+ * with an xe_bo_put().
+ *
+ * Return: @bo on success, NULL on failure.
+ */
+static inline __must_check struct xe_bo *xe_bo_get_unless_zero(struct xe_bo *bo)
+{
+	if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
+		return NULL;
+
+	return bo;
+}
+
 static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
 {
 	if (bo)
@@ -314,6 +337,20 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 
 #define i915_gem_object_flush_if_display(obj)		((void)(obj))
 
+/**
+ * struct xe_bo_shrink_flags - flags governing the shrink behaviour.
+ * @purge: Only purging allowed. Don't shrink if bo not purgeable.
+ * @writeback: Attempt to immediately move content to swap.
+ */
+struct xe_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+};
+
+long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		  const struct xe_bo_shrink_flags flags,
+		  unsigned long *scanned);
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..b2d7b8e11355 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -48,6 +48,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_shrinker.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -297,6 +298,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
+	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
+		xe_shrinker_destroy(xe->mem.shrinker);
+
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -326,6 +330,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index c92df0a2423f..610f262fcd7d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -365,6 +365,8 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.sys_mgr: system memory shrinker. */
+		struct xe_shrinker *shrinker;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
new file mode 100644
index 000000000000..32f83316146c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -0,0 +1,248 @@
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
+#include "xe_pm.h"
+#include "xe_shrinker.h"
+
+/**
+ * struct xe_shrinker - per-device shrinker
+ * @xe: Back pointer to the device.
+ * @lock: Lock protecting accounting.
+ * @shrinkable_pages: Number of pages that are currently shrinkable.
+ * @purgeable_pages: Number of pages that are currently purgeable.
+ * @shrink: Pointer to the mm shrinker.
+ * @pm_worker: Worker to wake up the device if required.
+ */
+struct xe_shrinker {
+	struct xe_device *xe;
+	rwlock_t lock;
+	long shrinkable_pages;
+	long purgeable_pages;
+	struct shrinker *shrink;
+	struct work_struct pm_worker;
+};
+
+static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
+{
+	return shrink->private_data;
+}
+
+/**
+ * xe_shrinker_mod_pages() - Modify shrinker page accounting
+ * @shrinker: Pointer to the struct xe_shrinker.
+ * @shrinkable: Shrinkable pages delta. May be negative.
+ * @purgeable: Purgeable page delta. May be negative.
+ *
+ * Modifies the shrinkable and purgeable pages accounting.
+ */
+void
+xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable)
+{
+	write_lock(&shrinker->lock);
+	shrinker->shrinkable_pages += shrinkable;
+	shrinker->purgeable_pages += purgeable;
+	write_unlock(&shrinker->lock);
+}
+
+static s64 xe_shrinker_walk(struct xe_device *xe,
+			    struct ttm_operation_ctx *ctx,
+			    const struct xe_bo_shrink_flags flags,
+			    unsigned long to_scan, unsigned long *scanned)
+{
+	unsigned int mem_type;
+	s64 freed = 0, lret;
+
+	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
+		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
+		struct ttm_bo_lru_cursor curs;
+		struct ttm_buffer_object *ttm_bo;
+
+		if (!man || !man->use_tt)
+			continue;
+
+		ttm_bo_lru_for_each_reserved_guarded(&curs, man, ctx, ttm_bo) {
+			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
+			if (lret < 0)
+				return lret;
+
+			freed += lret;
+			if (*scanned >= to_scan)
+				break;
+		}
+	}
+
+	return freed;
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
+/*
+ * Check if we need runtime pm, and if so try to grab a reference if
+ * already active. If grabbing a reference fails, queue a worker that
+ * does it for us outside of reclaim, but don't wait for it to complete.
+ * If bo shrinking needs an rpm reference and we don't have it (yet),
+ * that bo will be skipped anyway.
+ */
+static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
+				       unsigned long nr_to_scan)
+{
+	struct xe_device *xe = shrinker->xe;
+
+	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe) ||
+	    !get_nr_swap_pages())
+		return false;
+
+	if (!force) {
+		read_lock(&shrinker->lock);
+		force = (nr_to_scan > shrinker->purgeable_pages);
+		read_unlock(&shrinker->lock);
+		if (!force)
+			return false;
+	}
+
+	if (!xe_pm_runtime_get_if_active(xe)) {
+		if (xe_rpm_reclaim_safe(xe) && current_is_kswapd()) {
+			xe_pm_runtime_get(xe);
+			return true;
+		}
+		queue_work(xe->unordered_wq, &shrinker->pm_worker);
+		return false;
+	}
+
+	return true;
+}
+
+static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtime_pm)
+{
+	if (runtime_pm)
+		xe_pm_runtime_put(shrinker->xe);
+}
+
+static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	bool is_kswapd = current_is_kswapd();
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = !is_kswapd,
+	};
+	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
+	struct xe_bo_shrink_flags shrink_flags = {
+		.purge = true,
+		.writeback = is_kswapd,
+	};
+	bool runtime_pm;
+	bool purgeable;
+	s64 lret;
+
+	nr_to_scan = sc->nr_to_scan;
+
+	read_lock(&shrinker->lock);
+	purgeable = !!shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	/* Might need runtime PM. Try to wake early if it looks like it. */
+	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan);
+
+	if (purgeable && nr_scanned < nr_to_scan) {
+		lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+					nr_to_scan, &nr_scanned);
+		if (lret >= 0)
+			freed += lret;
+	}
+
+	sc->nr_scanned = nr_scanned;
+	if (nr_scanned >= nr_to_scan)
+		goto out;
+
+	/* If we didn't wake before, try to do it now if needed. */
+	if (!runtime_pm)
+		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0);
+
+	shrink_flags.purge = false;
+	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+				nr_to_scan, &nr_scanned);
+	if (lret >= 0)
+		freed += lret;
+
+	sc->nr_scanned = nr_scanned;
+out:
+	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
+	return nr_scanned ? freed : SHRINK_STOP;
+}
+
+/* Wake up the device for shrinking. */
+static void xe_shrinker_pm(struct work_struct *work)
+{
+	struct xe_shrinker *shrinker =
+		container_of(work, typeof(*shrinker), pm_worker);
+
+	xe_pm_runtime_get(shrinker->xe);
+	xe_pm_runtime_put(shrinker->xe);
+}
+
+/**
+ * xe_shrinker_create() - Create an xe per-device shrinker
+ * @xe: Pointer to the xe device.
+ *
+ * Returns: A pointer to the created shrinker on success,
+ * Negative error code on failure.
+ */
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
+	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
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
+/**
+ * xe_shrinker_destroy() - Destroy an xe per-device shrinker
+ * @shrinker: Pointer to the shrinker to destroy.
+ */
+void xe_shrinker_destroy(struct xe_shrinker *shrinker)
+{
+	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
+	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
+	shrinker_free(shrinker->shrink);
+	flush_work(&shrinker->pm_worker);
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
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9844a8edbfe1..d38b91872da3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -108,9 +108,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	u64 gtt_size;
 
 	si_meminfo(&si);
+	/* Potentially restrict amount of TT memory here. */
 	gtt_size = (u64)si.totalram * si.mem_unit;
-	/* TTM limits allocation of all TTM devices by 50% of system memory */
-	gtt_size /= 2;
 
 	man->use_tt = true;
 	man->func = &xe_ttm_sys_mgr_func;
diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
new file mode 100644
index 000000000000..5f8c7d3069ef
--- /dev/null
+++ b/include/drm/ttm/ttm_backup.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _TTM_BACKUP_H_
+#define _TTM_BACKUP_H_
+
+#include <linux/mm_types.h>
+#include <linux/shmem_fs.h>
+
+struct ttm_backup;
+
+/**
+ * ttm_backup_handle_to_page_ptr() - Convert handle to struct page pointer
+ * @handle: The handle to convert.
+ *
+ * Converts an opaque handle received from the
+ * struct ttm_backoup_ops::backup_page() function to an (invalid)
+ * struct page pointer suitable for a struct page array.
+ *
+ * Return: An (invalid) struct page pointer.
+ */
+static inline struct page *
+ttm_backup_handle_to_page_ptr(unsigned long handle)
+{
+	return (struct page *)(handle << 1 | 1);
+}
+
+/**
+ * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer is a handle
+ * @page: The struct page pointer to check.
+ *
+ * Return: true if the struct page pointer is a handld returned from
+ * ttm_backup_handle_to_page_ptr(). False otherwise.
+ */
+static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
+{
+	return (unsigned long)page & 1;
+}
+
+/**
+ * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer to a handle
+ * @page: The struct page pointer to convert
+ *
+ * Return: The handle that was previously used in
+ * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
+ * for use as argument in the struct ttm_backup_ops drop() or
+ * copy_backed_up_page() functions.
+ */
+static inline unsigned long
+ttm_backup_page_ptr_to_handle(const struct page *page)
+{
+	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
+	return (unsigned long)page >> 1;
+}
+
+/** struct ttm_backup_ops - A struct ttm_backup backend operations */
+struct ttm_backup_ops {
+	/**
+	 * drop - release memory associated with a handle
+	 * @backup: The struct backup pointer used to obtain the handle
+	 * @handle: The handle obtained from the @backup_page function.
+	 */
+	void (*drop)(struct ttm_backup *backup, unsigned long handle);
+
+	/**
+	 * copy_backed_up_page - Copy the contents of a previously backed
+	 * up page
+	 * @backup: The struct backup pointer used to back up the page.
+	 * @dst: The struct page to copy into.
+	 * @handle: The handle returned when the page was backed up.
+	 * @intr: Try to perform waits interruptable or at least killable.
+	 *
+	 * Return: 0 on success, Negative error code on failure, notably
+	 * -EINTR if @intr was set to true and a signal is pending.
+	 */
+	int (*copy_backed_up_page)(struct ttm_backup *backup, struct page *dst,
+				   unsigned long handle, bool intr);
+
+	/**
+	 * backup_page - Backup a page
+	 * @backup: The struct backup pointer to use.
+	 * @page: The page to back up.
+	 * @writeback: Whether to perform immediate writeback of the page.
+	 * This may have performance implications.
+	 * @i: A unique integer for each page and each struct backup.
+	 * This is a hint allowing the backup backend to avoid managing
+	 * its address space separately.
+	 * @page_gfp: The gfp value used when the page was allocated.
+	 * This is used for accounting purposes.
+	 * @alloc_gfp: The gpf to be used when the backend needs to allocaete
+	 * memory.
+	 *
+	 * Return: A handle on success. 0 on failure.
+	 * (This is following the swp_entry_t convention).
+	 *
+	 * Note: This function could be extended to back up a folio and
+	 * backends would then split the folio internally if needed.
+	 * Drawback is that the caller would then have to keep track of
+	 * the folio size- and usage.
+	 */
+	unsigned long (*backup_page)(struct ttm_backup *backup, struct page *page,
+				     bool writeback, pgoff_t i, gfp_t page_gfp,
+				     gfp_t alloc_gfp);
+	/**
+	 * fini - Free the struct backup resources after last use.
+	 * @backup: Pointer to the struct backup whose resources to free.
+	 *
+	 * After a call to @fini, it's illegal to use the @backup pointer.
+	 */
+	void (*fini)(struct ttm_backup *backup);
+};
+
+/**
+ * struct ttm_backup - Abstract a backup backend.
+ * @ops: The operations as described above.
+ *
+ * The struct ttm_backup is intended to be subclassed by the
+ * backend implementation.
+ */
+struct ttm_backup {
+	const struct ttm_backup_ops *ops;
+};
+
+/**
+ * ttm_backup_shmem_create() - Create a shmem-based struct backup.
+ * @size: The maximum size (in bytes) to back up.
+ *
+ * Create a backup utilizing shmem objects.
+ *
+ * Return: A pointer to a struct ttm_backup on success,
+ * an error pointer on error.
+ */
+struct ttm_backup *ttm_backup_shmem_create(loff_t size);
+
+#endif
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 7b56d1ca36d7..1ea3caa358e5 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -222,9 +222,48 @@ struct ttm_lru_walk {
 	bool trylock_only;
 };
 
+struct ttm_bo_lru_cursor {
+	struct ttm_resource_cursor res_curs;
+	struct ttm_operation_ctx *ctx;
+	struct ttm_buffer_object *bo;
+	bool needs_unlock;
+};
+
+void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
+struct ttm_bo_lru_cursor *
+ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
+		       struct ttm_resource_manager *man,
+		       struct ttm_operation_ctx *ctx);
+
+DEFINE_CLASS(ttm_bo_lru_cursor, struct ttm_bo_lru_cursor *,
+	     if (_T) {ttm_bo_lru_cursor_fini(_T); },
+	     ttm_bo_lru_cursor_init(curs, man, ctx),
+	     struct ttm_bo_lru_cursor *curs, struct ttm_resource_manager *man,
+	     struct ttm_operation_ctx *ctx);
+static inline void *
+class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
+{ return *_T; }
+
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
+/**
+ * struct ttm_bo_shrink_flags - flags to govern the bo shrinking behaviour
+ * @purge: Purge the content rather than backing it up.
+ * @writeback: Attempt to immediately write content to swap space.
+ * @allow_move: Allow moving to system before shrinking. This is typically
+ * not desired for zombie- or ghost objects (with zombie object meaning
+ * objects with a zero gem object refcount)
+ */
+struct ttm_bo_shrink_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+	u32 allow_move : 1;
+};
+
+long ttm_bo_try_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
+		       const struct ttm_bo_shrink_flags flags);
+
 /**
  * ttm_bo_get - reference a struct ttm_buffer_object
  *
@@ -462,5 +501,15 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
 pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 		     pgprot_t tmp);
 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
+int ttm_bo_populate(struct ttm_buffer_object *bo,
+		    struct ttm_operation_ctx *ctx);
+
+struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs);
+struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs);
+
+#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
+	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
+	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\
+	     (_bo) = ttm_bo_lru_cursor_next(_cursor))
 
 #endif
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c84..438358f72716 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -252,9 +252,10 @@ struct ttm_device {
 	spinlock_t lru_lock;
 
 	/**
-	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
+	 * @unevictable Buffer objects which are pinned or swapped and as such
+	 * not on an LRU list.
 	 */
-	struct list_head pinned;
+	struct list_head unevictable;
 
 	/**
 	 * @dev_mapping: A pointer to the struct address_space for invalidating
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 160d954a261e..3112a4be835c 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -33,6 +33,7 @@
 
 struct device;
 struct seq_file;
+struct ttm_backup_flags;
 struct ttm_operation_ctx;
 struct ttm_pool;
 struct ttm_tt;
@@ -89,6 +90,11 @@ void ttm_pool_fini(struct ttm_pool *pool);
 
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
 
+void ttm_pool_release_backed_up(struct ttm_tt *tt);
+
+long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
+			const struct ttm_backup_flags *flags);
+
 int ttm_pool_mgr_init(unsigned long num_pages);
 void ttm_pool_mgr_fini(void);
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index be034be56ba1..ee0e652328b3 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -30,6 +30,7 @@
 #include <linux/mutex.h>
 #include <linux/iosys-map.h>
 #include <linux/dma-fence.h>
+#include <linux/cleanup.h>
 
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_caching.h>
@@ -325,6 +326,9 @@ struct ttm_resource_cursor {
 	unsigned int priority;
 };
 
+void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
+			      struct ttm_resource_manager *man);
+
 void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
 
 /**
@@ -456,8 +460,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
 				struct drm_printer *p);
 
 struct ttm_resource *
-ttm_resource_manager_first(struct ttm_resource_manager *man,
-			   struct ttm_resource_cursor *cursor);
+ttm_resource_manager_first(struct ttm_resource_cursor *cursor);
 struct ttm_resource *
 ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
 
@@ -466,14 +469,13 @@ ttm_lru_first_res_or_null(struct list_head *head);
 
 /**
  * ttm_resource_manager_for_each_res - iterate over all resources
- * @man: the resource manager
  * @cursor: struct ttm_resource_cursor for the current position
  * @res: the current resource
  *
  * Iterate over all the evictable resources in a resource manager.
  */
-#define ttm_resource_manager_for_each_res(man, cursor, res)		\
-	for (res = ttm_resource_manager_first(man, cursor); res;	\
+#define ttm_resource_manager_for_each_res(cursor, res)	\
+	for (res = ttm_resource_manager_first(cursor); res;	\
 	     res = ttm_resource_manager_next(cursor))
 
 struct ttm_kmap_iter *
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 2b9d856ff388..aed5aa147598 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -32,11 +32,13 @@
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
 
+struct ttm_backup;
 struct ttm_device;
 struct ttm_tt;
 struct ttm_resource;
 struct ttm_buffer_object;
 struct ttm_operation_ctx;
+struct ttm_pool_tt_restore;
 
 /**
  * struct ttm_tt - This is a structure holding the pages, caching- and aperture
@@ -85,6 +87,9 @@ struct ttm_tt {
 	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
 	 * used to assure pgprot always matches.
 	 *
+	 * TTM_TT_FLAG_PRIV_BACKED_UP: TTM internal only. This is set if the
+	 * struct ttm_tt has been (possibly partially) backed up.
+	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
@@ -96,6 +101,7 @@ struct ttm_tt {
 #define TTM_TT_FLAG_DECRYPTED		BIT(4)
 
 #define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
+#define TTM_TT_FLAG_PRIV_BACKED_UP	BIT(6)
 	uint32_t page_flags;
 	/** @num_pages: Number of pages in the page array. */
 	uint32_t num_pages;
@@ -105,11 +111,20 @@ struct ttm_tt {
 	dma_addr_t *dma_address;
 	/** @swap_storage: Pointer to shmem struct file for swap storage. */
 	struct file *swap_storage;
+	/**
+	 * @backup: Pointer to backup struct for backed up tts.
+	 * Could be unified with @swap_storage. Meanwhile, the driver's
+	 * ttm_tt_create() callback is responsible for assigning
+	 * this field.
+	 */
+	struct ttm_backup *backup;
 	/**
 	 * @caching: The current caching state of the pages, see enum
 	 * ttm_caching.
 	 */
 	enum ttm_caching caching;
+	/** @restore: Partial restoration from backup state. TTM private */
+	struct ttm_pool_tt_restore *restore;
 };
 
 /**
@@ -129,6 +144,12 @@ static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
 	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
 }
 
+static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
+{
+	return tt->page_flags & (TTM_TT_FLAG_SWAPPED |
+				 TTM_TT_FLAG_PRIV_BACKED_UP);
+}
+
 /**
  * ttm_tt_create
  *
@@ -230,6 +251,21 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
 struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
 					    struct ttm_tt *tt);
 unsigned long ttm_tt_pages_limit(void);
+
+/**
+ * struct ttm_backup_flags - Flags to govern backup behaviour.
+ * @purge: Free pages without backing up. Bypass pools.
+ * @writeback: Attempt to copy contents directly to swap space, even
+ * if that means blocking on writes to external memory.
+ */
+struct ttm_backup_flags {
+	u32 purge : 1;
+	u32 writeback : 1;
+};
+
+long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
+		   const struct ttm_backup_flags flags);
+
 #if IS_ENABLED(CONFIG_AGP)
 #include <linux/agp_backend.h>
 
-- 
2.46.0

