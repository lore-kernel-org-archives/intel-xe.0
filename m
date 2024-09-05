Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640BFCD5BC0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 13:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319A910E8A2;
	Thu,  5 Sep 2024 13:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgSPSHeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6010E8A2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 13:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725542198; x=1757078198;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1rAcf+SYl4C1zo6Zbk1b3EOdjG+dUkZaEayUD0HiwNI=;
 b=ZgSPSHeTNn2q7aI5grUzrhCm+fcB0753nnuWSxU5+Znhp9evmnUddXj5
 KqTGktgEnU6Zn2wLFFk8Wpnv3h5mXMawy9NbYa7zGl7Z+Tc/cAlVOkVi1
 TiYMYk+BQg9cRm8CnVsg/oZfffLDIBd+SSKT2pr4Sjdz3WNrHdzta0fle
 afo7p+8qyG9Sw7zQ+j8eZvB5WKhTcxtBnAmQeZF/JL9FqvJV2mdLbi+Aj
 xbtCDpc7xyT2tv45ACXlaKVTco39GXJeI6ndHdBEzpQtzkUqdw+6mi9GC
 Pn7X1/zHiIS/z7NoF9tI+UJoQkVPSCSq9h5Ok/9TrygQY+FfDCSJSkW83 g==;
X-CSE-ConnectionGUID: JE+pJsJ4Q3O6EjnlyDJ/mA==
X-CSE-MsgGUID: ELSZRIjyR0WdAefnSH48kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34826963"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="34826963"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 06:16:36 -0700
X-CSE-ConnectionGUID: 2mCXc5p9TxO7RdmHungHOw==
X-CSE-MsgGUID: LmxTZ87JTkiMLPWM164PIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="70417245"
Received: from unknown (HELO fedora..) ([10.245.245.247])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 06:16:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Add a xe_bo subtest for shrinking / swapping
Date: Thu,  5 Sep 2024 15:16:17 +0200
Message-ID: <20240905131617.8521-1-thomas.hellstrom@linux.intel.com>
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

Add a subtest that tries to allocate twice the amount of
buffer object memory available, write data to it and then read
all the data back verifying data integrity.
In order to be able to do this on systems that
have no or not enough swap-space available, allocate some memory
as purgeable, and introduce a function to purge such memory from
the TTM swap_notify path.

this test is intended to add test coverage to the current
bo swap path and upcoming shrinking path.

The test has previously been part of the xe bo shrinker series.

v2:
- Skip test if the execution time is expected to be too long.
- Minor code cleanups.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 237 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c       |  32 ++++-
 2 files changed, 268 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 8dac069483e8..d82b7748dd9e 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -6,6 +6,12 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include <linux/iosys-map.h>
+#include <linux/random.h>
+#include <linux/swap.h>
+
+#include <uapi/linux/sysinfo.h>
+
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
@@ -358,9 +364,240 @@ static void xe_bo_evict_kunit(struct kunit *test)
 	evict_test_run_device(xe);
 }
 
+struct xe_bo_link {
+	struct list_head link;
+	struct xe_bo *bo;
+	u32 val;
+};
+
+#define XE_BO_SHRINK_SIZE ((unsigned long)SZ_64M)
+
+static int shrink_test_fill_random(struct xe_bo *bo, struct rnd_state *state,
+				   struct xe_bo_link *link)
+{
+	struct iosys_map map;
+	int ret = ttm_bo_vmap(&bo->ttm, &map);
+	size_t __maybe_unused i;
+
+	if (ret)
+		return ret;
+
+	for (i = 0; i < bo->ttm.base.size; i += sizeof(u32)) {
+		u32 val = prandom_u32_state(state);
+
+		iosys_map_wr(&map, i, u32, val);
+		if (i == 0)
+			link->val = val;
+	}
+
+	ttm_bo_vunmap(&bo->ttm, &map);
+	return 0;
+}
+
+static bool shrink_test_verify(struct kunit *test, struct xe_bo *bo,
+			       unsigned int bo_nr, struct rnd_state *state,
+			       struct xe_bo_link *link)
+{
+	struct iosys_map map;
+	int ret = ttm_bo_vmap(&bo->ttm, &map);
+	size_t i;
+	bool failed = false;
+
+	if (ret) {
+		KUNIT_FAIL(test, "Error mapping bo %u for content check.\n", bo_nr);
+		return true;
+	}
+
+	for (i = 0; i < bo->ttm.base.size; i += sizeof(u32)) {
+		u32 val = prandom_u32_state(state);
+
+		if (iosys_map_rd(&map, i, u32) != val) {
+			KUNIT_FAIL(test, "Content not preserved, bo %u offset 0x%016llx",
+				   bo_nr, (unsigned long long)i);
+			kunit_info(test, "Failed value is 0x%08x, recorded 0x%08x\n",
+				   (unsigned int)iosys_map_rd(&map, i, u32), val);
+			if (i == 0 && val != link->val)
+				kunit_info(test, "Looks like PRNG is out of sync.\n");
+			failed = true;
+			break;
+		}
+	}
+
+	ttm_bo_vunmap(&bo->ttm, &map);
+
+	return failed;
+}
+
+/*
+ * Try to create system bos corresponding to twice the amount
+ * of available system memory to test shrinker functionality.
+ * If no swap space is available to accommodate the
+ * memory overcommit, mark bos purgeable.
+ */
+static int shrink_test_run_device(struct xe_device *xe)
+{
+	struct kunit *test = kunit_get_current_test();
+	LIST_HEAD(bos);
+	struct xe_bo_link *link, *next;
+	struct sysinfo si;
+	size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
+	unsigned int interrupted = 0, successful = 0, count = 0;
+	struct rnd_state prng;
+	u64 rand_seed;
+	bool failed = false;
+
+	rand_seed = get_random_u64();
+	prandom_seed_state(&prng, rand_seed);
+
+	/* Skip if execution time is expected to be too long. */
+
+	limit = SZ_32G;
+	/* IGFX with flat CCS needs to copy when swapping / shrinking */
+	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
+		limit = SZ_16G;
+
+	si_meminfo(&si);
+	ram = (size_t)si.freeram * si.mem_unit;
+	if (ram > limit) {
+		kunit_skip(test, "Too long expected execution time.\n");
+		return 0;
+	}
+	to_alloc = ram * 2;
+
+	ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
+	if (to_alloc > ram_and_swap)
+		purgeable = to_alloc - ram_and_swap;
+	purgeable += purgeable / 5;
+
+	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
+		   (unsigned long)ram);
+	for (alloced = 0; alloced < to_alloc; alloced += XE_BO_SHRINK_SIZE) {
+		struct xe_bo *bo;
+		unsigned int mem_type;
+		struct xe_ttm_tt *xe_tt;
+
+		link = kzalloc(sizeof(*link), GFP_KERNEL);
+		if (!link) {
+			KUNIT_FAIL(test, "Unexpected link allocation failure\n");
+			failed = true;
+			break;
+		}
+
+		INIT_LIST_HEAD(&link->link);
+
+		/* We can create bos using WC caching here. But it is slower. */
+		bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
+				       DRM_XE_GEM_CPU_CACHING_WB,
+				       XE_BO_FLAG_SYSTEM);
+		if (IS_ERR(bo)) {
+			if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
+			    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
+				KUNIT_FAIL(test, "Error creating bo: %pe\n", bo);
+			kfree(link);
+			failed = true;
+			break;
+		}
+		xe_bo_lock(bo, false);
+		xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
+
+		/*
+		 * Allocate purgeable bos first, because if we do it the
+		 * other way around, they may not be subject to swapping...
+		 */
+		if (alloced < purgeable) {
+			xe_tt->purgeable = true;
+			bo->ttm.priority = 0;
+		} else {
+			int ret = shrink_test_fill_random(bo, &prng, link);
+
+			if (ret) {
+				xe_bo_unlock(bo);
+				xe_bo_put(bo);
+				KUNIT_FAIL(test, "Error filling bo with random data: %pe\n",
+					   ERR_PTR(ret));
+				kfree(link);
+				failed = true;
+				break;
+			}
+		}
+
+		mem_type = bo->ttm.resource->mem_type;
+		xe_bo_unlock(bo);
+		link->bo = bo;
+		list_add_tail(&link->link, &bos);
+
+		if (mem_type != XE_PL_TT) {
+			KUNIT_FAIL(test, "Bo in incorrect memory type: %u\n",
+				   bo->ttm.resource->mem_type);
+			failed = true;
+		}
+		cond_resched();
+		if (signal_pending(current))
+			break;
+	}
+
+	/*
+	 * Read back and destroy bos. Reset the pseudo-random seed to get an
+	 * identical pseudo-random number sequence for readback.
+	 */
+	prandom_seed_state(&prng, rand_seed);
+	list_for_each_entry_safe(link, next, &bos, link) {
+		static struct ttm_operation_ctx ctx = {.interruptible = true};
+		struct xe_bo *bo = link->bo;
+		struct xe_ttm_tt *xe_tt;
+		int ret;
+
+		count++;
+		if (!signal_pending(current) && !failed) {
+			bool purgeable, intr = false;
+
+			xe_bo_lock(bo, NULL);
+
+			/* xe_tt->purgeable is cleared on validate. */
+			xe_tt = container_of(bo->ttm.ttm, typeof(*xe_tt), ttm);
+			purgeable = xe_tt->purgeable;
+			do {
+				ret = ttm_bo_validate(&bo->ttm, &tt_placement, &ctx);
+				if (ret == -EINTR)
+					intr = true;
+			} while (ret == -EINTR && !signal_pending(current));
+
+			if (!ret && !purgeable)
+				failed = shrink_test_verify(test, bo, count, &prng, link);
+
+			xe_bo_unlock(bo);
+			if (ret) {
+				KUNIT_FAIL(test, "Validation failed: %pe\n",
+					   ERR_PTR(ret));
+				failed = true;
+			} else if (intr) {
+				interrupted++;
+			} else {
+				successful++;
+			}
+		}
+		xe_bo_put(link->bo);
+		list_del(&link->link);
+		kfree(link);
+	}
+	kunit_info(test, "Readbacks interrupted: %u successful: %u\n",
+		   interrupted, successful);
+
+	return 0;
+}
+
+static void xe_bo_shrink_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	shrink_test_run_device(xe);
+}
+
 static struct kunit_case xe_bo_tests[] = {
 	KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_gen_param),
 	KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM_ATTR(xe_bo_shrink_kunit, xe_pci_live_device_gen_param,
+			      {.speed = KUNIT_SPEED_SLOW}),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 06911e9a3bf5..a065ba8fda83 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -283,6 +283,8 @@ struct xe_ttm_tt {
 	struct device *dev;
 	struct sg_table sgt;
 	struct sg_table *sg;
+	/** @purgeable: Whether the content of the pages of @ttm is purgeable. */
+	bool purgeable;
 };
 
 static int xe_tt_map_sg(struct ttm_tt *tt)
@@ -761,7 +763,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	if (xe_rpm_reclaim_safe(xe)) {
 		/*
 		 * We might be called through swapout in the validation path of
-		 * another TTM device, so unconditionally acquire rpm here.
+		 * another TTM device, so acquire rpm here.
 		 */
 		xe_pm_runtime_get(xe);
 	} else {
@@ -1082,6 +1084,33 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
+static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+{
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+
+	if (ttm_bo->ttm) {
+		struct ttm_placement place = {};
+		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
+
+		drm_WARN_ON(&xe->drm, ret);
+	}
+}
+
+static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
+{
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false
+	};
+
+	if (ttm_bo->ttm) {
+		struct xe_ttm_tt *xe_tt =
+			container_of(ttm_bo->ttm, struct xe_ttm_tt, ttm);
+
+		if (xe_tt->purgeable)
+			xe_ttm_bo_purge(ttm_bo, &ctx);
+	}
+}
+
 const struct ttm_device_funcs xe_ttm_funcs = {
 	.ttm_tt_create = xe_ttm_tt_create,
 	.ttm_tt_populate = xe_ttm_tt_populate,
@@ -1094,6 +1123,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
 	.release_notify = xe_ttm_bo_release_notify,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
+	.swap_notify = xe_ttm_bo_swap_notify,
 };
 
 static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
-- 
2.46.0

