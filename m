Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF181C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 03:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DE710E3D0;
	Tue, 23 May 2023 03:58:54 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062A410E3CF
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 03:58:52 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64d2b42a8f9so3826837b3a.3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684814332; x=1687406332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZvp/JvB1DH05GVF0tACF7TB2poMZCFTFWgS3RKs1Mc=;
 b=sJa/+sMkqppjjp36BM06wrgdHTK7s2i0BOOS6d0wksNHwN+qV6RU30xI1axYUSD4nd
 HmHzdVkLVtIGgp1Mt+rKOAS0tKJEk7o4b8NN7sKOwAx9Wu5G96ruHNG7VbPDn8DVhiA0
 dzwyz9CSRtUdAKuZVwF6809byb9UyRc9UUWFHc4Cxm5pU0n/Mm13bUQsYMFwt6JqzM0E
 28g/yCzeEmNP8+hKkvU6f4wZt72yotNiliWzJYGUvg3vIy2fW2r/hpkZmLVA+/SsskoM
 6WtE197vQBlo5cpbyvGifvL00snkUuAPSVrZNHE8od1dD/ndVLg+wzs6ptMb/BU/eQT4
 obiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684814332; x=1687406332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZvp/JvB1DH05GVF0tACF7TB2poMZCFTFWgS3RKs1Mc=;
 b=GknIBWFdAMo9HPdIXI5bioUhQ/NBXushGIUs6UUr3bprugTOIEJlsic1lGiWhvDX5H
 fqUnXQ4aNCudKOKqgz7q9qrfvptATuNss3EelkSaXiVUWlC6b4SQvGxVBgX3WpPOzY+M
 Oo29QO2hPvRPk1heikE7TivIqrEUHR6OTIMas9c7QJe8qSzKhCyKvMxi4/I26lZMDaPu
 UMNk8nQNNweGsMW6MZ46BE1+Vs/W5CSnLxQqUu1DJjHooetzf8E8y4wySEZAzcLjvn1b
 CVfLERmk1u6nQ5sLswYXrcYJY9+CI7CuoU2kWGhcpsNR9InZ496K2XNV8fLbLcHUIgTq
 PU0Q==
X-Gm-Message-State: AC+VfDzwynkPaG4c97DJuE4HVTyJ2Jz4CGsqcMrvbhKT0w9gomnh0wYA
 9XqozegYDAVW8K6D69xpKK0CK8EZ1GbL3g==
X-Google-Smtp-Source: ACHHUZ6R4bi8a9zIR48TjT+G6nhK1dAtrz9BH0PzCB/DRvX1yyF0qRZhGPN3dZDDVPyIdm6pAe+e+A==
X-Received: by 2002:a05:6a00:1689:b0:643:b653:3aa with SMTP id
 k9-20020a056a00168900b00643b65303aamr20690976pfc.32.1684814332123; 
 Mon, 22 May 2023 20:58:52 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa78d86000000b006414289ab69sm4828615pfr.52.2023.05.22.20.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 20:58:51 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 20:58:08 -0700
Message-Id: <20230523035808.635175-9-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523035808.635175-1-kode54@gmail.com>
References: <20230523035808.635175-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 8/8] drm/xe: VM LRU bulk move
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

From: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
LRU position on every exec.

v2: Bulk move for compute VMs, use WARN rather than BUG

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
 drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
 drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
 drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
 6 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c82e995df779..e9bed2d8a19c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
 }
 
+static void xe_gem_object_close(struct drm_gem_object *obj,
+				struct drm_file *file_priv)
+{
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
+	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
+		struct ww_acquire_ctx ww;
+
+		XE_WARN_ON(!xe_bo_is_user(bo));
+
+		xe_bo_lock(bo, &ww, 0, false);
+		ttm_bo_set_bulk_move(&bo->ttm, NULL);
+		xe_bo_unlock(bo, &ww);
+	}
+}
+
+
 static bool should_migrate_to_system(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
@@ -1040,6 +1057,7 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
 
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
+	.close = xe_gem_object_close,
 	.mmap = drm_gem_ttm_mmap,
 	.export = xe_gem_prime_export,
 	.vm_ops = &xe_gem_vm_ops,
@@ -1081,8 +1099,8 @@ void xe_bo_free(struct xe_bo *bo)
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_gt *gt, struct dma_resv *resv,
-				    size_t size, enum ttm_bo_type type,
-				    u32 flags)
+				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    enum ttm_bo_type type, u32 flags)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1149,7 +1167,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		return ERR_PTR(err);
 
 	bo->created = true;
-	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	if (bulk)
+		ttm_bo_set_bulk_move(&bo->ttm, bulk);
+	else
+		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
 
 	return bo;
 }
@@ -1219,7 +1240,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		}
 	}
 
-	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
+	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
+				   vm && !xe_vm_in_fault_mode(vm) &&
+				   flags & XE_BO_CREATE_USER_BIT ?
+				   &vm->lru_bulk_move : NULL, size,
 				   type, flags);
 	if (IS_ERR(bo))
 		return bo;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7e111332c35a..f7562012b836 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_gt *gt, struct dma_resv *resv,
-				    size_t size, enum ttm_bo_type type,
-				    u32 flags);
+				    struct ttm_lru_bulk_move *bulk, size_t size,
+				    enum ttm_bo_type type, u32 flags);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_gt *gt, struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 9b252cc782b7..975dee1f770f 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 	int ret;
 
 	dma_resv_lock(resv, NULL);
-	bo = __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->size,
+	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
 				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
 	if (IS_ERR(bo)) {
 		ret = PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index ff4df00f20a2..b2dcf34af16b 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -395,6 +395,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
+	if (!err && !xe_vm_no_dma_fences(vm)) {
+		spin_lock(&xe->ttm.lru_lock);
+		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
+		spin_unlock(&xe->ttm.lru_lock);
+	}
+
 err_repin:
 	if (!xe_vm_no_dma_fences(vm))
 		up_read(&vm->userptr.notifier_lock);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0398da1ef1e2..a5d65d0325d6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -629,6 +629,10 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 #undef retry_required
 
+	spin_lock(&vm->xe->ttm.lru_lock);
+	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
+	spin_unlock(&vm->xe->ttm.lru_lock);
+
 	/* Point of no return. */
 	arm_preempt_fences(vm, &preempt_fences);
 	resume_and_reinstall_preempt_fences(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fada7896867f..d3e99f22510d 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -164,6 +164,9 @@ struct xe_vm {
 	/** Protects @rebind_list and the page-table structures */
 	struct dma_resv resv;
 
+	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
+	struct ttm_lru_bulk_move lru_bulk_move;
+
 	u64 size;
 	struct rb_root vmas;
 
-- 
2.40.1

