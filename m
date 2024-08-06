Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F28C52D71
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB4E10E3F5;
	Tue,  6 Aug 2024 19:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL0ISY61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F9F10E3E1
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972491; x=1754508491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pn2TPje+tgqjXcPMpmTk1cURJxfFjUSviTKAKl8LiFo=;
 b=dL0ISY61Cj4D4PiJ4uJYY5gKd6Q1bj5JvSR5xfHJ7iMS7UmJVAsJqqRN
 7Y2C9C1v9EilYaII8e9wctU1oQR7uhOva9K4djJ8G4rml9w+fZHmADjEO
 TM4otq2OtFzMNRWRXnGxrMQ6EgnpmfdVYTEq0r/fb9EB7DY2fn7hUckgV
 b5QtJ136pkVjQHS8uYQppM+8kZHgmCCHQoNG/+4MzdUYoOYXcjNdAf3tW
 LSk2aYuHElV5p1jQUQw22SDsKg8fvFaO18bLnvgnf4G4RiMBEs6TryifS
 0kBVOT6Fy4TGbmkWcX564RdVbLp2JHufDYehhlNMbJI4KWwZ/02d0jodn g==;
X-CSE-ConnectionGUID: Eq6KCK5oQymAFYZ+eBFJ0w==
X-CSE-MsgGUID: cHBYQ9ZJRy2erj7X0ZyLxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682133"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:11 -0700
X-CSE-ConnectionGUID: b1wusITeRGeuUQfP5jwjWA==
X-CSE-MsgGUID: ScI3B5T2TqefAQbfvBwnZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585094"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:09 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 09/13] drm/xe/exec: Switch hw engine group execution mode
 upon job submission
Date: Tue,  6 Aug 2024 21:27:07 +0200
Message-ID: <20240806192739.1076344-10-francois.dugast@intel.com>
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
index e7cb27a38424..472d05709c31 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -286,3 +286,16 @@ __releases(&group->mode_sem)
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

