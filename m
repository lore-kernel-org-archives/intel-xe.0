Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBE6C52D7B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C45410E7D1;
	Thu,  8 Aug 2024 18:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wve+SR5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5278910E7D1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142559; x=1754678559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pGVfNYCSxT1rbtnA6qE8j2l74jJ0GOCMwevvFA+yV2k=;
 b=Wve+SR5FLnwGqmJ6iP4mVAtuCWF9/Dn14fI175Wqpw7l1lvxd7Tha7La
 1Wd6BkVqSjnlfwthKN61U2CUJKJctAwZ0/hVkBoLdJr2FjqFfPMgxCu7F
 eJxyILnIH3bGAOW6c2jHPCGsfykZjaQJvvBVqHZsmBEVJsXB7oCYFqmQA
 asPIy+r79Tx8zJ0eMHarxqyxdQfC3nB9G7P7iOUHi8qZqwnrvMjD3d5YA
 UJkdykCLuUfvg7qLLyBNdJ7snBVF2yUeQHoVtccX+2jAZIZzj/8CQsguq
 2ZBuuLkVPrgAY8gvvPdCg5UAVGEMmVgJ8l5ATNnL6O9SeMvSjCMEgny/s Q==;
X-CSE-ConnectionGUID: bFKYpAwCT0uXJnZXbIKKew==
X-CSE-MsgGUID: RAe9LdhxQO69rE7S342IHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921590"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921590"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:39 -0700
X-CSE-ConnectionGUID: dpKFpUkyQ6e30gsiFq6aRg==
X-CSE-MsgGUID: IOZ1IJtaT8WiWOpTQYLgjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975919"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:37 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 04/11] drm/xe/hw_engine_group: Add helper to suspend
 faulting LR jobs
Date: Thu,  8 Aug 2024 20:40:22 +0200
Message-ID: <20240808184220.1715625-5-francois.dugast@intel.com>
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

This is a required feature for dma fence jobs to preempt faulting long
running jobs in order to ensure mutual exclusion on a given hw engine
group.

v2: Pipeline calls to suspend(q) and suspend_wait(q) to improve
    efficiency, switch to lockdep_assert_held_write (Matt Brost)

v3: Return error on suspend_wait failure to propagate on the call stack
    up to IOCTL (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index b362af7ffab5..8659332012dd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -166,3 +166,39 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 
 	up_write(&group->mode_sem);
 }
+
+/**
+ * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
+ * @group: The hw engine group
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group *group)
+{
+	int err;
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
+		err = q->ops->suspend_wait(q);
+		if (err)
+			goto err_suspend;
+	}
+
+	return 0;
+
+err_suspend:
+	up_write(&group->mode_sem);
+	return err;
+}
-- 
2.43.0

