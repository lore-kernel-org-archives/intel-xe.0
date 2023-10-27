Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16594C25B72
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF5410EA5F;
	Fri, 27 Oct 2023 22:30:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CFE10EA5E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445785; x=1729981785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=55Dw8M7WjqxaCYoIqiTiFHOYBGxFrB+Ylc1x1k56tXY=;
 b=MRrgqGbZo/7WMxNn2g34Pk0uMRiSTDmoLLwr0X50P8W8yoUGe8PFqIck
 WdxKSzpfI8A/KTCSWl/PBccLU0LJLjnn2OwtiOA/CjFa8Usoh5Zp252Ia
 /xdQSB6qbrNgeOV0Dxkz8hUwNk98xkumiib8eUCxpapKbyGQvtHhFflAb
 Lojt6qfg8g+GXIrKF9dgA9fQHdOpsKzWE4ER+PpJufrlUc7XLM/qDSH8M
 uvcI6FFrQma7tv6DKDbWokAW8EosFKtZcDqgBNjuHmJ4tDj/eoEaQoeoN
 Bq+swK0FcNtPUPusM68ClQsBgPg/9FyTj0tubtCue+OOZCg9+Sm20dTXT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397787"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397787"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360378"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360378"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:45 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:23 -0700
Message-ID: <20231027222928.1981633-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/12] drm/xe/gsc: Add an interface for GSC
 packet submissions
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

Communication with the GSC FW is done via input/output buffers, whose
addresses are provided via a GSCCS command. The buffers contain a
generic header and a client-specific packet (e.g. PXP, HDCP); the
clients don't care about the header format and/or the GSCCS command in
the batch, they only care about their client-specific header. This patch
therefore introduces helpers that allow the callers to automatically
fill in the input header, submit the GSCCS job and decode the output
header, to make it so that the caller only needs to worry about their
client-specific input and output messages.

NOTE: this patch by itself only adds the interface so it does nothing,
I've kept it separate for review but the plan is to squash it with the
follow up patch before merge, so that the interface and the user are
introduced at the same time.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 +++++
 .../gpu/drm/xe/instructions/xe_gsc_commands.h |   2 +
 drivers/gpu/drm/xe/xe_gsc_submit.c            | 170 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++++
 5 files changed, 249 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
 create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4a442dcf4d79..876c122ad63c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -58,6 +58,7 @@ xe-y += xe_bb.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
 	xe_gsc.o \
+	xe_gsc_submit.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
diff --git a/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
new file mode 100644
index 000000000000..a4c2646803b5
--- /dev/null
+++ b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _ABI_GSC_COMMAND_HEADER_ABI_H
+#define _ABI_GSC_COMMAND_HEADER_ABI_H
+
+#include <linux/types.h>
+
+struct intel_gsc_mtl_header {
+	u32 validity_marker;
+#define GSC_HECI_VALIDITY_MARKER 0xA578875A
+
+	u8 heci_client_id;
+
+	u8 reserved1;
+
+	u16 header_version;
+#define MTL_GSC_HEADER_VERSION 1
+
+	/* FW allows host to decide host_session handle as it sees fit. */
+	u64 host_session_handle;
+
+	/* handle generated by FW for messages that need to be re-submitted */
+	u64 gsc_message_handle;
+
+	u32 message_size; /* lower 20 bits only, upper 12 are reserved */
+
+	/*
+	 * Flags mask:
+	 * Bit 0: Pending
+	 * Bit 1: Session Cleanup;
+	 * Bits 2-15: Flags
+	 * Bits 16-31: Extension Size
+	 * According to internal spec flags are either input or output
+	 * we distinguish the flags using OUTFLAG or INFLAG
+	 */
+	u32 flags;
+#define GSC_OUTFLAG_MSG_PENDING	BIT(0)
+#define GSC_INFLAG_MSG_CLEANUP	BIT(1)
+
+	u32 status;
+} __packed;
+
+#endif
diff --git a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
index c7a833d7f965..f8949cad9d0f 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gsc_commands.h
@@ -28,6 +28,8 @@
 	REG_FIELD_PREP(GSC_OPCODE, op) | \
 	REG_FIELD_PREP(GSC_CMD_DATA_AND_LEN, dl))
 
+#define GSC_HECI_CMD_PKT __GSC_INSTR(0, 6)
+
 #define GSC_FW_LOAD __GSC_INSTR(1, 2)
 #define   GSC_FW_LOAD_LIMIT_VALID REG_BIT(31)
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
new file mode 100644
index 000000000000..e96336ac4728
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_gsc_submit.h"
+
+#include "abi/gsc_command_header_abi.h"
+#include "xe_bb.h"
+#include "xe_exec_queue.h"
+#include "xe_gt_printk.h"
+#include "xe_gt_types.h"
+#include "xe_map.h"
+#include "xe_sched_job.h"
+#include "instructions/xe_gsc_commands.h"
+#include "regs/xe_gsc_regs.h"
+
+#define GSC_HDR_SIZE (sizeof(struct intel_gsc_mtl_header)) /* shorthand define */
+
+#define mtl_gsc_header_wr(xe_, map_, offset_, field_, val_) \
+	xe_map_wr_field(xe_, map_, offset_, struct intel_gsc_mtl_header, field_, val_)
+
+#define mtl_gsc_header_rd(xe_, map_, offset_, field_) \
+	xe_map_rd_field(xe_, map_, offset_, struct intel_gsc_mtl_header, field_)
+
+static struct xe_gt *
+gsc_to_gt(struct xe_gsc *gsc)
+{
+	return container_of(gsc, struct xe_gt, uc.gsc);
+}
+
+/**
+ * xe_gsc_header_write - write the MTL GSC header in memory
+ * @xe: the Xe device
+ * @map: the iosys map to write to
+ * @offset: offset from the start of the map at which to write the header
+ * @heci_client_id: client id identifying the type of command (see abi for values)
+ * @host_session_id: host session ID of the caller
+ * @payload_size: size of the payload that follows the header
+ *
+ * Returns: offset memory location following the header
+ */
+u32 xe_gsc_emit_header(struct xe_device *xe, struct iosys_map *map, u32 offset,
+		       u8 heci_client_id, u64 host_session_id, u32 payload_size)
+{
+	xe_map_memset(xe, map, offset, 0, GSC_HDR_SIZE);
+
+	mtl_gsc_header_wr(xe, map, offset, validity_marker, GSC_HECI_VALIDITY_MARKER);
+	mtl_gsc_header_wr(xe, map, offset, heci_client_id, heci_client_id);
+	mtl_gsc_header_wr(xe, map, offset, host_session_handle, host_session_id);
+	mtl_gsc_header_wr(xe, map, offset, header_version, MTL_GSC_HEADER_VERSION);
+	mtl_gsc_header_wr(xe, map, offset, message_size, payload_size + GSC_HDR_SIZE);
+
+	return offset + GSC_HDR_SIZE;
+};
+
+/**
+ * xe_gsc_check_and_update_pending - check the pending bit and update the input
+ * header with the retry handle from the output header
+ * @xe: the Xe device
+ * @in: the iosys map containing the input buffer
+ * @offset_in: offset within the iosys at which the input buffer is located
+ * @out: the iosys map containing the output buffer
+ * @offset_out: offset within the iosys at which the output buffer is located
+ *
+ * Returns: true if the pending bit was set, false otherwise
+ */
+bool xe_gsc_check_and_update_pending(struct xe_device *xe,
+				     struct iosys_map *in, u32 offset_in,
+				     struct iosys_map *out, u32 offset_out)
+{
+	if (mtl_gsc_header_rd(xe, out, offset_out, flags) & GSC_OUTFLAG_MSG_PENDING) {
+		u64 handle = mtl_gsc_header_rd(xe, out, offset_out, gsc_message_handle);
+
+		mtl_gsc_header_wr(xe, in, offset_in, gsc_message_handle, handle);
+
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * xe_gsc_read_out_header - reads and validates the output header and returns
+ * the offset of the reply following the header
+ * @xe: the Xe device
+ * @map: the iosys map containing the output buffer
+ * @offset: offset within the iosys at which the output buffer is located
+ * @min_payload_size: minimum size of the message excluding the gsc header
+ * @payload_offset: optional pointer to be set to the payload offset
+ *
+ * Returns: -errno value on failure, 0 otherwise
+ */
+int xe_gsc_read_out_header(struct xe_device *xe,
+			   struct iosys_map *map, u32 offset,
+			   u32 min_payload_size,
+			   u32 *payload_offset)
+{
+	u32 marker = mtl_gsc_header_rd(xe, map, offset, validity_marker);
+	u32 size = mtl_gsc_header_rd(xe, map, offset, message_size);
+	u32 payload_size = size - GSC_HDR_SIZE;
+
+	if (marker != GSC_HECI_VALIDITY_MARKER)
+		return -EPROTO;
+
+	if (size < GSC_HDR_SIZE || payload_size < min_payload_size)
+		return -ENODATA;
+
+	if (payload_offset)
+		*payload_offset = offset + GSC_HDR_SIZE;
+
+	return 0;
+}
+
+/**
+ * xe_gsc_pkt_submit_kernel - submit a kernel heci pkt to the GSC
+ * @xe: the GSC uC
+ * @addr_in: GGTT address of the message to send to the GSC
+ * @size_in: size of the message to send to the GSC
+ * @addr_out: GGTT address for the GSC to write the reply to
+ * @size_out: size of the memory reserved for the reply
+ */
+int xe_gsc_pkt_submit_kernel(struct xe_gsc *gsc, u64 addr_in, u32 size_in,
+			     u64 addr_out, u32 size_out)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_bb *bb;
+	struct xe_sched_job *job;
+	struct dma_fence *fence;
+	long timeout;
+
+	if (size_in < GSC_HDR_SIZE)
+		return -ENODATA;
+
+	if (size_out < GSC_HDR_SIZE)
+		return -ENOMEM;
+
+	bb = xe_bb_new(gt, 8, false);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
+
+	bb->cs[bb->len++] = GSC_HECI_CMD_PKT;
+	bb->cs[bb->len++] = lower_32_bits(addr_in);
+	bb->cs[bb->len++] = upper_32_bits(addr_in);
+	bb->cs[bb->len++] = size_in;
+	bb->cs[bb->len++] = lower_32_bits(addr_out);
+	bb->cs[bb->len++] = upper_32_bits(addr_out);
+	bb->cs[bb->len++] = size_out;
+	bb->cs[bb->len++] = 0;
+
+	job = xe_bb_create_job(gsc->q, bb);
+	if (IS_ERR(job)) {
+		xe_bb_free(bb, NULL);
+		return PTR_ERR(job);
+	}
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
+	dma_fence_put(fence);
+	xe_bb_free(bb, NULL);
+	if (timeout < 0)
+		return timeout;
+	else if (!timeout)
+		return -ETIME;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.h b/drivers/gpu/drm/xe/xe_gsc_submit.h
new file mode 100644
index 000000000000..0801da5d446a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GSC_SUBMIT_H_
+#define _XE_GSC_SUBMIT_H_
+
+#include <linux/types.h>
+
+struct iosys_map;
+struct xe_device;
+struct xe_gsc;
+
+u32 xe_gsc_emit_header(struct xe_device *xe, struct iosys_map *map, u32 offset,
+		       u8 heci_client_id, u64 host_session_id, u32 payload_size);
+
+bool xe_gsc_check_and_update_pending(struct xe_device *xe,
+				     struct iosys_map *in, u32 offset_in,
+				     struct iosys_map *out, u32 offset_out);
+
+int xe_gsc_read_out_header(struct xe_device *xe,
+			   struct iosys_map *map, u32 offset,
+			   u32 min_payload_size,
+			   u32 *payload_offset);
+
+int xe_gsc_pkt_submit_kernel(struct xe_gsc *gsc, u64 addr_in, u32 size_in,
+			     u64 addr_out, u32 size_out);
+
+#endif
-- 
2.41.0

