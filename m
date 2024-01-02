Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B459AC4707B
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 21:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779AF10E222;
	Tue,  2 Jan 2024 21:17:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4045E10E237
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 21:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704230252; x=1735766252;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YgKUeUzULw6Ly9eCjArAH65Y/zLV9qPJWWypsWmofKM=;
 b=YyCXMwcE2E72EgmCG9QaiD9LHihAmBQRH4ghf/Q0ibWVm82PW2psE5tu
 eYqF7SiaQXocaNJG9kkJtY0kn+0JsGUvR3a2kwU94v/suSPLOEyCbPN5C
 8QU4151jlt+v/8id9xWdJ+6MPPfB7twO9UbtvgyGh3S6QG2MPxWNDa/00
 F8Ahc0fi2xtguXS95Fea4Kie449x8fQWqi8zPWh4xl2SglSbTWgaz010i
 UjRlmb9NQa2lROlU4mCl8v64lQf+YA2YDBGMh4GQs/RI67Zu1FMdZkXh4
 z5sPkjuyBI/QICSULjVDEl5ISc7XcNJZ6Tz3PZSZBqT8WkwJi7YhT7TDk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396654457"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="396654457"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="898648797"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="898648797"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 13:17:31 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Add exec_queue.sched_props.priority
Date: Tue,  2 Jan 2024 13:17:30 -0800
Message-ID: <20240102211731.6720-4-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102211731.6720-1-brian.welty@intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
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

The purpose here is to allow to optimize exec_queue_set_priority()
in follow-on patch.  Currently it does q->ops->set_priority(...).
But we'd like to apply exec_queue_user_extensions much earlier and
q->ops cannot be called before __xe_exec_queue_init().

It will be much more efficient to instead only have to set
q->sched_props.priority when applying user extensions. That value will
then already be set to the user requested value. So the setting of
default value is moved from q->ops->init() to __xe_exec_queue_alloc.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c       | 7 +++----
 drivers/gpu/drm/xe/xe_migrate.c          | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e78b13845417..9891cddba71c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -67,6 +67,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 				hwe->eclass->sched_props.preempt_timeout_us;
 	q->sched_props.job_timeout_ms =
 				hwe->eclass->sched_props.job_timeout_ms;
+	q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
 	if (xe_exec_queue_is_parallel(q)) {
 		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 882eb5373980..6ae4f4e2ddca 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -52,8 +52,6 @@ struct xe_exec_queue {
 	struct xe_vm *vm;
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
-	/** @priority: priority of this exec queue */
-	enum xe_exec_queue_priority priority;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
@@ -144,6 +142,8 @@ struct xe_exec_queue {
 		u32 preempt_timeout_us;
 		/** @job_timeout_ms: job timeout in milliseconds */
 		u32 job_timeout_ms;
+		/** @priority: priority of this exec queue */
+		enum xe_exec_queue_priority priority;
 	} sched_props;
 
 	/** @compute: compute exec queue state */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6cbf41ad9c8c..0bd79089b633 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -421,7 +421,7 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
 	struct xe_device *xe = guc_to_xe(guc);
-	enum xe_exec_queue_priority prio = q->priority;
+	enum xe_exec_queue_priority prio = q->sched_props.priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
@@ -1231,7 +1231,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	err = xe_sched_entity_init(&ge->entity, sched);
 	if (err)
 		goto err_sched;
-	q->priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
 
 	if (xe_exec_queue_is_lr(q))
 		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
@@ -1301,7 +1300,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 {
 	struct xe_sched_msg *msg;
 
-	if (q->priority == priority || exec_queue_killed_or_banned(q))
+	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1309,7 +1308,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 		return -ENOMEM;
 
 	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
-	q->priority = priority;
+	q->sched_props.priority = priority;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index adf1dab5eba2..6567abcb3c6d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -356,7 +356,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_CAST(m->q);
 	}
 	if (xe->info.has_usm)
-		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
+		m->q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
 
 	mutex_init(&m->job_mutex);
 
-- 
2.43.0

