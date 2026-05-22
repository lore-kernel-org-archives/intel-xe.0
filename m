Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE670CD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 16:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730B810F673;
	Fri, 22 May 2026 16:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjX+70BV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B6510E297
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779468267; x=1811004267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NXyf5jHLWV4bF89H7uUFeWdbGjirlU9aOvBzrPQmDH0=;
 b=SjX+70BVjn6roIbenmDMIdnC7+WB70nPF2XnX1aqJGgroLVrYtUF1971
 OwFoZ2p/at/Lw+utw31qDjV1hRQrJ9m1201gfY37N2mYZOAVwe+DqtGQS
 DoqyfkQLlHswvG1Zr9Pfn7QcPkDkRDlPt1kje6Q//EWOYshIzkSI/7gtS
 Mo5JbhzX7SsCF0+6x9bVm1fi6UVAMMC2Ov+Cb5XXcHS6r0QvdxT81i0HD
 +2RJgskuZJylFhv5HdAGG54C1+pGphg5WYJqxVTo65s0L3uvp0DoFqC09
 2H1oOprse1mRGwAgdCpA8Yc6+tUHXXpo0MyZEV066beemsPMQVKMaBmUr Q==;
X-CSE-ConnectionGUID: dViPmuPtS8Wk3aEVRjjG+Q==
X-CSE-MsgGUID: PrOF513gSFqhekDVjzaxfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80453400"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80453400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:44:27 -0700
X-CSE-ConnectionGUID: I2c0S0hHS/uPXF8UwSK6wg==
X-CSE-MsgGUID: LAQPQB+NQqCU2vkB7yGuKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238370123"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.219])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:44:25 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 4/5] drm/xe: Rename EXEC_MODE_LR to EXEC_MODE_FAULT in hw
 engine group
Date: Fri, 22 May 2026 18:43:54 +0200
Message-ID: <20260522164355.2773-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522164355.2773-1-thomas.hellstrom@linux.intel.com>
References: <20260522164355.2773-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The execution mode tracked by xe_hw_engine_group_execution_mode
describes whether the hw engine group is currently executing jobs
in fault mode (long-running, fault-capable) or in DMA fence mode.
The EXEC_MODE_LR label was misleading since not all LR queues use
fault mode; rename it to EXEC_MODE_FAULT for clarity.

No functional change.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c                  |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 10 +++++-----
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index e05dabfcd43c..15ad0fee906c 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -342,7 +342,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		spin_unlock(&xe->ttm.lru_lock);
 	}
 
-	if (mode == EXEC_MODE_LR)
+	if (mode == EXEC_MODE_FAULT)
 		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 
 err_repin:
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 791be6edd0a4..fba0ed039bad 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -22,12 +22,12 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
 	int err;
 	enum xe_hw_engine_group_execution_mode previous_mode;
 
-	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode,
+	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_FAULT, &previous_mode,
 					  NULL, 0);
 	if (err)
 		return;
 
-	if (previous_mode == EXEC_MODE_LR)
+	if (previous_mode == EXEC_MODE_FAULT)
 		goto put;
 
 	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
@@ -292,13 +292,13 @@ static int switch_mode(struct xe_hw_engine_group *group, bool has_deps)
 	lockdep_assert_held_write(&group->mode_sem);
 
 	switch (group->cur_mode) {
-	case EXEC_MODE_LR:
+	case EXEC_MODE_FAULT:
 		new_mode = EXEC_MODE_DMA_FENCE;
 		err = xe_hw_engine_group_suspend_faulting_lr_jobs(group,
 								  has_deps);
 		break;
 	case EXEC_MODE_DMA_FENCE:
-		new_mode = EXEC_MODE_LR;
+		new_mode = EXEC_MODE_FAULT;
 		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
 		break;
 	}
@@ -395,7 +395,7 @@ enum xe_hw_engine_group_execution_mode
 xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
 {
 	if (xe_vm_in_fault_mode(q->vm))
-		return EXEC_MODE_LR;
+		return EXEC_MODE_FAULT;
 	else
 		return EXEC_MODE_DMA_FENCE;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
index 92b6e0712c03..b4c41de6ba5f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
@@ -14,11 +14,11 @@
  * enum xe_hw_engine_group_execution_mode - possible execution modes of a hw
  * engine group
  *
- * @EXEC_MODE_LR: execution in long-running mode
+ * @EXEC_MODE_FAULT: execution in fault mode (long-running, fault-capable)
  * @EXEC_MODE_DMA_FENCE: execution in dma fence mode
  */
 enum xe_hw_engine_group_execution_mode {
-	EXEC_MODE_LR,
+	EXEC_MODE_FAULT,
 	EXEC_MODE_DMA_FENCE,
 };
 
-- 
2.54.0

