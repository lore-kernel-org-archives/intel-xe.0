Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63200CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717410E36B;
	Fri, 31 Oct 2025 18:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaPYiA22";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC82E10E305
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935385; x=1793471385;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B7p9ONnDcJR9Q7kREXApwFe9V/zq1IeYBXSHMJ4FSYo=;
 b=ZaPYiA22ifJSDrN0VtFMEd8MalRvYDMQ5k7TrOuwhOqwFAeB0YoqIYaf
 3EzEdpbJ5Fv3SvG2txXhcZHy2JlY2jCExsvYKNgUqAineKmG0rfdQFGPa
 WLUYE6I8+Lg/fG26R6wx3VH8WibiGY1zQp6PkdlE8i5RYHfyzGWPZgEvB
 ID80wTOXgXVxx9kv/kyowOZWNF/k2ORjVvTDqrohS059R9NVvBIyy5b/A
 9ld6SaHOGF/USnHPvhqBBJmRJcN6M75wUtzf1115vM2foBz+m5du+LVZn
 kUu/0VUSo+2FRrIwBy3uBEdXcaWPrcKVzn+hta+x/M3xOyAcBWcKA83b4 w==;
X-CSE-ConnectionGUID: Ru8mwI7WS062kZ8pL/FLZQ==
X-CSE-MsgGUID: fwp2TeOAQTSQHIGc60krlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123861"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123861"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:44 -0700
X-CSE-ConnectionGUID: 77rNVu/zQ9GnvWHaTt/npQ==
X-CSE-MsgGUID: xKRUYR6zTiiV0HjXy83Hmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987639"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 11/16] drm/xe/multi_queue: Handle CGP context error
Date: Fri, 31 Oct 2025 11:29:31 -0700
Message-ID: <20251031182936.1882062-12-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 33 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
 drivers/gpu/drm/xe/xe_trace.h            |  5 ++++
 5 files changed, 45 insertions(+)

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
index 48b5006eb080..d0e19af0b4d2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1574,6 +1574,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
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
index 87c13feb2cef..605352145d76 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -48,6 +48,8 @@
 #include "xe_vm.h"
 #include "xe_bo.h"
 
+#define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
@@ -3001,6 +3003,37 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
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
+		  "CGP context error: region=%s err=0x%x, context=0x%x LRCA=0x%x:0x%x SgId=0x%x",
+		  msg[0] & 1 ? "uc" : "kmd", msg[1], msg[2], msg[4], msg[3], msg[5]);
+
+	trace_xe_exec_queue_cgp_context_error(q);
+
+	/* Treat the same as engine reset */
+	set_exec_queue_reset(q);
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
+		xe_guc_exec_queue_trigger_cleanup(q);
+
+	return 0;
+}
+
 /**
  * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
  * @guc: guc
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index abfa94bce391..01b013a90b1b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -35,6 +35,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
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

