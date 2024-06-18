Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CA1C2BB9A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 01:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E19410E205;
	Tue, 18 Jun 2024 01:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMXIIu1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E5F10E013
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 01:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718675181; x=1750211181;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kog2znHvka5oT2Qe0fMak/o9++c4Mjp69xwp9SqJi+Q=;
 b=aMXIIu1bdSfJliqWV/QFinwU346A9f+w3qIdvxwGLwpCvgGSt2VDiU4V
 FyjMUTh/e3x89uSp/INbXvBQW2vGTYByoIDOhvnSA1GAnJCa52p8igEd5
 PsTO4OksbCa7YK5fvalP42AMyS/ZXo2jqpY9wz99AuCWlhVV1zJhDi1KH
 YhnDKQPan1a4Vr83QR/dClnd3cKZlz3lLaJV5IlNhCaBmDHtlpPhOHNAO
 4ybzC+ItYVjxl6T9UwZZYKQy4WWTy4FU6AlK6+C5CdVYuoQPntnT8Z5oc
 65UDPvh/mdpmHy2vNi95BVl51t14AycU3swLhIBuwHp6Vl7apdxsmRuPI g==;
X-CSE-ConnectionGUID: VAQLbu4QRNKfhuPugt2+mg==
X-CSE-MsgGUID: L1EoLAKOSmm4Y8/ZEyRJVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38051501"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="38051501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 18:46:20 -0700
X-CSE-ConnectionGUID: GwiCre1ZQ0u3JwYc62FoFQ==
X-CSE-MsgGUID: y5cHjS/xT9qvi4ef+7lZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41314322"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 18:46:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/17] drm/xe/oa: Add OAR support
Date: Mon, 17 Jun 2024 18:46:02 -0700
Message-ID: <20240618014609.3233427-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240618014609.3233427-1-ashutosh.dixit@intel.com>
References: <20240618014609.3233427-1-ashutosh.dixit@intel.com>
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

Add OAR support to allow userspace to execute MI_REPORT_PERF_COUNT on
render engines. Configuration batches are used to program the OAR unit, as
well as modifying the render engine context image of a specified exec queue
(to have correct register values when that context switches in).

v2: Rename/refactor xe_oa_modify_self (Umesh)
v3: Move IS_MI_LRI_CMD() into xe_oa.c (Michal)

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |   1 +
 drivers/gpu/drm/xe/xe_oa.c                    | 193 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h              |   4 +
 6 files changed, 206 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index b7bf99dd4848..10ec2920d31b 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -45,6 +45,7 @@
 #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
 #define   MI_LRI_NUM_REGS(x)		XE_INSTR_NUM_DW(2 * (x) + 1)
 #define   MI_LRI_FORCE_POSTED		REG_BIT(12)
+#define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
 
 #define MI_FLUSH_DW			__MI_INSTR(0x26)
 #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 263ffc7bc2ef..cdc68d373165 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -129,6 +129,7 @@
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
+#define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
 #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 43bc5e33a6c7..94ff62e1d95e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -651,6 +651,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 
 /* Make the magic macros work */
 #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
+#define __xe_lrc_regs_offset xe_lrc_regs_offset
 
 #define LRC_SEQNO_PPHWSP_OFFSET 512
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
@@ -658,6 +659,11 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 #define LRC_PPHWSP_SIZE SZ_4K
 
+u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
+{
+	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
+}
+
 static size_t lrc_reg_size(struct xe_device *xe)
 {
 	if (GRAPHICS_VERx100(xe) >= 1250)
@@ -695,11 +701,6 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
 }
 
-static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
-{
-	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
-}
-
 static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
 {
 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 001af6c79454..c24542e89318 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -52,6 +52,7 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
 
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
+u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
 
 void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
 u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 86d56b080eff..d9285c976dbb 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -13,7 +13,9 @@
 #include <drm/xe_drm.h>
 
 #include "instructions/xe_mi_commands.h"
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_lrc_layout.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_assert.h"
 #include "xe_bb.h"
@@ -24,6 +26,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
@@ -58,6 +61,12 @@ struct xe_oa_config {
 	struct rcu_head rcu;
 };
 
+struct flex {
+	struct xe_reg reg;
+	u32 offset;
+	u32 value;
+};
+
 struct xe_oa_open_param {
 	u32 oa_unit_id;
 	bool sample;
@@ -598,6 +607,93 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
 		free_oa_config_bo(oa_bo);
 }
 
+static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
+			     struct xe_bb *bb, const struct flex *flex, u32 count)
+{
+	u32 offset = xe_bo_ggtt_addr(lrc->bo);
+
+	do {
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(22) /* GGTT */ | 2;
+		bb->cs[bb->len++] = offset + flex->offset * sizeof(u32);
+		bb->cs[bb->len++] = 0;
+		bb->cs[bb->len++] = flex->value;
+
+	} while (flex++, --count);
+}
+
+static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
+				  const struct flex *flex, u32 count)
+{
+	struct xe_bb *bb;
+	int err;
+
+	bb = xe_bb_new(stream->gt, 4 * count, false);
+	if (IS_ERR(bb)) {
+		err = PTR_ERR(bb);
+		goto exit;
+	}
+
+	xe_oa_store_flex(stream, lrc, bb, flex, count);
+
+	err = xe_oa_submit_bb(stream, bb);
+	xe_bb_free(bb, NULL);
+exit:
+	return err;
+}
+
+static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
+{
+	struct xe_bb *bb;
+	int err;
+
+	bb = xe_bb_new(stream->gt, 3, false);
+	if (IS_ERR(bb)) {
+		err = PTR_ERR(bb);
+		goto exit;
+	}
+
+	write_cs_mi_lri(bb, reg_lri, 1);
+
+	err = xe_oa_submit_bb(stream, bb);
+	xe_bb_free(bb, NULL);
+exit:
+	return err;
+}
+
+static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
+{
+	const struct xe_oa_format *format = stream->oa_buffer.format;
+	struct xe_lrc *lrc = stream->exec_q->lrc[0];
+	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
+	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
+		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
+
+	struct flex regs_context[] = {
+		{
+			OACTXCONTROL(stream->hwe->mmio_base),
+			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
+			enable ? OA_COUNTER_RESUME : 0,
+		},
+		{
+			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
+			regs_offset + CTX_CONTEXT_CONTROL,
+			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
+				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0)
+		},
+	};
+	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
+	int err;
+
+	/* Modify stream hwe context image with regs_context */
+	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
+				     regs_context, ARRAY_SIZE(regs_context));
+	if (err)
+		return err;
+
+	/* Apply reg_lri using LRI */
+	return xe_oa_load_with_lri(stream, &reg_lri);
+}
+
 #define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
 
 static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
@@ -615,6 +711,10 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
+	/* disable the context save/restore or OAR counters */
+	if (stream->exec_q)
+		xe_oa_configure_oar_context(stream, false);
+
 	/* Make sure we disable noa to save power. */
 	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
 
@@ -743,6 +843,7 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 {
 	u32 oa_debug, sqcnt1;
+	int ret;
 
 	/*
 	 * Wa_1508761755:xehpsdv, dg2
@@ -780,6 +881,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 
 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
 
+	if (stream->exec_q) {
+		ret = xe_oa_configure_oar_context(stream, true);
+		if (ret)
+			return ret;
+	}
+
 	return xe_oa_emit_oa_config(stream);
 }
 
@@ -949,6 +1056,81 @@ static const struct file_operations xe_oa_fops = {
 	.unlocked_ioctl	= xe_oa_ioctl,
 };
 
+static bool engine_supports_mi_query(struct xe_hw_engine *hwe)
+{
+	return hwe->class == XE_ENGINE_CLASS_RENDER ||
+		hwe->class == XE_ENGINE_CLASS_COMPUTE;
+}
+
+static bool xe_oa_find_reg_in_lri(u32 *state, u32 reg, u32 *offset, u32 end)
+{
+	u32 idx = *offset;
+	u32 len = min(MI_LRI_LEN(state[idx]) + idx, end);
+	bool found = false;
+
+	idx++;
+	for (; idx < len; idx += 2) {
+		if (state[idx] == reg) {
+			found = true;
+			break;
+		}
+	}
+
+	*offset = idx;
+	return found;
+}
+
+#define IS_MI_LRI_CMD(x) (REG_FIELD_GET(MI_OPCODE, (x)) == \
+			  REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
+
+static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
+{
+	struct xe_lrc *lrc = stream->exec_q->lrc[0];
+	u32 len = (xe_gt_lrc_size(stream->gt, stream->hwe->class) +
+		   lrc->ring.size) / sizeof(u32);
+	u32 offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
+	u32 *state = (u32 *)lrc->bo->vmap.vaddr;
+
+	if (drm_WARN_ON(&stream->oa->xe->drm, !state))
+		return U32_MAX;
+
+	for (; offset < len; ) {
+		if (IS_MI_LRI_CMD(state[offset])) {
+			/*
+			 * We expect reg-value pairs in MI_LRI command, so
+			 * MI_LRI_LEN() should be even
+			 */
+			drm_WARN_ON(&stream->oa->xe->drm,
+				    MI_LRI_LEN(state[offset]) & 0x1);
+
+			if (xe_oa_find_reg_in_lri(state, reg, &offset, len))
+				break;
+		} else {
+			offset++;
+		}
+	}
+
+	return offset < len ? offset : U32_MAX;
+}
+
+static int xe_oa_set_ctx_ctrl_offset(struct xe_oa_stream *stream)
+{
+	struct xe_reg reg = OACTXCONTROL(stream->hwe->mmio_base);
+	u32 offset = stream->oa->ctx_oactxctrl_offset[stream->hwe->class];
+
+	/* Do this only once. Failure is stored as offset of U32_MAX */
+	if (offset)
+		goto exit;
+
+	offset = xe_oa_context_image_offset(stream, reg.addr);
+	stream->oa->ctx_oactxctrl_offset[stream->hwe->class] = offset;
+
+	drm_dbg(&stream->oa->xe->drm, "%s oa ctx control at 0x%08x dword offset\n",
+		stream->hwe->name, offset);
+exit:
+	return offset && offset != U32_MAX ? 0 : -ENODEV;
+}
+
 static int xe_oa_stream_init(struct xe_oa_stream *stream,
 			     struct xe_oa_open_param *param)
 {
@@ -966,6 +1148,17 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	stream->periodic = param->period_exponent > 0;
 	stream->period_exponent = param->period_exponent;
 
+	if (stream->exec_q && engine_supports_mi_query(stream->hwe)) {
+		/* If we don't find the context offset, just return error */
+		ret = xe_oa_set_ctx_ctrl_offset(stream);
+		if (ret) {
+			drm_err(&stream->oa->xe->drm,
+				"xe_oa_set_ctx_ctrl_offset failed for %s\n",
+				stream->hwe->name);
+			goto exit;
+		}
+	}
+
 	stream->oa_config = xe_oa_get_oa_config(stream->oa, param->metric_set);
 	if (!stream->oa_config) {
 		drm_dbg(&stream->oa->xe->drm, "Invalid OA config id=%i\n", param->metric_set);
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 5bb8ce0d71c9..d28ee566c51c 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -13,6 +13,7 @@
 
 #include <drm/xe_drm.h>
 #include "regs/xe_reg_defs.h"
+#include "xe_hw_engine_types.h"
 
 #define XE_OA_BUFFER_SIZE SZ_16M
 
@@ -137,6 +138,9 @@ struct xe_oa {
 	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
 	struct idr metrics_idr;
 
+	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context image */
+	u32 ctx_oactxctrl_offset[XE_ENGINE_CLASS_MAX];
+
 	/** @oa_formats: tracks all OA formats across platforms */
 	const struct xe_oa_format *oa_formats;
 
-- 
2.41.0

