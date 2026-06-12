Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9FDCD98D8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 06:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F3710F268;
	Fri, 12 Jun 2026 06:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwU/KZfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391D010F25C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 06:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781244087; x=1812780087;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xE51f+K50VA919iSn6MNfZu7PlRuWdEhsHGQ3UGUq64=;
 b=KwU/KZfEx2dTm8KY9AxJch27hVdHPwCDBEhrZH56gfOj5axJXWxigANs
 SJBXvKuDlOaPvBCw83EbPmyznPxr+7U+iioAPGVq+PcZUjUuz0NCS9dWX
 fDkNDSW5+fh2RlI+GTsl64Eq5QrnYWvXiAxzSAejDPp2MATnVAR1FO+4+
 cZjwn2U5HNxKSSYgXLZ3HXPwpk+f8YDjKpC2n0o1LTaC6fcL/IQCt94BK
 TTvCoIgbFdy3NapL/v0ySsVgHfk18JLu0v24/nDfHxX9iI7X4Sa6YEOFa
 VcqjLjBtVIO968MbrSCGSSyt1WmQ9Dhd4vVr8nU2I+oojedgJ3WGQl7X6 Q==;
X-CSE-ConnectionGUID: K515zTR1RdOJ6coV8QZMpg==
X-CSE-MsgGUID: DPSxQTwaSbq6NS3Cb5GdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82077054"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82077054"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 23:01:26 -0700
X-CSE-ConnectionGUID: gKrMeDbHSpG+LXF0KkxrUQ==
X-CSE-MsgGUID: hec8FLgNQQmTroeXvj5xKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="242602818"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 23:01:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/xe: Handle unprocessed messages in
 guc_exec_queue_fini
Date: Thu, 11 Jun 2026 23:01:19 -0700
Message-Id: <20260612060120.3795183-1-matthew.brost@intel.com>
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

In a corner case where the device wedges, GuC backend messages may not
be processed. This can lead to leaked resources, such as memory or PM
references, associated with those unhandled messages.

Address this by cleaning up any side effects of such lost messages in
guc_exec_queue_fini before freeing the queue.

This ensures proper resource cleanup even when the GuC is unable to
process pending messages.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 71e7d7e81d6a ("drm/xe/multi_queue: Add support for multi queue dynamic priority change")
Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e82018445b7c..acf3600a7602 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1678,10 +1678,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
+static void guc_exec_queue_handle_unprocessed_msg(struct xe_sched_msg *msg);
+
 static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_sched_msg *msg, *next;
 
 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
 		struct xe_exec_queue_group *group = q->multi_queue.group;
@@ -1691,6 +1694,12 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 		mutex_unlock(&group->list_lock);
 	}
 
+	/* Corner case during wedging messages can be left unprocessed */
+	list_for_each_entry_safe(msg, next, &ge->sched.msgs, link) {
+		list_del(&msg->link);
+		guc_exec_queue_handle_unprocessed_msg(msg);
+	}
+
 	release_guc_id(guc, q);
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
@@ -1881,6 +1890,20 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
 
+static void guc_exec_queue_handle_unprocessed_msg(struct xe_sched_msg *msg)
+{
+	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
+
+	switch (msg->opcode) {
+	case SET_SCHED_PROPS:
+	case SET_MULTI_QUEUE_PRIORITY:
+		kfree(msg);
+		break;
+	}
+
+	xe_pm_runtime_put(xe);
+}
+
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
-- 
2.34.1

