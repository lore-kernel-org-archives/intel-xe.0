Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE68CCC6B19
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B7310F980;
	Tue, 13 Oct 2026 20:19:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B5810E137
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 20:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791922768; x=1823458768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fT5UWy+djWgLi1wR9BALTr8AeXs58L7drgM42mFw0ss=;
 b=gurBanOjXrMLjphpvSAXgpz7UoQCKv44XtiCLSY51fLE6/OiUU3gH+bE
 iNi2K+MOgmpUPWwmmbVmzA2G1wA8jSzJqVB/Pf3gkmJ2YBogGyxDZ/imw
 NEtoaTCxXeGjcBr2Wme43asBmxHuvk9eNs84pEb2SsNp6FAJAtyuU1ZzL
 ZvnhXjAg2o1OwZQHFLcME/3B/1XD7GhUashUHSxK81Gf3GhZJ/EZ+ffG/
 HcQGdEUyPUvOKt4bre+24XbiLsIHYgeMHsjsQfIghuqSMJtG43YZpfR5Y
 MP6i351uNev21nWHpnWvdGBItTQTrWaQofpNuiwsewHv3CdwTmg/NPN0L g==;
X-CSE-ConnectionGUID: 7BuTDLjpSX25Vthx67RGoA==
X-CSE-MsgGUID: 8C+el+hBS2WzWuobhZdcBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="678545"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="678545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:19:22 -0700
X-CSE-ConnectionGUID: wldXvX6RRoS/1zVGzmmuvg==
X-CSE-MsgGUID: HI//m6QnStqOwhYJadULug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1348482"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2026 13:19:23 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v2 2/3] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Date: Tue, 13 Oct 2026 13:15:07 -0700
Message-ID: <20261013201508.514480-3-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201508.514480-1-daniel.charles@intel.com>
References: <20261013201508.514480-1-daniel.charles@intel.com>
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
index 74b711abe2572..89397e1e65465 100644
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
index c4ef3e9bf7a18..609af66b343d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2045,12 +2045,23 @@ static void __guc_exec_queue_process_msg_cgp_sync(struct xe_sched_msg *msg,
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
@@ -2085,6 +2096,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg,
 	case CGP_SYNC_MSG:
 		__guc_exec_queue_process_msg_cgp_sync(msg, bound);
 		break;
+	case KILL:
+		__guc_exec_queue_process_msg_kill(msg, bound);
+		break;
 	default:
 		XE_WARN_ON("Unknown message type");
 	}
@@ -2211,8 +2225,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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
 	/*
@@ -2222,6 +2247,23 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 	 * stays set until the queue is torn down.
 	 */
 	suspend_wait_wake(q);
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
 
@@ -2274,10 +2316,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
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
2.43.0

