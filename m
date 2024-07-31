Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A18C52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9309B10E633;
	Wed, 31 Jul 2024 14:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVMf9/We";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D46D10E630
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722435858; x=1753971858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbHkw0vKws/2Ya1Nykkx9ARmUR1pl7KUP8AdgRVuRsQ=;
 b=YVMf9/WeafDQz6gpgRhAf8gMJpXJ6ByV4tie7o/1rzuSCcNB/m+KDFJr
 SBt2REsqOl9aVAAAsPxVqCqtRJeQAHdSn78gmHg90NkaXtulg+9WeiQJW
 CAzAT45urb4Rupbb7uBDVEQ3+FvU3A1IbM9hZrwQicWdSVt+z0VWYa0u1
 h+k5OjShFbsqLsD7CvVPzIuQA+uEyf3QBIjJhCoyE8R98IJb7ogjxMwWF
 OTsd3N0MXMq1Ixe9AStDLDRO5VvWAWJr23Nix6X9jcohoojDWXQwurP41
 GVqaf8lqOmMSJw3JltsQbO1PO6w+9GPlE847uyESCSR0szhnXddTp0tjx Q==;
X-CSE-ConnectionGUID: hY959OtGRBqTJfNF1QYiYw==
X-CSE-MsgGUID: fiM48j7xRUOPrdrHHyoCrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31469198"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31469198"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:17 -0700
X-CSE-ConnectionGUID: L47/u5ZERDyH6MphDtAOOw==
X-CSE-MsgGUID: dj/ydPESTIC/lLNwBOL6Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59501030"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:16 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 09/13] drm/xe/exec: Switch hw engine group execution mode
 upon job submission
Date: Wed, 31 Jul 2024 16:21:43 +0200
Message-ID: <20240731142349.4101307-10-francois.dugast@intel.com>
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

If the job about to be submitted is a dma-fence job, update the current
execution mode of the hw engine group. This triggers the required
operations to ensure mutual exclusion of executions modes in this hw
engine group.

v2: Change execution mode in exec IOCTL only when submitted job is
    dma-fence (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c            | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  3 +++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index f36980aa26e6..2169fbf766d3 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
+#include "xe_hw_engine_group.h"
 #include "xe_macros.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
@@ -124,6 +125,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	bool write_locked, skip_retry = false;
 	ktime_t end = 0;
 	int err = 0;
+	struct xe_hw_engine_group *group;
+	enum xe_hw_engine_group_execution_mode mode, previous_mode;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
@@ -182,6 +185,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	group = q->hwe->hw_engine_group;
+	mode = xe_hw_engine_group_find_exec_mode(q);
+
+	if (mode == EXEC_MODE_DMA_FENCE) {
+		err = xe_hw_engine_group_get_mode(group, mode, &previous_mode);
+		if (err)
+			goto err_syncs;
+	}
+
 retry:
 	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
 		err = down_write_killable(&vm->lock);
@@ -199,7 +211,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		downgrade_write(&vm->lock);
 		write_locked = false;
 		if (err)
-			goto err_unlock_list;
+			goto err_hw_exec_mode;
 	}
 
 	if (!args->num_batch_buffer) {
@@ -324,6 +336,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
 		goto retry;
+err_hw_exec_mode:
+	if (mode == EXEC_MODE_DMA_FENCE)
+		xe_hw_engine_group_put(group);
 err_syncs:
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 81e43452196a..1ebcade9fd47 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -278,3 +278,16 @@ __releases(&group->mode_sem)
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
index e0deb7c7bb5b..0f196c0ad98d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
@@ -22,4 +22,7 @@ int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
 				enum xe_hw_engine_group_execution_mode *previous_mode);
 void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
 
+enum xe_hw_engine_group_execution_mode
+xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
+
 #endif
-- 
2.43.0

