Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0504CD3B9AB
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5F610E6C8;
	Thu, 11 Dec 2025 01:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgsvsY00";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCC810E6C8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765414979; x=1796950979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vq7d1sdQW/pWQ6axPe1MyksDKlmBfUqeA+ACkwnxrwk=;
 b=VgsvsY00o8ijAnqKWgrTYY38pGbw44Ty6/HqdpzOgPjemKGfopQ0WDrq
 sTaqgs7nNM7vDqqi0Y+vOjiiyxNbZ96FEWCoWmDpoy+sdvApgZxZ1s5JP
 jQ1Ir4j0TxprSOC6r+aAFWYcML1BO75Q27XmwYSk63Q9vtLGNgzGLklOI
 HfDYl8EeZ7RBHN0pWo/ZPyCCd7D00+zLbPcaDDghsL/pmBmYB+P1w09lg
 Ii4YOUN7fYxkWAyxJWj34DTpR2owjJ9Xp4aT+Ku9lNufByTT9hwwbj0Bs
 xSIs3ZReyfM6O1AEuRDh3MCe0gG6WDoulqVl9TLV5S76qxMQrmvXioDp+ A==;
X-CSE-ConnectionGUID: DMeMj9NlSAuk6i6vzB7Aag==
X-CSE-MsgGUID: uS38Cjt8TjSHxZNsVgZM0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67442872"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="67442872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
X-CSE-ConnectionGUID: I0YshbmWQaGGgrWy1e7Ujg==
X-CSE-MsgGUID: XYRXqhwNSC+bq/8lbshs+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196664127"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:02:58 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v6 12/17] drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
Date: Wed, 10 Dec 2025 17:03:00 -0800
Message-ID: <20251211010249.1647839-31-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
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
index 3be5e78485c7..e8bde976e4c8 100644
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

