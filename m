Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8FBC52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FE310E96D;
	Fri,  9 Aug 2024 15:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFZazkOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E232D10E96D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723218743; x=1754754743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yfh6sM1p3nyrFbtwo/6MsgsGzDKLC+U2/7VtZx0NckQ=;
 b=mFZazkOLu+c9Rc0bmGAD1nwZ9k2xTlc3nvDynzNj0Vujwzta5QLqRbjJ
 mdpXgI5CQ+PP8dbo7iMBueK5Yc25gmFbgvoqBjoRe4OLzdlHVxMO2Rskd
 6YDEel4ln1rV8Ngmk5ofSdnvaP9rCKuXtykVZ5BSDqqdtchHc7QNdWNTt
 RL72q3Ff3puIT8AtaIH+HJYXd7k331I7Nv0RmflFdLIwPRbiTiuPrPHB5
 /umwYAivtHfS1iyPmuDrCTDiZz4nON6FGUVVf3iVPHvTispgXhSm52kZY
 6W+3dZIspWPAsJ5APCJShGLTn87dUbYyKVPXORJsi+DLv1Pjrx9ws1HZT A==;
X-CSE-ConnectionGUID: D04Ucaj6QtOxHpjwSu4nTQ==
X-CSE-MsgGUID: d/w1IfKzQNqnIWz2GGCJtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21207406"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21207406"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:23 -0700
X-CSE-ConnectionGUID: UU5ORiqUR4WG/mh7DS/G/g==
X-CSE-MsgGUID: 4SIc03veTYm12OgwpXIowg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61728839"
Received: from sbutnari-mobl1.ti.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:21 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v9 08/11] drm/xe/hw_engine_group: Ensure safe transition
 between execution modes
Date: Fri,  9 Aug 2024 17:51:33 +0200
Message-ID: <20240809155156.1955925-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809155156.1955925-1-francois.dugast@intel.com>
References: <20240809155156.1955925-1-francois.dugast@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

