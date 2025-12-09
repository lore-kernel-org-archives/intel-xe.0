Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A905AD3B7FE
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A7010E48A;
	Tue,  9 Dec 2025 03:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WoGOOMSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDCC10E47C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 03:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250466; x=1796786466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DIMwD8Flh/PJH6KZwa5URt/BDmOUHbYlVEOzd1XeR1g=;
 b=WoGOOMSenavr+V+1aGN8aAlj5PAcsCDfUF/w74lJpRiOKOuYZwEkSud3
 IOlbfqijTlnEWBizvTMAtF0lvp6qe7wRHW+MRuBnfpapVYzt0z+rxM377
 6OyGRnLNEjskdTrdyh+cgLImHk1f1/0MPVx+HOV39WOGFCqNeIFAh11ex
 PmV5SwSQqgwTKCt0Un947Cou59P45454XUds2AQGKnawkFzaJEx0PrO9h
 Ir4kdjVRwC6dRatchGJlSuUGgKlEsTqDsJkwPZuKvNM/vvMmuuXfTdbKj
 sj9WeDf6KpBPpKyR94eL9qstD9E5g6Ox3T2jkx0hI4ZawmRD48Qf7/ami Q==;
X-CSE-ConnectionGUID: uU4Ija9BQAqjvX61J3p4sg==
X-CSE-MsgGUID: XfTc+XH+TB+4rq9oP9X+yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67254149"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67254149"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
X-CSE-ConnectionGUID: L2m30CPkSm6g3mZhCSDbnA==
X-CSE-MsgGUID: gq4MQIaPTWmQN7Qq5NhxwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200289648"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v4 12/18] drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
Date: Mon,  8 Dec 2025 19:21:02 -0800
Message-ID: <20251209032055.1539229-32-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
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

If GuC doesn't response to CGP_SYNC message, trigger
GT reset and cleanup of all the queues of the multi
queue group.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 75d9fc79fa3d..509433f132d0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -593,6 +593,23 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
+static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	struct xe_exec_queue *eq;
+
+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
+		     xe_exec_queue_is_multi_queue(q));
+
+	xe_guc_exec_queue_trigger_cleanup(primary);
+
+	mutex_lock(&group->list_lock);
+	list_for_each_entry(eq, &group->list, multi_queue.link)
+		xe_guc_exec_queue_trigger_cleanup(eq);
+	mutex_unlock(&group->list_lock);
+}
+
 static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
 {
 	if (xe_exec_queue_is_multi_queue(q)) {
@@ -618,6 +635,23 @@ static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
 	}
 }
 
+static void set_exec_queue_group_banned(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	struct xe_exec_queue *eq;
+
+	/* Ban all queues of the multi-queue group */
+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
+		     xe_exec_queue_is_multi_queue(q));
+	set_exec_queue_banned(primary);
+
+	mutex_lock(&group->list_lock);
+	list_for_each_entry(eq, &group->list, multi_queue.link)
+		set_exec_queue_banned(eq);
+	mutex_unlock(&group->list_lock);
+}
+
 #define parallel_read(xe_, map_, field_) \
 	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
 			field_)
@@ -677,7 +711,11 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
 				 !READ_ONCE(group->sync_pending) ||
 				 xe_guc_read_stopped(guc), HZ);
 	if (!ret || xe_guc_read_stopped(guc)) {
+		/* CGP_SYNC failed. Reset gt, cleanup the group */
 		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
+		set_exec_queue_group_banned(q);
+		xe_gt_reset_async(q->gt);
+		xe_guc_exec_queue_group_trigger_cleanup(q);
 		return;
 	}
 
-- 
2.43.0

