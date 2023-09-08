Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD9EEE57EC
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 09:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37AB10E898;
	Fri,  8 Sep 2023 09:17:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3DA10E896
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 09:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694164667; x=1725700667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3XguiQOneaVj6eKqrbpfYo67znVrxq/10HZ2cxX9QWA=;
 b=hljB0f86N7mneddjTSj97NwDd5UoeEBa5IJDDfFTJylyoIWwbtpWih6M
 iNzfJp/Krzf99jGSusOVQ1+euS3ZLsHbtWGq8LSlKF0JSvXuFIfk2M2ZU
 vA+E5Hwt27Els2xrZPeU6e26XjMQooDZcoeUD6m6astaP1JLJ6MQIch7R
 HEHvCwksx3LdU5YBZtdvo1hpv+uLZALOP8KsytIOzu2SNNURIVC9hYqB9
 XFnlB8U+1mKDzhzdPrpBromVgtLfPAJ0JaFokMJxsWu8LklPgUd1USdsQ
 rK0Het3XlbvgK6vHz1JaxKNme4XmsNK5tnlPWGr9XHJHDuSvmkEPiaERf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381416679"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="381416679"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 02:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857329197"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857329197"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 02:17:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 11:17:16 +0200
Message-ID: <20230908091716.36984-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908091716.36984-1-thomas.hellstrom@linux.intel.com>
References: <20230908091716.36984-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 6/6] drm/xe: Convert remaining instances of
 ttm_eu_reserve_buffers to drm_exec
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

The VM_BIND functionality and vma destruction was locking
potentially multiple dma_resv objects using the
ttm_eu_reserve_buffers() function. Rework those to use the drm_exec
helper, taking care that any calls to xe_bo_validate() ends up
inside an unsealed locking transaction.

v4:
- Remove an unbalanced xe_bo_put() (igt and Matthew Brost)
v5:
- Rebase conflict

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 94 +++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9534b6c0abec..a6a0f17fec1d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1113,29 +1113,20 @@ int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
-	struct ttm_validate_buffer tv[2];
-	struct ww_acquire_ctx ww;
-	struct xe_bo *bo = xe_vma_bo(vma);
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
+	struct drm_exec exec;
 	int err;
 
-	memset(tv, 0, sizeof(tv));
-	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
-	list_add(&tv[0].head, &objs);
-
-	if (bo) {
-		tv[1].bo = &xe_bo_get(bo)->ttm;
-		list_add(&tv[1].head, &objs);
+	drm_exec_init(&exec, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = xe_vm_prepare_vma(&exec, vma, 0);
+		drm_exec_retry_on_contention(&exec);
+		if (XE_WARN_ON(err))
+			break;
 	}
-	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
-	XE_WARN_ON(err);
 
 	xe_vma_destroy(vma, NULL);
 
-	ttm_eu_backoff_reservation(&ww, &objs);
-	if (bo)
-		xe_bo_put(bo);
+	drm_exec_fini(&exec);
 }
 
 struct xe_vma *
@@ -2149,12 +2140,6 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 	return &vm->pt_root[idx]->bo->ttm;
 }
 
-static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
-{
-	tv->num_shared = 1;
-	tv->bo = xe_vm_ttm_bo(vm);
-}
-
 static void vm_set_async_error(struct xe_vm *vm, int err)
 {
 	lockdep_assert_held(&vm->lock);
@@ -2659,42 +2644,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	return err;
 }
 
-static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
-			       struct xe_vma_op *op)
+static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
+		      struct xe_vma *vma, struct xe_vma_op *op)
 {
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
-	struct xe_bo *vbo;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	xe_vm_tv_populate(vm, &tv_vm);
-	list_add_tail(&tv_vm.head, &objs);
-	vbo = xe_vma_bo(vma);
-	if (vbo) {
-		/*
-		 * An unbind can drop the last reference to the BO and
-		 * the BO is needed for ttm_eu_backoff_reservation so
-		 * take a reference here.
-		 */
-		xe_bo_get(vbo);
-
-		if (!vbo->vm) {
-			tv_bo.bo = &vbo->ttm;
-			tv_bo.num_shared = 1;
-			list_add(&tv_bo.head, &objs);
-		}
-	}
-
-again:
-	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
-	if (err) {
-		xe_bo_put(vbo);
+	err = xe_vm_prepare_vma(exec, vma, 1);
+	if (err)
 		return err;
-	}
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -2773,17 +2732,36 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 		XE_WARN_ON("NOT POSSIBLE");
 	}
 
-	ttm_eu_backoff_reservation(&ww, &objs);
+	if (err)
+		trace_xe_vma_fail(vma);
+
+	return err;
+}
+
+static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
+			       struct xe_vma_op *op)
+{
+	struct drm_exec exec;
+	int err;
+
+retry_userptr:
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec) {
+		err = op_execute(&exec, vm, vma, op);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			break;
+	}
+	drm_exec_fini(&exec);
+
 	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
 		lockdep_assert_held_write(&vm->lock);
 		err = xe_vma_userptr_pin_pages(vma);
 		if (!err)
-			goto again;
-	}
-	xe_bo_put(vbo);
+			goto retry_userptr;
 
-	if (err)
 		trace_xe_vma_fail(vma);
+	}
 
 	return err;
 }
-- 
2.41.0

