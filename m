Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40CDC25B5C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 04:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50C811A0EB;
	Thu, 25 Apr 2024 04:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fI8dG1h9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6961411A0E5
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 04:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714020884; x=1745556884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9mKOLIbdT64RDD6m5wrPv0saYrtf2Czm7GGeKpQHb2o=;
 b=fI8dG1h9RZcBfZWsQ5QcSrrKo/kbnfSg2FYF6VQdjEzeR/L7kGxc5kgr
 y9jv1scjJV0cgx0qvj/Tc79dqplz/wy4EAZNLFCPmFHuZsWn8wlR53/EF
 vBtvAwueeX6q+g/TKfTSnkKPNnJ+cIV2zrCEkkJBRjlkQrTp8YT/tgfx9
 7EOV30NsMV5HgYgt4DT4GoJ87mxJ6STwZE0vjmyhxVyfJa2P1qdds5FTH
 KZoJPVYmZLw+ibxg04koTlDIy7snHju94KqL40A5I4hbxsqm3t/CFn0th
 bckmdhv6KLXhPpOkyQx03BG6mqF3WREgJ9MUta9eSjGAxNLbvpnH7fa0p w==;
X-CSE-ConnectionGUID: obF8zKlrTb2qVtvO7vlmnQ==
X-CSE-MsgGUID: k13wx+D0Tz6Pxqr+THEjSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20374881"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20374881"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:44 -0700
X-CSE-ConnectionGUID: bd7lbL05SK6YM517iOiQPQ==
X-CSE-MsgGUID: r8YCDpHVSTyFJULAFy3tiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24996507"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 11/13] drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
Date: Wed, 24 Apr 2024 21:55:11 -0700
Message-Id: <20240425045513.1913039-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425045513.1913039-1-matthew.brost@intel.com>
References: <20240425045513.1913039-1-matthew.brost@intel.com>
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

Rather than adding a ufence to a VMA in the bind function, add the
ufence to all VMAs in the IOCTL that require binds in
vm_bind_ioctl_ops_fini. This help withs the transition to job 1 per VM
bind IOCTL.

v2:
 - Rebase
v3:
 - Fix typo in commit (Oak)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 15 ++++++++++++
 drivers/gpu/drm/xe/xe_sync.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c   | 44 ++++++++++++++++++++++++++++++------
 3 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 65f1f1628235..2883d9aca404 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -338,6 +338,21 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 	return ERR_PTR(-ENOMEM);
 }
 
+/**
+ * __xe_sync_ufence_get() - Get user fence from user fence
+ * @ufence: input user fence
+ *
+ * Get a user fence reference from user fence
+ *
+ * Return: xe_user_fence pointer with reference
+ */
+struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence)
+{
+	user_fence_get(ufence);
+
+	return ufence;
+}
+
 /**
  * xe_sync_ufence_get() - Get user fence from sync
  * @sync: input sync
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 3e03396af2c6..006dbf780793 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -37,6 +37,7 @@ static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
 	return !!sync->ufence;
 }
 
+struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
 struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
 void xe_sync_ufence_put(struct xe_user_fence *ufence);
 int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3d642bc3cb28..4ab234bba70a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1782,17 +1782,10 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-	struct xe_user_fence *ufence;
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(bo);
 
-	ufence = find_ufence_get(syncs, num_syncs);
-	if (vma->ufence && ufence)
-		xe_sync_ufence_put(vma->ufence);
-
-	vma->ufence = ufence ?: vma->ufence;
-
 	if (immediate) {
 		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
 				       first_op, last_op);
@@ -2801,20 +2794,57 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	return fence;
 }
 
+static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence *ufence)
+{
+	if (vma->ufence)
+		xe_sync_ufence_put(vma->ufence);
+	vma->ufence = __xe_sync_ufence_get(ufence);
+}
+
+static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
+			  struct xe_user_fence *ufence)
+{
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		vma_add_ufence(op->map.vma, ufence);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.prev)
+			vma_add_ufence(op->remap.prev, ufence);
+		if (op->remap.next)
+			vma_add_ufence(op->remap.next, ufence);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va), ufence);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+}
+
 static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 				   struct dma_fence *fence)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
+	struct xe_user_fence *ufence;
 	struct xe_vma_op *op;
 	int i;
 
+	ufence = find_ufence_get(vops->syncs, vops->num_syncs);
 	list_for_each_entry(op, &vops->list, link) {
+		if (ufence)
+			op_add_ufence(vm, op, ufence);
+
 		if (op->base.op == DRM_GPUVA_OP_UNMAP)
 			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), fence);
 		else if (op->base.op == DRM_GPUVA_OP_REMAP)
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va),
 				       fence);
 	}
+	if (ufence)
+		xe_sync_ufence_put(ufence);
 	for (i = 0; i < vops->num_syncs; i++)
 		xe_sync_entry_signal(vops->syncs + i, fence);
 	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-- 
2.34.1

