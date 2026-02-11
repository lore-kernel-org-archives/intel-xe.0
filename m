Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07407ECD6F9
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 23:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A757C10E66A;
	Wed, 11 Feb 2026 23:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwVff/MQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2774710E66C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 23:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770852862; x=1802388862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gQLSbxAfraInPh2rTV7UrFGrmOyObq6YCK09vgBdfP0=;
 b=NwVff/MQw52nY/aqT6d2Q8G88Qe9iJfeBYzUlaDmERtoIugNFM6l97It
 0tISinB1Rym2iljMfbgjuMznmAuIB/dOULiORi2Q14nXId+tQ5LccMLl0
 nZiPWuN631JASWDR5XFIura9STYmXPRW6+wNTTyxqqDUhE3op9Olp+JsB
 C2PkIbw7a/4FGb+J3PUNoFs+1nRODs3KAdrZ64Ns3G2V/BKMuSKTdFLdy
 eUOftE+3EipyqDShS1aBS6MN04EUXWzE/rPUgjzOkRNyFJItryoNYpWkT
 6FEj8GyWB/5SAEgzgPwnYj+u3lcH5nJ62ePkJqiS88yGR63V4DMelTobf A==;
X-CSE-ConnectionGUID: CSVDm62ZTEyJ/SsRgHYkcA==
X-CSE-MsgGUID: qFXFa3y3QTirUgXa1/jZPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="59585373"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="59585373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:34:22 -0800
X-CSE-ConnectionGUID: qDscuGWFTb6OSgd48Dfugw==
X-CSE-MsgGUID: WXk5CW7URq2IoDEwvNnCyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216931327"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:34:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 3/4] drm/xe: Add facility to lookup the value of a register
 in a default LRC
Date: Wed, 11 Feb 2026 15:34:15 -0800
Message-ID: <20260211233411.614951-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211233411.614951-6-matthew.d.roper@intel.com>
References: <20260211233411.614951-6-matthew.d.roper@intel.com>
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

An LRC is stored in memory as a special batchbuffer that hardware will
execute to re-load state when switching to the context; it's a
collection of register values (encoded as MI_LOAD_REGISTER_IMM commands)
and other state instructions (e.g., 3DSTATE_*).  The value that will be
loaded for a given register can be determined by parsing the batchbuffer
to find MI_LRI commands and extracting the value from the offset/value
pairs it contains.  Add functions to do this, which will be used in a
future patch to help verify that our expected reg_sr programming is in
place.

The implementation here returns the value as soon as it finds a match in
the LRC.  Technically a register could appear multiple times (either due
to memory corruption or a hardware defect) and the last value
encountered would be the one in effect when the context resumes
execution.  We can adjust the logic to keep looking and return the last
match instead of first in the future if we encounter real-world cases
where this would assist with debugging.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 96 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h |  4 ++
 2 files changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 38f648b98868..57ef4f527ed0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2155,6 +2155,102 @@ void xe_lrc_dump_default(struct drm_printer *p,
 	}
 }
 
+/*
+ * Lookup the value of a register within the offset/value pairs of an
+ * MI_LOAD_REGISTER_IMM instruction.
+ *
+ * Return -ENOENT if the register is not present in the MI_LRI instruction.
+ */
+static int lookup_reg_in_mi_lri(u32 offset, u32 *value,
+				const u32 *dword_pair, int num_regs)
+{
+	for (int i = 0; i < num_regs; i++) {
+		if (dword_pair[2 * i] == offset) {
+			*value = dword_pair[2 * i + 1];
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+/*
+ * Lookup the value of a register in a specific engine type's default LRC.
+ *
+ * Return -EINVAL if the default LRC doesn't exist, or ENOENT if the register
+ * cannot be found in the default LRC.
+ */
+int xe_lrc_lookup_default_reg_value(struct xe_gt *gt,
+				    enum xe_engine_class hwe_class,
+				    u32 offset,
+				    u32 *value)
+{
+	u32 *dw;
+	int remaining_dw, ret;
+
+	if (!gt->default_lrc[hwe_class])
+		return -EINVAL;
+
+	/*
+	 * Skip the beginning of the LRC since it contains the per-process
+	 * hardware status page.
+	 */
+	dw = gt->default_lrc[hwe_class] + LRC_PPHWSP_SIZE;
+	remaining_dw = (xe_gt_lrc_size(gt, hwe_class) - LRC_PPHWSP_SIZE) / 4;
+
+	while (remaining_dw > 0) {
+		u32 num_dw = instr_dw(*dw);
+
+		if (num_dw > remaining_dw)
+			num_dw = remaining_dw;
+
+		switch (*dw & XE_INSTR_CMD_TYPE) {
+		case XE_INSTR_MI:
+			switch (*dw & MI_OPCODE) {
+			case MI_BATCH_BUFFER_END:
+				/* End of LRC; register not found */
+				return -ENOENT;
+
+			case MI_NOOP:
+			case MI_TOPOLOGY_FILTER:
+				/*
+				 * MI_NOOP and MI_TOPOLOGY_FILTER don't have
+				 * a length field and are always 1-dword
+				 * instructions.
+				 */
+				remaining_dw--;
+				dw++;
+				break;
+
+			case MI_LOAD_REGISTER_IMM:
+				ret = lookup_reg_in_mi_lri(offset, value,
+							   dw + 1, (num_dw - 1) / 2);
+				if (ret == 0)
+					return 0;
+
+				fallthrough;
+
+			default:
+				/*
+				 * Jump to next instruction based on length
+				 * field.
+				 */
+				remaining_dw -= num_dw;
+				dw += num_dw;
+				break;
+			}
+			break;
+
+		default:
+			/* Jump to next instruction based on length field. */
+			remaining_dw -= num_dw;
+			dw += num_dw;
+		}
+	}
+
+	return -ENOENT;
+}
+
 struct instr_state {
 	u32 instr;
 	u16 num_dw;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c307a3fd9ea2..3e500004f1ae 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -133,6 +133,10 @@ size_t xe_lrc_skip_size(struct xe_device *xe);
 void xe_lrc_dump_default(struct drm_printer *p,
 			 struct xe_gt *gt,
 			 enum xe_engine_class);
+int xe_lrc_lookup_default_reg_value(struct xe_gt *gt,
+				    enum xe_engine_class hwe_class,
+				    u32 offset,
+				    u32 *value);
 
 u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
 
-- 
2.53.0

