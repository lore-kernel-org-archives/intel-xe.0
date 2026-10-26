Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A563606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 18:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OGTEDOs/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28C910E394;
	Mon, 26 Oct 2026 18:26:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF4E10E394
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 18:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793039158; x=1824575158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=40GzrUHnByR17Y8qj9LCcdq5zL9yDLKTsHDERmZsq/o=;
 b=OGTEDOs/1errx4KnBvyS/U0fv49xKXLjQKcrENcx5bbdE+V8ydcOPec9
 71K7uwJMkrKKiQnbxN4L4zhZo8fMuAfuWNydUiEiw4QVDeANEPkhD6lq2
 rFzs/vL/BNXdKerj82kb9K6YgxYKGV7FrRg1+NDD7b3u2dIVMYYaZtkJ/
 L/W8k3IbJaIOPXDeVut6pHoKqCgvxcx4Z17MqMSr/3JZa554GKkT0czac
 srqKG63Q78l0x/FABZdjDmW1ET31carxFRuBBSMf74ejFNzbz9cXj5qjs
 ybDuFyaOMm6nqd68GUUK2O9BcmWwH+BFIzjNvVFbvZxVVJzyKadrNUXoZ w==;
X-CSE-ConnectionGUID: Q1+qhiJ1RcyxpD1NTHgt7w==
X-CSE-MsgGUID: s31clMpbS5yp2XOWQlS/dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1733682"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1733682"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 11:25:57 -0700
X-CSE-ConnectionGUID: 5t+/fKUcQZSihZr1zRl6/w==
X-CSE-MsgGUID: R4isxIKCQPCN1rD5ZoD8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4366734"
Received: from jesusnar-vm-u24.iil.labsad.intel.com ([10.111.58.210])
 by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2026 11:25:55 -0700
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jesus Narvaez <jesus.narvaez@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v2] drm/xe/guc: Handle GuC semaphore instruction field check
 error
Date: Mon, 26 Oct 2026 20:25:13 +0200
Message-ID: <20261026182513.1329781-2-jesus.narvaez@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting on NVL-P and newer platforms which support 64 bit semaphores,
opt in to enable GuC to check the semaphore instruction field when it
receives it from HW.

The 64 bit semaphore instruction includes a field that is passed through
the CSB to the GuC. The GuC then checks for any invalid values in this
field and sends a G2H message back if the check failed, so add a
handler to deal with the context that has been marked as unrunnable.

Rejecting the unsupported values now means later on, if the values are
used for something else like sending hints about semaphore behavior,
there won't be any conflicts due to the change in behavior.

v2:
- Updated commit message to explain why GuC checks the instruction field
  (Daniele)
- Use "instruction field" in comments, but kept KLV name to match GuC
  specs (Daniele)
- Removed LRCA variable and print out in handler (Daniele)

Signed-off-by: Jesus Narvaez <jesus.narvaez@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  9 +++++
 drivers/gpu/drm/xe/xe_guc.c              | 10 ++++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 46 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
 drivers/gpu/drm/xe/xe_trace.h            |  5 +++
 7 files changed, 77 insertions(+)

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
index 4bcdc1a96785..dd34d61ebf3a 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -169,6 +169,12 @@ enum  {
  *      This flag will enable notification from GuC to KMD via G2H message
  *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon receiving the
  *      same interrupt from the CS.
+ *
+ * _`GUC_KLV_OPT_IN_FEATURE_SEMAPHORE_INSTRUCTION_FIELDS_CHECK` : 0x400A
+ *      This flag will enable the GuC to check the semaphore instruction field
+ *      when GuC receives it from HW. If the check fails the GuC removes the
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
index b1f4e132fa0c..c96c02fc924a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -663,6 +663,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 	if (supports_dynamic_ics(guc))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
 
+	/*
+	 * 64 bit semaphore instruction field check support was added in GuC
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
index d42f0133c1eb..27afe95c4ce7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1909,6 +1909,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
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
index 7e2ce1a79a75..179ad7287ffd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3723,6 +3723,52 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
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
+	u64 token, data;
+
+	if (unlikely(len != 8))
+		return -EPROTO;
+
+	guc_id = msg[0];
+
+	token = (u64)msg[4] << 32 | msg[3];
+	type  = msg[5];
+	data  = (u64)msg[7] << 32 | msg[6];
+
+	q = g2h_exec_queue_lookup(guc, guc_id);
+	if (unlikely(!q))
+		return -EPROTO;
+
+	xe_gt_info(gt,
+		   "GuC: invalid semaphore instruction field! guc_id=%d, type=%u, token=0x%llx, data=0x%llx",
+		   guc_id, type, token, data);
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
index 7a81d0aa19bb..3eef8784a1a5 100644
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

