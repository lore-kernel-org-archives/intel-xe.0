Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA14C3DA50
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2A610EAFB;
	Fri, 12 Jul 2024 21:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIlK8G1u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B5A10EA79
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819765; x=1752355765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1lGgQFR/uMi0sTwMD4c9j8iHdDcLlAS0S7cnMNG2mo=;
 b=LIlK8G1uMIRr8iloI2WHi83lqjgbbd9bhfplEMhBIvxx+TaFMMKONlQv
 t1OtvQVR76hISqcvohQLxcY0RbMcL9jwWFEfpQIR7SmsTfHElnqE+8riz
 uvPcHy+HI5d8J2scZwWIcjJRxppXQ9RMZtYvZrL+kFUXEG5LXeA+WqqQp
 8qYrsq4UtpZZ1BZwaNrJO7U7f5nYgmBZQrQZi/u8MMH4EwjikUb8SxeWO
 tXi5fv5BcFX6XttthkyTdaSA2orPuSLHJlMfMlFueCgnDV3nQPbCsWJ01
 3h3E8Eol0fHN/3edVDVZbOFl8WRk+A6X5e3+Gt/kV74RitjmTK3Mfy07m A==;
X-CSE-ConnectionGUID: uEN1mqQ4TH2fpyO3/ior5w==
X-CSE-MsgGUID: n1OpWINeRse1DpTkhVb5dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990159"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:24 -0700
X-CSE-ConnectionGUID: 9repteiHSBmur3aB6fnZHA==
X-CSE-MsgGUID: rKIHts9RSrSKxEIWste/CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864584"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:25 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 05/14] drm/xe/pxp: Add GSC session invalidation support
Date: Fri, 12 Jul 2024 14:28:49 -0700
Message-ID: <20240712212901.2684239-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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

After a session is terminated, we need to inform the GSC so that it can
clean up its side of the allocation. This is done by sending an
invalidation command with the session ID.

Note that this patch is meant to be squashed with the follow-up patches
that implement the other pieces of the termination flow. It is separate
for now for ease of review.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  12 +
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 212 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |   1 +
 3 files changed, 225 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
index f3c4cf10ba20..dddabeb4046e 100644
--- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
+++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
@@ -49,6 +49,7 @@ struct pxp_cmd_header {
 	u32 buffer_len;
 } __packed;
 
+#define PXP42_CMDID_INVALIDATE_STREAM_KEY 0x00000007
 #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
 
 /* PXP-Input-Packet: HUC Auth-only */
@@ -63,4 +64,15 @@ struct pxp43_huc_auth_out {
 	struct pxp_cmd_header header;
 } __packed;
 
+/* PXP-Input-Packet: Invalidate Stream Key */
+struct pxp42_inv_stream_key_in {
+	struct pxp_cmd_header header;
+	u32 rsvd[3];
+} __packed;
+
+/* PXP-Output-Packet: Invalidate Stream Key */
+struct pxp42_inv_stream_key_out {
+	struct pxp_cmd_header header;
+	u32 rsvd;
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index 88200315a882..e54e51e75567 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -15,8 +15,13 @@
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
 #include "xe_lrc.h"
+#include "xe_map.h"
 #include "xe_pxp_types.h"
+#include "xe_sched_job.h"
 #include "xe_vm.h"
+#include "abi/gsc_command_header_abi.h"
+#include "abi/gsc_pxp_commands_abi.h"
+#include "instructions/xe_gsc_commands.h"
 #include "instructions/xe_mfx_commands.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
@@ -286,3 +291,210 @@ int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
 
 	return 0;
 }
+
+static bool
+is_fw_err_platform_config(u32 type)
+{
+	switch (type) {
+	case PXP_STATUS_ERROR_API_VERSION:
+	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
+	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
+		return true;
+	default:
+		break;
+	}
+	return false;
+}
+
+static const char *
+fw_err_to_string(u32 type)
+{
+	switch (type) {
+	case PXP_STATUS_ERROR_API_VERSION:
+		return "ERR_API_VERSION";
+	case PXP_STATUS_NOT_READY:
+		return "ERR_NOT_READY";
+	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
+	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
+		return "ERR_PLATFORM_CONFIG";
+	default:
+		break;
+	}
+	return NULL;
+}
+
+static int pxp_pkt_submit(struct xe_exec_queue *q, u64 batch_addr)
+{
+	struct xe_gt *gt = q->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_sched_job *job;
+	struct dma_fence *fence;
+	long timeout;
+
+	xe_assert(xe, q->hwe->engine_id == XE_HW_ENGINE_GSCCS0);
+
+	job =  xe_sched_job_create(q, &batch_addr);
+	if (IS_ERR(job))
+		return PTR_ERR(job);
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
+	dma_fence_put(fence);
+	if (timeout < 0)
+		return timeout;
+	else if (!timeout)
+		return -ETIME;
+
+	return 0;
+}
+
+static void emit_pxp_heci_cmd(struct xe_device *xe, struct iosys_map *batch,
+			      u64 addr_in, u32 size_in, u64 addr_out, u32 size_out)
+{
+	u32 len = 0;
+
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, GSC_HECI_CMD_PKT);
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, lower_32_bits(addr_in));
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, upper_32_bits(addr_in));
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, size_in);
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, lower_32_bits(addr_out));
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, upper_32_bits(addr_out));
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, size_out);
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 0);
+	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, MI_BATCH_BUFFER_END);
+}
+
+#define GSC_PENDING_RETRY_MAXCOUNT 40
+#define GSC_PENDING_RETRY_PAUSE_MS 50
+static int gsccs_send_message(struct xe_pxp *pxp, void *msg_in, size_t msg_in_size,
+			      void *msg_out, size_t msg_out_size_max)
+{
+	struct xe_device *xe = pxp->xe;
+	const size_t max_msg_size = PXP_INOUT_SIZE - sizeof(struct intel_gsc_mtl_header);
+	u32 wr_offset = 0;
+	u32 rd_offset = 0;
+	u32 reply_size;
+	int ret = 0;
+	int retry = GSC_PENDING_RETRY_MAXCOUNT;
+
+	if (!pxp->gsc_exec.q)
+		 return -ENODEV;
+
+	if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
+		 return -ENOSPC;
+
+	wr_offset = xe_gsc_emit_header(xe, &pxp->gsc_exec.msg_in, 0,
+				       HECI_MEADDRESS_PXP,
+				       pxp->gsc_exec.host_session_handle,
+				       msg_in_size);
+
+	/* NOTE: zero size packets are used for session-cleanups */
+	if (msg_in && msg_in_size)
+		 xe_map_memcpy_to(xe, &pxp->gsc_exec.msg_in, wr_offset,
+				  msg_in, msg_in_size);
+
+	/* Make sure the reply header does not contain stale data */
+	xe_gsc_poison_header(xe, &pxp->gsc_exec.msg_out, 0);
+
+	emit_pxp_heci_cmd(xe, &pxp->gsc_exec.batch, PXP_MSG_IN_OFFSET,
+			  wr_offset + msg_in_size, PXP_MSG_OUT_OFFSET,
+			  msg_out_size_max + wr_offset);
+
+	xe_device_wmb(xe);
+
+	do {
+		 ret = pxp_pkt_submit(pxp->gsc_exec.q, PXP_BB_OFFSET);
+		 if (ret)
+			  break;
+
+		 if (xe_gsc_check_and_update_pending(xe, &pxp->gsc_exec.msg_in, 0,
+							  &pxp->gsc_exec.msg_out, 0)) {
+			  ret = -EAGAIN;
+			  msleep(GSC_PENDING_RETRY_PAUSE_MS);
+		 }
+	} while (--retry && ret == -EAGAIN);
+
+	if (ret) {
+		 drm_err(&xe->drm, "failed to submit GSC PXP message: %d\n", ret);
+		 return ret;
+	}
+
+	ret = xe_gsc_read_out_header(xe, &pxp->gsc_exec.msg_out, 0,
+				     sizeof(struct pxp_cmd_header), &rd_offset);
+	if (ret) {
+		 drm_err(&xe->drm, "invalid GSC reply for PXP (err=%d)\n", ret);
+		 return ret;
+	}
+
+	reply_size = xe_map_rd_field(xe, &pxp->gsc_exec.msg_out, rd_offset,
+				     struct pxp_cmd_header, buffer_len);
+	reply_size += sizeof(struct pxp_cmd_header);
+
+	if (reply_size > msg_out_size_max) {
+		 drm_warn(&xe->drm, "caller with insufficient PXP reply size %u (%ld)\n",
+			   reply_size, msg_out_size_max);
+		 reply_size = msg_out_size_max;
+	}
+
+	if (msg_out)
+		  xe_map_memcpy_from(xe, msg_out, &pxp->gsc_exec.msg_out,
+					rd_offset, reply_size);
+
+	xe_gsc_poison_header(xe, &pxp->gsc_exec.msg_in, 0);
+
+	return ret;
+}
+
+/**
+ * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
+ * @pxp: the xe_pxp structure
+ * @id: the session to invalidate
+ *
+ * Submit a message to the GSC FW to notify it that a session has been
+ * terminated and is therefore invalid.
+ *
+ * Returns 0 if the submission is successful, an errno value otherwise.
+ */
+int xe_pxp_submit_session_invalidation(struct xe_pxp *pxp, u32 id)
+{
+	struct xe_device *xe = pxp->xe;
+	struct pxp42_inv_stream_key_in msg_in = {0};
+	struct pxp42_inv_stream_key_out msg_out = {0};
+	int ret = 0;
+
+	/*
+	 * Stream key invalidation reuses the same version 4.2 input/output
+	 * command format but firmware requires 4.3 API interaction
+	 */
+	msg_in.header.api_version = PXP_APIVER(4, 3);
+	msg_in.header.command_id = PXP42_CMDID_INVALIDATE_STREAM_KEY;
+	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
+
+	msg_in.header.stream_id = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
+	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
+	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, id);
+
+	ret = gsccs_send_message(pxp, &msg_in, sizeof(msg_in), &msg_out, sizeof(msg_out));
+	if (ret) {
+		drm_err(&xe->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
+			id, ret);
+	} else if (msg_out.header.status != 0) {
+		if (is_fw_err_platform_config(msg_out.header.status)) {
+			drm_info_once(&xe->drm,
+				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
+				      id, msg_out.header.status,
+				      fw_err_to_string(msg_out.header.status));
+		} else {
+			drm_dbg(&xe->drm, "PXP inv-stream-key-%u failed 0x%08x:%s:\n",
+				id, msg_out.header.status,
+				fw_err_to_string(msg_out.header.status));
+			drm_dbg(&xe->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
+				msg_in.header.command_id, msg_in.header.api_version);
+		}
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
index 4ee8c0acfed9..7f26f1bd90dc 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.h
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
@@ -14,5 +14,6 @@ int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
 void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
 
 int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
+int xe_pxp_submit_session_invalidation(struct xe_pxp *pxp, u32 session_id);
 
 #endif /* __XE_PXP_SUBMIT_H__ */
-- 
2.43.0

