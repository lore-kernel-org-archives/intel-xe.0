Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9F8C71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 07:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308A910E031;
	Mon, 16 Jun 2025 07:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlH/9Lgz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C2310E031
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750058764; x=1781594764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3ILkOvbEntwt5WB5bFz48dxDxyLulcpX+invlQe1SYo=;
 b=RlH/9Lgzd7HJ8LMgQRSKTyrwlUQr98yeq3ISueM9mTi2G8DwO7R1SQ9K
 tINiI35UNnFLA5tGtCu8LkzSIdIjFW+DD8EPQXbBGvObXedj12RY93kvB
 KJovpFowhU9ih153hlDNFv4cSddJKDMxq3ILYHOyg64EZasubPHqd0MvG
 WrinCrBggnFJIb05IkqhSc47fX/uyr3BrVahT9wIsQN2X0h30bIgtq77s
 cliaATZD+pfA9TBLnuhIizwSCVKNgraDfOus1Sjhv2cSiXGUdOY6rPArA
 0GRqpjpNcJVfnBKqt+jb9JePA513p1DCko3UF0w2nu/Pj4a+6zJJn1myx g==;
X-CSE-ConnectionGUID: fIf1wKYzRSiOfjFOWA9SAg==
X-CSE-MsgGUID: HTXB2XgFSKeZiZ69bT1RUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69768756"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="69768756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:26:03 -0700
X-CSE-ConnectionGUID: U0DyDC59RAqMoS++XvHBwA==
X-CSE-MsgGUID: 3RPIPrU0S8iUMzvdNX8/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148228519"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:26:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com
Subject: [PATCH v2] drm/xe: Use RCU free for exec queue, not GuC exec queue
Date: Mon, 16 Jun 2025 00:27:37 -0700
Message-Id: <20250616072737.2062805-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The exec queue name is used in dma-fence timelines, not the GuC exec queue.
Therefore, the exec queue itself requires RCU freeing rather than the
GuC exec queue.

Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the safe access rules")
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c           | 7 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h     | 2 ++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 2 --
 drivers/gpu/drm/xe/xe_guc_submit.c           | 7 +------
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fee22358cc09..d8c3e983ffb6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -47,7 +47,11 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 	if (q->xef)
 		xe_file_put(q->xef);
 
-	kfree(q);
+	/*
+	 * RCU free due sched being exported via DRM scheduler fences
+	 * (timeline name).
+	 */
+	kfree_rcu(q, rcu);
 }
 
 static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
@@ -82,6 +86,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
+	init_rcu_head(&q->rcu);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cc1cffb5c87f..a17fe852fc0d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -43,6 +43,8 @@ struct xe_exec_queue {
 
 	/** @gt: GT structure this exec queue can submit to */
 	struct xe_gt *gt;
+	/** @rcu: For safe freeing of exported dma fences */
+	struct rcu_head rcu;
 	/**
 	 * @hwe: A hardware of the same class. May (physical engine) or may not
 	 * (virtual engine) be where jobs actual engine up running. Should never
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index a3f421e2adc0..4c39f01e4f52 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -20,8 +20,6 @@ struct xe_exec_queue;
 struct xe_guc_exec_queue {
 	/** @q: Backpointer to parent xe_exec_queue */
 	struct xe_exec_queue *q;
-	/** @rcu: For safe freeing of exported dma fences */
-	struct rcu_head rcu;
 	/** @sched: GPU scheduler for this xe_exec_queue */
 	struct xe_gpu_scheduler sched;
 	/** @entity: Scheduler entity for this xe_exec_queue */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index df7a5a4eec74..7170e78e5b8e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1299,11 +1299,7 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
 
-	/*
-	 * RCU free due sched being exported via DRM scheduler fences
-	 * (timeline name).
-	 */
-	kfree_rcu(ge, rcu);
+	kfree(ge);
 	xe_exec_queue_fini(q);
 	xe_pm_runtime_put(guc_to_xe(guc));
 }
@@ -1486,7 +1482,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	q->guc = ge;
 	ge->q = q;
-	init_rcu_head(&ge->rcu);
 	init_waitqueue_head(&ge->suspend_wait);
 
 	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
-- 
2.34.1

