Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D386C52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE8F10E3F3;
	Tue,  6 Aug 2024 19:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xpzjemhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141310E3F3
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972488; x=1754508488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RkEnjYf8y8v12q1CHKHLhNgb5bWyf2+2Q7uaF3+UCqM=;
 b=XpzjemhcYfxpXMs4E7ORXADQVWR+VnOmBFbj3OAAkWy/QTLA8dTXwDaf
 fdY7ul7D3PNjCQ2nHCmGypG/lOA7KnnXoHBsIrR+8T1M9p4jFAEs5Sjts
 J3TIaduZKwdyQd+/0dtcy3Nox66G+eRJZWKYfgz1Fw5mqBPROc7d9ZfYU
 MZz121JLi4bcteCPIWesr+JUYgq21a8SniahmFWqNmbtMAPnLMYPE0WBc
 /29zMVTGecCOQ8H4o1ZrnsOl4qSP/kzY6odbPxXPJDxOslxhUgDKp3H6s
 xQ8R2nHqj5BsyN5wNRjwTIhn1dNY6nthx342bfZuwvwDhSpaZVa6Kgi6m w==;
X-CSE-ConnectionGUID: 5GbSOcEVSm6WukNKK2KS/w==
X-CSE-MsgGUID: hr5PPmyoR+CzIVL6FjqI5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31682129"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="31682129"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:08 -0700
X-CSE-ConnectionGUID: pyKZMyJVTAqla9kxUDZZiw==
X-CSE-MsgGUID: 5aUR+EpwQw2d0KugP4NskQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56585076"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:28:06 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v6 07/13] drm/xe/hw_engine_group: Add helper to wait for dma
 fence jobs
Date: Tue,  6 Aug 2024 21:27:05 +0200
Message-ID: <20240806192739.1076344-8-francois.dugast@intel.com>
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

This is a required feature for faulting long running jobs not to be
submitted while dma fence jobs are running on the hw engine group.

v2: Switch to lockdep_assert_held_write in worker, get a proper reference
    for the last fence (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index dfdff26f2eb9..7ff470eb850e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -178,3 +178,36 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
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

