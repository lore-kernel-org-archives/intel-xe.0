Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201D7C5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 07:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AC510F38E;
	Fri,  7 Aug 2026 07:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXbHanOX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767BE10F38E
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786086284; x=1817622284;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YZfRWYVhkyTXk2p4stTNmI0SaP1rTPfEeYViEzopKg0=;
 b=RXbHanOXurp/c9/6scUkGokmBDal6H/giGdaGoUZyDAesvFqEH1KGHds
 ZDWtAH5SpUDRX4a3kyc7HDz76dwSlwSeNCsh6f4HxAnfKCCP3nQ3WFXHn
 hfW1BLlqzVrts8odXamOYahtQJo+5uwzj2GvG9utJIqeIvz97t2FkR8Bt
 VcunzPqGMxYG6xCE7aAmK7FFPDpzAlAlUKEYqSyxWsN3BlNHk1gnDdsu1
 gmYIrvOuqC/CZoCfOEk9kU4iGv4GUfEvx0v+ki1FAAXyRdc7rY09d+oKd
 Kn2PBx/oyDmypxjA0aLmMaAvGnnCcdhT9NuRwSsnvkuodbjVfDGkldYva w==;
X-CSE-ConnectionGUID: +cmlA6KgQiGUWeih1Si78Q==
X-CSE-MsgGUID: NbS0kJGaTZCPeABY3LnvMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97339353"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97339353"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:04:43 -0700
X-CSE-ConnectionGUID: QPCmDqJ/QASH1qDG6LEL7A==
X-CSE-MsgGUID: JTvHSolEQXCZv9GL2kb3Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="267471293"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa005.fm.intel.com with ESMTP; 07 Aug 2026 00:04:23 -0700
From: Nishit Sharma <nishit.sharma@intel.com>
To: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 stuart.summers@intel.com
Subject: [PATCH] drm/xe/guc: Silently discard stale G2H reply during overlap
Date: Fri,  7 Aug 2026 07:04:21 +0000
Message-ID: <20260807070421.237683-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

When xe_force_gt_reset_async() fires a second reset before the first
reset's post-recovery drain has completed, GuC may still be processing
H2G requests (SCHED_CONTEXT_MODE_SET / DEREGISTER_CONTEXT) that were
issued by the first reset. The G2H replies SCHED_DONE and DEREGISTER_DONE
can then arrive after the KMD has already marked those exec queues as
banned, killed, or wedged in response to the second reset.
At that point the state flags that the reply handlers assert on
have already been cleared, and the handlers treat this as a protocol
violation, emitting an *ERROR* and returning -EPROTO.

This is not a real error. The reset path tears down exec queues
independently of any in-flight G2H traffic, so a stale reply for a dead
queue is harmless. The proper response is to discard it silently and let
the reset-driven teardown proceed undisturbed.

Detect this condition by checking whether the queue is already in a
terminal state (banned, killed, or wedged) before treating an unexpected
G2H as a protocol error. If so, log at debug level and return success.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8aaed4fd13ea..988c236c6a03 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3149,6 +3149,19 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(!exec_queue_pending_enable(q) &&
 		     !exec_queue_pending_disable(q))) {
+		/*
+		 * Stale SCHED_DONE from a prior reset cycle: the reset marked
+		 * the queue banned/killed (clearing the pending flags) before
+		 * GuC's reply landed. Discard silently
+		 */
+		if (exec_queue_banned(q) || exec_queue_killed(q) ||
+		    exec_queue_wedged(q)) {
+			xe_gt_dbg(guc_to_gt(guc),
+				  "SCHED_DONE: Stale G2H guc_id=%d, state=0x%04x\n",
+				  q->guc->id, atomic_read(&q->guc->state));
+			return 0;
+		}
+
 		xe_gt_err(guc_to_gt(guc),
 			  "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=%d, runnable_state=%u",
 			  atomic_read(&q->guc->state), q->guc->id,
@@ -3185,6 +3198,18 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
+		 /*
+		  * DEREGISTER_DONE from a prior reset cycle
+		  * Discard silently
+		  */
+		if (exec_queue_banned(q) || exec_queue_killed(q) ||
+		    exec_queue_wedged(q)) {
+			xe_gt_dbg(guc_to_gt(guc),
+				  "DEREGISTER_DONE: Stale G2H guc_id=%d, state=0x%04x\n",
+				  q->guc->id, atomic_read(&q->guc->state));
+			return 0;
+		}
+
 		xe_gt_err(guc_to_gt(guc),
 			  "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
 			  atomic_read(&q->guc->state), q->guc->id);
-- 
2.43.0

