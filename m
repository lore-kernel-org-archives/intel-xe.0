Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FDFCD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 13:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFAC10E360;
	Mon, 25 May 2026 13:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLW5M/FY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A3310E360
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779715937; x=1811251937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NXyf5jHLWV4bF89H7uUFeWdbGjirlU9aOvBzrPQmDH0=;
 b=NLW5M/FYHPHqdCGXXdZlbbO9xW70zHJJ48eaWiKLl181CPbkfWe1MmBf
 k8HsEYU3W/kLbY4TbUItff3isCe3G1CouHG+5WxzapGsVeY+86+6gFKty
 a7PJDv/FXXVNV+e+5y13de/OuPb3IQrIwV0RB2d4KW+/00XUv3W6nJw46
 /PCfvveLBcQ5fQ5hJBIQW2H1MMR0DJVQ2qML3Y7myZdu7ZNpwied1KxER
 gFuG5Lf1HlohrXTSt3mcxWYZVsvvDdwkW3krJIzQUZJPycTFNy0FbZjd1
 RJs+bQ8uFQxWEuwf1K38YPKraCHFoE+TuCcLN8mWvISS8notR+ArWMUqr w==;
X-CSE-ConnectionGUID: Y/QhhkZTQgKfdZ3Dsp666A==
X-CSE-MsgGUID: YTOE4QXvSFGjLOUS7vgZ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91225495"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="91225495"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 06:32:17 -0700
X-CSE-ConnectionGUID: De63thtmTg22eupFm+suCw==
X-CSE-MsgGUID: dp+/8POLQryWTCWcm5tMog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="235242110"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.238])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 06:31:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 4/5] drm/xe: Rename EXEC_MODE_LR to EXEC_MODE_FAULT in hw
 engine group
Date: Mon, 25 May 2026 15:30:50 +0200
Message-ID: <20260525133051.91636-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
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

