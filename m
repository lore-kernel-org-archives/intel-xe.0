Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDA5C27C44
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA6C11224E;
	Tue, 28 May 2024 12:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ce8Nj1Wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962AD10E231
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716899653; x=1748435653;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GT0Bs4REaDXxQRwuGkJvmpu7uA5/luiPGGBoojlJ/fs=;
 b=ce8Nj1WfIboJgJTyVBqXTd1AnRn1XbRcbskuuWOuuK7fYoIN06Eyavcg
 4R+Xd6VgZVgc5wtSfVqb/aA2MljIfBs/sWOVtLzv9ZXa6jZHHbyspV+k1
 ixukgq2ZBAM2gU3ynm0hUhDJF3G1mLTLERQd8ogDKd6uW00C282lpRbk6
 t1cWI6Dq24sZ2kGn3aZ9TW/4r+NTFWfQiAhrtEjXcXVhvS/ZB1DAqTO2X
 gfnO4gohC/YElhOeJPhG5EAtUVNF+KaG5yYkMj4spLp2ys++017jo3xKN
 c49t/VTydR8Vlu5gcoRH9Nnta2aqMiqliyVGaK09ORb2MlXMDvuRoEjAz A==;
X-CSE-ConnectionGUID: ujWjO+8DSd2OGC20cr32Pw==
X-CSE-MsgGUID: FsLE8zh5Tky+fK85iRdQmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13065055"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13065055"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:13 -0700
X-CSE-ConnectionGUID: Z+iDH8beSJuRJNCNH4OiLw==
X-CSE-MsgGUID: PKpisKtLRjSu5K18CiZ/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39880492"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 20/22] drm/xe: Initial support for drm exec locking during
 validate
Date: Tue, 28 May 2024 14:33:41 +0200
Message-ID: <20240528123343.169970-21-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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

Initial stab at converting xe_bo validation to drm_exec locking
where it matters most. (Low hanging fruit). For a couple of call
sites as well as for bo allocation, the passing down the call
chaing of the drm_exec object may turn out a bit tricky.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c       | 6 +++---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c  | 4 ++--
 drivers/gpu/drm/xe/tests/xe_migrate.c  | 2 +-
 drivers/gpu/drm/xe/xe_bo.c             | 8 +++++---
 drivers/gpu/drm/xe/xe_bo.h             | 4 +++-
 drivers/gpu/drm/xe/xe_dma_buf.c        | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c           | 2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c   | 2 +-
 drivers/gpu/drm/xe/xe_vm.c             | 4 ++--
 10 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 36e15c4961c1..85f37dd7ecb1 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -289,7 +289,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (IS_DGFX(xe))
 		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
 	else
-		ret = xe_bo_validate(bo, NULL, true);
+		ret = xe_bo_validate(bo, NULL, true, NULL);
 	if (!ret)
 		ttm_bo_pin(&bo->ttm);
 	ttm_bo_unreserve(&bo->ttm);
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 7576d362020f..410579f75a39 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -30,7 +30,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	u32 offset;
 
 	/* Move bo to VRAM if not already there. */
-	ret = xe_bo_validate(bo, NULL, false);
+	ret = xe_bo_validate(bo, NULL, false, NULL);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate bo.\n");
 		return ret;
@@ -276,7 +276,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		if (i) {
 			down_read(&vm->lock);
 			xe_vm_lock(vm, false);
-			err = xe_bo_validate(bo, bo->vm, false);
+			err = xe_bo_validate(bo, bo->vm, false, NULL);
 			xe_vm_unlock(vm);
 			up_read(&vm->lock);
 			if (err) {
@@ -285,7 +285,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 				goto cleanup_all;
 			}
 			xe_bo_lock(external, false);
-			err = xe_bo_validate(external, NULL, false);
+			err = xe_bo_validate(external, NULL, false, NULL);
 			xe_bo_unlock(external);
 			if (err) {
 				KUNIT_FAIL(test, "external bo valid err=%pe\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index e7f9b531c465..ef88b4dd184c 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -81,7 +81,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	}
 
 	/* Re-validate the importer. This should move also exporter in. */
-	ret = xe_bo_validate(imported, NULL, false);
+	ret = xe_bo_validate(imported, NULL, false, NULL);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			KUNIT_FAIL(test, "Validating importer failed with err=%d.\n",
@@ -157,7 +157,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 
 			/* Is everything where we expect it to be? */
 			xe_bo_lock(import_bo, false);
-			err = xe_bo_validate(import_bo, NULL, false);
+			err = xe_bo_validate(import_bo, NULL, false, NULL);
 
 			/* Pinning in VRAM is not allowed. */
 			if (!is_dynamic(params) &&
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 962f6438e219..572ea9630303 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -90,7 +90,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 		return;
 	}
 
-	err = xe_bo_validate(remote, NULL, false);
+	err = xe_bo_validate(remote, NULL, false, NULL);
 	if (err) {
 		KUNIT_FAIL(test, "Failed to validate system bo for %s: %i\n",
 			   str, err);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b84acf6c46da..9e2adaaae245 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1755,7 +1755,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_user(bo));
 
 	if (!xe_bo_is_pinned(bo)) {
-		err = xe_bo_validate(bo, NULL, false);
+		err = xe_bo_validate(bo, NULL, false, NULL);
 		if (err)
 			return err;
 
@@ -1801,7 +1801,7 @@ int xe_bo_pin(struct xe_bo *bo)
 	/* We only expect at most 1 pin */
 	xe_assert(xe, !xe_bo_is_pinned(bo));
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, NULL, false, NULL);
 	if (err)
 		return err;
 
@@ -1917,11 +1917,13 @@ void xe_bo_unpin(struct xe_bo *bo)
  * Return: 0 on success, negative error code on failure. May return
  * -EINTR or -ERESTARTSYS if internal waits are interrupted by a signal.
  */
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
+		   struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
+		.exec = exec,
 	};
 
 	if (vm) {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 220e71086e65..a6ddaff8ce74 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -62,6 +62,7 @@
 
 #define XE_BO_PROPS_INVALID	(-1)
 
+struct drm_exec;
 struct sg_table;
 struct xe_ttm_lru_walk;
 
@@ -164,7 +165,8 @@ int xe_bo_pin_external(struct xe_bo *bo);
 int xe_bo_pin(struct xe_bo *bo);
 void xe_bo_unpin_external(struct xe_bo *bo);
 void xe_bo_unpin(struct xe_bo *bo);
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict);
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
+		   struct drm_exec *exec);
 
 static inline bool xe_bo_is_pinned(struct xe_bo *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 68f309f5e981..ce84aa70cca8 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -102,7 +102,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 		if (!attach->peer2peer)
 			r = xe_bo_migrate(bo, XE_PL_TT);
 		else
-			r = xe_bo_validate(bo, NULL, false);
+			r = xe_bo_validate(bo, NULL, false, NULL);
 		if (r)
 			return ERR_PTR(r);
 	}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index b01a670fecb8..629cef7e3ba7 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -413,7 +413,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		return 0;
 	}
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, NULL, false, NULL);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 040dd142c49c..2493f7a39858 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -117,7 +117,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 			return err;
 	} else if (bo) {
 		/* Create backing store if needed */
-		err = xe_bo_validate(bo, vm, true);
+		err = xe_bo_validate(bo, vm, true, NULL);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ca564ada34fa..5ec8bfaac5ed 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -380,7 +380,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
 			       &vm->rebind_list);
 
-	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
+	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false, exec);
 	if (ret)
 		return ret;
 
@@ -2704,7 +2704,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
-			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+			err = xe_bo_validate(bo, xe_vma_vm(vma), true, exec);
 	}
 
 	return err;
-- 
2.44.0

