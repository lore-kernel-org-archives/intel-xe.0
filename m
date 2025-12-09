Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FA6D3B7E2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 03:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE18B10E47C;
	Tue,  9 Dec 2025 03:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPwbAFl0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C9610E47D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 03:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250466; x=1796786466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o56yWy2RVVeCRfR2LX+XOrSHz1zUpWyhz2gHCaB+eCQ=;
 b=GPwbAFl0xtXoagZ4tJ3dXKA8bsc3UwqmiE0jFGGo0J1wpi4u7C7nPUKw
 PWF6ogRz11HMUhOIT8T2NKyyBY16323FyMOdhG6zg2vTukiz1qYKt1xMx
 hlxhLskXqyxYFYpXR69jzHV+v8P+pcY7+dxI2xLR/4kVnS3RGyaNe3lTJ
 QFUy1HjX6yLnESpiQ7x7l8JDVMhFE6wpVGbW/cKHr9awvDJ9rj9VD0Lu0
 OeU7wPe/CjY6azH3jAEvW2oyK7rfFNv75w7E/xfbq+7v96490FiH+jfjR
 INUMd5Nvcf+cSSMpqEobw4rng+1RH3Yn6rApabxow0xZFaBuLwPFqeVis A==;
X-CSE-ConnectionGUID: UP2RcFSzQKWjd57IUulXbA==
X-CSE-MsgGUID: n8NlltKDRSeoPjk/5f9Qfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67254148"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67254148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
X-CSE-ConnectionGUID: MSSSX3ASQnCCZMlf1PpbvA==
X-CSE-MsgGUID: 2qoqpoyfSemtQq55PJayAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200289644"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:21:05 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH v4 11/18] drm/xe/multi_queue: Handle CGP context error
Date: Mon,  8 Dec 2025 19:21:01 -0800
Message-ID: <20251209032055.1539229-31-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
References: <20251209032055.1539229-20-niranjana.vishwanathapura@intel.com>
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

Trigger multi-queue context cleanup upon CGP context error
notification from GuC.

v4: Fix error message

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
 drivers/gpu/drm/xe/xe_trace.h            |  5 ++++
 5 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 3e9fbed9cda6..8af3691626bf 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -142,6 +142,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
 	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
 	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
+	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4d5b4ed357cc..3e49e7fd0031 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1618,6 +1618,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
 		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
 		break;
+	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR:
+		ret = xe_guc_exec_queue_cgp_context_error_handler(guc, payload,
+								  adj_len);
+		break;
 	default:
 		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ec9571ddef08..75d9fc79fa3d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -48,6 +48,8 @@
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
 
+#define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
@@ -3007,6 +3009,35 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	return 0;
 }
 
+int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
+						u32 len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_exec_queue *q;
+	u32 guc_id = msg[2];
+
+	if (unlikely(len != XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN)) {
+		drm_err(&xe->drm, "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	q = g2h_exec_queue_lookup(guc, guc_id);
+	if (unlikely(!q))
+		return -EPROTO;
+
+	xe_gt_dbg(gt,
+		  "CGP context error: [%s] err=0x%x, q0_id=0x%x LRCA=0x%x guc_id=0x%x",
+		  msg[0] & 1 ? "uc" : "kmd", msg[1], msg[2], msg[3], msg[4]);
+
+	trace_xe_exec_queue_cgp_context_error(q);
+
+	/* Treat the same as engine reset */
+	xe_guc_exec_queue_reset_trigger_cleanup(q);
+
+	return 0;
+}
+
 /**
  * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
  * @guc: guc
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index ad8c0e8e0415..4d89b2975fe9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -37,6 +37,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
+int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
+						u32 len);
 
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 79a97b086cb2..c9d0748dae9d 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -172,6 +172,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_memory_cat_error,
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
-- 
2.43.0

