Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4BAC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF11610EAEE;
	Wed, 17 Jul 2024 13:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnfOCVsU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8159D10EAF2
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221730; x=1752757730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I8HZVUD0zksn+wJVedoFAaB/whQ5ctTOrNXcag/qZ7k=;
 b=DnfOCVsUnpr6fHZV+rgEMxmNgOtpaNIbF22rEw9tU5x55xBHjR5YJmpY
 cowy/6YbvtALtpO3SKRVwwT9EXVpxvIJob1lGP4HkW6p69ksRcWPQAbJZ
 ro+tHioyoihugUtiSPKTHbh0CW4gbriAkTNR7iBKj+z8BQcPAzCkJTo9e
 a2zZ5AFtAozZT/uk9DER6mS3egCxsn3hX8dPbFhJ7kdzyhtwrZv1NvsmD
 I4s8h5nnkqIWPzLGl3qyBZ8DCaGzZ/1XrrIqQqdM4o7dn2d0qco9CnXS9
 MH+du6gVKWrKWD+YPb+mocuPQ/NF+HzEUq+dmz+CFd2g9h3zlsHZ1zvFo Q==;
X-CSE-ConnectionGUID: g6qBh8hVT62syskerpm4OA==
X-CSE-MsgGUID: T6kadWMgRtKSf5ea2s/TBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832075"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832075"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:50 -0700
X-CSE-ConnectionGUID: KG+oS/jaQ0yxoiRPIvtWCw==
X-CSE-MsgGUID: +lEZC5HDT2OOIhqM26nktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55532041"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:48 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 6/9] drm/xe/hw_engine_group: Ensure safe transition between
 execution modes
Date: Wed, 17 Jul 2024 15:07:27 +0200
Message-ID: <20240717130821.1073379-7-francois.dugast@intel.com>
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

Provide a way to safely transition execution modes of the hw engine
group ahead of the actual execution. When necessary, either wait for
running jobs to complete or preempt them, thus ensuring mutual
exclusion between modes EXEC_MODE_LR and EXEC_MODE_DMA_FENCE.

Unlike a mutex, the rw_semaphore used in this context allows multiple
submissions in the same mode.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 67 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  3 ++
 2 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index dc75dfe6187a..4f539711357a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1278,3 +1278,70 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 
 	return 0;
 }
+
+static int switch_mode(struct xe_hw_engine_group *group,
+		       enum xe_hw_engine_group_execution_mode new_mode)
+{
+	int err = 0;
+
+	lockdep_assert_held(&group->mode_sem);
+
+	if (group->cur_mode == new_mode)
+		return 0;
+	else if (group->cur_mode == EXEC_MODE_LR && new_mode == EXEC_MODE_DMA_FENCE)
+		err = xe_hw_engine_group_suspend_lr_jobs(group);
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
+ *
+ * Return: 0 if successful, -EINTR if locking failed.
+ */
+int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
+				enum xe_hw_engine_group_execution_mode mode)
+{
+	int err = down_read_interruptible(&group->mode_sem);
+
+	if (err)
+		return err;
+
+	if (mode != group->cur_mode) {
+		up_read(&group->mode_sem);
+		err = down_write_killable(&group->mode_sem);
+		if (err)
+			return err;
+
+		if (mode != group->cur_mode) {
+			err = switch_mode(group, mode);
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
+{
+	up_read(&group->mode_sem);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index ce59d83a75ad..fce0adf6a7c4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -73,5 +73,8 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
 
 int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
 int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
+int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
+				enum xe_hw_engine_group_execution_mode mode);
+void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
 
 #endif
-- 
2.43.0

