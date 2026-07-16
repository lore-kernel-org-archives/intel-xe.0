Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB69C43458
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 05:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FE310E2AE;
	Thu, 16 Jul 2026 05:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpaSX5+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7346E10E2AE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 05:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784178248; x=1815714248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0boY2maO2foWPh9XN97fAW+wsI4ivz56j1q0ZlYwQRE=;
 b=YpaSX5+q9S0c6lm+/m+l23U+9yqOnb37PrhHf/88mtHVfWuKVs8hVYeq
 V3fSAJ/7R+QNYyTPzSL2CFTseG74N0dP9KreYt3tgmuGbsuftKKgeEm3c
 j/HUQudBpjOl3t/ocJrZEv6jxyMpTMVvoZ021DLrJU3aou53Xoq3Xrv+g
 xCA/JiTV/zsUlUVPTscoRzCN2IhSx86UGDYpHIUe/FdK+OTgEy/+6OjMu
 o8CVz0M79dRxpp713Q1iru8B0DWjBSXJVKHDUmomBSAhqMe+BJImTwQBh
 j99mLOcGN6RFDccr6z03dp7zozi8PasG8xynnVyELc08w2UHoYSu5JgXQ Q==;
X-CSE-ConnectionGUID: v6BM5OcHRw+GBthkqEzjog==
X-CSE-MsgGUID: FsZAYJ/hT/m1JZiVxQ3sZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84710509"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84710509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:04:08 -0700
X-CSE-ConnectionGUID: tzm1+uUfTzKjMN4KsdKJIw==
X-CSE-MsgGUID: ElnLPnQ1R9ORXj05urgT6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="258360995"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:04:05 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 tejas.upadhyay@intel.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2] drm/xe/guc: Keep scheduler timeline name alive
Date: Thu, 16 Jul 2026 10:32:49 +0530
Message-ID: <20260716050249.3624905-1-arvind.yadav@intel.com>
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

v2:
  - Simplify @name kernel-doc wording. (Tvrtko)

Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe access rules")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index e5e53b421f29..53a073b1e55d 100644
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
+	 * @name: Scheduler timeline name.
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

