Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F9BC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B0C10E4BA;
	Tue,  7 Nov 2023 05:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5746D10E02D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334756; x=1730870756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0C/Rwn0x4X7C9SWo0ClBmWUkcN2usVuufK0miWFRXU=;
 b=mRvInC4IAChugR5T+JmkkxaADNa6EMpujyThXEFutrXRASp7vyMBle6T
 uLkxW7qBOMdUOTO+VovyOX1hincVmtkfwK9Umoa3PqMnLntG6WrKaYOdV
 n3yVsMsF4wiY+xjn3trz2Co38ORE73omDreahmdz0CMTvzlJaEEblEohQ
 FGlffEH8ScpWbCpq2FvcyOFc54+pNZJzg4vROFAkzsazieDroQaI6NMnD
 eh+RFZueeLlSUngAOfzv4SFZCKHkWFAyP1r+anSSd2hqHnHTdl9i2YPzM
 6gNBTWp59G2bLMKR/o8EIPYuwOWDOhwGa04trM2fufybR7rt/vyx513PZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769510"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769510"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689821"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689821"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:38 -0800
Message-Id: <20231107052603.124361-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/27] drm/xe: Allow num_batch_buffer == 0 in
 exec IOCTL
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

The idea being out-syncs can signal indicating all previous operations
on the exec queue are complete. An example use case of this would be
support for implementing vkQueueWaitForIdle easily.

v2: Don't add last_fence for VM's that do not support dma fences

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             | 22 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++--
 drivers/gpu/drm/xe/xe_sync.c             |  5 ++++-
 drivers/gpu/drm/xe/xe_sync.h             |  2 +-
 drivers/gpu/drm/xe/xe_vm.c               |  2 +-
 6 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 28e84a0bbeb0..4666f5b145f7 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -161,7 +161,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
+	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
+			 q->width != args->num_batch_buffer))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
@@ -182,12 +183,13 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (i = 0; i < args->num_syncs; i++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
 					  &syncs_user[i], true,
-					  xe_vm_no_dma_fences(vm));
+					  xe_vm_no_dma_fences(vm),
+					  !args->num_batch_buffer);
 		if (err)
 			goto err_syncs;
 	}
 
-	if (xe_exec_queue_is_parallel(q)) {
+	if (args->num_batch_buffer && xe_exec_queue_is_parallel(q)) {
 		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
 				       q->width);
 		if (err) {
@@ -234,6 +236,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
+	if (!args->num_batch_buffer) {
+		if (!xe_vm_no_dma_fences(vm)) {
+			struct dma_fence *fence =
+				xe_exec_queue_last_fence_get(q, vm);
+
+			for (i = 0; i < num_syncs; i++)
+				xe_sync_entry_signal(&syncs[i], NULL, fence);
+		}
+
+		goto err_exec;
+	}
+
 	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
 		err = -EWOULDBLOCK;
 		goto err_exec;
@@ -327,6 +341,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (xe_exec_queue_is_lr(q))
 		q->ring_ops->emit_job(job);
+	if (!xe_vm_no_dma_fences(vm))
+		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4fd44a9203e4..35710b66e5de 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -924,7 +924,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
-	lockdep_assert_held_write(&vm->lock);
+	if (q->flags & EXEC_QUEUE_FLAG_VM)
+		lockdep_assert_held_write(&vm->lock);
+	else
+		xe_vm_assert_held(vm);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ecd761177567..35ffe7c55f25 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -53,8 +53,9 @@ struct xe_exec_queue {
 	struct xe_hw_fence_irq *fence_irq;
 
 	/**
-	 * @last_fence: last fence on engine, protected by vm->lock in write
-	 * mode if bind engine
+	 * @last_fence: last fence on exec queue, protected by vm->lock in write
+	 * mode if bind exec queue, protected by dma resv lock if non-bind exec
+	 * queue
 	 */
 	struct dma_fence *last_fence;
 
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 73ef259aa387..2461e7d4814c 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -100,7 +100,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
-			bool exec, bool no_dma_fences)
+			bool exec, bool no_dma_fences, bool exec_nop)
 {
 	struct drm_xe_sync sync_in;
 	int err;
@@ -171,6 +171,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_USER_FENCE:
+		if (XE_IOCTL_DBG(xe, exec_nop))
+			return -EOPNOTSUPP;
+
 		if (XE_IOCTL_DBG(xe, !signal))
 			return -EOPNOTSUPP;
 
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 30958ddc4cdc..98f02bb34637 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -15,7 +15,7 @@ struct xe_sched_job;
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
-			bool exec, bool compute_mode);
+			bool exec, bool compute_mode, bool exec_nop);
 int xe_sync_entry_wait(struct xe_sync_entry *sync);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 403444ff3856..2f212939d2b5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3088,7 +3088,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs], false,
-					  xe_vm_no_dma_fences(vm));
+					  xe_vm_no_dma_fences(vm), false);
 		if (err)
 			goto free_syncs;
 	}
-- 
2.34.1

