Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F52C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D5210E7D6;
	Thu,  8 Aug 2024 18:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6Ayfc5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5200D10E7D6
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142565; x=1754678565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dFVvLVGJLKJdd+WriZ7cz1IahWceh6XM5uuD8+AsKT0=;
 b=e6Ayfc5V9MvetdO9SSSN40oETW26XmOgWwF8viwtk/06+rvHKeZrBVcE
 7aoMEmUW80BRepa3XzEgAXp7F6Y56/CeXkSCYQmEEJOsLVdAKVAvNOJDz
 pZsMLKP7elofcxHDiR+1fl/cvgczTjPZNknMRcRjC7UI3mqA4NwAo57Bb
 POq85oq2/tbpvREABA0MHqPgAh/fIPoqmXR5p2FSPPPtf2scvoHm5llmM
 Un2X5fFhoy9uEmjeo/4bU+FEhdVZugLdb0kleqW2G6NmHUz6uPZ5/XsCW
 eGdy4khjYMt7oqIU8jAd1ECg0yLYAcP2mxEae6vCNa+JUwKTRWfKLvBXD w==;
X-CSE-ConnectionGUID: 1JMu4IsQRSafS6ldHgI9LA==
X-CSE-MsgGUID: flvjJU7hSfqBxcL6qXlO6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921604"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:45 -0700
X-CSE-ConnectionGUID: iDnDGmvuQlmG6TjM29UNCQ==
X-CSE-MsgGUID: ywTZuLnGRa+27/t9H94tnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975932"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:43 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 08/11] drm/xe/hw_engine_group: Ensure safe transition
 between execution modes
Date: Thu,  8 Aug 2024 20:40:26 +0200
Message-ID: <20240808184220.1715625-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
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

v4: Now that xe_hw_engine_group_suspend_faulting_lr_jobs can fail,
    propagate the error to the caller (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 75 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  5 ++
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 8d3ddfc4ee82..e6c235119351 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -235,3 +235,78 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 
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
+		err = xe_hw_engine_group_suspend_faulting_lr_jobs(group);
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

