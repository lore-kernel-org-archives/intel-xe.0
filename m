Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF120C47073
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B1110E340;
	Wed,  3 Jan 2024 18:44:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E7910E0BA
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704307449; x=1735843449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VPDh0C3PHWxeiZuGoySJ3VFOQ26XDw51XwopcaUbrgE=;
 b=YSPi9ZRikZYjB3UjhiEfzihcuQzrSKNMDAK2aKTqFowsuhzBuyR7iy24
 W/LvdNNb/VnGjsg5xyJRMxkJeHPc87FX4rNNJCEV/qDE1pl2zf2bTz6mA
 /D1jPQpAhgMn9EhxyYVpbpY68OJF5OYCWm8z7LpVWJ6G3HDMPiFymqI0M
 7rng9LATTw4KA6Mkll5Gue5udvtHC9KfKD0IHrx4nQ1d0EPIfQkh6Kgu7
 O8E2/wC/NxWQN+QPaMxrDDWjUMMsDijzKHJ95XkgCpFIr+0bgFErCiCNv
 BBEWF7lCVaItNVXvzw018vgE5+aJeNg9/6bSBG6TL0KG3Ik6C9aBQ5G5N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3815685"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="3815685"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="814330130"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="814330130"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:44:08 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/xe: Add exec_queue.sched_props.priority
Date: Wed,  3 Jan 2024 10:44:06 -0800
Message-ID: <20240103184408.17844-4-brian.welty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103184408.17844-1-brian.welty@intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
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

v2: fix existing bug such that q->sched_props.priority is now set
    before guc_exec_queue_add_msg() (Matt)
    fix existing bug in that xe_migrate_init() should use exec_queue's
    vfunc for updating priority.

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
index 56c0a7bf554f..392cbde62957 100644
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
@@ -1301,15 +1300,15 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 {
 	struct xe_sched_msg *msg;
 
-	if (q->priority == priority || exec_queue_killed_or_banned(q))
+	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
+	q->sched_props.priority = priority;
 	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
-	q->priority = priority;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index adf1dab5eba2..f967fa69769e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -356,7 +356,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_CAST(m->q);
 	}
 	if (xe->info.has_usm)
-		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
+		m->q->ops->set_priority(m->q, XE_EXEC_QUEUE_PRIORITY_KERNEL);
 
 	mutex_init(&m->job_mutex);
 
-- 
2.43.0

