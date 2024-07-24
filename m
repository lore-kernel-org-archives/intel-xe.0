Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0289C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 19:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1A10E7A6;
	Wed, 24 Jul 2024 19:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIU+YpgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E9110E795
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 19:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721849706; x=1753385706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJhb87L6SQh6Xr/ycRugGdqYuXyUaxut/xz5+gpomZE=;
 b=YIU+YpgPfSY2jbKbIMiGhcalFevScVdEcqDnffjyKUqBVbSiVrETNhhd
 QLwCX9DGTUk81BxpQ3G4byTjNKNWWvRvKHjZEbeh4pKWCWtjEs/V/tRRO
 +j0xXwL3NrXkslpBXStVLR/q8QiVbfK0SEQYV4K7OZOTZOEhs0LWt1x3Z
 wcEN+HE6quZa/gtB1HGKbqu7IaFrIJpCJGJuqmOQM7JjZWgyIGdpLSyA2
 dROes2wIxSZd1oGsK/XrHPn5egv4+PdTiPH/FyPi916ffW64cxutyPv+G
 cJRj9WHr8tgABAzU2VgnCEtk7nOi/CDChlL9ZJ8VejpEvv+JHsddBmeX6 A==;
X-CSE-ConnectionGUID: 1wLM1GadS4WT2/GweFTTrg==
X-CSE-MsgGUID: F3Al/78sT8imHO6MF4taXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19691131"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19691131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:06 -0700
X-CSE-ConnectionGUID: cxpHMzEBQ+qoJ3VdT1SfCQ==
X-CSE-MsgGUID: 3evQ7aPkT7GW74uevfE0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83292253"
Received: from ntgaliba-mobl2.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.180])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 12:35:04 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2 04/12] drm/xe/hw_engine_group: Add helper to suspend
 faulting LR jobs
Date: Wed, 24 Jul 2024 21:32:57 +0200
Message-ID: <20240724193431.2685833-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724193431.2685833-1-francois.dugast@intel.com>
References: <20240724193431.2685833-1-francois.dugast@intel.com>
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
index da1515068850..4dabb0e8908a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -149,3 +149,28 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 
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

