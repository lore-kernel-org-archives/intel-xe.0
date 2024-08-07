Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8776FC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579C410E581;
	Wed,  7 Aug 2024 16:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVbg34vY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F4E10E587
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723047891; x=1754583891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uSNej4l+Kp/yR/ZjXUXtRSh3D9wgsxKr3Pv0V5HY7wA=;
 b=cVbg34vY9FYeB81HeUFd92LsO/wBHa+A/A11p2XrwDh6G3v5ScR1Yyy+
 JpcTp9o4EorZkhXzSu/REN0Hfh70kpqdQpn4hJWZvI8xt23RLmsj4Zwuc
 RAKN71b5CfkzkQEJexr6yb7wOCf/lWXZvr6WVLBFw4HsZQ0HEYo2Lk5g9
 UTD+lFRpWwrOJlZgsshDnT95PT/4XYUUXcYGBNWSiQAltWITS1mTeXTQf
 cOuhLsmzw9dAssCI/+Q3nKY3YLShd35wwwmkhrFwguXptCu7ac1YJA3TA
 eTLF3jI++abUxvPhORGsEcwgHattOB8PJ+BDvhN1ausE8DwWK1ts+5ryF Q==;
X-CSE-ConnectionGUID: 4D7w1slLQNueyJQlyxyLvQ==
X-CSE-MsgGUID: 0gCEl0d9R+G3CU/VPgMWNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24040455"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24040455"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:50 -0700
X-CSE-ConnectionGUID: IsGFPQ/ySxGEO4lgrKRdrQ==
X-CSE-MsgGUID: mT/DWN1eQ4etEayFeb2vAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61791035"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:49 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 09/13] drm/xe/exec: Switch hw engine group execution mode
 upon job submission
Date: Wed,  7 Aug 2024 18:23:38 +0200
Message-ID: <20240807162416.1307061-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807162416.1307061-1-francois.dugast@intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
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
index 75c82d24cedd..4781d6d606aa 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -288,3 +288,16 @@ __releases(&group->mode_sem)
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

