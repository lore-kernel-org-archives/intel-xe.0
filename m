Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755C2CA0EE9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:22:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE7E10E4B3;
	Mon, 18 Aug 2025 17:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PhQ0PKqy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AC210E4B1
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755537770; x=1787073770;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+WrkPbW/0jBr80g6vMp5hbStVoseeSwHIXdm4/gJXu4=;
 b=PhQ0PKqy++K/D7t8hEnfyODsupE5XIGM7+7DX8Yjv6KUq6c98FyVl7q2
 8Avts5HFnI+7zXilN/PS1ZVprHpeMR84ggmibYKuhtLa1maCbnCi17MKI
 6/JZmr7c+1Luf9ntRCuguUclwldd1NkbaAEkCNkODDxrbu6Tcb4FFaGTo
 Tu/U6b7MB3XMLjRMFfQL97NTk+VK0AcpUEOXCaB5YechpaUPyX/P9TAKN
 CkN9tw1j9dpiTgbWUBXZzqptjSY81GB7LZXWvZKM22eeD9/fVKN64l0yw
 vTvPoAfyeZpNa44j0e4yWmfTqrQDSl6sWmUiZw1JtAEIZigYcpopUaPPV A==;
X-CSE-ConnectionGUID: tOtlkiyMQCyAZwWOorCbeg==
X-CSE-MsgGUID: HpTUUPfuQ2a0zQsVYXa7QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68478664"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="68478664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:22:47 -0700
X-CSE-ConnectionGUID: zso9k9lQTROIwOQcU/kTUA==
X-CSE-MsgGUID: AwWZRVk/SH+XB7PqMz0png==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167871635"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:22:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/xe/guc: Track pending-enable source in submission
 state
Date: Mon, 18 Aug 2025 10:22:42 -0700
Message-Id: <20250818172243.2649863-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818172243.2649863-1-matthew.brost@intel.com>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
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

Add explicit tracking in the GuC submission state to record the source
of a pending enable (TDR vs. resume path vs. submission). Disambiguating
the origin lets the GuC submission state machine apply the correct
recovery/replay behavior.

This helps VF resume: when the device comes back, the state machine knows
whether the pending enable stems from timeout recovery, from a resume
sequence, or submission and can gate sequencing and fixups accordingly.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..9e4118126ef9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -68,6 +68,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
 #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
 #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
+#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -219,6 +221,36 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
 }
 
+static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
+}
+
+static void set_exec_queue_pending_resume(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
+}
+
+static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
+}
+
+static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
+}
+
+static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
+}
+
+static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
+}
+
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -1344,6 +1376,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_RESET;
 
 sched_enable:
+	set_exec_queue_pending_tdr_exit(q);
 	enable_scheduling(q);
 rearm:
 	/*
@@ -1494,6 +1527,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 		clear_exec_queue_suspended(q);
 		if (!exec_queue_enabled(q)) {
 			q->guc->resume_time = RESUME_PENDING;
+			set_exec_queue_pending_resume(q);
 			enable_scheduling(q);
 		}
 	} else {
@@ -2065,6 +2099,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_enable(q));
 
 		q->guc->resume_time = ktime_get();
+		clear_exec_queue_pending_resume(q);
+		clear_exec_queue_pending_tdr_exit(q);
 		clear_exec_queue_pending_enable(q);
 		smp_wmb();
 		wake_up_all(&guc->ct.wq);
-- 
2.34.1

