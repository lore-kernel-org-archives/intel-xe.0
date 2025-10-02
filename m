Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8391DCCA472
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC4F10E85C;
	Thu,  2 Oct 2025 23:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAW/4vYK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD16110E0CF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759446288; x=1790982288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IC68kpUFRk75aceO4T1CDY4QDgCcUFIdaXIBp8TVjBM=;
 b=DAW/4vYKzdntWnNoYeTOnABYu9N6woJxUzru9AlY8RUcyvDTlzYGigGs
 tBQxdLJsBfIws+cl9hq2HER1qo3GKmKtLFIm5U6uU8phw7gmLNnVx7xr5
 iTGarjsN2lxyM/DR3qTDUhgf7R6hEtRjRnax+SNFvZUU3rCP/rPB8v8A3
 XjRz3MQEMH/kBeBlwV92g6UBbpFRR33/fOW/n0aajK1KJdozu6ekIdUdD
 1castgoTJNKCuChFeWl0ogueI7LEaq6kWx7woJ2Y4B1CANrpkJYYq5AlM
 AvGLiuJc4EAA0zEDgvLTcACL9bGdSZPK0GrO4Ii7zh5HC/yD4BUhCScG0 w==;
X-CSE-ConnectionGUID: 0Hq4NNzVSjqMXtcNbVCvgQ==
X-CSE-MsgGUID: uss3ySk8RBWLcfu+PljE1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79165584"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79165584"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:47 -0700
X-CSE-ConnectionGUID: pxVdAc0mSVqAjPE42eQw7w==
X-CSE-MsgGUID: ed0zi9llTmWZX6hKFoa9Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179566733"
Received: from dut4351arlh.fm.intel.com ([10.105.10.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 7/7] drm/xe: Check for GuC responses on disabling scheduling
Date: Thu,  2 Oct 2025 23:04:44 +0000
Message-Id: <20251002230444.313505-8-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
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

In the event the GuC becomes unresponsive during a scheduling
disable event, we still want the driver to be able to recover.
This patch follows the same methodology we already have in place
for TLB invalidation requests, where we send a request to GuC
and wait for that invalidation done response. If the response
doesn't come back in time we then at least print a message
indicating the invalidation failed for some reason.

In this case, we send the schedule disable and the expectation
is that GuC will respond with a schedule done response. The KMD
then catches that response and in turn sends a context deregistration
response. So in the event GuC becomes unresponsive after we send
the schedule disable, we actually have two g2h responses that
have been reserved but never received.

To handle this, make sure the pending disable event in the
exec queue gets cleared (i.e. we received that response from
GuC). If it doesn't in a reasonable amount of time, assume
GuC is dead: ban the exec queue, queue up a GT reset, and
manually call the schedule done handler. Then in the schedule
done handler, in turn, check whether the context had been
banned. If so, manually call the deregistration done handler
to ensure all resources related to that exec queue get
cleaned up properly. Without this, if the device becomes
wedged after an exec queue has been created, the attached
resources like the LRC will not get feed properly resulting
in a memory leak.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 45b72bebfc63..a177d87c8524 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -939,6 +939,9 @@ int xe_guc_read_stopped(struct xe_guc *guc)
 		GUC_CONTEXT_##enable_disable,				\
 	}
 
+static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
+			      u32 runnable_state);
+
 static void disable_scheduling_deregister(struct xe_guc *guc,
 					  struct xe_exec_queue *q)
 {
@@ -974,6 +977,17 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
 		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
+
+	ret = wait_event_timeout(guc->ct.wq,
+				 !exec_queue_pending_disable(q) ||
+				 xe_guc_read_stopped(guc),
+				 HZ * 5);
+	if (!ret || xe_guc_read_stopped(guc)) {
+		xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
+		set_exec_queue_banned(q);
+		handle_sched_done(guc, q, 0);
+		xe_gt_reset_async(q->gt);
+	}
 }
 
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
@@ -2117,6 +2131,8 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	return q;
 }
 
+static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
+
 static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	u32 action[] = {
@@ -2131,7 +2147,12 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	trace_xe_exec_queue_deregister(q);
 
-	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
+	if (exec_queue_banned(q)) {
+		handle_deregister_done(guc, q);
+	} else {
+		xe_guc_ct_send_g2h_handler(&guc->ct, action,
+					   ARRAY_SIZE(action));
+	}
 }
 
 static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
-- 
2.34.1

