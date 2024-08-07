Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B13EC3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 16:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0696910E582;
	Wed,  7 Aug 2024 16:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAflfBAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAE610E582
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723047887; x=1754583887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mi2pFaomz5pCLTzdul/YSrk6tndoohEmeQKPBNIGFhE=;
 b=IAflfBAOn3T1b1yi2DjyHyusSe9vgw7T4D+CmFgV2vH6Im5QiBNV/ytl
 k5Q/18sN9eOXCiBc0tieTe11qh5qMYyxGvoZNvSWvUD0DxtjJ1wjrqBTl
 OL/NbajmGx8IhVhbx+tQoJbSZ49wp2XHudOi6mohFro3Tl7tZPDEacZRa
 T636jFFf0AEQhCF33FZnwtmZEq2wJMs6GZxMd54cJGOa1ZvxXnIBpobw2
 C7Fbedj3zXm+vAwvxayJK/lgGi4DHb7mfyHdoOM57S9baWaIBQUb4VK/8
 HH0yojnkpjzvk9D9lw4OAIz7VtHt9RSxaww2k/KGA4wuDiC4a9ym+K8dS Q==;
X-CSE-ConnectionGUID: 6oc2wAewTBqh1BzIimmI5w==
X-CSE-MsgGUID: q3Lw65I1SX2PPctEmjVNxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24040443"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="24040443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:47 -0700
X-CSE-ConnectionGUID: 3jJ7/ILRQMaowzrjFBalyA==
X-CSE-MsgGUID: afuKv9ybQhiVadER7HSgpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="61790957"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 09:24:41 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v7 04/13] drm/xe/hw_engine_group: Add helper to suspend
 faulting LR jobs
Date: Wed,  7 Aug 2024 18:23:33 +0200
Message-ID: <20240807162416.1307061-5-francois.dugast@intel.com>
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
index 52e1dc78518e..3f74ff577a4c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -155,3 +155,28 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 
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

