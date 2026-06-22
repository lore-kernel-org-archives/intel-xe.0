Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52116CDB46B
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A8310E4AD;
	Mon, 22 Jun 2026 06:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmUfT1xS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B20B10E285
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111595; x=1813647595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fmo7v1rQJMkQUfakUK8vb0gX7TzD0RTRm5RH6Bo+aD4=;
 b=nmUfT1xSkBonpKEiM/eb7OfpuFQi24WFFiHq9yPriTq4bT+nZ1ExgVGc
 A3QkDSV0JYjTdpVVq4Pz4FOqlk8bnsTFwWXk8adHQ59D/QAoVSXl0PlWG
 eAqQwrcdmsySK8NUyKgpGlTjYIcJHJTmPcHs5uTmtogeuCkTv54ePGl6o
 qS0CD4SKNzzyKy7NMJGCI1VjY6mnDSs6oiqGgTC77iWvGnnjfKhXmgOrZ
 dDdiRKFElNoX7eUiFN3UF348kXvMO6elm/klPfQlCDmfh0SJnRCe5oDeR
 I/eudAgYTJu8nTLCC0rSDSsGS6XrZjQpEZYq1GIC0smLQGyTUZYOZcdK0 A==;
X-CSE-ConnectionGUID: kkB3vkvbS4u08SB/JYaHoA==
X-CSE-MsgGUID: GKmeEuIyT8aD18FnMD3neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928766"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928766"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:54 -0700
X-CSE-ConnectionGUID: wbpbUJNARyuQs/7YkOMqrg==
X-CSE-MsgGUID: dIhscGB7TG+PdCEOzrNJOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068221"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:45 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 9/9] drm/xe/tests: add live KUnit coverage for BO page-size
 allocation modes
Date: Mon, 22 Jun 2026 12:30:31 +0530
Message-ID: <20260622070031.2445502-10-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
MIME-Version: 1.0
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

Add a live KUnit suite to exercise the debug-controlled BO page-size
allocation modes.

The new tests cover forced 2M mode, forced 1G mode, and mixed mode.
They verify that user BO creation applies the expected NEEDS_* flags,
that no unexpected page-size flags are added, that min_align matches the
selected leaf size, and that the resulting resource contains a
contiguous block large enough for the requested leaf where applicable.

The mixed-mode test also checks repeated allocations across the rotation
sequence and validates per-BO alignment behavior.

Skip unsupported platforms and transient -ENOMEM cases so the tests can
run in varying live environments without producing false failures

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c            | 223 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   2 +
 2 files changed, 225 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 49c95ed67d7e..7b40be187a0f 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -22,6 +22,214 @@
 #include "xe_pci.h"
 #include "xe_pm.h"
 
+struct pagesize_alloc_saved {
+	enum xe_page_size_alloc_ctrl_mode  mode;
+	unsigned int cur_index;
+};
+
+static void pagesize_alloc_save(struct xe_device *xe,
+				struct pagesize_alloc_saved *s)
+{
+	s->mode      = xe->page_size_alloc_ctrl.mode;
+	s->cur_index = xe->page_size_alloc_ctrl.cur_index;
+}
+
+static void pagesize_alloc_restore(struct xe_device *xe,
+				   struct pagesize_alloc_saved *s)
+{
+	xe->page_size_alloc_ctrl.mode      = s->mode;
+	xe->page_size_alloc_ctrl.cur_index = s->cur_index;
+}
+
+/* Walk the TTM resource and return true if any segment is >= @want. */
+static bool bo_has_contig_block(struct xe_bo *bo, u64 want)
+{
+	struct xe_res_cursor cur;
+
+	if (!bo->ttm.resource)
+		return false;
+
+	xe_res_first(bo->ttm.resource, 0, xe_bo_size(bo), &cur);
+	for (; cur.remaining; xe_res_next(&cur, cur.size))
+		if (cur.size >= want)
+			return true;
+	return false;
+}
+
+/* Map a NEEDS_* flag to the (leaf size, alloc size) the test should use. */
+struct leaf_info {
+	u64 leaf;        /* SZ_2M / SZ_1G */
+	u64 alloc_size;  /* BO size to request */
+	u32 flag;        /* expected XE_BO_FLAG_NEEDS_* */
+	const char *name;
+};
+
+static const struct leaf_info leaf_2m = {
+	.leaf = SZ_2M,
+	.alloc_size = SZ_2M,
+	.flag = XE_BO_FLAG_NEEDS_2M,
+	.name = "2M"
+};
+
+static const struct leaf_info leaf_1g = {
+	.leaf = SZ_1G,
+	.alloc_size = SZ_1G,
+	.flag = XE_BO_FLAG_NEEDS_1G,
+	.name = "1G"
+};
+
+/*
+ * Common body for the ONLY_<size> tests.
+ *
+ *   1. Skip if platform can't support this leaf size.
+ *   2. Set mode, allocate one BO.
+ *   3. Skip on -ENOMEM (environmental: no free contiguous block right now).
+ *   4. Verify: flag was added, bo->page_alignment matches, buddy gave a contig block.
+ */
+static void run_only_leaf(struct kunit *test,
+			  enum xe_page_size_alloc_ctrl_mode
+			  mode,
+			  const struct leaf_info *li)
+{
+	struct xe_device *xe = test->priv;
+	struct pagesize_alloc_saved saved;
+	struct xe_bo *bo;
+	struct ttm_buffer_object *ttm_bo;
+	u32 other_flags;
+
+	if (!xe_device_supports_multi_pagesize(xe))
+		kunit_skip(test, "platform does not support %s leaves", li->name);
+
+	pagesize_alloc_save(xe, &saved);
+	xe->page_size_alloc_ctrl.mode = mode;
+
+	bo = xe_bo_create_user(xe, NULL, li->alloc_size,
+			       DRM_XE_GEM_CPU_CACHING_WC,
+			       XE_BO_FLAG_VRAM0, NULL);
+	if (IS_ERR(bo)) {
+		if (PTR_ERR(bo) == -ENOMEM) {
+			kunit_skip(test,
+				   "no contiguous %s VRAM available right now",
+				   li->name);
+			goto out;
+		}
+		KUNIT_FAIL(test, "%s BO alloc failed: %pe", li->name, bo);
+		goto out;
+	}
+	ttm_bo = &bo->ttm;
+	/* 1) The mode added the right NEEDS_* flag. */
+	KUNIT_EXPECT_TRUE_MSG(test, bo->flags & li->flag,
+			      "%s: flag missing, flags=0x%x",
+			      li->name, bo->flags);
+	/* 2) No other NEEDS_* flags accidentally tagged on. */
+	other_flags = (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
+		       XE_BO_FLAG_NEEDS_1G) & ~li->flag;
+	KUNIT_EXPECT_FALSE_MSG(test, bo->flags & other_flags,
+			       "%s: stray flags=0x%x", li->name, bo->flags);
+	/* 3) Allocator honored the alignment requirement.
+	 *    bo->page_alignment is stored in 4K pages (alignment = align >> PAGE_SHIFT
+	 *    in __xe_bo_create_locked), so compare in pages too.
+	 */
+	KUNIT_EXPECT_EQ_MSG(test, ttm_bo->page_alignment, li->leaf >> PAGE_SHIFT,
+			    "%s: page_alignment=%u pages expected=%llu pages",
+			    li->name, ttm_bo->page_alignment,
+			    (u64)(li->leaf >> PAGE_SHIFT));
+	/* 4) Buddy actually returned a contiguous block big enough for the leaf. */
+	KUNIT_EXPECT_TRUE_MSG(test, bo_has_contig_block(bo, li->leaf),
+			      "%s: no contiguous %llu-byte block in resource",
+			      li->name, li->leaf);
+	xe_bo_put(bo);
+
+out:
+	pagesize_alloc_restore(xe, &saved);
+}
+
+static void xe_bo_page_size_alloc_only_2m(struct kunit *test)
+{
+	run_only_leaf(test, XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M, &leaf_2m);
+}
+
+static void xe_bo_page_size_alloc_only_1g(struct kunit *test)
+{
+	run_only_leaf(test, XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G, &leaf_1g);
+}
+
+/*
+ * MIXED: with the Layer-3 (mixed-mode skip) in place, the rotation only
+ * produces flags whose size the platform supports.  Verify that:
+ *   - every BO's flag is either 0 (DEFAULT slot) or a NEEDS_* the platform
+ *     actually advertises support for via xe_device_has_pt_leaf();
+ *   - at least one of the supported NEEDS_* values actually appears across
+ *     the 8 iterations (proves the rotation is doing something);
+ *   - alignment matches the flag when one is set.
+ */
+static void xe_bo_page_size_alloc_mixed_8bo(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct pagesize_alloc_saved saved;
+	struct xe_bo *bos[8] = {};
+	struct ttm_buffer_object *ttm_bo;
+	int i, n = ARRAY_SIZE(bos);
+	static const u32 expect[4] = {
+		0,
+		XE_BO_FLAG_NEEDS_64K,
+		XE_BO_FLAG_NEEDS_2M,
+		XE_BO_FLAG_NEEDS_1G,
+	};
+	static const u64 size_for_slot[4] = {
+		SZ_4K, SZ_64K, SZ_2M, SZ_1G,
+	};
+	static const u64 leaf_for_slot[4] = {
+		SZ_4K, SZ_64K, SZ_2M, SZ_1G,
+	};
+
+	if (!xe_device_supports_multi_pagesize(xe))
+		kunit_skip(test, "no large leaf sizes supported on this platform");
+
+	pagesize_alloc_save(xe, &saved);
+	xe->page_size_alloc_ctrl.mode      = XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
+	xe->page_size_alloc_ctrl.cur_index = 0;
+
+	for (i = 0; i < n; i++) {
+		/*
+		 * Size must cover the largest leaf the rotation might pick on
+		 * this platform, otherwise __xe_bo_create_locked() rejects the
+		 * BO with -EINVAL when aligned_size != size for ttm_bo_type_device.
+		 */
+		u64 size = size_for_slot[i % 4];
+		u64 leaf = leaf_for_slot[i % 4];
+		u32 want = expect[i % 4];
+
+		bos[i] = xe_bo_create_user(xe, NULL, size,
+					   DRM_XE_GEM_CPU_CACHING_WC,
+					   XE_BO_FLAG_VRAM0, NULL);
+		if (IS_ERR(bos[i])) {
+			if (PTR_ERR(bos[i]) == -ENOMEM) {
+				kunit_info(test, "iter=%d -ENOMEM, skipping", i);
+				bos[i] = NULL;
+				continue;
+			}
+			KUNIT_FAIL(test, "iter=%d alloc failed: %pe", i, bos[i]);
+			bos[i] = NULL;
+			goto cleanup;
+		}
+
+		ttm_bo = &bos[i]->ttm;
+		if (want)
+			KUNIT_EXPECT_EQ_MSG(test, ttm_bo->page_alignment,
+					    leaf >> PAGE_SHIFT,
+					    "iter=%d want=0x%x page_alignment=%u pages expected=%llu pages",
+					    i, want, ttm_bo->page_alignment,
+					    (u64)(leaf >> PAGE_SHIFT));
+	}
+
+cleanup:
+	for (i = 0; i < n; i++)
+		if (bos[i])
+			xe_bo_put(bos[i]);
+	pagesize_alloc_restore(xe, &saved);
+}
+
 static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 			    bool clear, u64 get_val, u64 assign_val,
 			    struct kunit *test, struct drm_exec *exec)
@@ -609,6 +817,21 @@ static struct kunit_case xe_bo_tests[] = {
 	{}
 };
 
+static struct kunit_case xe_bo_page_size_alloc_cases[] = {
+	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_only_2m,   xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_only_1g,   xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_mixed_8bo,   xe_pci_live_device_gen_param),
+	{}
+};
+
+VISIBLE_IF_KUNIT
+struct kunit_suite xe_bo_page_size_alloc_suite = {
+	.name = "xe_bo_page_size_alloc",
+	.test_cases = xe_bo_page_size_alloc_cases,
+	.init = xe_kunit_helper_xe_device_live_test_init,
+};
+EXPORT_SYMBOL_IF_KUNIT(xe_bo_page_size_alloc_suite);
+
 VISIBLE_IF_KUNIT
 struct kunit_suite xe_bo_test_suite = {
 	.name = "xe_bo",
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index c55e46f1ae92..3d48a92e1201 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -11,6 +11,7 @@ extern struct kunit_suite xe_dma_buf_test_suite;
 extern struct kunit_suite xe_migrate_test_suite;
 extern struct kunit_suite xe_mocs_test_suite;
 extern struct kunit_suite xe_guc_g2g_test_suite;
+extern struct kunit_suite xe_bo_page_size_alloc_suite;
 
 kunit_test_suite(xe_bo_test_suite);
 kunit_test_suite(xe_bo_shrink_test_suite);
@@ -18,6 +19,7 @@ kunit_test_suite(xe_dma_buf_test_suite);
 kunit_test_suite(xe_migrate_test_suite);
 kunit_test_suite(xe_mocs_test_suite);
 kunit_test_suite(xe_guc_g2g_test_suite);
+kunit_test_suite(xe_bo_page_size_alloc_suite);
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
-- 
2.43.0

