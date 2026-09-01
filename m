Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5C0C624CE
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 01:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDD210E269;
	Tue,  1 Sep 2026 01:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0u74LLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3668410E269
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788225437; x=1819761437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KTmCfiB9ZmJCGsX6XN++5XCprw85fMtPIgwVntylGls=;
 b=S0u74LLWM9tu0FaMXzgyu2CU0jRvPJdyqzya91ADbGsi+NCGa4c0urtf
 qG3u0+sUNAmW7U90YUC7AjED4hPWI//hjVr5m4ZC2yuMMbUcGR7XL8W/T
 p0KGk+KbtoWcki4WIxJxyFeFPZIuRqicNzClUlgH8xtBt7ErXtHAGXOTP
 fyiKv1wjL/k47P+mbNNcd81IET4pcGI2aKdRPKPcz7lmFPT1FUXyHyC4h
 sbAhSAhXFgi9vOo8rGaRIHs71Gkh30V4igc8sxpgedyHUJ9mLJId0TUb4
 qDoDqixy4umidRH5PDwX0eWbgpEHakb4dxF22PjTfy+eL5+Q8fnpNJqHl w==;
X-CSE-ConnectionGUID: BNGIZviyQT6lU408oMhoKA==
X-CSE-MsgGUID: pmIL8c0pTLu0X323bVpd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="98979729"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="98979729"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 18:17:16 -0700
X-CSE-ConnectionGUID: B9gbTXdxRaK0U0oOgHSr8A==
X-CSE-MsgGUID: RWZoBCKiRc6nLXn8QmdD4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="265700489"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 18:17:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wang Xin <x.wang@intel.com>, Jia Yao <jia.yao@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/xe: Disable scheduling early on FD close to avoid CAT
 error cascade
Date: Mon, 31 Aug 2026 18:17:12 -0700
Message-Id: <20260901011712.2617466-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901011712.2617466-1-matthew.brost@intel.com>
References: <20260901011712.2617466-1-matthew.brost@intel.com>
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

When an FD is closed with many exec queues, teardown relies on the TDR
path to clean up scheduling. However, the TDR handling is serialized
(i.e., only one exec queue is processed at a time), which can make it
too slow compared to GuC scheduling activity.

In this window, GuC may continue to schedule contexts backed by
invalid page tables, leading to a cascade of CAT errors and repeated
engine resets. This significantly increases recovery time and can
degrade system stability.

To mitigate this, eagerly disable scheduling by sending a self-message
outside of the TDR path. This prevents further scheduling of invalid
contexts and avoids the CAT error/reset cascade.

This change improves robustness and reduces recovery latency in
multiple queue teardown scenarios.

Cc: Wang Xin <x.wang@intel.com>
Cc: Jia Yao <jia.yao@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Tested-by: Jia Yao <jia.yao@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 46 ++++++++++++++++++--
 2 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index d27826b36649..a46cde5ed81f 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -36,7 +36,7 @@ struct xe_guc_exec_queue {
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
-#define MAX_STATIC_MSG_TYPE	4
+#define MAX_STATIC_MSG_TYPE	5
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @destroy_async: do final destroy async from this worker */
 	struct work_struct destroy_async;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5223f2782503..9b9279ab7930 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1969,12 +1969,23 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
 		guc_exec_queue_send_cgp_sync(q, 0);
 }
 
+static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg,
+					      bool bound)
+{
+	struct xe_exec_queue *q = msg->private_data;
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+
+	if (exec_queue_enabled(primary) && bound)
+		disable_scheduling(primary, true);
+}
+
 #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
 #define SET_SCHED_PROPS			2
 #define SUSPEND				3
 #define RESUME				4
 #define SET_MULTI_QUEUE_PRIORITY	5
 #define CGP_SYNC_MSG			6
+#define KILL				7
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
 #define MSG_HEAD	BIT(9)
@@ -2009,6 +2020,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
 	case CGP_SYNC_MSG:
 		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
 		break;
+	case KILL:
+		__guc_exec_queue_process_msg_kill(msg, bound);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2131,11 +2145,39 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return err;
 }
 
+static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
+				       struct xe_sched_msg *msg,
+				       u32 opcode);
+
+#define STATIC_MSG_CLEANUP	0
+#define STATIC_MSG_SUSPEND	1
+#define STATIC_MSG_RESUME	2
+#define STATIC_MSG_CGP_SYNC	3
+#define STATIC_MSG_KILL		4
 static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
+
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
 	__suspend_fence_signal(q);
+
+	/*
+	 * We eagerly send a message to ourselves to disable scheduling, as the
+	 * TDR is serialized (i.e., only one exec queue is processed at a time).
+	 * If an FD is closed with many exec queues, the TDR can be slower than
+	 * the GuC scheduling contexts with invalid page tables, creating a
+	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
+	 * this by immediately disabling scheduling outside of the TDR.
+	 */
+	if (kref_read(&q->refcount) && !exec_queue_wedged(q)) {
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg(q, msg, KILL);
+		xe_sched_msg_unlock(sched);
+	}
+
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
@@ -2188,10 +2230,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 	return true;
 }
 
-#define STATIC_MSG_CLEANUP	0
-#define STATIC_MSG_SUSPEND	1
-#define STATIC_MSG_RESUME	2
-#define STATIC_MSG_CGP_SYNC	3
 static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
-- 
2.34.1

