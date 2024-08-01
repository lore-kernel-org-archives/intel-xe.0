Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3261BC52D54
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32EC10E960;
	Thu,  1 Aug 2024 12:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWGWwuRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C4510E95F
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517095; x=1754053095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/TWKNpn+MnaBYkjBxZTzinYsTLDszlAKt907usXfj5c=;
 b=KWGWwuRMKkzERBXAXpYoWAcft9JdgTSSMBPWl4Lpr5HqHezY9l6HAxkb
 RyACTO6vuEpz9FdLnoqKP/R1YTu7594VH/st0fqTPGhzB8YhQ5R/KEqsX
 uvp2jbyl3rvsRtBibJIC5mtgOJgPB3tMmCm6FCZ0qd2awh7/ojfrvJvJE
 ZVoF45M52wQq4ZZzhAe7j5lrFLi9Wq+nL9bl9jPHLYRk9SjiRMCifDzTw
 iUYqiGPJS9RMF83eP95OPbKSIxcW5qzMz/wzHyob0uegWXghcmNNzbeho
 yGScbMNuyv+dJeB9BFTyNOBnayPmWuab+ccr8kcP6U9+F9qUHar1cTB39 Q==;
X-CSE-ConnectionGUID: P2gUMWkmSMmR34L9dWwLtg==
X-CSE-MsgGUID: 0V7S8l4cSHW+KBB52TT5ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357132"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357132"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:14 -0700
X-CSE-ConnectionGUID: 8OBuajH2RMOuKaFc3roGMQ==
X-CSE-MsgGUID: IhFHK97tSsWcrrV+HXrM1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110072"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:13 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 04/13] drm/xe/hw_engine_group: Add helper to suspend
 faulting LR jobs
Date: Thu,  1 Aug 2024 14:56:45 +0200
Message-ID: <20240801125748.355078-5-francois.dugast@intel.com>
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

This is a required feature for dma fence jobs to preempt faulting long
running jobs in order to ensure mutual exclusion on a given hw engine
group.

v2: Pipeline calls to suspend(q) and suspend_wait(q) to improve
    efficiency, switch to lockdep_assert_held_write (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 7a43d6b77753..24d998a7b6bb 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -150,3 +150,28 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 
 	up_write(&group->mode_sem);
 }
+
+/**
+ * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
+ * @group: The hw engine group
+ */
+static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group *group)
+{
+	struct xe_exec_queue *q;
+
+	lockdep_assert_held_write(&group->mode_sem);
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (!xe_vm_in_fault_mode(q->vm))
+			continue;
+
+		q->ops->suspend(q);
+	}
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (!xe_vm_in_fault_mode(q->vm))
+			continue;
+
+		q->ops->suspend_wait(q);
+	}
+}
-- 
2.43.0

