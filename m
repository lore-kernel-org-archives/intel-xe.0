Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B124C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0623A10E966;
	Thu,  1 Aug 2024 12:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MS4n6n+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4460510E966
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517109; x=1754053109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PSBObJm2TX9KH/xZfG1XxNYrnLoO5N9dVK6Xv61z/wo=;
 b=MS4n6n+1EYlB2nlDpzO7la8UHFBdzP+kknFE9OhHxz3nwB7oUtj9jfbO
 8AEX8L2rk53lNBmI5RdNewCbRy8WElyqt32RcGg3Tem9j/tHHXec9VfRF
 WUoSsCeOtoj/HFs9wk5lEtFKQ116KptXPWQVwUD5OWWeeVwQ5TjSxCuZb
 hdnIQmJnEX6tBNtz7XVh4NMdyf4kpDosik5zMq2xrMPmTEktimHAonNKF
 fiCMF0FD1K6xdiLgLQNkUsYRxvWonckQmWZvQ6X8pb435ZM+bKufNfNVo
 kxlv/I8/O4PeMYncyRXkdHgQyME/+SnBCrEjXqL5UE9kPh+WYhy+l76LB g==;
X-CSE-ConnectionGUID: zGhI4rW8RmygO+KbxHrHZA==
X-CSE-MsgGUID: N+elgAQURHmdvboMDY78ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357154"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357154"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:20 -0700
X-CSE-ConnectionGUID: MOld7MDLTyaAKaeweCo82Q==
X-CSE-MsgGUID: Mwk0IXLUSiu9fYZf9AL9yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110102"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:19 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 08/13] drm/xe/hw_engine_group: Ensure safe transition
 between execution modes
Date: Thu,  1 Aug 2024 14:56:49 +0200
Message-ID: <20240801125748.355078-9-francois.dugast@intel.com>
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

Provide a way to safely transition execution modes of the hw engine group
ahead of the actual execution. When necessary, either wait for running
jobs to complete or preempt them, thus ensuring mutual exclusion between
execution modes.

Unlike a mutex, the rw_semaphore used in this context allows multiple
submissions in the same mode.

v2: Use lockdep_assert_held_write, add annotations (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 71 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  5 ++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index de057c98d5a5..a5754e6de7c9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -208,3 +208,74 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 
 	return 0;
 }
+
+static int switch_mode(struct xe_hw_engine_group *group,
+		       enum xe_hw_engine_group_execution_mode new_mode)
+{
+	int err = 0;
+
+	lockdep_assert_held_write(&group->mode_sem);
+
+	if (group->cur_mode == EXEC_MODE_LR && new_mode == EXEC_MODE_DMA_FENCE)
+		xe_hw_engine_group_suspend_faulting_lr_jobs(group);
+	else if (group->cur_mode == EXEC_MODE_DMA_FENCE && new_mode == EXEC_MODE_LR)
+		err = xe_hw_engine_group_wait_for_dma_fence_jobs(group);
+	else
+		err = -EINVAL;
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
+ * @mode: The new execution mode
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
+			err = switch_mode(group, new_mode);
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

