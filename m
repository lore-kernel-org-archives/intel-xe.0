Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0DDC52D7D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC36F10E96C;
	Fri,  9 Aug 2024 15:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EqSicIEj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D5410E96B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723218737; x=1754754737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hUNuIhQsC0TzslNlJrFss9HAxqAVA3gCr2Hk380+GVo=;
 b=EqSicIEjN7gfHQccgyjRBLtO6urV3IiBTHiSBVMJ79c+awBOTZyzGFLz
 e0RBLUMLElz25n/ukGudZKsT4XhHmN8CMlRxIxakzsUd1egb0oy3O5tut
 QFOBlYj+39Ag5v8z/KnGJwjfB3MKhJT6UfsACRhNcOBb/fvg0NmdFQ9fx
 rJU5l3xicvPha0XqaXbTl71LLMCLGdblXNEvH1MwPK35EdP5RTv0l/SEx
 5y9UAQCPL6sIS41VpFBnjBU/7naMzizIItafQEVT7dML90IPYkwaVGCIF
 HSHvR+U2L4hpcW1mJS9lf+ZaydZlImFlAfVCCKvfhqVW6fguMBBAICljU g==;
X-CSE-ConnectionGUID: ZAlcVpAbTV2WY47d7nagiw==
X-CSE-MsgGUID: XQeI1uI7R12O7u+vZ3cX3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21207387"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21207387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:17 -0700
X-CSE-ConnectionGUID: c3c09TQfQ8aMaaQ8K2hadQ==
X-CSE-MsgGUID: z0PBBwBoRB6nSX4FNHaqeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="61728797"
Received: from sbutnari-mobl1.ti.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:52:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v9 04/11] drm/xe/hw_engine_group: Add helper to suspend
 faulting LR jobs
Date: Fri,  9 Aug 2024 17:51:29 +0200
Message-ID: <20240809155156.1955925-5-francois.dugast@intel.com>
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

This is a required feature for dma fence jobs to preempt faulting long
running jobs in order to ensure mutual exclusion on a given hw engine
group.

v2: Pipeline calls to suspend(q) and suspend_wait(q) to improve
    efficiency, switch to lockdep_assert_held_write (Matt Brost)

v3: Return error on suspend_wait failure to propagate on the call stack
    up to IOCTL (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

