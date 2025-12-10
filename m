Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF53D3B9BA
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE9410E64C;
	Wed, 10 Dec 2025 00:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="my0/6BKG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FF310E641
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327163; x=1796863163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vq7d1sdQW/pWQ6axPe1MyksDKlmBfUqeA+ACkwnxrwk=;
 b=my0/6BKGEgdBNKSg9h78CH3g0niKkhDKtCppR7vU8iVTc628k8/1fddm
 9P4rEcNk/OjHl5iMW61oNu1Y6kli6IgFh3VmjoGsUYblBwBbZAWqUdGTH
 lyPmVBCyeBaGxO32DoKvWALdjFrgv2UdQBKgX+UOt9fnqTMNnL17qisQ8
 2g3uyD0lMu4I5O3GAJCk7fLngyGhMtz0uaOpY2sT0DBfzmvB8iF+sj4xi
 5fZo63NqJDOUCdBc0VACGwqGKWWA1oVRLVXDETbeag3NJ9nAgIqg7gJdy
 eiZ8a62ZP72GbnZ4y9eVMi7HaPqD9/IMnfmy9Vpe5ZB1r4Ubt5zZ0cifh g==;
X-CSE-ConnectionGUID: V55XUTh3QamaIPkHxW3RYw==
X-CSE-MsgGUID: avFUcV2ATHqx7XVQ3ZyV9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180379"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:23 -0800
X-CSE-ConnectionGUID: CeT53FiOTd2/EWKyMgEQew==
X-CSE-MsgGUID: Srr9UPXwR6SytIA6WlHnfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421537"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v5 12/17] drm/xe/multi_queue: Reset GT upon CGP_SYNC failure
Date: Tue,  9 Dec 2025 16:39:23 -0800
Message-ID: <20251210003913.1612141-31-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
References: <20251210003913.1612141-19-niranjana.vishwanathapura@intel.com>
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

