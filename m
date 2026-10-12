Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12E9CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6820510E4F6;
	Mon, 12 Oct 2026 19:29:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB96B10E4F6
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 19:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791833366; x=1823369366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X5l7dpglCoBqodD96qiQGm2mBjx1MVptS2RWArKgcbw=;
 b=aT1sdj2ATQStIKwsZaynLDXkwKtRvwMoMhs88qg7rOkWia5AOTK4J7cx
 +XrXyGO6/5sd56qcPGi26nzYYaEwIytxnkgrVfc4bsJK6N9HDmIJzZw5S
 42rcJcU6jTvdqXH+jZy8grPW3PbYEyKk4QFt00xXARuBpwWxSWWi+wOs5
 YqDlCknVN0+Xifv8WPMcCIz13vIYAB/NLSPBWZ6/L15br8yk5bt9wIWtF
 WqkegLsAFt5PpYTleXSNHUCOWwl6gLo+GUMFKzCLoSLyjZYPQPVMV40Lp
 ODxkCqpn/fdBWazRTpqmPEdzjf3hPeHB1wHz2P1ygYgQANBS1Fkwbg0Tp Q==;
X-CSE-ConnectionGUID: m4LXaOrGQpC7Ahezs8VBSg==
X-CSE-MsgGUID: chr/isKaSXyrv8+nPTvNSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="450206"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="450206"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:29:25 -0700
X-CSE-ConnectionGUID: CXuehJALTd21d5wPtP+REw==
X-CSE-MsgGUID: r8HOQRSmTSexzmjvefkr0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="897777"
Received: from jesusnar-vm-u24.iil.labsad.intel.com ([10.111.58.210])
 by orviesa009.jf.intel.com with ESMTP; 12 Oct 2026 12:29:24 -0700
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jesus Narvaez <jesus.narvaez@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH] drm/xe/guc: Handle GuC semaphore instruction field check error
Date: Mon, 12 Oct 2026 22:28:28 +0300
Message-ID: <20261012192828.226700-2-jesus.narvaez@intel.com>
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

Starting on NVL-P and newer platforms which support 64 bit semaphores,
opt in to enable GuC to check semaphore instruction fields when it
receives them from HW.

The GuC will send a G2H back if the check failed, so add a handler to
deal with the context that has been marked as unrunnable.

Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  9 +++++
 drivers/gpu/drm/xe/xe_guc.c              | 10 +++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 47 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  2 +
 drivers/gpu/drm/xe/xe_trace.h            |  5 +++
 7 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index f5c9b37038d4..520b771906cd 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -143,6 +143,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
 	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
 	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
+	XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD = 0x460B,
 	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
 	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
 	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 4bcdc1a96785..c63387ebc173 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -169,6 +169,12 @@ enum  {
  *      This flag will enable notification from GuC to KMD via G2H message
  *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon receiving the
  *      same interrupt from the CS.
+ *
+ * _`GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK` : 0x400A
+ *      This flag will enable the GuC to check the semaphore instruction fields
+ *      when GuC receives them from HW. If the check fails the GuC removes the
+ *      context, marks it as not runnable and notifies the driver via G2H
+ *      message GUC_ACTION_GUC2HOST_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD.
  */
 
 #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
@@ -180,6 +186,9 @@ enum  {
 #define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 0x4004
 #define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
 
+#define GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_KEY 0x400A
+#define GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK_LEN 0u
+
 /**
  * DOC: GuC Scheduling Policies KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 3ab4cb9e4964..a0c693a1e74f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -663,6 +663,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 	if (supports_dynamic_ics(guc))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
 
+	/*
+	 * 64 bit semaphore instruction fields check support was added in GuC
+	 * v70.64.0, which maps to compatibility version v1.33.0.
+	 * Support starts with platforms that have 64 bit semaphores, which
+	 * is NVL-P and newer.
+	 */
+	if ((GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 33, 0)) &&
+	    xe->info.platform >= XE_NOVALAKE_P)
+		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK);
+
 	if (count) {
 		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index da5ce97484b8..cdd7285465b1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1802,6 +1802,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_exec_queue_cgp_context_error_handler(guc, payload,
 								  adj_len);
 		break;
+	case XE_GUC_ACTION_NOTIFY_CONTEXT_INVALID_SEMAPHORE_INSTRUCTION_FIELD:
+		ret = xe_guc_context_invalid_semaphore_instruction_field_handler(guc, payload,
+										 adj_len);
+		break;
 	default:
 		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
 	}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35f..35965667c198 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3708,6 +3708,53 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
 	return 0;
 }
 
+/**
+ * xe_guc_context_invalid_semaphore_instruction_field_handler - Invalid semaphore field handler
+ * @guc: guc
+ * @msg: message indicating which context failed the field check
+ * @len: length of message
+ *
+ * The GuC has detected an unsupported SW Token Info value in a 64 bit semaphore
+ * instruction and has already removed the offending context and marked it as
+ * not runnable, so trigger reset-cleanup on the queue to match the state GuC
+ * already applied.
+ *
+ * Return: 0 on success, -EPROTO for malformed messages.
+ */
+int xe_guc_context_invalid_semaphore_instruction_field_handler(struct xe_guc *guc,
+							       u32 *msg, u32 len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_exec_queue *q;
+	u32 guc_id, type;
+	u64 lrc_address, token, data;
+
+	if (unlikely(len != 8))
+		return -EPROTO;
+
+	guc_id = msg[0];
+
+	lrc_address = (u64)msg[2] << 32 | msg[1];
+	token       = (u64)msg[4] << 32 | msg[3];
+	type        = msg[5];
+	data        = (u64)msg[7] << 32 | msg[6];
+
+	q = g2h_exec_queue_lookup(guc, guc_id);
+	if (unlikely(!q))
+		return -EPROTO;
+
+	xe_gt_info(gt,
+		   "GuC: invalid semaphore instruction field! guc_id=%d, type=%u lrca=0x%llx, token=0x%llx, data=0x%llx",
+		   guc_id, type, lrc_address, token, data);
+
+	trace_xe_guc_invalid_semaphore_instruction_field(q);
+
+	/* Treat the same as engine reset */
+	xe_guc_exec_queue_reset_trigger_cleanup(q);
+
+	return 0;
+}
+
 static void
 guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
 				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 29abf07d8f04..d3ecca3c8ed5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -41,6 +41,8 @@ int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
 						u32 len);
+int xe_guc_context_invalid_semaphore_instruction_field_handler(struct xe_guc *guc,
+							       u32 *msg, u32 len);
 
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index d4e9d91f6f7f..e52054eccc8d 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -223,6 +223,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_guc_invalid_semaphore_instruction_field,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
-- 
2.43.0

