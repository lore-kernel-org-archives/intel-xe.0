Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7091C52D6D
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7CD10E632;
	Wed, 31 Jul 2024 14:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsjqhWyT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868C710E630
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722435862; x=1753971862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RELpXV3vouXFY7FZXCPX3f6RCUU8pCIyd3ENqQS5bcw=;
 b=dsjqhWyTFpU440GF8g0GKINNEBnPEsbpAZd55i8TA+X0w46ovZ7eMg0s
 jlXmYW8hDNSnXWKLdIhomhHTr3UYal74ErJfb9v+oFpX9iVNkTrSGGpl1
 jO+CFaU+aQ59Ux64C9QDS64RY/an5ayZcLussUoa3RcftBUgE+qXeC/Me
 lqPuVlRZ02zzmO4iV0u+2L5J0MhIIjHTknIT86sXgtO9uy0BGKsz+MCwR
 +/UwejbKcHTxt+7p2pBEI23YN4jubtecDXdbTtdm+29dx/+PIdlCUg/EV
 bsSHOlQvx8B+PUcaolZu5hzwgFeQ2YPmjl3DDcBaSHfeI1t4Tfc2jRrxK g==;
X-CSE-ConnectionGUID: B6DvYAtETGeTcn4Tb3kXJA==
X-CSE-MsgGUID: aNUqqXMRS3qG0mkRioaiew==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31469201"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31469201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:21 -0700
X-CSE-ConnectionGUID: qFunNdm5QCupd1+2wg93FA==
X-CSE-MsgGUID: dOI9vOpPTcCnxWD1XAOpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59501051"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:19 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 11/13] drm/xe/hw_engine_group: Resume exec queues suspended
 by dma fence jobs
Date: Wed, 31 Jul 2024 16:21:45 +0200
Message-ID: <20240731142349.4101307-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731142349.4101307-1-francois.dugast@intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
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

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c            |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 46 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  1 +
 3 files changed, 49 insertions(+), 1 deletion(-)

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
index 1ebcade9fd47..18f8578e5781 100644
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
@@ -124,7 +156,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
 	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
 		q->ops->suspend(q);
 		q->ops->suspend_wait(q);
-		queue_work(group->resume_wq, &group->resume_work);
+		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 	}
 
 	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
@@ -150,6 +182,16 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
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
@@ -173,6 +215,8 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
 
 		q->ops->suspend_wait(q);
 	}
+
+	xe_hw_engine_group_resume_faulting_lr_jobs(group);
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

