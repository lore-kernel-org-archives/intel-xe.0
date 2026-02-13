Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A823EEA871
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 00:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F2510E77C;
	Fri, 13 Feb 2026 00:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsLa4g3E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595B210E161
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 00:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770941376; x=1802477376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gQLSbxAfraInPh2rTV7UrFGrmOyObq6YCK09vgBdfP0=;
 b=gsLa4g3Eqxu0rbTDSTPKk2UeuICcrjNCtbrOyAiPK5AN6IBXaK5oQXjS
 7YVjPd4f68xABlaUQjFwDFw4dOPVKQgc+7Anh7wL385dtP+0x/iz8NbV4
 FvUvmCJGAe/NbKZfBaDa81dj4kLk7BIGZVkDcJvDw8BtIU8nRnmpsz8rr
 OLuyXptT81FZKfjSh7i7Sj4fEKC3muvquOOgR3y5gziiB292R+v2vmA9l
 pkX3ieTdJiv1W9pBnG2Cre2ffBfSHDleztRLXup0RXina48D7cbZe+FEq
 G2fb1WeV9jSmy1YGy50Oy3YA1tzZvZp2/vtKwXDebJItivrv2j72dUL/c g==;
X-CSE-ConnectionGUID: EJa/sAyKSVu1JH8sJ23BOg==
X-CSE-MsgGUID: fwN5v7Y2RqucjCGZYJh8Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94764100"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="94764100"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 16:09:36 -0800
X-CSE-ConnectionGUID: VaL9CYDOQzqzymjxfM3xSQ==
X-CSE-MsgGUID: p4v4mlM1RlWNA4HQ1vbV9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="212595833"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 16:09:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 3/4] drm/xe: Add facility to lookup the value of a register
 in a default LRC
Date: Thu, 12 Feb 2026 16:09:33 -0800
Message-ID: <20260213000929.732113-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213000929.732113-6-matthew.d.roper@intel.com>
References: <20260213000929.732113-6-matthew.d.roper@intel.com>
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

