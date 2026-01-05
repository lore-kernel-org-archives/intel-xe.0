Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D819FC2A080
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B557410E38B;
	Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzG717SR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFB510E289
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AZa2JOkuz76bm1XgubfD/YXO7wOthmESDl34Su+CRY8=;
 b=lzG717SRMUy81roP7SUhKlPeumxPfkuStr7ebhsysFl2MQitn3nbIZmZ
 ffcDHY10BTigpx2dV39/FqnwMBgJc9gVlJVFedpTpZGtsFA/XP7x/3XH2
 c9J9s2bBiN1TailLfnq8nz/zbfmPDKnHu13Sm4tAMStb+gVQOoV8SA9pH
 CQo4AFnGu24LiByzoYxPGj1b8PI1Pm8MDjV2cPNZJfI0/vbDwut0EsLOi
 5WSTaPoIt5by66nQhddUDjGTVKy+LSrNc8PzBgAZjOGkxuIf3InM6J2eE
 f54mSAxL1c8/gbLa7qlG1RBYbWUtpLT32Znxlm7spGO8qLr+idnXaVyrB A==;
X-CSE-ConnectionGUID: H+l3bwtoRNOGIN8SecH5mg==
X-CSE-MsgGUID: TYlhCTlKQHy376v0pYwGfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856264"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856264"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: E1Ar8+aKRAW6CLSaP3epbQ==
X-CSE-MsgGUID: HkYJCzAGSaiNF3MtnRlm2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060671"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 11/22] drm/xe: Support unstable opcodes for static
 scheduler messages
Date: Sun,  4 Jan 2026 20:02:26 -0800
Message-Id: <20260105040237.1307873-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

To support a single static scheduler message with a changing opcode,
read the message opcode under the message lock and pass it to the
scheduler for processing.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 10 +++++++---
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  5 +++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 8ea5480a517d..0c568cf0460b 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -24,7 +24,7 @@ static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
 }
 
 static struct xe_sched_msg *
-xe_sched_get_msg(struct xe_gpu_scheduler *sched)
+xe_sched_get_msg(struct xe_gpu_scheduler *sched, unsigned int *opcode)
 {
 	struct xe_sched_msg *msg;
 
@@ -33,6 +33,9 @@ xe_sched_get_msg(struct xe_gpu_scheduler *sched)
 					       struct xe_sched_msg, link);
 		if (msg)
 			list_del_init(&msg->link);
+
+		/* Opcode only stable under lock for static messages */
+		*opcode = msg->opcode;
 	}
 
 	return msg;
@@ -43,13 +46,14 @@ static void xe_sched_process_msg_work(struct work_struct *w)
 	struct xe_gpu_scheduler *sched =
 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
 	struct xe_sched_msg *msg;
+	unsigned int opcode;
 
 	if (READ_ONCE(sched->base.pause_submit))
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
index 07ffab338e4a..26cd9fa6e2b3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2046,13 +2046,14 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
 
-static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
+static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
+				       unsigned int opcode)
 {
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
 
 	trace_xe_sched_msg_recv(msg);
 
-	switch (msg->opcode) {
+	switch (opcode) {
 	case CLEANUP:
 		__guc_exec_queue_process_msg_cleanup(msg);
 		break;
-- 
2.34.1

