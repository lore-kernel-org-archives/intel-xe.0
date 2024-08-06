Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73737C52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419B910E3E1;
	Tue,  6 Aug 2024 19:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vu3blLqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DFB10E3E8
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972494; x=1754508494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zg7NSE1v7Ju6fbS1VPZ6e6BLzErkrJMOUN8rk8DXQJA=;
 b=Vu3blLqTkIOo3X5ADt9f4lOTGsINC4BjstdV2rbs+ZkBf+frCrc0+X2Y
 2GA0fiFQz5mzXS04yWVPpsZ1JMT+HE3RHSwG+oug96BivAQMBayYDj13p
 4p5Qg7PaoNG4WcZ+2WklCByrwSlh57o+t/kOWLUcRI0la2CJ38nbt4cBe
 9qj37wRfytlMfbKyQh2Kfe4Nn3iKcvuhS4FWDveHKWkhLWee3nupNJnH9
 XM6/v64dXcVdNcjDRBlZGsvHF1WMUv3AGPqmo2kqWzkDyiDM0Vs//ps+E
 UPaaBhRN+ln6mj8b4gPrIFr5kz3F225N8Req6v7WCIFPv8zi6Xu1eEIzS Q==;
X-CSE-ConnectionGUID: FIlVT/W6SJ6qS8rSvFq66A==
X-CSE-MsgGUID: vTiYvl3DSmauadfDhkQi5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682136"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:14 -0700
X-CSE-ConnectionGUID: 3CIcdS98TMO0/lwcbH8r8w==
X-CSE-MsgGUID: 5mlgMlx8Rui4Sf9U0VAH0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585106"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:12 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 11/13] drm/xe/hw_engine_group: Resume exec queues suspended
 by dma fence jobs
Date: Tue,  6 Aug 2024 21:27:09 +0200
Message-ID: <20240806192739.1076344-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806192739.1076344-1-francois.dugast@intel.com>
References: <20240806192739.1076344-1-francois.dugast@intel.com>
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

Submission of a dma fence job leads to suspending the faulting long
running exec queues of the hw engine group. Work is queued in the resume
worker for this group and execution is resumed on the attached exec queues
in faulting long running mode.

This is another entry point for execution on the hw engine group so the
execution mode is updated.

v2: Kick the resume worker from exec IOCTL, switch to unordered workqueue,
    destroy it after use (Matt Brost)

v3: Do not resume if no exec queue was suspended (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c            |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 49 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  1 +
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 2169fbf766d3..484acfbe0e61 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -324,6 +324,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		spin_unlock(&xe->ttm.lru_lock);
 	}
 
+	if (mode == EXEC_MODE_LR)
+		xe_hw_engine_group_resume_faulting_lr_jobs(group);
+
 err_repin:
 	if (!xe_vm_in_lr_mode(vm))
 		up_read(&vm->userptr.notifier_lock);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 472d05709c31..c08526123eb9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -17,9 +17,36 @@ hw_engine_group_free(struct drm_device *drm, void *arg)
 {
 	struct xe_hw_engine_group *group = arg;
 
+	destroy_workqueue(group->resume_wq);
 	kfree(group);
 }
 
+static void
+hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
+{
+	struct xe_exec_queue *q;
+	struct xe_hw_engine_group *group = container_of(w, struct xe_hw_engine_group, resume_work);
+	int err;
+	enum xe_hw_engine_group_execution_mode previous_mode;
+
+	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode);
+	if (err)
+		return;
+
+	if (previous_mode == EXEC_MODE_LR)
+		goto put;
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (!xe_vm_in_fault_mode(q->vm))
+			continue;
+
+		q->ops->resume(q);
+	}
+
+put:
+	xe_hw_engine_group_put(group);
+}
+
 static struct xe_hw_engine_group *
 hw_engine_group_alloc(struct xe_device *xe)
 {
@@ -30,7 +57,12 @@ hw_engine_group_alloc(struct xe_device *xe)
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
+	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
+	if (!group->resume_wq)
+		return ERR_PTR(-ENOMEM);
+
 	init_rwsem(&group->mode_sem);
+	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
 	INIT_LIST_HEAD(&group->exec_queue_list);
 
 	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
@@ -128,7 +160,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
 	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
 		q->ops->suspend(q);
 		q->ops->suspend_wait(q);
-		queue_work(group->resume_wq, &group->resume_work);
+		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 	}
 
 	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
@@ -154,6 +186,16 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 	up_write(&group->mode_sem);
 }
 
+/**
+ * xe_hw_engine_group_resume_faulting_lr_jobs() - Asynchronously resume the hw engine group's
+ * faulting LR jobs
+ * @group: The hw engine group
+ */
+void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group)
+{
+	queue_work(group->resume_wq, &group->resume_work);
+}
+
 /**
  * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
  * @group: The hw engine group
@@ -161,6 +203,7 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group *group)
 {
 	struct xe_exec_queue *q;
+	bool need_resume = false;
 
 	lockdep_assert_held_write(&group->mode_sem);
 
@@ -168,6 +211,7 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
 		if (!xe_vm_in_fault_mode(q->vm))
 			continue;
 
+		need_resume = true;
 		q->ops->suspend(q);
 	}
 
@@ -177,6 +221,9 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
 
 		q->ops->suspend_wait(q);
 	}
+
+	if (need_resume)
+		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
index 0f196c0ad98d..797ee81acbf2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
@@ -24,5 +24,6 @@ void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
 
 enum xe_hw_engine_group_execution_mode
 xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
+void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group);
 
 #endif
-- 
2.43.0

