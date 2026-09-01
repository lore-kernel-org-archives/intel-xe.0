Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E5CC61DFD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 01:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1105B10E16C;
	Tue,  1 Sep 2026 01:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtWxwhhv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181A810E16C
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788225437; x=1819761437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cLkEI6vfA6jU4WWjwZrCFlv9XmCEqvUIHwba0srS+Eo=;
 b=XtWxwhhvJiWAzyY7hYD98DfuZLD/s/yxpyYAHGTQ81Q/9CHcnY7YJI45
 NQ93lePhLdoH2i6+i272PuTKbOFSw8dJ1VpdVUecHV9LWQ3tArzF1pyLd
 6eDpD+v9gwjdKkpxfKbjaoJPRRpWJOCsbwHYVKF4PUH+5kkHKDg0l77He
 lUjJYTC6Ii7LuwY2GeSzth5BwMMffVDyBNumJMtBFdoxOP49QkIbOAQqc
 WosQzTruPSVffWiaTkzYH04w/+KW02T8NjV7LjkPPv3gTwwvyGj87p8pk
 pEFnP+3KGsnBR3jFjJMcqxJ4W1ey7QMfVLDDgr4Z2cLNWSNS17iNMtbkL A==;
X-CSE-ConnectionGUID: rVx0xgxOQ7GzbkFq0c6ANw==
X-CSE-MsgGUID: fRS0DkFhQ1qYVGgz9PwJXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="98979728"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="98979728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 18:17:16 -0700
X-CSE-ConnectionGUID: 22ec8SevSoCSbfxXkHosBQ==
X-CSE-MsgGUID: 97ZpAWB6RJWnmWpPyIK3RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="265700486"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 18:17:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stable <stable@kernel.org>
Subject: [PATCH 1/2] drm/xe: Read scheduler message opcode under lock
Date: Mon, 31 Aug 2026 18:17:11 -0700
Message-Id: <20260901011712.2617466-1-matthew.brost@intel.com>
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

For static scheduler messages, the opcode is only guaranteed to remain
stable while the message is on the pending message list. Read the opcode
under the message lock before removing the message from the pending list,
and pass it through the processing pipeline.

Fixes: ff796870f5dd ("drm/xe/guc: rework exec queue teardown PM/unplug handling")
Cc: stable <stable@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 13 +++++++++----
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  7 ++++---
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 9c8004d5dd91..d656db758cb3 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -23,15 +23,19 @@ static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
 }
 
 static struct xe_sched_msg *
-xe_sched_get_msg(struct xe_gpu_scheduler *sched)
+xe_sched_get_msg(struct xe_gpu_scheduler *sched, unsigned int *opcode)
 {
 	struct xe_sched_msg *msg;
 
 	xe_sched_msg_lock(sched);
 	msg = list_first_entry_or_null(&sched->msgs,
 				       struct xe_sched_msg, link);
-	if (msg)
+	if (msg) {
+		/* The opcode is only stable under lock for static messages */
+		*opcode = msg->opcode;
+
 		list_del_init(&msg->link);
+	}
 	xe_sched_msg_unlock(sched);
 
 	return msg;
@@ -42,13 +46,14 @@ static void xe_sched_process_msg_work(struct work_struct *w)
 	struct xe_gpu_scheduler *sched =
 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
 	struct xe_sched_msg *msg;
+	unsigned int opcode;
 
 	if (drm_sched_is_stopped(&sched->base))
 		return;
 
-	msg = xe_sched_get_msg(sched);
+	msg = xe_sched_get_msg(sched, &opcode);
 	if (msg) {
-		sched->ops->process_msg(msg);
+		sched->ops->process_msg(msg, opcode);
 
 		xe_sched_process_msg_queue_if_ready(sched);
 	}
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 63d9bf92583c..ea8b0d703d12 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -34,7 +34,7 @@ struct xe_sched_backend_ops {
 	 * @process_msg: Process a message. Allowed to block, it is this
 	 * function's responsibility to free message if dynamically allocated.
 	 */
-	void (*process_msg)(struct xe_sched_msg *msg);
+	void (*process_msg)(struct xe_sched_msg *msg, unsigned int opcode);
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..5223f2782503 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1980,16 +1980,17 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
 #define MSG_HEAD	BIT(9)
 #define MSG_PM_REF	BIT(10)
 
-static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
+static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
+				       unsigned int opcode)
 {
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
 	int idx;
-	bool pm_ref = !!(msg->opcode & MSG_PM_REF);
+	bool pm_ref = !!(opcode & MSG_PM_REF);
 	bool bound = drm_dev_enter(&xe->drm, &idx);
 
 	trace_xe_sched_msg_recv(msg);
 
-	switch (msg->opcode & OPCODE_MASK) {
+	switch (opcode & OPCODE_MASK) {
 	case CLEANUP:
 		__guc_exec_queue_process_msg_cleanup(msg, bound);
 		break;
-- 
2.34.1

