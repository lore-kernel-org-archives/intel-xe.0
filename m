Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B1DC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CD610EAF5;
	Wed, 17 Jul 2024 13:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYS9HoSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E0410EAF5
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221731; x=1752757731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g0sPdHp9MVbfKjKm8jWHFm2MKH+AccGqdPV5OdLwnjA=;
 b=bYS9HoSKZWt8gvSy58LKS/s0otEORJ11bClOHAf/PopXRh4uuAnFsmqX
 B2/Qqor+mxL0+crXA0fvMhyUd4CbS/pVA6EDOkyiy09t/ZShTv1YC8W2B
 LWGplpygSlcPYqEnRjEO0hlUQ4X5t5IioqQO4dO+nVvhyJ/ljUkehwORW
 X+4Ie9b03tHkbXdrs3IwN14Wq0PL4hkj3mLuD3GyQHpiVsVqIGrFA3Dki
 cb2TLLasNPmsspLOsv+Uulb5440n1RY//VRZ0SrsWZX75fLn/lLhCjrXf
 yA73ByDDmo0qYupvC1fhZSLcatMPq/TpkJqigbvPtXbc346j8BRYyt7V+ Q==;
X-CSE-ConnectionGUID: bTv0hnyURZ2k1w7CgMOZyQ==
X-CSE-MsgGUID: n3tzXnByTL+l6c6X48l48Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832081"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832081"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:51 -0700
X-CSE-ConnectionGUID: swh85N5MSTSn/i2a7HrLjA==
X-CSE-MsgGUID: /WLxGgM1TL2t7ev9eDrh/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55532050"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:50 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 7/9] drm/xe/exec: Switch hw engine group execution mode upon
 job submission
Date: Wed, 17 Jul 2024 15:07:28 +0200
Message-ID: <20240717130821.1073379-8-francois.dugast@intel.com>
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

Update the current execution mode of the hw engine group which will be
used to run the job that is about to be submitted. This triggers the
required operations to ensure mutual exclusion of executions modes in
this hw engine group.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c      | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  2 ++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 2d72cdec3a0b..35418b5d1f5c 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
+#include "xe_hw_engine.h"
 #include "xe_macros.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
@@ -124,6 +125,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	bool write_locked, skip_retry = false;
 	ktime_t end = 0;
 	int err = 0;
+	struct xe_hw_engine_group *group;
+	enum xe_hw_engine_group_execution_mode mode;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
@@ -182,6 +185,13 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	group = q->hwe->hw_engine_group;
+	mode = xe_hw_engine_group_find_exec_mode(q);
+
+	err = xe_hw_engine_group_get_mode(group, mode);
+	if (err)
+		goto err_syncs;
+
 retry:
 	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
 		err = down_write_killable(&vm->lock);
@@ -199,7 +209,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		downgrade_write(&vm->lock);
 		write_locked = false;
 		if (err)
-			goto err_unlock_list;
+			goto err_hw_exec_mode;
 	}
 
 	if (!args->num_batch_buffer) {
@@ -324,6 +334,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
 		goto retry;
+err_hw_exec_mode:
+	xe_hw_engine_group_put(group);
 err_syncs:
 	for (i = 0; i < num_syncs; i++)
 		xe_sync_entry_cleanup(&syncs[i]);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4f539711357a..e6c755a04fd8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1345,3 +1345,16 @@ void xe_hw_engine_group_put(struct xe_hw_engine_group *group)
 {
 	up_read(&group->mode_sem);
 }
+
+/**
+ * xe_hw_engine_group_find_exec_mode() - Find the execution mode for this exec queue
+ * @q: The exec_queue
+ */
+enum xe_hw_engine_group_execution_mode
+xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
+{
+	if (xe_vm_in_lr_mode(q->vm))
+		return EXEC_MODE_LR;
+	else
+		return EXEC_MODE_DMA_FENCE;
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index fce0adf6a7c4..6dfebb18cbb7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -76,5 +76,7 @@ int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct x
 int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
 				enum xe_hw_engine_group_execution_mode mode);
 void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
+enum xe_hw_engine_group_execution_mode
+xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
 
 #endif
-- 
2.43.0

