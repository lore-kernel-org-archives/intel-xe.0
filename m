Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969D6C44501
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 06:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F7410E2A2;
	Tue, 14 Jul 2026 06:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXXu5urY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B04E10E2A2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 06:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784011453; x=1815547453;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kss67HHz1/6bE8qG0pp734Rgi2XPcd/8adGVIJ7Jj9g=;
 b=nXXu5urYUSFXBP+Ng2HtM6RxeNFLHuyqsYvGH69YkGtvPDAcQxR3PWQ7
 Xir6J3biDRZI8JLV+doyhn9GAYWCwbgpZxwP2nFIu+EscC/U/vNoUY4Lx
 jfY3BLXpkvpWH26kQVN1oTOnX76yJPIS2TIToio0ls9GQzu/Rj16vgkej
 fqgINO51VTgKKeFWoMToKKDvINp4wXalBnluhk/oFEim7D57SXL7utkcW
 tAEApx2xlmiXDQRggFNCJY++1IDlQOofmoiUc1/N7UN2o7EyArdS1Tv9o
 YKnSxZeWI3asuzPKniVK0rkZZMyAyDvxiXZjns8v4w5rLF057O6Cb9VE+ Q==;
X-CSE-ConnectionGUID: oo668Zz/RHyDa+dOI1a5Nw==
X-CSE-MsgGUID: qMgghajTRl2UIuqJAgPi4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="87168638"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="87168638"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 23:44:12 -0700
X-CSE-ConnectionGUID: n0qiYIZOSI+VN1IbHxPcLg==
X-CSE-MsgGUID: ylzcKTYrS6GVM80GqZB/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="260080068"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 23:44:10 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe/guc: Keep scheduler timeline name alive
Date: Tue, 14 Jul 2026 12:14:02 +0530
Message-ID: <20260714064402.2457257-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The scheduler keeps a pointer to the timeline name, but q->name
is freed with the exec queue while scheduler fences can still
reference it.

Store the name in struct xe_guc_exec_queue so it shares
the scheduler's RCU-deferred lifetime.

Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe access rules")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index e5e53b421f29..cda14d954e57 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -10,6 +10,7 @@
 #include <linux/workqueue.h>
 
 #include "xe_gpu_scheduler_types.h"
+#include "xe_hw_fence_types.h"
 
 struct dma_fence;
 struct xe_exec_queue;
@@ -24,6 +25,10 @@ struct xe_guc_exec_queue {
 	struct rcu_head rcu;
 	/** @sched: GPU scheduler for this xe_exec_queue */
 	struct xe_gpu_scheduler sched;
+	/**
+	 * @name: Scheduler timeline name, kept with @sched until RCU free.
+	 */
+	char name[MAX_FENCE_NAME_LEN];
 	/** @entity: Scheduler entity for this xe_exec_queue */
 	struct xe_sched_entity entity;
 	/**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cec3bbf3a10e..8ef6eeebfaa8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1978,6 +1978,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	xe_exec_queue_assign_name(q, q->guc->id);
 
+	strscpy(ge->name, q->name, sizeof(ge->name));
+
 	/*
 	 * Use primary queue's submit_wq for all secondary queues of a
 	 * multi queue group. This serialization avoids any locking around
@@ -1992,7 +1994,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
 			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			    q->name, gt_to_xe(q->gt)->drm.dev);
+			    ge->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_release_id;
 
-- 
2.43.0

