Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813A5C54EFC
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 09:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6CA10E494;
	Tue, 28 Jul 2026 09:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUYzze9g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E85D10E494
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785231611; x=1816767611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=29Qch1bRSh7yCxKBNxdyf9M8ZDorASe9aMkRtXtTHUA=;
 b=XUYzze9gkg2AeQTz7r0rmIF8hmvM5wFWS1ItHNnlQlx24YxeOdmGbTS5
 TiIb/m+gmKU9DbVazj+/qH/6+b88W4zqYJ3BLy0mY6TXbkuRPMQO9/aXH
 IWVCo5OaoCZZXBT84T2ohYcjLlBaOP914tIhHIe8jW5TN+RI9S5EWamW8
 rIMgtSmfgHZxQ3wfSpbw+KiongZIBBV3TZ5C3oAzJRhfXAmrTgFDQdOvk
 W4cwFtH6YQ7GsYJO50wWoZrHnhbZtBp+w6hMOBmLFnF0kcOC2YVh75qW0
 j1nSlLGYegCdY/nDVyUmKIV271ksAw1oQpth21zyoW378lci2+2g1I4Bc w==;
X-CSE-ConnectionGUID: gvFt2j0HR9OKL68ESsHkVQ==
X-CSE-MsgGUID: xoS3BVcwQ6qmv6748FNpYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85660239"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85660239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:40:11 -0700
X-CSE-ConnectionGUID: XzAehg4dQs2WEdrNtdwsDw==
X-CSE-MsgGUID: lUpLnSV8Tf6NaJqV1SZrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="255347846"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2026 02:40:08 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH] [CI-only][Do not review]Page allocation debufs knob
Date: Tue, 28 Jul 2026 15:10:10 +0530
Message-ID: <20260728094011.509392-1-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
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

drm/xe: add page size allocation control state to xe_device

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug            |  17 ++
 drivers/gpu/drm/xe/tests/xe_bo.c            | 242 ++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c |   6 +
 drivers/gpu/drm/xe/xe_bo.c                  | 160 ++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h                  |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  78 +++++++
 drivers/gpu/drm/xe/xe_device.c              |  25 ++
 drivers/gpu/drm/xe/xe_device.h              |  48 ++++
 drivers/gpu/drm/xe/xe_device_types.h        |  31 +++
 drivers/gpu/drm/xe/xe_pt.c                  |  77 ++++++-
 10 files changed, 681 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01227c77f6d7..cce7deb057b9 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -86,6 +86,23 @@ config DRM_XE_KUNIT_TEST
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_PAGE_SIZE
+	bool "Enable debug control for user BO page-size allocation"
+	depends on DRM_XE_DEBUG && DEBUG_FS
+	default y
+	help
+	  Expose a debugfs knob to override user BO page-size allocation
+	  handling for validation and debug. Supported modes include forced
+	  2M, forced 1G, and a mixed mode that exercises 4K, 64K, 2M, and
+	  1G page-size paths on platforms that support them.
+
+	  This is an unstable debugfs interface intended for development and
+	  validation only. Its layout, contents, and existence may change or
+	  be removed at any time with no regression warranty.
+
+	  Recommended for driver developers only.
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_GUC
         bool "Enable extra GuC related debug options"
         depends on DRM_XE_DEBUG
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
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c266fa6bade1..929669f18788 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2340,8 +2340,16 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
-	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
-		size_t align = flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
+	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
+		       XE_BO_FLAG_NEEDS_1G)))) {
+		size_t align;
+
+		if (flags & XE_BO_FLAG_NEEDS_1G)
+			align = SZ_1G;
+		else if (flags & XE_BO_FLAG_NEEDS_2M)
+			align = SZ_2M;
+		else
+			align = SZ_64K;
 
 		aligned_size = ALIGN(size, align);
 		if (type != ttm_bo_type_device)
@@ -2632,6 +2640,145 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
 	return ret ? ERR_PTR(ret) : bo;
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe, struct xe_bo *bo)
+{
+	if (!xe_debug_page_size_mode_is_mixed(xe))
+		return;
+
+	if (!(bo->flags & XE_BO_FLAG_VRAM_MASK) ||
+	    !(bo->flags & XE_BO_FLAG_USER))
+		return;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+	if (xe->page_size_alloc_ctrl.mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		xe->page_size_alloc_ctrl.cur_index++;
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+}
+
+static bool xe_size_align_overflows(size_t size, size_t align)
+{
+	return size > SIZE_MAX - (align - 1);
+}
+
+static u32 get_flag_from_cur_index_in_mixed_mode(struct xe_device *xe, size_t *align_size,
+						 int *err)
+{
+	static const struct {
+		u32    flag;
+		size_t align;
+	} map[] = {
+		{ 0,                     SZ_4K  }, /* default: 4K, no flag */
+		{ XE_BO_FLAG_NEEDS_64K,  SZ_64K },
+		{ XE_BO_FLAG_NEEDS_2M,   SZ_2M  },
+		{ XE_BO_FLAG_NEEDS_1G,   SZ_1G  },
+	};
+	u32 idx;
+	const typeof(*map) *entry;
+
+	lockdep_assert_held(&xe->page_size_alloc_ctrl.lock);
+
+	*err = 0;
+	idx = xe->page_size_alloc_ctrl.cur_index % ARRAY_SIZE(map);
+
+	entry = &map[idx];
+
+	if (!entry->flag)
+		return 0;
+
+	if (xe_size_align_overflows(*align_size, entry->align)) {
+		*err = -EINVAL;
+		return 0;
+	}
+	*align_size = ALIGN(*align_size, entry->align);
+
+	return entry->flag;
+}
+
+static int xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
+					      u32 *bo_flags,
+					      size_t *size)
+{
+	enum xe_page_size_alloc_ctrl_mode mode;
+	u32 want = 0;
+	size_t align_size = *size;
+	int err = 0;
+
+	/*
+	 * The debug page-size policy is only meaningful for BOs placed in
+	 * VRAM, where the downstream BO init path can
+	 * actually honor the corresponding minimum page-size requirement.
+	 */
+	if (!(*bo_flags & XE_BO_FLAG_VRAM_MASK))
+		return 0;
+
+	/*
+	 * Do not override existing page-size requirement flags, since they
+	 * may reflect functional requirements for specific BO types.
+	 */
+	if (*bo_flags & (XE_BO_FLAG_NEEDS_64K |
+			 XE_BO_FLAG_NEEDS_2M |
+			 XE_BO_FLAG_NEEDS_1G))
+		return 0;
+
+	if (!READ_ONCE(xe->page_size_alloc_ctrl.mode))
+		return 0;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+
+	mode = xe->page_size_alloc_ctrl.mode;
+	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE) {
+		goto out_unlock;
+	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M) {
+		if (xe_size_align_overflows(align_size, SZ_2M)) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+		want = XE_BO_FLAG_NEEDS_2M;
+		align_size = ALIGN(align_size, SZ_2M);
+	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G) {
+		if (xe_size_align_overflows(align_size, SZ_1G)) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
+		want = XE_BO_FLAG_NEEDS_1G;
+		align_size = ALIGN(align_size, SZ_1G);
+	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED) {
+		want = get_flag_from_cur_index_in_mixed_mode(xe, &align_size, &err);
+		if (err)
+			goto out_unlock;
+	} else {
+		goto out_unlock;
+	}
+
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+
+	*bo_flags |= want;
+	/*
+	 * Apply the debug page-size policy by rounding the user BO size up to
+	 * the selected granularity.
+	 */
+	*size = align_size;
+	return err;
+
+out_unlock:
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+	return err;
+}
+#else
+static int xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
+					      u32 *bo_flags,
+					      size_t *size)
+{
+	return 0;
+}
+
+static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe,
+						     struct xe_bo *bo)
+{
+}
+#endif
+
 /**
  * xe_bo_create_user() - Create a user BO
  * @xe: The xe device.
@@ -2652,9 +2799,16 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
 				u32 flags, struct drm_exec *exec)
 {
 	struct xe_bo *bo;
+	int err = 0;
 
 	flags |= XE_BO_FLAG_USER;
 
+	if (xe_debug_page_size_mode_not_none(xe)) {
+		err = xe_bo_apply_debug_page_size_policy(xe, &flags, &size);
+		if (err)
+			return ERR_PTR(err);
+	}
+
 	if (vm || exec) {
 		xe_assert(xe, exec);
 		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
@@ -3469,6 +3623,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto out_bulk;
 
+	xe_bo_debug_mixed_mode_cur_index_advance(xe, bo);
+
 	args->handle = handle;
 	goto out_put;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7ae1d9ac0574..c6d80e1bd6e7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -52,6 +52,7 @@
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
+#define XE_BO_FLAG_NEEDS_1G		BIT(27)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 5a3877fcb0f0..8de78cd0aa03 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -614,6 +614,72 @@ static const struct file_operations disable_late_binding_fops = {
 	.write = disable_late_binding_set,
 };
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static const char * const page_size_alloc_mode_names[] = {
+	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE]    = "none",
+	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M] = "only_2m",
+	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G] = "only_1g",
+	[XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED]   = "mixed",
+};
+
+static ssize_t page_size_alloc_mode_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len;
+	enum xe_page_size_alloc_ctrl_mode mode;
+
+	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+	if (mode >= ARRAY_SIZE(page_size_alloc_mode_names) ||
+	    !page_size_alloc_mode_names[mode])
+		len = scnprintf(buf, sizeof(buf), "unknown\n");
+	else
+		len = scnprintf(buf, sizeof(buf), "%s\n",
+				page_size_alloc_mode_names[mode]);
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t page_size_alloc_mode_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	int ret;
+	char buf[32];
+	int mode;
+
+	if (*pos)
+		return -ESPIPE;
+
+	if (size > sizeof(buf) - 1)
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, ubuf, size);
+	if (ret < 0)
+		return ret;
+	buf[ret] = '\0';
+
+	mode = sysfs_match_string(page_size_alloc_mode_names, buf);
+	if (mode < 0)
+		return mode;
+
+	mutex_lock(&xe->page_size_alloc_ctrl.lock);
+	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
+		xe->page_size_alloc_ctrl.cur_index = 0;
+	WRITE_ONCE(xe->page_size_alloc_ctrl.mode,
+		   (enum xe_page_size_alloc_ctrl_mode)mode);
+	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
+
+	return size;
+}
+
+static const struct file_operations page_size_alloc_mode_fops = {
+	.owner = THIS_MODULE,
+	.read = page_size_alloc_mode_show,
+	.write = page_size_alloc_mode_set,
+};
+#endif
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -665,6 +731,18 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+	/*
+	 * Expose a debugfs knob to control user BO page-size allocation:
+	 * "none"    - default behavior
+	 * "only_2m" - force 2M page allocations
+	 * "only_1g" - force 1G page allocations
+	 * "mixed"   - select 4K, 64K, 2M, and 1G in round-robin order
+	 */
+	if (xe_debug_page_size_supported(xe))
+		debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
+				    &page_size_alloc_mode_fops);
+#endif
 	/*
 	 * Don't expose page reclaim configuration file if not supported by the
 	 * hardware initially.
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65..7007b6113760 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -921,6 +921,27 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 		xe_pm_runtime_put(xe);
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
+{
+	int err;
+
+	err = drmm_mutex_init(&xe->drm, &xe->page_size_alloc_ctrl.lock);
+	if (err)
+		return err;
+
+	xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE;
+	xe->page_size_alloc_ctrl.cur_index = 0;
+
+	return 0;
+}
+#else
+static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
+{
+	return 0;
+}
+#endif
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1073,6 +1094,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_debug_page_size_alloc_ctrl_init(xe);
+	if (err)
+		return err;
+
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index a03760d0ce38..6c4cfaebc44a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -212,6 +212,54 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged.flag);
 }
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+static inline bool xe_debug_page_size_supported(struct xe_device *xe)
+{
+	return IS_DGFX(xe);
+}
+
+static inline bool xe_debug_page_size_mode_not_none(struct xe_device *xe)
+{
+	enum xe_page_size_alloc_ctrl_mode mode;
+
+	if (!xe_debug_page_size_supported(xe))
+		return false;
+
+	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+
+	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M ||
+	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G ||
+	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
+}
+
+static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
+{
+	enum xe_page_size_alloc_ctrl_mode mode;
+
+	if (!xe_debug_page_size_supported(xe))
+		return false;
+
+	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
+
+	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
+}
+#else
+static inline bool xe_debug_page_size_supported(struct xe_device *xe)
+{
+	return false;
+}
+
+static inline bool xe_debug_page_size_mode_not_none(struct xe_device *xe)
+{
+	return false;
+}
+
+static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
+{
+	return false;
+}
+#endif
+
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 860ad322237f..03a7bb08adf7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -61,6 +61,23 @@ enum xe_wedged_mode {
 	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
 };
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+/**
+ * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE: Use the normal allocation policy
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M: Force user BO allocations to 2M pages
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G: Force user BO allocations to 1G pages
+ * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED: Select page sizes in round-robin order
+ *     (4K, 64K, 2M, 1G)
+ */
+enum xe_page_size_alloc_ctrl_mode {
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE = 0,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G,
+	XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED
+};
+#endif
+
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
 #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
@@ -478,6 +495,20 @@ struct xe_device {
 	/** @late_bind: xe mei late bind interface */
 	struct xe_late_bind late_bind;
 
+#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
+	/**
+	 * @page_size_alloc_ctrl: User BO page-size allocation
+	 * debug control state
+	 */
+	struct {
+		/** @page_size_alloc_ctrl.mode: xe page size allocation control mode */
+		enum xe_page_size_alloc_ctrl_mode mode;
+		/** @page_size_alloc_ctrl.cur_index: Round-robin index used by mixed mode */
+		u32 cur_index;
+		/** @page_size_alloc_ctrl.lock: Protects @mode and @cur_index */
+		struct mutex lock;
+	} page_size_alloc_ctrl;
+#endif
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 598c6b2571e7..b360ef4e2a7e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -302,6 +302,14 @@ struct xe_pt_stage_bind_walk {
 	bool needs_64K;
 	/** @clear_pt: clear page table entries during the bind walk */
 	bool clear_pt;
+	/**
+	 * @target_leaf_level: Page-table level at which to emit leaf PTEs
+	 * 0 for normal 4K/64K mappings, 1 for 2M huge pages, and 2 for 1G huge
+	 * pages. The walk still traverses from the root down; this field tells
+	 * xe_pt_stage_bind_entry() to treat the selected level as a leaf instead
+	 * of descending further.
+	 */
+	u32 target_leaf_level;
 	/**
 	 * @vma: VMA being mapped
 	 */
@@ -514,6 +522,39 @@ xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 	return xe_walk->found_64K;
 }
 
+static bool xe_pt_huge_leaf_allowed(u64 addr, u64 next, unsigned int level,
+				    struct xe_pt_stage_bind_walk *xe_walk)
+{
+	if (xe_walk->clear_pt)
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	if (!xe_debug_page_size_supported(xe_walk->vm->xe))
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	if (!xe_walk->target_leaf_level)
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	if (level == xe_walk->target_leaf_level)
+		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
+
+	return false;
+}
+
+static bool xe_pt_exact_leaf_required_but_invalid(u64 addr, u64 next,
+						  unsigned int level,
+						  struct xe_pt_stage_bind_walk *xe_walk)
+{
+	struct xe_device *xe = xe_walk->vm->xe;
+
+	if (!xe_debug_page_size_mode_not_none(xe))
+		return false;
+
+	return !xe_walk->clear_pt &&
+		xe_walk->target_leaf_level &&
+		level == xe_walk->target_leaf_level &&
+		!xe_pt_hugepte_possible(addr, next, level, xe_walk);
+}
+
 static int
 xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		       unsigned int level, u64 addr, u64 next,
@@ -531,8 +572,18 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	int ret = 0;
 	u64 pte;
 
-	/* Is this a leaf entry ?*/
-	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
+	if (xe_pt_exact_leaf_required_but_invalid(addr, next, level, xe_walk))
+		return -EINVAL;
+
+	/*
+	 * Is this a leaf entry?
+	 * Always create a 4K leaf at level 0. For huge pages (level > 0),
+	 * validate alignment and size with xe_pt_hugepte_possible().
+	 * When target_leaf_level is non-zero, only that huge-page level is
+	 * accepted for normal bind walks. Clear walks remain unconstrained so
+	 * existing huge leaves can be cleared without descending further.
+	 */
+	if (level == 0 || xe_pt_huge_leaf_allowed(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk->curs;
 		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
 		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
@@ -682,6 +733,27 @@ static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
 				 (bo && xe_bo_has_single_placement(bo))));
 }
 
+static u32 xe_pt_target_leaf_level_from_bo(struct xe_device *xe,
+					   struct xe_vma *vma)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+
+	if (!xe_debug_page_size_mode_not_none(xe))
+		return 0;
+
+	if (!bo || !(bo->flags & XE_BO_FLAG_VRAM_MASK) ||
+	    !(bo->flags & XE_BO_FLAG_USER))
+		return 0;
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_1G)
+		return 2;
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_2M)
+		return 1;
+
+	return 0;
+}
+
 /**
  * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
  * range.
@@ -774,6 +846,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		xe_svm_notifier_unlock(vm);
 	}
 
+	xe_walk.target_leaf_level = xe_pt_target_leaf_level_from_bo(xe, vma);
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
 	if (clear_pt)
 		goto walk_pt;
-- 
2.43.0

