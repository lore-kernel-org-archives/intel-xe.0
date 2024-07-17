Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE445C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B519210EAF3;
	Wed, 17 Jul 2024 13:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxXEXwvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708E210EAF6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221733; x=1752757733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WV1xtwMYjuzU6SsSuWGCQ0M3buc9BCSyfDQzQWEKHZ8=;
 b=CxXEXwvoUceVROh/A5jnZ7Kr4koWLqCRVeX1qN+YG8GlrTNeiVkIJau2
 1HR/PTYjeLeRu9Lbv9hGgTuoA6KVz76fGrBaIBvZ33RZji5nNULGafUVn
 YylvUbIJVIragle5fqRmKWA1hCybDAiPHnfHdgwZ91lZVv1rCKNv1Czsr
 FMnyGZ2qoAR2nO57dtB+IV4QtQ2mc5JXskZ4L3DGAC8QoU5fAjIgqRpan
 RpejmBkqJsIw2ND5yw8OrsqQo+P1RLXgYXFlJojif3MjpfNT6om1e+fMh
 esIblLNLlk+8wwenzbSDWuErI6GMrhjR+85SRigBSxEaLaTLrqsBYhV2/ g==;
X-CSE-ConnectionGUID: lynSJ9AYSFmGL3DkzEb3Fw==
X-CSE-MsgGUID: POBsGh3xRrCBPFGrk6+0dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832084"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:53 -0700
X-CSE-ConnectionGUID: 2zavu93RRguaTuZ10TwNsg==
X-CSE-MsgGUID: Eb5GpueNSASTeM5I2vPY5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55532065"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:51 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 8/9] drm/xe/hw_engine_group: Resume LR exec queues suspended
 by dma fence jobs
Date: Wed, 17 Jul 2024 15:07:29 +0200
Message-ID: <20240717130821.1073379-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717130821.1073379-1-francois.dugast@intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
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

Submission of a dma fence job leads to suspending the long running exec
queues of the hw engine group. Work is queued in the resume worker for
this group and execution is resumed on the attached exec queues in long
running mode.

This is another entry point for execution on the hw engine group so the
execution mode is updated.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e6c755a04fd8..dd8ef65cbf2d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -431,6 +431,26 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
 }
 
+static void hw_engine_group_resume_work_func(struct work_struct *w)
+{
+	struct xe_exec_queue *q;
+	struct xe_hw_engine_group *group = container_of(w, struct xe_hw_engine_group, resume_work);
+	int err;
+
+	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR);
+	if (err)
+		return;
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (!xe_vm_in_lr_mode(q->vm))
+			continue;
+
+		q->ops->resume(q);
+	}
+
+	xe_hw_engine_group_put(group);
+}
+
 static struct xe_hw_engine_group *
 hw_engine_group_alloc(struct xe_device *xe)
 {
@@ -438,6 +458,8 @@ hw_engine_group_alloc(struct xe_device *xe)
 
 	group = kzalloc(sizeof(*group), GFP_KERNEL);
 	init_rwsem(&group->mode_sem);
+	group->resume_wq = alloc_ordered_workqueue("xe-resume-lr-jobs-wq", 0);
+	INIT_WORK(&group->resume_work, hw_engine_group_resume_work_func);
 	INIT_LIST_HEAD(&group->exec_queue_list);
 
 	return group;
@@ -1235,6 +1257,7 @@ static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
 {
 	int err;
 	struct xe_exec_queue *q;
+	bool suspended_queue = false;
 
 	lockdep_assert_held(&group->mode_sem);
 
@@ -1247,8 +1270,13 @@ static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
 			return err;
 
 		q->ops->suspend_wait(q);
+
+		suspended_queue = true;
 	}
 
+	if (suspended_queue)
+		queue_work(group->resume_wq, &group->resume_work);
+
 	return 0;
 }
 
-- 
2.43.0

