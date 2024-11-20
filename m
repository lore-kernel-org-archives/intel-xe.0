Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EA4D743F5
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7010E3DD;
	Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nwc8gNuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B7710E183
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146246; x=1763682246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pQGxWcMuSN+okN9hmPXMPYfpEGJLzVprte30hg1vZV0=;
 b=Nwc8gNuID9/ll4hFcfpSzrKzmnS7g0OWQ2MUR0APnTBQbF1yQGfhKk6T
 IMnIBHY0lep4GUFI6mYFXBbpp6PJ7kDUvMO1bxmQndff+eGdt+bGuAX8M
 GQ/UXeeMaEZ1Ctnc2x2IKe6mpY5CCLqSPCRvSCL4KR89//LejolQsCXgR
 xXltnelYDOuJg6Au4qYj1VBfrWZrBnI5/Pcmhrc6ntmDyqSI3U9YbbUW0
 4DveyzLWm/JKIB5v7FRK6fPgm3ogbOSwLRD8vcB7gZzWAVP0/ZlE4dMBo
 xCcbP9dEqp+LAbKWuTCk17a79OBBKa3Hbklt+s5JfMgLs131UfWYGLVPE g==;
X-CSE-ConnectionGUID: EFzZ1ZgLRou1E0C8n0QjzQ==
X-CSE-MsgGUID: a1C9PJ8JT/KRIBnWueNeZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733278"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733278"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:06 -0800
X-CSE-ConnectionGUID: AOfpskpiT8ewGwD6bUnDEQ==
X-CSE-MsgGUID: N9ngvfV1Rj2F+dpxKgnusw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453636"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:06 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 04/12] drm/xe/pxp: Add GSC session invalidation support
Date: Wed, 20 Nov 2024 15:43:44 -0800
Message-ID: <20241120234353.1037180-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

v2: Better comment and error messages (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  13 +
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 228 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |   3 +
 3 files changed, 244 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
index f3c4cf10ba20..f0da65ccdda2 100644
--- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
+++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
@@ -31,6 +31,7 @@ enum pxp_status {
 	PXP_STATUS_NOT_READY = 0x100e,
 	PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
 	PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
+	PXP_STATUS_PLATFCONFIG_FIXED_KF1_NOT_SUPPORTED = 0x1037,
 	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
 };
 
@@ -49,6 +50,7 @@ struct pxp_cmd_header {
 	u32 buffer_len;
 } __packed;
 
+#define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
 #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
 
 /* PXP-Input-Packet: HUC Auth-only */
@@ -63,4 +65,15 @@ struct pxp43_huc_auth_out {
 	struct pxp_cmd_header header;
 } __packed;
 
+/* PXP-Input-Packet: Invalidate Stream Key */
+struct pxp43_inv_stream_key_in {
+	struct pxp_cmd_header header;
+	u32 rsvd[3];
+} __packed;
+
+/* PXP-Output-Packet: Invalidate Stream Key */
+struct pxp43_inv_stream_key_out {
+	struct pxp_cmd_header header;
+	u32 rsvd;
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index 326baea679a3..f5f6b18c1054 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -15,9 +15,13 @@
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
 #include "xe_lrc.h"
+#include "xe_map.h"
 #include "xe_pxp_types.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
+#include "abi/gsc_command_header_abi.h"
+#include "abi/gsc_pxp_commands_abi.h"
+#include "instructions/xe_gsc_commands.h"
 #include "instructions/xe_mfx_commands.h"
 #include "instructions/xe_mi_commands.h"
 
@@ -311,3 +315,227 @@ int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
 
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
+	case PXP_STATUS_PLATFCONFIG_FIXED_KF1_NOT_SUPPORTED:
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
+	case PXP_STATUS_PLATFCONFIG_FIXED_KF1_NOT_SUPPORTED:
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
+	job = xe_sched_job_create(q, &batch_addr);
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
+static int gsccs_send_message(struct xe_pxp_gsc_client_resources *gsc_res,
+			      void *msg_in, size_t msg_in_size,
+			      void *msg_out, size_t msg_out_size_max)
+{
+	struct xe_device *xe = gsc_res->vm->xe;
+	const size_t max_msg_size = gsc_res->inout_size - sizeof(struct intel_gsc_mtl_header);
+	u32 wr_offset;
+	u32 rd_offset;
+	u32 reply_size;
+	u32 min_reply_size = 0;
+	int ret;
+	int retry = GSC_PENDING_RETRY_MAXCOUNT;
+
+	if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
+		return -ENOSPC;
+
+	wr_offset = xe_gsc_emit_header(xe, &gsc_res->msg_in, 0,
+				       HECI_MEADDRESS_PXP,
+				       gsc_res->host_session_handle,
+				       msg_in_size);
+
+	/* NOTE: zero size packets are used for session-cleanups */
+	if (msg_in && msg_in_size) {
+		xe_map_memcpy_to(xe, &gsc_res->msg_in, wr_offset,
+				 msg_in, msg_in_size);
+		min_reply_size = sizeof(struct pxp_cmd_header);
+	}
+
+	/* Make sure the reply header does not contain stale data */
+	xe_gsc_poison_header(xe, &gsc_res->msg_out, 0);
+
+	/*
+	 * The BO is mapped at address 0 of the PPGTT, so no need to add its
+	 * base offset when calculating the in/out addresses.
+	 */
+	emit_pxp_heci_cmd(xe, &gsc_res->batch, PXP_BB_SIZE,
+			  wr_offset + msg_in_size, PXP_BB_SIZE + gsc_res->inout_size,
+			  wr_offset + msg_out_size_max);
+
+	xe_device_wmb(xe);
+
+	/*
+	 * If the GSC needs to communicate with CSME to complete our request,
+	 * it'll set the "pending" flag in the return header. In this scenario
+	 * we're expected to wait 50ms to give some time to the proxy code to
+	 * handle the GSC<->CSME communication and then try again. Note that,
+	 * although in most case the 50ms window is enough, the proxy flow is
+	 * not actually guaranteed to complete within that time period, so we
+	 * might have to try multiple times, up to a worst case of 2 seconds,
+	 * after which the request is considered aborted.
+	 */
+	do {
+		ret = pxp_pkt_submit(gsc_res->q, 0);
+		if (ret)
+			break;
+
+		if (xe_gsc_check_and_update_pending(xe, &gsc_res->msg_in, 0,
+						    &gsc_res->msg_out, 0)) {
+			ret = -EAGAIN;
+			msleep(GSC_PENDING_RETRY_PAUSE_MS);
+		}
+	} while (--retry && ret == -EAGAIN);
+
+	if (ret) {
+		drm_err(&xe->drm, "failed to submit GSC PXP message (%pe)\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = xe_gsc_read_out_header(xe, &gsc_res->msg_out, 0,
+				     min_reply_size, &rd_offset);
+	if (ret) {
+		drm_err(&xe->drm, "invalid GSC reply for PXP (%pe)\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	if (msg_out && min_reply_size) {
+		reply_size = xe_map_rd_field(xe, &gsc_res->msg_out, rd_offset,
+					     struct pxp_cmd_header, buffer_len);
+		reply_size += sizeof(struct pxp_cmd_header);
+
+		if (reply_size > msg_out_size_max) {
+			drm_warn(&xe->drm, "PXP reply size overflow: %u (%zu)\n",
+				 reply_size, msg_out_size_max);
+			reply_size = msg_out_size_max;
+		}
+
+		xe_map_memcpy_from(xe, msg_out, &gsc_res->msg_out,
+				   rd_offset, reply_size);
+	}
+
+	xe_gsc_poison_header(xe, &gsc_res->msg_in, 0);
+
+	return ret;
+}
+
+/**
+ * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
+ * @gsc_res: the pxp client resources
+ * @id: the session to invalidate
+ *
+ * Submit a message to the GSC FW to notify it that a session has been
+ * terminated and is therefore invalid.
+ *
+ * Returns 0 if the submission is successful, an errno value otherwise.
+ */
+int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res, u32 id)
+{
+	struct xe_device *xe = gsc_res->vm->xe;
+	struct pxp43_inv_stream_key_in msg_in = {0};
+	struct pxp43_inv_stream_key_out msg_out = {0};
+	int ret = 0;
+
+	/*
+	 * Stream key invalidation reuses the same version 4.2 input/output
+	 * command format but firmware requires 4.3 API interaction
+	 */
+	msg_in.header.api_version = PXP_APIVER(4, 3);
+	msg_in.header.command_id = PXP43_CMDID_INVALIDATE_STREAM_KEY;
+	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
+
+	msg_in.header.stream_id = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
+	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
+	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, id);
+
+	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
+				 &msg_out, sizeof(msg_out));
+	if (ret) {
+		drm_err(&xe->drm, "Failed to invalidate PXP stream-key %u (%pe)\n",
+			id, ERR_PTR(ret));
+	} else if (msg_out.header.status != 0) {
+		ret = -EIO;
+
+		if (is_fw_err_platform_config(msg_out.header.status))
+			drm_info_once(&xe->drm,
+				      "Failed to invalidate PXP stream-key %u: BIOS/SOC 0x%08x(%s)\n",
+				      id, msg_out.header.status,
+				      fw_err_to_string(msg_out.header.status));
+		else
+			drm_dbg(&xe->drm, "Failed to invalidate stream-key %u, s=0x%08x\n",
+				id, msg_out.header.status);
+	}
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
index 4ee8c0acfed9..48fdc9b09116 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.h
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
@@ -9,10 +9,13 @@
 #include <linux/types.h>
 
 struct xe_pxp;
+struct xe_pxp_gsc_client_resources;
 
 int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
 void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
 
 int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
+int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res,
+				       u32 id);
 
 #endif /* __XE_PXP_SUBMIT_H__ */
-- 
2.43.0

