Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A702C55ABA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 20:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341E910EB94;
	Tue,  4 Aug 2026 20:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gijmu6Sf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83C110E881
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 20:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785874365; x=1817410365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sC0FyU/4yVM+g1sWWjZZbfy2aBXmjv1G5KmMq8310X0=;
 b=Gijmu6Sf7Ak1HxGgWehhLRuSXxtuyO9kmPiJIU2CPkgmr+X47MBNqeB5
 hYx0R/qytTV20XQg12u0xvZT+EAOGyUUJa6FPqdnDbnQVHG2Fsk0oL/SU
 CBJt7nuwJSXgL/Ti9ek4pVUeW86zzHBUMVL7I4O/eQuWblUtdWCaL9+x2
 4rBbHJXCmqd61uUh3r37iTO+3adTj4nKezwRDOMyAt1pk474j1dfR4Dpr
 KmCphbpO3p8T1tS2T1XLfERi9Zr7vzSRSqAtqb5RGC0dubVla1YB5R7kH
 Sf27ZEay7SGDW4u0R9CVHARy1/8w1tYLbDw5RuO9anR22LxphUzF3qgNn Q==;
X-CSE-ConnectionGUID: MWrAv/I2Q26mche/gOYVXw==
X-CSE-MsgGUID: UPs/SIeSQcC93tjE0088uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86636957"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="86636957"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 13:12:44 -0700
X-CSE-ConnectionGUID: 0b27b1+PQVyGX3wSTF871Q==
X-CSE-MsgGUID: +aLE+ds+QDybg6DfVBRXUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="261662284"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 04 Aug 2026 13:12:43 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4] [CI-ONLY] DONOT-Review: Pin vram limit
Date: Wed,  5 Aug 2026 01:44:16 +0530
Message-ID: <20260804201417.1379741-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
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

drm/xe/dma-buf: propagate pin error

Return the error from xe_bo_pin_external() instead of asserting
success, so callers observe failures such as -ENOSPC from the pin limit.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: add pin_vram_percent modparam

Add a module parameter that caps the percentage of each VRAM region
which may be pinned via dma-buf. A value of 0 disables the limit.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/vram: add pinned vram counters

Add per-region counters tracking dma-buf and total pinned VRAM bytes
along with the enforced dma-buf pin limit.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/vram: init dma-buf pin limit

Derive the per-region dma-buf pin limit from pin_vram_percent during
VRAM manager initialization.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/bo: account dma-buf pinned vram

Track dma-buf pinned VRAM in the per-region counters on external
pin and unpin.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/bo: account kernel pinned vram

Track kernel pinned VRAM in the per-region total counter on pin
and unpin.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/bo: enforce dma-buf pin limit

Reject external VRAM pins that would exceed the per-region dma-buf
limit with -ENOSPC.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/vram: show pinned vram in debug

Expose the pinned VRAM counters and the dma-buf limit in the VRAM
manager debug output.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/tests: add VRAM pin limit KUnit tests

Test under-limit success, over-limit rejection, counter recovery after
unpin, and the limit=0 unlimited case in xe_bo tests. Add an end-to-end
dma-buf pin limit test in xe_dma_buf tests.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c           | 230 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_dma_buf.c      |  96 +++++++++
 drivers/gpu/drm/xe/xe_bo.c                 |  72 ++++++-
 drivers/gpu/drm/xe/xe_bo_types.h           |   8 +
 drivers/gpu/drm/xe/xe_defaults.h           |   1 +
 drivers/gpu/drm/xe/xe_dma_buf.c            |   5 +-
 drivers/gpu/drm/xe/xe_module.c             |   5 +
 drivers/gpu/drm/xe/xe_module.h             |   1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  21 ++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   9 +
 10 files changed, 439 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 6a17e13d58cf..5e951614c5f1 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -17,7 +17,9 @@
 #include "tests/xe_pci_test.h"
 #include "tests/xe_test.h"
 
+#include "xe_bo.h"
 #include "xe_bo_evict.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_gt.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
@@ -828,9 +830,237 @@ static void xe_bo_shrink_kunit(struct kunit *test)
 	shrink_test_run_device(xe);
 }
 
+/* Returns NULL if the device has no VRAM (skips the test). */
+static struct xe_ttm_vram_mgr *pin_limit_get_mgr(struct xe_device *xe,
+						  struct kunit *test)
+{
+	struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
+
+	if (!man) {
+		kunit_skip(test, "no VRAM\n");
+		return NULL;
+	}
+	return to_xe_ttm_vram_mgr(man);
+}
+
+static struct xe_bo *pin_limit_bo_create(struct xe_device *xe,
+					 struct kunit *test, u64 size)
+{
+	struct xe_bo *bo = xe_bo_create_user(xe, NULL, size,
+					     DRM_XE_GEM_CPU_CACHING_WC,
+					     XE_BO_FLAG_VRAM0, NULL);
+	if (IS_ERR(bo))
+		KUNIT_FAIL(test, "bo create err=%pe\n", bo);
+	return bo;
+}
+
+static void xe_bo_pin_limit_under_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_bo *bo;
+	u64 orig_limit;
+	int err;
+
+	guard(xe_pm_runtime)(xe);
+
+	mgr = pin_limit_get_mgr(xe, test);
+	if (!mgr)
+		return;
+
+	bo = pin_limit_bo_create(xe, test, SZ_64K);
+	if (IS_ERR(bo))
+		return;
+
+	spin_lock(&xe->pinned.lock);
+	orig_limit = mgr->pin.dmabuf_limit;
+	/* limit = current usage + exactly one BO */
+	mgr->pin.dmabuf_limit = mgr->pin.dmabuf_used + SZ_64K;
+	spin_unlock(&xe->pinned.lock);
+
+	xe_bo_lock(bo, false);
+	err = xe_bo_pin_external(bo, false, XE_VALIDATION_OPT_OUT);
+	xe_bo_unlock(bo);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	xe_bo_lock(bo, false);
+	xe_bo_unpin_external(bo);
+	xe_bo_unlock(bo);
+
+	spin_lock(&xe->pinned.lock);
+	/* dmabuf_used must be back to what it was before the pin */
+	KUNIT_EXPECT_EQ(test, mgr->pin.dmabuf_used,
+			mgr->pin.dmabuf_limit - SZ_64K);
+	mgr->pin.dmabuf_limit = orig_limit;
+	spin_unlock(&xe->pinned.lock);
+
+	xe_bo_put(bo);
+}
+
+static void xe_bo_pin_limit_reject_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_bo *bo;
+	u64 orig_limit;
+	int err;
+
+	guard(xe_pm_runtime)(xe);
+
+	mgr = pin_limit_get_mgr(xe, test);
+	if (!mgr)
+		return;
+
+	bo = pin_limit_bo_create(xe, test, SZ_64K);
+	if (IS_ERR(bo))
+		return;
+
+	spin_lock(&xe->pinned.lock);
+	orig_limit = mgr->pin.dmabuf_limit;
+	/* limit = current usage + less than one BO, forcing rejection */
+	mgr->pin.dmabuf_limit = mgr->pin.dmabuf_used + SZ_4K;
+	spin_unlock(&xe->pinned.lock);
+
+	xe_bo_lock(bo, false);
+	err = xe_bo_pin_external(bo, false, XE_VALIDATION_OPT_OUT);
+	xe_bo_unlock(bo);
+	KUNIT_EXPECT_EQ(test, err, -ENOSPC);
+
+	spin_lock(&xe->pinned.lock);
+	/* dmabuf_used must be unchanged — no partial charge on rejection */
+	KUNIT_EXPECT_EQ(test, mgr->pin.dmabuf_used,
+			mgr->pin.dmabuf_limit - SZ_4K);
+	mgr->pin.dmabuf_limit = orig_limit;
+	spin_unlock(&xe->pinned.lock);
+
+	xe_bo_put(bo);
+}
+
+static void xe_bo_pin_limit_unpin_restores_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_bo *bo_a, *bo_b;
+	u64 orig_limit;
+	int err;
+
+	guard(xe_pm_runtime)(xe);
+
+	mgr = pin_limit_get_mgr(xe, test);
+	if (!mgr)
+		return;
+
+	bo_a = pin_limit_bo_create(xe, test, SZ_64K);
+	if (IS_ERR(bo_a))
+		return;
+
+	bo_b = pin_limit_bo_create(xe, test, SZ_64K);
+	if (IS_ERR(bo_b)) {
+		xe_bo_put(bo_a);
+		return;
+	}
+
+	spin_lock(&xe->pinned.lock);
+	orig_limit = mgr->pin.dmabuf_limit;
+	/* limit = current usage + exactly one BO */
+	mgr->pin.dmabuf_limit = mgr->pin.dmabuf_used + SZ_64K;
+	spin_unlock(&xe->pinned.lock);
+
+	xe_bo_lock(bo_a, false);
+	err = xe_bo_pin_external(bo_a, false, XE_VALIDATION_OPT_OUT);
+	xe_bo_unlock(bo_a);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	if (err)
+		goto out;
+
+	/* Second pin must be rejected while first is held. */
+	xe_bo_lock(bo_b, false);
+	err = xe_bo_pin_external(bo_b, false, XE_VALIDATION_OPT_OUT);
+	xe_bo_unlock(bo_b);
+	KUNIT_EXPECT_EQ(test, err, -ENOSPC);
+
+	xe_bo_lock(bo_a, false);
+	xe_bo_unpin_external(bo_a);
+	xe_bo_unlock(bo_a);
+
+	/* After unpin, the second BO must fit. */
+	xe_bo_lock(bo_b, false);
+	err = xe_bo_pin_external(bo_b, false, XE_VALIDATION_OPT_OUT);
+	xe_bo_unlock(bo_b);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	xe_bo_lock(bo_b, false);
+	xe_bo_unpin_external(bo_b);
+	xe_bo_unlock(bo_b);
+
+out:
+	spin_lock(&xe->pinned.lock);
+	mgr->pin.dmabuf_limit = orig_limit;
+	spin_unlock(&xe->pinned.lock);
+
+	xe_bo_put(bo_b);
+	xe_bo_put(bo_a);
+}
+
+static void xe_bo_pin_limit_zero_unlimited_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_bo *bo;
+	u64 orig_limit;
+	int err;
+
+	guard(xe_pm_runtime)(xe);
+
+	mgr = pin_limit_get_mgr(xe, test);
+	if (!mgr)
+		return;
+
+	/* BO is 2x SZ_64K so it would fail if limit were SZ_64K */
+	bo = pin_limit_bo_create(xe, test, 2 * SZ_64K);
+	if (IS_ERR(bo))
+		return;
+
+	spin_lock(&xe->pinned.lock);
+	orig_limit = mgr->pin.dmabuf_limit;
+	/* limit = current usage + one BO; 2*SZ_64K BO will be rejected */
+	mgr->pin.dmabuf_limit = mgr->pin.dmabuf_used + SZ_64K;
+	spin_unlock(&xe->pinned.lock);
+
+	/* Confirm this size is rejected when a limit is set. */
+	xe_bo_lock(bo, false);
+	err = xe_bo_pin_external(bo, false, XE_VALIDATION_OPT_OUT);
+	xe_bo_unlock(bo);
+	KUNIT_EXPECT_EQ(test, err, -ENOSPC);
+
+	spin_lock(&xe->pinned.lock);
+	mgr->pin.dmabuf_limit = 0; /* now disable limit */
+	spin_unlock(&xe->pinned.lock);
+
+	/* Same BO must succeed once limit is cleared. */
+	xe_bo_lock(bo, false);
+	err = xe_bo_pin_external(bo, false, XE_VALIDATION_OPT_OUT);
+	xe_bo_unlock(bo);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	xe_bo_lock(bo, false);
+	xe_bo_unpin_external(bo);
+	xe_bo_unlock(bo);
+
+	spin_lock(&xe->pinned.lock);
+	mgr->pin.dmabuf_limit = orig_limit;
+	spin_unlock(&xe->pinned.lock);
+
+	xe_bo_put(bo);
+}
+
 static struct kunit_case xe_bo_tests[] = {
 	KUNIT_CASE_PARAM(xe_ccs_migrate_kunit, xe_pci_live_device_gen_param),
 	KUNIT_CASE_PARAM(xe_bo_evict_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_pin_limit_under_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_pin_limit_reject_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_pin_limit_unpin_restores_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_bo_pin_limit_zero_unlimited_kunit, xe_pci_live_device_gen_param),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 0be8440b3976..f97dd9516b81 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -13,6 +13,7 @@
 
 #include "xe_pci.h"
 #include "xe_pm.h"
+#include "xe_ttm_vram_mgr.h"
 
 static bool p2p_enabled(struct dma_buf_test_params *params)
 {
@@ -285,8 +286,103 @@ static void xe_dma_buf_kunit(struct kunit *test)
 	dma_buf_run_device(xe);
 }
 
+static void xe_dma_buf_pin_limit_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct ttm_resource_manager *man;
+	struct xe_ttm_vram_mgr *mgr;
+	/* dynamic importer + force_different_devices required for dma_buf_pin */
+	struct dma_buf_test_params p = {
+		.base.id = XE_TEST_LIVE_DMA_BUF,
+		.mem_mask = XE_BO_FLAG_VRAM0,
+		.attach_ops = &xe_dma_buf_attach_ops,
+		.force_different_devices = true,
+	};
+	struct drm_gem_object *import;
+	struct dma_buf_attachment *attach;
+	struct dma_buf *dmabuf;
+	struct xe_bo *bo;
+	u64 orig_limit;
+	int err;
+
+	guard(xe_pm_runtime)(xe);
+
+	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
+	if (!man) {
+		kunit_skip(test, "no VRAM\n");
+		return;
+	}
+	mgr = to_xe_ttm_vram_mgr(man);
+
+	test->priv = &p;
+	bo = xe_bo_create_user(xe, NULL, SZ_64K,
+			       DRM_XE_GEM_CPU_CACHING_WC,
+			       XE_BO_FLAG_VRAM0, NULL);
+	if (IS_ERR(bo)) {
+		KUNIT_FAIL(test, "bo create err=%pe\n", bo);
+		return;
+	}
+
+	dmabuf = xe_gem_prime_export(&bo->ttm.base, 0);
+	if (IS_ERR(dmabuf)) {
+		KUNIT_FAIL(test, "export err=%pe\n", dmabuf);
+		goto put_bo;
+	}
+	bo->ttm.base.dma_buf = dmabuf;
+
+	import = xe_gem_prime_import(&xe->drm, dmabuf);
+	if (IS_ERR(import)) {
+		KUNIT_FAIL(test, "import err=%pe\n", import);
+		goto put_dmabuf;
+	}
+
+	attach = list_first_entry_or_null(&dmabuf->attachments,
+					  typeof(*attach), node);
+	if (!attach) {
+		KUNIT_FAIL(test, "no attachment\n");
+		goto put_import;
+	}
+
+	/* dma_buf_pin requires dmabuf->resv to be held */
+	xe_bo_lock(bo, false);
+
+	/* Force reject: limit = current used + less than one BO */
+	spin_lock(&xe->pinned.lock);
+	orig_limit = mgr->pin.dmabuf_limit;
+	mgr->pin.dmabuf_limit = mgr->pin.dmabuf_used + SZ_4K;
+	spin_unlock(&xe->pinned.lock);
+
+	err = dma_buf_pin(attach);
+	KUNIT_EXPECT_EQ(test, err, -ENOSPC);
+
+	/* Lift limit: pin must succeed */
+	spin_lock(&xe->pinned.lock);
+	mgr->pin.dmabuf_limit = 0;
+	spin_unlock(&xe->pinned.lock);
+
+	err = dma_buf_pin(attach);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	if (!err)
+		dma_buf_unpin(attach);
+
+	xe_bo_unlock(bo);
+
+	spin_lock(&xe->pinned.lock);
+	mgr->pin.dmabuf_limit = orig_limit;
+	spin_unlock(&xe->pinned.lock);
+
+put_import:
+	drm_gem_object_put(import);
+put_dmabuf:
+	bo->ttm.base.dma_buf = NULL;
+	dma_buf_put(dmabuf);
+put_bo:
+	xe_bo_put(bo);
+}
+
 static struct kunit_case xe_dma_buf_tests[] = {
 	KUNIT_CASE_PARAM(xe_dma_buf_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_dma_buf_pin_limit_kunit, xe_pci_live_device_gen_param),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dde309821237..070acb3e4c20 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -31,6 +31,7 @@
 #include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
+#include "xe_printk.h"
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
@@ -38,6 +39,7 @@
 #include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 #include "xe_vram_types.h"
 
@@ -3119,6 +3121,16 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 	return 0;
 }
 
+static struct xe_ttm_vram_mgr *xe_bo_pin_vram_mgr(struct xe_bo *bo)
+{
+	struct ttm_resource *res = bo->ttm.resource;
+
+	if (!res || !mem_type_is_vram(res->mem_type))
+		return NULL;
+
+	return to_xe_ttm_vram_mgr(ttm_manager_type(bo->ttm.bdev, res->mem_type));
+}
+
 /**
  * xe_bo_pin_external - pin an external BO
  * @bo: buffer object to be pinned
@@ -3134,6 +3146,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 int xe_bo_pin_external(struct xe_bo *bo, bool in_place, struct drm_exec *exec)
 {
 	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ttm_vram_mgr *mgr;
+	u64 size = xe_bo_size(bo);
 	int err;
 
 	xe_assert(xe, !bo->vm);
@@ -3145,11 +3159,42 @@ int xe_bo_pin_external(struct xe_bo *bo, bool in_place, struct drm_exec *exec)
 			if (err)
 				return err;
 		}
+	}
 
-		spin_lock(&xe->pinned.lock);
-		list_add_tail(&bo->pinned_link, &xe->pinned.late.external);
-		spin_unlock(&xe->pinned.lock);
+	mgr = xe_bo_pin_vram_mgr(bo);
+	spin_lock(&xe->pinned.lock);
+
+	if (bo->dmabuf_pin_count++ == 0) {
+		if (mgr && mgr->pin.dmabuf_limit &&
+		    mgr->pin.dmabuf_used + size > mgr->pin.dmabuf_limit) {
+			u64 used = mgr->pin.dmabuf_used;
+			u64 limit = mgr->pin.dmabuf_limit;
+
+			bo->dmabuf_pin_count--;
+			spin_unlock(&xe->pinned.lock);
+			xe_err_ratelimited(xe,
+					   "dma-buf VRAM pin limit reached (used %lluM, limit %lluM), rejecting with -ENOSPC\n",
+					   used >> 20, limit >> 20);
+			/*
+			 * No SMEM fallback: non-P2P callers migrate to TT before
+			 * reaching here; a VRAM mgr means VRAM is genuinely required.
+			 */
+			return -ENOSPC;
+		}
+
+		if (mgr) {
+			mgr->pin.dmabuf_used += size;
+			mgr->pin.total_used += size;
+		}
 	}
+	if (!xe_bo_is_pinned(bo))
+		list_add_tail(&bo->pinned_link, &xe->pinned.late.external);
+	spin_unlock(&xe->pinned.lock);
+
+	if (!xe_bo_is_pinned(bo))
+		list_add_tail(&bo->pinned_link, &xe->pinned.late.external);
+
+	spin_unlock(&xe->pinned.lock);
 
 	ttm_bo_pin(&bo->ttm);
 	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
@@ -3201,7 +3246,11 @@ int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
 		return err;
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
+		struct xe_ttm_vram_mgr *mgr = xe_bo_pin_vram_mgr(bo);
+
 		spin_lock(&xe->pinned.lock);
+		if (mgr)
+			mgr->pin.total_used += xe_bo_size(bo);
 		if (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)
 			list_add_tail(&bo->pinned_link, &xe->pinned.late.kernel_bo_present);
 		else
@@ -3235,14 +3284,23 @@ int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
 void xe_bo_unpin_external(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ttm_vram_mgr *mgr = xe_bo_pin_vram_mgr(bo);
+	u64 size = xe_bo_size(bo);
 
 	xe_assert(xe, !bo->vm);
 	xe_assert(xe, xe_bo_is_pinned(bo));
 	xe_assert(xe, xe_bo_is_user(bo));
 
 	spin_lock(&xe->pinned.lock);
-	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link))
-		list_del_init(&bo->pinned_link);
+	/* display may hold a concurrent pin; use dmabuf_pin_count not ttm pin_count */
+	if (--bo->dmabuf_pin_count == 0) {
+		if (mgr) {
+			mgr->pin.dmabuf_used -= size;
+			mgr->pin.total_used -= size;
+		}
+		if (!list_empty(&bo->pinned_link))
+			list_del_init(&bo->pinned_link);
+	}
 	spin_unlock(&xe->pinned.lock);
 
 	ttm_bo_unpin(&bo->ttm);
@@ -3265,7 +3323,11 @@ void xe_bo_unpin(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_pinned(bo));
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
+		struct xe_ttm_vram_mgr *mgr = xe_bo_pin_vram_mgr(bo);
+
 		spin_lock(&xe->pinned.lock);
+		if (mgr)
+			mgr->pin.total_used -= xe_bo_size(bo);
 		xe_assert(xe, !list_empty(&bo->pinned_link));
 		list_del_init(&bo->pinned_link);
 		spin_unlock(&xe->pinned.lock);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index e45f24301050..6a74a0aff594 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -90,6 +90,14 @@ struct xe_bo {
 	/** @ccs_cleared: true means that CCS region of BO is already cleared */
 	bool ccs_cleared;
 
+	/**
+	 * @dmabuf_pin_count: number of active dma-buf pins. 0->1 charges the
+	 * VRAM limit and adds to the restore list; N->0 uncharges and removes.
+	 * Independent of ttm pin_count, which also counts display pins that
+	 * bypass xe_bo_pin_external.
+	 */
+	u32 dmabuf_pin_count;
+
 	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
 	struct xe_mem_pool_node *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index c8ae1d5f3d60..cb1b58e48484 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -22,5 +22,6 @@
 #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
 #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
 #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
+#define XE_DEFAULT_PIN_VRAM_PERCENT		50
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index bf0728838ead..b9d00aff0a9b 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -80,10 +80,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		}
 	}
 
-	ret = xe_bo_pin_external(bo, !allow_vram, exec);
-	xe_assert(xe, !ret);
-
-	return 0;
+	return xe_bo_pin_external(bo, !allow_vram, exec);
 }
 
 static void xe_dma_buf_unpin(struct dma_buf_attachment *attach)
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 848d65265443..296a1466ae95 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -30,6 +30,7 @@ struct xe_modparam xe_modparam = {
 #endif
 	.wedged_mode =		XE_DEFAULT_WEDGED_MODE,
 	.svm_notifier_size =	XE_DEFAULT_SVM_NOTIFIER_SIZE,
+	.pin_vram_percent =	XE_DEFAULT_PIN_VRAM_PERCENT,
 	/* the rest are 0 by default */
 };
 
@@ -37,6 +38,10 @@ module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600)
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, must be power of 2 "
 		 "[default=" __stringify(XE_DEFAULT_SVM_NOTIFIER_SIZE) "]");
 
+module_param_named(pin_vram_percent, xe_modparam.pin_vram_percent, uint, 0600);
+MODULE_PARM_DESC(pin_vram_percent, "Max percent of VRAM pinnable via dma-buf per region (0=unlimited) "
+		 "[default=" __stringify(XE_DEFAULT_PIN_VRAM_PERCENT) "]");
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index a0eb7db07770..716f92944dbb 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -24,6 +24,7 @@ struct xe_modparam {
 #endif
 	unsigned int wedged_mode;
 	u32 svm_notifier_size;
+	unsigned int pin_vram_percent;
 };
 
 extern struct xe_modparam xe_modparam;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index b518f7dec680..9e2ce93ccd06 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -8,11 +8,14 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_buddy.h>
 
+#include <linux/math64.h>
+
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_module.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
@@ -190,8 +193,17 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
+	struct xe_device *xe = ttm_to_xe_device(man->bdev);
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct gpu_buddy *mm = &mgr->mm;
+	u64 dmabuf_used, dmabuf_limit, total_used;
+
+	/* snapshot pin counters under their own lock before sleeping on mgr->lock */
+	spin_lock(&xe->pinned.lock);
+	dmabuf_used  = mgr->pin.dmabuf_used;
+	dmabuf_limit = mgr->pin.dmabuf_limit;
+	total_used   = mgr->pin.total_used;
+	spin_unlock(&xe->pinned.lock);
 
 	mutex_lock(&mgr->lock);
 	drm_printf(printer, "default_page_size: %lluKiB\n",
@@ -200,6 +212,12 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
 		   (u64)mgr->visible_avail >> 20);
 	drm_printf(printer, "visible_size: %lluMiB\n",
 		   (u64)mgr->visible_size >> 20);
+	drm_printf(printer, "pin_dmabuf_used: %lluMiB\n",
+		   dmabuf_used >> 20);
+	drm_printf(printer, "pin_dmabuf_limit: %lluMiB\n",
+		   dmabuf_limit >> 20);
+	drm_printf(printer, "pin_total_used: %lluMiB\n",
+		   total_used >> 20);
 
 	drm_buddy_print(mm, printer);
 	mutex_unlock(&mgr->lock);
@@ -309,6 +327,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 
 	man->func = &xe_ttm_vram_mgr_func;
 	mgr->mem_type = mem_type;
+	if (xe_modparam.pin_vram_percent)
+		mgr->pin.dmabuf_limit =
+			mul_u64_u32_div(size, xe_modparam.pin_vram_percent, 100);
 	err = drmm_mutex_init(&xe->drm, &mgr->lock);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 9106da056b49..459e3135b26c 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -29,6 +29,15 @@ struct xe_ttm_vram_mgr {
 	struct mutex lock;
 	/** @mem_type: The TTM memory type */
 	u32 mem_type;
+	/** @pin: pinned VRAM accounting in bytes, protected by xe->pinned.lock */
+	struct {
+		/** @pin.dmabuf_limit: max bytes pinnable via dma-buf, 0 = unlimited */
+		u64 dmabuf_limit;
+		/** @pin.dmabuf_used: bytes currently pinned via dma-buf */
+		u64 dmabuf_used;
+		/** @pin.total_used: bytes currently pinned via any path */
+		u64 total_used;
+	} pin;
 };
 
 /**
-- 
2.43.0

