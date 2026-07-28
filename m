Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB1C54F52
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 06:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27D110E540;
	Tue, 28 Jul 2026 06:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyYto4y/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B7F10E77C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 06:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218508; x=1816754508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXRy1bOAsIuGJbbWZuV5e/AytQR+tUSTjNERFtHFSpc=;
 b=eyYto4y/kEVR4XlSeWbijqt9ie/+9GEq5H01Y8tReIgyJC1Ap3PhHFmm
 GJj7OcXVT8nxSoaYXTNZarDgO6kungbkogShJIzrx3NFU8AHBzsq7682v
 m9UtBYc2y8yo0EA/VfhxYy41zUANKVvGFg9Pd3cFYqFqAcs+HyXmIN1k4
 BoSo8RVe7a8U9+65HvfEYqGoLzGbVYk7QsZRGT35jAH099KdYnpbMMg6P
 O/emz0EEKp7DrqxlmoPNe7vLfgNiCGIGo1hzodZZfsvy+DsLxbO/8LZzX
 W5ue+AQI99Q5W2FllkmpKAWOibb+nCDNwjc9OgwNU3DdPlB6cOHE7pnmx g==;
X-CSE-ConnectionGUID: itoNKb0cSXubFFr+s6ArMw==
X-CSE-MsgGUID: 8pZilImUQJKQjDH5/QkBvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96150870"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="96150870"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:01:43 -0700
X-CSE-ConnectionGUID: y/5hzkF0Q2KniL0XunacLQ==
X-CSE-MsgGUID: DO69+g6bRLeLQlH4QDp1GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="284152431"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 23:01:40 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v9 6/6] drm/xe/tests: add live KUnit coverage for BO page-size
 allocation modes
Date: Tue, 28 Jul 2026 11:31:32 +0530
Message-ID: <20260728060132.4067990-7-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060132.4067990-1-naresh.kumar.g@intel.com>
References: <20260728060132.4067990-1-naresh.kumar.g@intel.com>
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

Add live KUnit coverage for the debug-controlled BO
    page-size allocation modes.

    The new tests cover forced 2M mode, forced 1G mode,
    and mixed mode. They verify that user BO creation applies
    the expected NEEDS_* flags, that no unexpected page-size flags are
    added in the forced modes, that BO size is rounded as expected, and
    that page_alignment matches the selected leaf size.

    The mixed-mode test does not assume a strict per-allocation rotation
    sequence, since the device-global mixed-mode index may be perturbed by
    concurrent BO creation on a live system. Instead,
    it validates that each allocation results in
    one valid mixed-mode page-size outcome.

    Treat transient VRAM allocation failures as skipped test cases so the
    tests can run in varying live environments without producing false
    failures.

    v3
    - address review comments
    - rework mixed-mode test to avoid assuming strict rotation order
    - reword commit message
    v4
    - skip VRAM-targeted live tests on non-dGFX devices
    v5
    - advance the mixed-mode index in the test
    v6
    - Gaurd kunit tests under CONFIG_DRM_XE_DEBUG_PAGE_SIZE
    v9
    - consider XE_VRAM_FLAGS_NEED64K in mixed mode for certain
      platoform min alignment expectations.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c            | 242 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   6 +
 2 files changed, 248 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 49c95ed67d7e..6a17e13d58cf 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -22,6 +22,231 @@
 #include "xe_pci.h"
 #include "xe_pm.h"
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+struct page_size_alloc_saved {
+	enum xe_page_size_alloc_ctrl_mode mode;
+	u32 cur_index;
+};
+
+/* Caller must hold xe->page_size_alloc_ctrl.lock. */
+static void page_size_alloc_save(struct xe_device *xe,
+				 struct page_size_alloc_saved *s)
+{
+	s->mode = xe->page_size_alloc_ctrl.mode;
+	s->cur_index = xe->page_size_alloc_ctrl.cur_index;
+}
+
+static void page_size_alloc_restore(struct xe_device *xe,
+				    const struct page_size_alloc_saved *s)
+{
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+	xe->page_size_alloc_ctrl.mode = s->mode;
+	xe->page_size_alloc_ctrl.cur_index = s->cur_index;
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+}
+
+/* Expected properties for a forced page-size allocation mode. */
+struct leaf_info {
+	u64 leaf;
+	u64 alloc_size;
+	u32 flag;
+	const char *name;
+};
+
+static const struct leaf_info leaf_2m = {
+	.leaf = SZ_2M,
+	.alloc_size = SZ_2M - PAGE_SIZE,
+	.flag = XE_BO_FLAG_NEEDS_2M,
+	.name = "2M",
+};
+
+static const struct leaf_info leaf_1g = {
+	.leaf = SZ_1G,
+	.alloc_size = SZ_1G - PAGE_SIZE,
+	.flag = XE_BO_FLAG_NEEDS_1G,
+	.name = "1G",
+};
+
+static void run_only_leaf(struct kunit *test,
+			  enum xe_page_size_alloc_ctrl_mode mode,
+			  const struct leaf_info *li)
+{
+	struct xe_device *xe = test->priv;
+	struct page_size_alloc_saved saved;
+	struct xe_bo *bo;
+	struct ttm_buffer_object *ttm_bo;
+	u32 other_flags;
+
+	if (!IS_DGFX(xe)) {
+		kunit_skip(test, "requires dGFX VRAM");
+		return;
+	}
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+	page_size_alloc_save(xe, &saved);
+	xe->page_size_alloc_ctrl.mode = mode;
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+
+	bo = xe_bo_create_user(xe, NULL, li->alloc_size,
+			       DRM_XE_GEM_CPU_CACHING_WC,
+			       XE_BO_FLAG_VRAM0, NULL);
+	if (IS_ERR(bo)) {
+		page_size_alloc_restore(xe, &saved);
+		if (PTR_ERR(bo) == -ENOSPC) {
+			kunit_skip(test,
+				   "no contiguous %s VRAM available right now",
+				   li->name);
+			return;
+		}
+
+		KUNIT_FAIL(test, "%s BO alloc failed: %pe", li->name, bo);
+		return;
+	}
+
+	ttm_bo = &bo->ttm;
+
+	/* 1) The mode added the right NEEDS_* flag. */
+	KUNIT_EXPECT_TRUE_MSG(test, bo->flags & li->flag,
+			      "%s: flag missing, flags=0x%x",
+			      li->name, bo->flags);
+
+	/* 2) No other NEEDS_* flags accidentally tagged on. */
+	other_flags = (XE_BO_FLAG_NEEDS_64K |
+		       XE_BO_FLAG_NEEDS_2M |
+		       XE_BO_FLAG_NEEDS_1G) & ~li->flag;
+	KUNIT_EXPECT_FALSE_MSG(test, bo->flags & other_flags,
+			       "%s: stray flags=0x%x",
+			       li->name, bo->flags);
+	/* 3) BO size was rounded up to the expected leaf size. */
+	KUNIT_EXPECT_EQ_MSG(test, xe_bo_size(bo), li->leaf,
+			    "%s: bo size=%llu expected=%llu",
+			    li->name,
+			    (u64)xe_bo_size(bo),
+			    (u64)li->leaf);
+	/*
+	 * 4) Allocator honored the requested alignment.
+	 * ttm_bo->page_alignment is stored in PAGE_SIZE units, so compare against
+	 * the expected leaf size converted with >> PAGE_SHIFT.
+	 */
+	KUNIT_EXPECT_EQ_MSG(test, ttm_bo->page_alignment,
+			    li->leaf >> PAGE_SHIFT,
+			    "%s: page_alignment=%u pages expected=%llu pages",
+			    li->name, ttm_bo->page_alignment,
+			    (u64)(li->leaf >> PAGE_SHIFT));
+
+	xe_bo_put(bo);
+	page_size_alloc_restore(xe, &saved);
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
+static void xe_bo_page_size_alloc_mixed_bos(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct page_size_alloc_saved saved;
+	struct xe_bo *bo;
+	struct ttm_buffer_object *ttm_bo;
+	u32 all_flags = XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
+			XE_BO_FLAG_NEEDS_1G;
+	u32 flags;
+	u64 expected_align;
+	int i;
+	const int n = 4;
+
+	if (!IS_DGFX(xe)) {
+		kunit_skip(test, "requires dGFX VRAM");
+		return;
+	}
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+	page_size_alloc_save(xe, &saved);
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+
+	for (i = 0; i < n; i++) {
+		mutex_lock(&xe->page_size_alloc_ctrl.lock);
+		xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
+		xe->page_size_alloc_ctrl.cur_index = i;
+		mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+		/*
+		 * Request a size valid for any mixed-mode slot. Since cur_index is
+		 * device-global and may be perturbed by concurrent allocations on
+		 * a live system, do not assume this iteration will see a specific
+		 * slot.
+		 */
+		bo = xe_bo_create_user(xe, NULL, SZ_1G,
+				       DRM_XE_GEM_CPU_CACHING_WC,
+				       XE_BO_FLAG_VRAM0, NULL);
+		if (IS_ERR(bo)) {
+			int err = PTR_ERR(bo);
+
+			page_size_alloc_restore(xe, &saved);
+			if (err == -ENOSPC) {
+				kunit_skip(test,
+					   "mixed mode BO allocation unavailable: %d",
+					   err);
+				return;
+			}
+			KUNIT_FAIL(test, "iter=%d alloc failed: %pe", i, bo);
+			return;
+		}
+
+		ttm_bo = &bo->ttm;
+		flags = bo->flags & all_flags;
+		/*
+		 * Mixed mode may result in:
+		 * 0-> default platform VRAM alignment
+		 * XE_BO_FLAG_NEEDS_64K
+		 * XE_BO_FLAG_NEEDS_2M
+		 * XE_BO_FLAG_NEEDS_1G
+		 * Any other combination is invalid.
+		 */
+		if (flags == 0) {
+			expected_align = SZ_4K;
+			if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+				expected_align = SZ_64K;
+		} else if (flags == XE_BO_FLAG_NEEDS_64K) {
+			expected_align = SZ_64K;
+		} else if (flags == XE_BO_FLAG_NEEDS_2M) {
+			expected_align = SZ_2M;
+		} else if (flags == XE_BO_FLAG_NEEDS_1G) {
+			expected_align = SZ_1G;
+		} else {
+			KUNIT_FAIL(test,
+				   "iter=%d invalid mixed-mode flags: 0x%x",
+				   i, flags);
+			xe_bo_put(bo);
+			page_size_alloc_restore(xe, &saved);
+			return;
+		}
+		/*
+		 * BO size should remain valid for the selected mode. Since the
+		 * request is SZ_1G, it should remain unchanged regardless of the
+		 * selected page-size policy.
+		 */
+		KUNIT_EXPECT_EQ_MSG(test, xe_bo_size(bo), (u64)SZ_1G,
+				    "iter=%d size=%llu expected=%llu",
+				    i,
+				    (u64)xe_bo_size(bo),
+				    (u64)SZ_1G);
+		KUNIT_EXPECT_EQ_MSG(test, ttm_bo->page_alignment,
+				    expected_align >> PAGE_SHIFT,
+				    "iter=%d flags=0x%x page_alignment=%u pages expected=%llu pages",
+				    i, flags, ttm_bo->page_alignment,
+				    (u64)(expected_align >> PAGE_SHIFT));
+		xe_bo_put(bo);
+	}
+	page_size_alloc_restore(xe, &saved);
+}
+#endif
+
 static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 			    bool clear, u64 get_val, u64 assign_val,
 			    struct kunit *test, struct drm_exec *exec)
@@ -609,6 +834,23 @@ static struct kunit_case xe_bo_tests[] = {
 	{}
 };
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static struct kunit_case xe_bo_page_size_alloc_cases[] = {
+	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_only_2m,   xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_only_1g,   xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_page_size_alloc_mixed_bos,   xe_pci_live_device_gen_param),
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
+#endif
+
 VISIBLE_IF_KUNIT
 struct kunit_suite xe_bo_test_suite = {
 	.name = "xe_bo",
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index c55e46f1ae92..87cd7db20e5f 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -11,6 +11,9 @@ extern struct kunit_suite xe_dma_buf_test_suite;
 extern struct kunit_suite xe_migrate_test_suite;
 extern struct kunit_suite xe_mocs_test_suite;
 extern struct kunit_suite xe_guc_g2g_test_suite;
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+extern struct kunit_suite xe_bo_page_size_alloc_suite;
+#endif
 
 kunit_test_suite(xe_bo_test_suite);
 kunit_test_suite(xe_bo_shrink_test_suite);
@@ -18,6 +21,9 @@ kunit_test_suite(xe_dma_buf_test_suite);
 kunit_test_suite(xe_migrate_test_suite);
 kunit_test_suite(xe_mocs_test_suite);
 kunit_test_suite(xe_guc_g2g_test_suite);
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+kunit_test_suite(xe_bo_page_size_alloc_suite);
+#endif
 
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
-- 
2.43.0

