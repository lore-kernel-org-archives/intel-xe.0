Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F13C001DF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 01:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DA710E4CE;
	Thu, 27 Jul 2023 01:40:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5EF10E068
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690422005; x=1721958005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rOqwD+7sx701yZUVZy2gQsjc1rmB7vuEIxXolRdbS2g=;
 b=E/ujwB0cHlRMDREJi6QFYlQGaZbIm23s4JhpSJEfFLY6MloCwI+wo/aB
 O9lY1ZHDVcr/REaqri8/Mq6twuPEkM5GM5lYBYldBabV1Ao3U9i178Qbq
 1KPS4FEFCb1d+vn9xtJ05Bpj+Hz90TPXwfLXVTtffwmjHQDQk9kstt7xy
 /naR7BojowbFZYWG5HIZgJPUVHOzuBZHnqhsgtmU9PObgpQxDkISmYNJT
 SnlP2lIpW6FJ4it/zQY+gmfKYW+GRjCiVOPDujqsXjnnJ5kNx35Q2dlC1
 NZvpxSU1Kg/YeqlTeBwhY8xy6GZ9VK5fOymCnVzcxDTn8NvqOBt+a05KW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371788088"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="371788088"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057459551"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="1057459551"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 18:39:57 -0700
Message-Id: <20230727013958.456502-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727013958.456502-1-matthew.brost@intel.com>
References: <20230727013958.456502-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe: Allow num_batch_buffer == 0 in exec
 IOCTL
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c       |  5 ++++-
 drivers/gpu/drm/xe/xe_engine_types.h |  2 +-
 drivers/gpu/drm/xe/xe_exec.c         | 21 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_sync.c         |  5 ++++-
 drivers/gpu/drm/xe/xe_sync.h         |  2 +-
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 6 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index bef82b40a097..26cc058ca734 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -839,7 +839,10 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
 static void xe_engine_last_fence_lockdep_assert(struct xe_engine *e,
 						struct xe_vm *vm)
 {
-	lockdep_assert_held_write(&vm->lock);
+	if (e->flags & ENGINE_FLAG_VM)
+		lockdep_assert_held_write(&vm->lock);
+	else
+		xe_vm_assert_held(vm);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index 9ca19942d72b..8e324be80792 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -54,7 +54,7 @@ struct xe_engine {
 
 	/**
 	 * @last_fence: last fence on engine, protected by vm->lock in write
-	 * mode if bind engine
+	 * mode if bind engine, protected by dma resv lock if exec engine
 	 */
 	struct dma_fence *last_fence;
 
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 58af1e0ef4d1..fae99c2e81e3 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -196,7 +196,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, engine->flags & ENGINE_FLAG_VM))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, engine->width != args->num_batch_buffer))
+	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
+			 engine->width != args->num_batch_buffer))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, engine->flags & ENGINE_FLAG_BANNED)) {
@@ -217,12 +218,13 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (i = 0; i < args->num_syncs; i++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
 					  &syncs_user[i], true,
-					  xe_vm_no_dma_fences(vm));
+					  xe_vm_no_dma_fences(vm),
+					  !args->num_batch_buffer);
 		if (err)
 			goto err_syncs;
 	}
 
-	if (xe_engine_is_parallel(engine)) {
+	if (args->num_batch_buffer && xe_engine_is_parallel(engine)) {
 		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
 				       engine->width);
 		if (err) {
@@ -261,6 +263,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_engine_end;
 	}
 
+	if (!args->num_batch_buffer) {
+		for (i = 0; i < num_syncs; i++) {
+			struct dma_fence *fence =
+				xe_engine_last_fence_get(engine, engine->vm);
+
+			xe_sync_entry_signal(&syncs[i], NULL, fence);
+		}
+
+		goto err_engine_end;
+	}
+
 	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
 		err = -EWOULDBLOCK;
 		goto err_engine_end;
@@ -354,6 +367,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (xe_engine_is_lr(engine))
 		engine->ring_ops->emit_job(job);
+	xe_engine_last_fence_set(engine, engine->vm,
+				 &job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
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
index 874ef9afbecf..879378a5ca8b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2994,7 +2994,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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

