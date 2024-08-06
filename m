Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6906BC52D71
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6EA10E3E9;
	Tue,  6 Aug 2024 19:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nO0t1Vf9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223E810E3F1
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972483; x=1754508483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7eTNZgVYPLiuN98gXnZxXDMdgwCLgYL/29lzs/8ApWY=;
 b=nO0t1Vf9TKg7dXyLuu0i80WHMFvdCOdKP24c59mkeOES50txx1eejCay
 BiKNNQYSkrL4NvlVOEMZo1VuPYPYLW1NnrZI34KoZGRLur94FfpBstTLO
 CxwYzitYV5AhsVY7KySnav+sc5c5m7Lay7P8zOuXEorBhzqk3YX+6sXSL
 lKlqdl9hyng2SxBSDVwGUXX/x5eyNdQ5Ydsb7ENTVCuZ61q5oVS+vy8OR
 qE02nbN6+5474nNfaCJFvPqrU+p7/VYWzc2tt+RfW49xEIbma2/7I24Se
 pr/BIYFqXIRQuw68Uoab7rsqNs2CRlHGOUzzI8LKt7BtD9L6MOweLaq/6 g==;
X-CSE-ConnectionGUID: ZQ2qcKEoQyehwYruOBDfEg==
X-CSE-MsgGUID: WjlzJeI8Rb29/iY0umZHZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682124"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682124"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:03 -0700
X-CSE-ConnectionGUID: meKZiBzFQfa/eBcNQ8dxyA==
X-CSE-MsgGUID: dNeDrIN/R7O0exht2293/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585038"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:01 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 04/13] drm/xe/hw_engine_group: Add helper to suspend
 faulting LR jobs
Date: Tue,  6 Aug 2024 21:27:02 +0200
Message-ID: <20240806192739.1076344-5-francois.dugast@intel.com>
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
index 3a54da17a9a7..dfdff26f2eb9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -153,3 +153,28 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 
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

