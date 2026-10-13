Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD353CC6B08
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA2B10F448;
	Tue, 13 Oct 2026 02:39:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECD710F448
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791859182; x=1823395182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+p6zwcbNNwqVwp9VEyj8MzPQxMAFNKT2WYyfuExwu6U=;
 b=Ww4X5nbsLcMcezsRFCbC5lmze3qrk3MRvRvpUrEJG0WckUOPFVJBc8Dl
 iYc7fBlucpTBW/SBtPafjKVZ5Zp3Z+8yolbLr6L3vwjpatoX2v5YjkmmM
 I1noTTxHNSUHhP/IDSCqIZfPfIUm+AXgANXHYnDn32EVxDPgZ4o4gevZr
 abn5t+BFscUEdNmPDt6WNTkKsUCojzc8CeZ3p8BJcvJZ0fXIVyxYkCXEq
 Yn7f2IxmCMMRgH7+7h+bh808PKwlLac4+7LBrVQ+izDU0lm7Yspnq4BWM
 VRrtMdEizDBUj9GO6dNn4I/WzExgbNBNYcQ7Mooh4lGlmOmMLE/oiJ8j7 w==;
X-CSE-ConnectionGUID: HpvcsLdPSDGlNv3jOHle8A==
X-CSE-MsgGUID: RL/9Q5LFSeG28DEYISmk5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="569712"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="569712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:39:36 -0700
X-CSE-ConnectionGUID: +GFwExfLRJadR3ZilatBFQ==
X-CSE-MsgGUID: DgimYW+TTuaVB/ZAq6T83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1132036"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa003.fm.intel.com with ESMTP; 12 Oct 2026 19:39:35 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intnel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, stable <stable@kernel.org>
Subject: [PATCH 1/3] drm/xe: Read scheduler message opcode under lock
Date: Mon, 12 Oct 2026 19:34:40 -0700
Message-ID: <20261013023442.206915-2-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013023442.206915-1-daniel.charles@intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

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
index 9c8004d5dd915..d656db758cb3c 100644
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
index 78ef2e8ded4f3..163a0d85e3cb9 100644
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
index 7ce73489c35fc..c4ef3e9bf7a18 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2056,16 +2056,17 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
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
2.43.0

