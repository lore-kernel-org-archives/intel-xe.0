Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CFEC10F07
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 19:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE1710E54E;
	Tue,  5 Dec 2023 19:19:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB4610E51F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701803996; x=1733339996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sHppTKEYOzOZCbulsVbvkeozx9iYEBNUwYCD4Tfef0E=;
 b=YoFu7zf9TuUQKvqxn2aFWii37x/Bdt/RaszG917SdovnUI90ZNnNsOC9
 gZ45Z+KoXKI2ECiSjSlO6SF1kkTi2HLnidMH7ByRbwoMPHyhUqWtialu7
 jcSpEMCTjR6J64WTQmGOYP4/ZarTputjxIQ7lRHNNfZhKby7vx7t0h7ra
 ecvi4H1xwSwFbw/+H1HQvZdJ1tYYII+21c20nWZ5mOe0N5Kr8j7tS3POK
 DRUKs3sx5n5UcCpzAVCqdyZ1aBcAtLyFap92A8y9bBUdNIQvo3SUfs8CF
 2QJMwj3ClcX/ndGrKL5jLCupWeWyULcuOgcXPttSTOdeR8E+VQAy9POcC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1032972"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1032972"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="12441528"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:19:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  5 Dec 2023 11:20:13 -0800
Message-Id: <20231205192014.301742-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205192014.301742-1-matthew.brost@intel.com>
References: <20231205192014.301742-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/5] drm/xe: Allow num_batch_buffer == 0 in
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
support for implementing vkQueueWaitIdle easily.

v2: Don't add last_fence for VM's that do not support dma fences
v3: Use a flags field instead of severval bools in sync parse (Thomas)
v4: v2: s/vkQueueWaitForIdle/vkQueueWaitIdle

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++--
 drivers/gpu/drm/xe/xe_sync.c             |  4 ++++
 4 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index a8a025495b14..76c0d517cd7a 100644
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
@@ -235,6 +236,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
+	if (!args->num_batch_buffer) {
+		if (xe_vm_in_lr_mode(vm)) {
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
@@ -328,6 +341,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (xe_exec_queue_is_lr(q))
 		q->ring_ops->emit_job(job);
+	if (xe_vm_in_lr_mode(vm))
+		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cb284c4ad049..67e3fd9dfc5f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -886,7 +886,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
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
index 5ba47a5cfdbd..52f0927d0d9b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -56,8 +56,9 @@ struct xe_exec_queue {
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
index 2a3f508722fc..d0f118223fa2 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -104,6 +104,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	int err;
 	bool exec = flags & SYNC_PARSE_FLAG_EXEC;
 	bool in_lr_mode = flags & SYNC_PARSE_FLAG_LR_MODE;
+	bool disallow_user_fence = flags & SYNC_PARSE_FLAG_DISALLOW_USER_FENCE;
 	bool signal;
 
 	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
@@ -164,6 +165,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_TYPE_USER_FENCE:
+		if (XE_IOCTL_DBG(xe, disallow_user_fence))
+			return -EOPNOTSUPP;
+
 		if (XE_IOCTL_DBG(xe, !signal))
 			return -EOPNOTSUPP;
 
-- 
2.34.1

