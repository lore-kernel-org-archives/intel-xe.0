Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1513C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 00:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726B010E49F;
	Wed, 29 Mar 2023 00:09:56 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FFA10E49F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 00:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680048594; x=1711584594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wfxfgoxOw2kb1X6BNK/I/8K43RXd/yoRGIIPCVKy2aA=;
 b=lZACs20RbzINkPwhnnDhucld+Ih+NDcr95MStrj52YyHdgjeuEZ7jnuk
 OQsC4xD+wTQPN685YYPpNmwux37BFc6ZiHQ0w7Brlzfrj9L9EPSil0P9n
 +KQLXUx81IkZ5GGDAxS4sawvbpnnD+eRdd/zzp2j8rJC6Y3bxxKs9yQF8
 fp+6ehPQvKoVgvkVhdz6WJKcfyY6Ap+4RdaepOXjOSizwoaKu4oIxyXMD
 lqUolCVrPqOmNVzoX34ErUerLaF3O5SDAgHJipropndsMino0vIeonTNE
 MNlFdaBVEknIv5FrL6IpD8XFIpxuHuDlltYUIGPygYaa49/kEfFEXHD69 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403350269"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="403350269"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 17:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773346495"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="773346495"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 17:09:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 28 Mar 2023 17:09:58 -0700
Message-Id: <20230329000958.2188321-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329000958.2188321-1-matthew.brost@intel.com>
References: <20230329000958.2188321-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/1] drm/xe: Return NULL in run_job for long
 running jobs
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

Return NULL in run_job for long running jobs, now to flow control the
ring use prepare_job.

FIXME: Need to implement cleanup for long runnig engines that encounter
errors.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c          | 54 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_engine.h          |  6 +++
 drivers/gpu/drm/xe/xe_engine_types.h    |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c      | 31 ++++++++++++--
 drivers/gpu/drm/xe/xe_sched_job.c       |  5 +++
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
 6 files changed, 96 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 37209b13bcd6..440f69ed3dc8 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -40,8 +40,11 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
 	e->flags = flags;
 	e->hwe = hwe;
 	e->gt = gt;
-	if (vm)
+	if (vm) {
 		e->vm = xe_vm_get(vm);
+		if (xe_vm_no_dma_fences(vm))
+			xa_init_flags(&e->pending_lr_jobs, XA_FLAGS_ALLOC1);
+	}
 	e->class = hwe->class;
 	e->width = width;
 	e->logical_mask = logical_mask;
@@ -149,8 +152,11 @@ void xe_engine_fini(struct xe_engine *e)
 
 	for (i = 0; i < e->width; ++i)
 		xe_lrc_finish(e->lrc + i);
-	if (e->vm)
+	if (e->vm) {
 		xe_vm_put(e->vm);
+		if (xe_vm_no_dma_fences(e->vm))
+			xa_destroy(&e->pending_lr_jobs);
+	}
 
 	kfree(e);
 }
@@ -789,3 +795,47 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+int xe_engine_add_lr_job(struct xe_engine *e, struct xe_sched_job *job)
+{
+	void *ret;
+
+	if (!xe_engine_is_lr(e))
+		return 0;
+
+	ret = xa_store(&e->pending_lr_jobs, job->fence->seqno, job, GFP_KERNEL);
+	if (IS_ERR(ret))
+		return PTR_ERR(ret);
+	XE_WARN_ON(ret);
+
+	return 0;
+}
+
+void xe_engine_del_lr_job(struct xe_engine *e, struct xe_sched_job *job)
+{
+	if (!xe_engine_is_lr(e))
+		return;
+
+	xa_erase(&e->pending_lr_jobs, job->fence->seqno);
+}
+
+struct xe_sched_job *xe_engine_get_lr_job(struct xe_engine *e, u32 seqno)
+{
+	struct xe_sched_job *job;
+
+	if (!xe_engine_is_lr(e))
+		return NULL;
+
+	xa_lock(&e->pending_lr_jobs);
+	job = xa_load(&e->pending_lr_jobs, seqno);
+	if (job)
+		dma_fence_get(job->fence);
+	xa_unlock(&e->pending_lr_jobs);
+
+	return job;
+}
+
+bool xe_engine_is_lr(struct xe_engine *e)
+{
+	return e->vm && xe_vm_no_dma_fences(e->vm);
+}
diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
index a49cf2ab405e..b7aa5a03adcd 100644
--- a/drivers/gpu/drm/xe/xe_engine.h
+++ b/drivers/gpu/drm/xe/xe_engine.h
@@ -12,6 +12,7 @@
 struct drm_device;
 struct drm_file;
 struct xe_device;
+struct xe_sched_job;
 struct xe_file;
 
 struct xe_engine *xe_engine_create(struct xe_device *xe, struct xe_vm *vm,
@@ -24,6 +25,11 @@ struct xe_engine *xe_engine_create_class(struct xe_device *xe, struct xe_gt *gt,
 void xe_engine_fini(struct xe_engine *e);
 void xe_engine_destroy(struct kref *ref);
 
+int xe_engine_add_lr_job(struct xe_engine *e, struct xe_sched_job *job);
+void xe_engine_del_lr_job(struct xe_engine *e, struct xe_sched_job *job);
+struct xe_sched_job *xe_engine_get_lr_job(struct xe_engine *e, u32 seqno);
+bool xe_engine_is_lr(struct xe_engine *e);
+
 struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
 
 static inline struct xe_engine *xe_engine_get(struct xe_engine *engine)
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index 36bfaeec23f4..46b718343f79 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -143,6 +143,9 @@ struct xe_engine {
 		u32 acc_granularity;
 	} usm;
 
+	/** @pending_lr_jobs: Pending jobs for long running work loads */
+	struct xarray pending_lr_jobs;
+
 	/** @ops: submission backend engine operations */
 	const struct xe_engine_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..590e5481d063 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -377,6 +377,22 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_engine *e)
 		       __guc_engine_policy_action_size(&policy), 0, 0);
 }
 
+static struct dma_fence *
+guc_engine_prepare_job(struct drm_sched_job *drm_job,
+		       struct drm_sched_entity *s_entity)
+{
+	struct xe_sched_job *job = to_xe_sched_job(drm_job), *lr_job;
+	struct xe_engine *e = job->engine;
+	u32 seqno = (u32)(job->fence->seqno) -
+		(e->lrc[0].ring.size * 2) / MAX_JOB_SIZE_BYTES;
+
+	lr_job = xe_engine_get_lr_job(job->engine, seqno);
+	if (lr_job)
+		return lr_job->fence;
+	else
+		return NULL;
+}
+
 #define PARALLEL_SCRATCH_SIZE	2048
 #define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
 #define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
@@ -675,18 +691,26 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
 		submit_engine(e);
 	}
 
-	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
+	if (xe_engine_is_lr(job->engine))
+		return NULL;
+	else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
 		return job->fence;
 	else
 		return dma_fence_get(job->fence);
 }
 
+static void __guc_engine_free_job(struct xe_sched_job *job)
+{
+	trace_xe_sched_job_free(job);
+	xe_sched_job_put(job);
+}
+
 static void guc_engine_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
-	trace_xe_sched_job_free(job);
-	xe_sched_job_put(job);
+	if (xe_engine_is_lr(job->engine))
+		__guc_engine_free_job(job);
 }
 
 static int guc_read_stopped(struct xe_guc *guc)
@@ -1056,6 +1080,7 @@ static void guc_engine_process_msg(struct drm_sched_msg *msg)
 }
 
 static const struct drm_sched_backend_ops drm_sched_ops = {
+	.prepare_job = guc_engine_prepare_job,
 	.run_job = guc_engine_run_job,
 	.free_job = guc_engine_free_job,
 	.timedout_job = guc_engine_timedout_job,
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 2985caa6097b..ece3a5db3978 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -154,6 +154,10 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
 	for (i = 0; i < width; ++i)
 		job->batch_addr[i] = batch_addr[i];
 
+	err = xe_engine_add_lr_job(e, job);
+	if (err)
+		goto err_fences;
+
 	/* All other jobs require a VM to be open which has a ref */
 	if (unlikely(e->flags & ENGINE_FLAG_KERNEL))
 		xe_device_mem_access_get(job_to_xe(job));
@@ -190,6 +194,7 @@ void xe_sched_job_destroy(struct kref *ref)
 
 	if (unlikely(job->engine->flags & ENGINE_FLAG_KERNEL))
 		xe_device_mem_access_put(job_to_xe(job));
+	xe_engine_del_lr_job(job->engine, job);
 	xe_engine_put(job->engine);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 5534bfacaa16..07406d894b26 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -22,6 +22,8 @@ struct xe_sched_job {
 	struct xe_engine *engine;
 	/** @refcount: ref count of this job */
 	struct kref refcount;
+	/** @lr_job_cb: long running job callback */
+	struct dma_fence_cb lr_job_cb;
 	/**
 	 * @fence: dma fence to indicate completion. 1 way relationship - job
 	 * can safely reference fence, fence cannot safely reference job.
-- 
2.34.1

