Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45239C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD25910EAF4;
	Wed, 17 Jul 2024 13:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDNj8ogt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024AF10EAEF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721221728; x=1752757728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I+wwYOIsCuwS/MbSpNTgL2AP4aq92kwzOx3FYp6RFmI=;
 b=QDNj8ogtLmNMpiQtMxkxYWs4LK9BSt/UgrRa7U/C8oj9Yw4BQow3eehF
 m/Yz/jFf9PG27hlEpgTrSYZxn6GaCH3V1Vj+3p2WFwj1dtpF7Gq2i9XJK
 h/WSuEB89WNsbAyxaoc/4bt14ipXr5qs3ydNx2yHkipApLUbfTEtKWYsq
 8MXhydvfcTaoO55KvyhKc9ppwMGgDmHSeaMl25kYLv09Ei/wUBQQg8k6q
 LkecwKo2lns/Ux8CcAVLiU9OwpjKPQuLJrQatxvzOLTMEeMpccdAV/fEd
 RqIaKhl6iOqH4BDYnV3gtNrooY/yWzMR3YdY0dj0Lb05LdqvpcNVw1Ysy A==;
X-CSE-ConnectionGUID: SFWRkNQyQp+qRzmCxcTk5A==
X-CSE-MsgGUID: a24PhT8bQdSYp4ydm9KkcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18832071"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18832071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:48 -0700
X-CSE-ConnectionGUID: EG4unTLmQKCdwjQg5iOSJA==
X-CSE-MsgGUID: ghTlzptYTFWtu5+bhOVryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="55532029"
Received: from rajritu-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.217.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:08:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [RFC v1 5/9] drm/xe/hw_engine_group: Add helper to wait for dma fence
 jobs
Date: Wed, 17 Jul 2024 15:07:26 +0200
Message-ID: <20240717130821.1073379-6-francois.dugast@intel.com>
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

This is a required feature for long running jobs not to be submitted
while dma fence jobs are running on the hw engine group.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 850f7b15b154..dc75dfe6187a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1251,3 +1251,30 @@ static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
 
 	return 0;
 }
+
+/**
+ * xe_hw_engine_group_wait_for_dma_fence_jobs() - Wait for dma fence jobs to complete
+ * @group: The hw engine group
+ *
+ * Return: 0 on success,
+ *	   -ETIME if waiting for one job failed
+ */
+static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group *group)
+{
+	long timeout;
+	struct xe_exec_queue *q;
+
+	lockdep_assert_held(&group->mode_sem);
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (xe_vm_in_lr_mode(q->vm))
+			continue;
+
+		timeout = dma_fence_wait(q->last_fence, false);
+
+		if (timeout < 0)
+			return -ETIME;
+	}
+
+	return 0;
+}
-- 
2.43.0

