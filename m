Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B4BC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 12:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A8E10E964;
	Thu,  1 Aug 2024 12:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdhIe8mE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE35710E961
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722517099; x=1754053099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F44oDyH78Ufz6VaZtaqA6bsJkQ0vh9sm2VzfEIaTnjU=;
 b=ZdhIe8mEezH306ygVoTid9Pia5EyxmRiY70wkm3/vjEbjbffwGtXYQYC
 PIJiYJ48KUQ5QfOYJfrknmX3kkelc72h8WsAwAofmKSPKP2QECUZX+d9T
 Wn7vGiHLLm6RrE0DFFhsSNhwwCx+ZPNDg/OHZ/7Y6GWbTb6w/Pc5IbCAC
 cVgipwb/e20CwXmENRsjwr3+tlK3drBcRrYplGeomJgSymSlG94Hdw5gq
 V0qRLR/TqzW+FuALqd6E9aKya8c3vz5eyVY8mhfYewXS6W4I4/j/Z/T9E
 7i5gNtbRqBRDGdFJXH7Y9VJp8oyU88GMUiVb4KQtt1xAPHNAKG5APNZvp A==;
X-CSE-ConnectionGUID: jqGdQoq3RhiNAlaCE59isQ==
X-CSE-MsgGUID: u0oAh6aTQ52KjyH3uoAAuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20357147"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20357147"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:19 -0700
X-CSE-ConnectionGUID: 9t/GhP/7TbikcTfK+IoD5Q==
X-CSE-MsgGUID: TeKy2xfCRUK2VZA6+cDw1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55110091"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:58:17 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 07/13] drm/xe/hw_engine_group: Add helper to wait for dma
 fence jobs
Date: Thu,  1 Aug 2024 14:56:48 +0200
Message-ID: <20240801125748.355078-8-francois.dugast@intel.com>
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

This is a required feature for faulting long running jobs not to be
submitted while dma fence jobs are running on the hw engine group.

v2: Switch to lockdep_assert_held_write in worker, get a proper reference
    for the last fence (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 24d998a7b6bb..de057c98d5a5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -175,3 +175,36 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
 		q->ops->suspend_wait(q);
 	}
 }
+
+/**
+ * xe_hw_engine_group_wait_for_dma_fence_jobs() - Wait for dma fence jobs to complete
+ * @group: The hw engine group
+ *
+ * This function is not meant to be called directly from a user IOCTL as dma_fence_wait()
+ * is not interruptible.
+ *
+ * Return: 0 on success,
+ *	   -ETIME if waiting for one job failed
+ */
+static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group *group)
+{
+	long timeout;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+
+	lockdep_assert_held_write(&group->mode_sem);
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (xe_vm_in_lr_mode(q->vm))
+			continue;
+
+		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
+		timeout = dma_fence_wait(fence, false);
+		xe_exec_queue_last_fence_put_for_resume(q, q->vm);
+
+		if (timeout < 0)
+			return -ETIME;
+	}
+
+	return 0;
+}
-- 
2.43.0

