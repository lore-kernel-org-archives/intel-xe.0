Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3552DC2A081
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E900510E395;
	Mon,  5 Jan 2026 04:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btgjta0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529B110E359
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585765; x=1799121765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GAoUtw6SOh6dzyG+8onCBaRhL6QE/XgdURqvQph2pD0=;
 b=btgjta0v4Uc5uM5T0TDmuVJQljuK8oXsftQutN4Jt+XhPjdvUbV6P7xu
 OgLPxIUNzL90AjRNacDEeHq9l4zLetFmoIY2OpSxpRE79ZBhHo3Gu+2o3
 gUu2+XhMJvQ9Nxt6vk02vfTArpczXm5SzqRRRnGMYg2jr0cyDRq2C9E91
 5IrqmAcWyK9a/nggRLFERAOCbXTYVNiYj6mGlu7ig0ECleh0wSQjY4AHH
 MND3odkNx4NuvkFTKiKwrZQqW6mMlhasLwNDlB85tkQBX0sF6RSwJyZ7g
 2dFWDGaLcWoEqZZEZYfoqVWbjQl4Bo1L1O2drcpEkHYErZBJmVPaBjsba A==;
X-CSE-ConnectionGUID: 1W9kGlLVS22+GL7gauIaZg==
X-CSE-MsgGUID: l6B34RH8ToWHmRJToxZ4Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856267"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856267"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:45 -0800
X-CSE-ConnectionGUID: 3DLBJRB2T/SyJtJiadYF5A==
X-CSE-MsgGUID: kQMXReikTgas5BUrWuDKVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060683"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 16/22] drm/xe: Add exec queue deadline trace points
Date: Sun,  4 Jan 2026 20:02:31 -0800
Message-Id: <20260105040237.1307873-17-matthew.brost@intel.com>
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

Add exec queue deadline trace points to help debug and profile the
deadline implementation.

v2:
 - Add freq / prio tracepoints

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_deadline_mgr.c |  4 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c   | 10 +++++++---
 drivers/gpu/drm/xe/xe_trace.h        | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr.c b/drivers/gpu/drm/xe/xe_deadline_mgr.c
index 8ebecf92aa8c..f3c920017e40 100644
--- a/drivers/gpu/drm/xe/xe_deadline_mgr.c
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.c
@@ -69,8 +69,10 @@ static bool __xe_deadline_mgr_enter_deadline(struct xe_deadline_mgr *mgr,
 	lockdep_assert_held(&mgr->lock);
 
 	if (XE_DEADLINE_EXIT_DELAY_MS &&
-	    mgr->state != XE_DEADLINE_MGR_STATE_NO_BOOST)
+	    mgr->state != XE_DEADLINE_MGR_STATE_NO_BOOST) {
 		cancel_delayed_work(&mgr->exit_delay);
+		trace_xe_exec_queue_cancel_deadline_exit(mgr->q);
+	}
 
 	if (mgr->state != state && !__xe_deadline_mgr_deadline_signaled(mgr)) {
 		mgr->state = state;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1aca444faf8b..7e47c375f530 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2088,12 +2088,16 @@ __guc_exec_queue_process_msg_set_deadline_state(struct xe_sched_msg *msg,
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	enum xe_deadline_mgr_state state;
 
-	if (opcode == EXIT_DEADLINE)
+	if (opcode == EXIT_DEADLINE) {
 		state = XE_DEADLINE_MGR_STATE_NO_BOOST;
-	else if (opcode == ENTER_DEADLINE_FREQ)
+		trace_xe_exec_queue_exit_deadline(q);
+	} else if (opcode == ENTER_DEADLINE_FREQ) {
 		state = XE_DEADLINE_MGR_STATE_FREQ_BOOST;
-	else
+		trace_xe_exec_queue_enter_deadline_freq(q);
+	} else {
 		state = XE_DEADLINE_MGR_STATE_PRIO_BOOST;
+		trace_xe_exec_queue_enter_deadline_prio(q);
+	}
 
 	if (guc_exec_queue_allowed_to_change_state(q))
 		deadline_policies(guc, q, state);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 6d12fcc13f43..14592403d2c0 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -233,6 +233,26 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_lr_cleanup,
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_exec_queue_enter_deadline_freq,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
+DEFINE_EVENT(xe_exec_queue, xe_exec_queue_enter_deadline_prio,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
+DEFINE_EVENT(xe_exec_queue, xe_exec_queue_exit_deadline,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
+DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cancel_deadline_exit,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DECLARE_EVENT_CLASS(xe_sched_job,
 		    TP_PROTO(struct xe_sched_job *job),
 		    TP_ARGS(job),
-- 
2.34.1

