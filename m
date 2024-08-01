Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56877C52D54
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D0C10E95F;
	Thu,  1 Aug 2024 12:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T50QmdZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D5110E967
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517109; x=1754053109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dCOoOjNl9+tLiIzeRcgV2tHhrjfpNnQEmTjocZy0kR8=;
 b=T50QmdZBqo4CVg8kKLqpeAWbsXn/U0u1u59oVzDJbir1qeIFuSm6tsiT
 oC8jOxljkwiu+ifI6hhSl5j4gdDHKDQTuF7IvhOHUMVlkNPmNukAyqC7R
 mSA0EKV04X9lijQxCE7ItqcRB0EKdpMPCp2Q1t3kIAK39O+nmKDOOOswJ
 zzIoIgnv2moOOc+5wAoX1JXoZdk4Dh708qQNk5oJL1ra+81n4+ZsOUIVA
 7Ak3y/8kw8DPKT9763PRny5Z6WLQCUSm5vwiYANoTj3w9H7ijMwtt42A2
 cLi2PZXfKoZhbTJYjaHLUPn04Okw1y8iSnHnKkbzV4ozn6rURPixXiIwH w==;
X-CSE-ConnectionGUID: CKfSrCHjQk2zZ0w6XM+CTg==
X-CSE-MsgGUID: KQ4RlGqtRSmrUDXVfalAWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357166"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357166"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:25 -0700
X-CSE-ConnectionGUID: ASMtoHvWTgy827YduJqpPQ==
X-CSE-MsgGUID: HXHW7VidRcOwaZmb8cxBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110119"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:23 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 11/13] drm/xe/hw_engine_group: Resume exec queues suspended
 by dma fence jobs
Date: Thu,  1 Aug 2024 14:56:52 +0200
Message-ID: <20240801125748.355078-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801125748.355078-1-francois.dugast@intel.com>
References: <20240801125748.355078-1-francois.dugast@intel.com>
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
index 16635f00c5f0..ca8b06df63f6 100644
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
@@ -125,7 +157,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
 	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
 		q->ops->suspend(q);
 		q->ops->suspend_wait(q);
-		queue_work(group->resume_wq, &group->resume_work);
+		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 	}
 
 	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
@@ -151,6 +183,16 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
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
@@ -174,6 +216,8 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
 
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

