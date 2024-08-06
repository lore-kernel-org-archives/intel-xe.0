Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF1BC52D6F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FDA10E3F4;
	Tue,  6 Aug 2024 19:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7pC1YC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B5210E3F4
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972489; x=1754508489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SbS+29hkwttPmFeKAzLvgoNOQ2HZeh9BAv7vcjQXZlk=;
 b=K7pC1YC+6CAo/AiilAUGET1rmInrFiisbK8TQbUgbZWKpazWwlX31wqS
 UUNWWjBIjb8SgnXDFeCT5Hoh5MxJJkrHM1qRqm6TpPicFNiupcpV4GtcK
 zco2TLs/ypTN9WXdh/wy2DdbGYrH0J/oSEBc8tHmM5uBML8df/JjXcugx
 vJZrmp1WNpA4Z941giTxHdGSDIZZ+wpczGWihvow1ZWWH7iB3+srJVyh9
 U43OubodsnOEh7ZfdooNigwVXLlKTE4IG7fkx8AEia4DvsOjDBbVh7UJY
 +jdIA0FDK953tu470wBFxvgQWXOngv2wi/cWaN7aQ67g/JpxOVBE+HMhq A==;
X-CSE-ConnectionGUID: /eIDc+qdSlG70WRXptE4sg==
X-CSE-MsgGUID: 72UDnf52TQSwJkJUpdhWjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682132"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:09 -0700
X-CSE-ConnectionGUID: sc02vxkbRL+qi0FXsAbHWg==
X-CSE-MsgGUID: Td47zYy1TQKdbhF+qfsbMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585090"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:08 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 08/13] drm/xe/hw_engine_group: Ensure safe transition
 between execution modes
Date: Tue,  6 Aug 2024 21:27:06 +0200
Message-ID: <20240806192739.1076344-9-francois.dugast@intel.com>
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

Provide a way to safely transition execution modes of the hw engine group
ahead of the actual execution. When necessary, either wait for running
jobs to complete or preempt them, thus ensuring mutual exclusion between
execution modes.

Unlike a mutex, the rw_semaphore used in this context allows multiple
submissions in the same mode.

v2: Use lockdep_assert_held_write, add annotations (Matt Brost)

v3: Fix kernel doc, remove redundant code (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 75 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  5 ++
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 7ff470eb850e..e7cb27a38424 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -211,3 +211,78 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 
 	return 0;
 }
+
+static int switch_mode(struct xe_hw_engine_group *group)
+{
+	int err = 0;
+	enum xe_hw_engine_group_execution_mode new_mode;
+
+	lockdep_assert_held_write(&group->mode_sem);
+
+	switch (group->cur_mode) {
+	case EXEC_MODE_LR:
+		new_mode = EXEC_MODE_DMA_FENCE;
+		xe_hw_engine_group_suspend_faulting_lr_jobs(group);
+		break;
+	case EXEC_MODE_DMA_FENCE:
+		new_mode = EXEC_MODE_LR;
+		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
+		break;
+	}
+
+	if (err)
+		return err;
+
+	group->cur_mode = new_mode;
+
+	return 0;
+}
+
+/**
+ * xe_hw_engine_group_get_mode() - Get the group to execute in the new mode
+ * @group: The hw engine group
+ * @new_mode: The new execution mode
+ * @previous_mode: Pointer to the previous mode provided for use by caller
+ *
+ * Return: 0 if successful, -EINTR if locking failed.
+ */
+int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
+				enum xe_hw_engine_group_execution_mode new_mode,
+				enum xe_hw_engine_group_execution_mode *previous_mode)
+__acquires(&group->mode_sem)
+{
+	int err = down_read_interruptible(&group->mode_sem);
+
+	if (err)
+		return err;
+
+	*previous_mode = group->cur_mode;
+
+	if (new_mode != group->cur_mode) {
+		up_read(&group->mode_sem);
+		err = down_write_killable(&group->mode_sem);
+		if (err)
+			return err;
+
+		if (new_mode != group->cur_mode) {
+			err = switch_mode(group);
+			if (err) {
+				up_write(&group->mode_sem);
+				return err;
+			}
+		}
+		downgrade_write(&group->mode_sem);
+	}
+
+	return err;
+}
+
+/**
+ * xe_hw_engine_group_put() - Put the group
+ * @group: The hw engine group
+ */
+void xe_hw_engine_group_put(struct xe_hw_engine_group *group)
+__releases(&group->mode_sem)
+{
+	up_read(&group->mode_sem);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
index 857a83787504..e0deb7c7bb5b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
@@ -17,4 +17,9 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt);
 int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
 void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
 
+int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
+				enum xe_hw_engine_group_execution_mode new_mode,
+				enum xe_hw_engine_group_execution_mode *previous_mode);
+void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
+
 #endif
-- 
2.43.0

