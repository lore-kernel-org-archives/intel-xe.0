Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02544C47DDF
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA86B10EAE5;
	Sat, 20 Jan 2024 02:00:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB7E10EACC
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716032; x=1737252032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=++Z0Wy4SrzIs9Vdg8Im2hLmRcFuXg9+Wy+xCjdiitO8=;
 b=lobdvm+iVTslK+sqSLjoXyXrs/drYvErUA1GeWvejI/7mzIGmd36AGDU
 htJJJGNiKW3O+fGRudW+BXt6HWB2RE3ucbWapmB3l7Scyb6gR6u6SeVlW
 pdpQL9Mz2PK+J+xcp5SEdeiGwxtLyK4/JwEjY3e/g9HxIvQJAMjMZXXRD
 gm7DhR8b6lIzhnLAeQFXaRTJQrnc9Qp/I7n7JmIR6Ay0S4dcuGrW9sGCv
 jxFUK0VvCYl8zkJkqn6n66IjmmrBH7C+qaJ5f/7ptvETYp0sbVy0/PkMS
 7N6/8m4z/TZXfUvBFLTV3btxiQ2jGWxO0kXhwkRTVzIpFaKnH1YJqELVl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472946"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472946"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125721"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125721"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 11/16] drm/xe/oa: Add OAR support
Date: Fri, 19 Jan 2024 18:00:21 -0800
Message-ID: <20240120020026.1261201-12-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   3 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   3 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  11 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |   1 +
 drivers/gpu/drm/xe/xe_oa.c                    | 190 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa_types.h              |   4 +
 6 files changed, 206 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c74ceb550dce7..48d4c759c6885 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -45,6 +45,9 @@
 #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
 #define   MI_LRI_NUM_REGS(x)		XE_INSTR_NUM_DW(2 * (x) + 1)
 #define   MI_LRI_FORCE_POSTED		REG_BIT(12)
+#define   IS_MI_LRI_CMD(x)		(REG_FIELD_GET(MI_OPCODE, (x)) == \
+					 REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
+#define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
 
 #define MI_FLUSH_DW			__MI_INSTR(0x26)
 #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 0b1266c88a6af..b6ef2df0e5ac0 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -125,7 +125,8 @@
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
-#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244)
+#define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
+#define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f17e9785355e8..7a078c987bdcf 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -586,12 +586,18 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 
 /* Make the magic macros work */
 #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
+#define __xe_lrc_regs_offset xe_lrc_regs_offset
 
 #define LRC_SEQNO_PPHWSP_OFFSET 512
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
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
@@ -623,11 +629,6 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
 }
 
-static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
-{
-	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
-}
-
 #define DECL_MAP_ADDR_HELPERS(elem) \
 static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
 { \
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 28b1d3f404d4f..d6d8aa8fb51eb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -23,6 +23,7 @@ void xe_lrc_finish(struct xe_lrc *lrc);
 
 size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
+u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
 
 void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
 u32 xe_lrc_ring_head(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 261f513947c5e..b693c302777c9 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -11,7 +11,9 @@
 #include <drm/xe_drm.h>
 
 #include "instructions/xe_mi_commands.h"
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_lrc_layout.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -19,6 +21,7 @@
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
 #include "xe_sched_job.h"
@@ -51,6 +54,12 @@ struct xe_oa_config {
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
@@ -583,6 +592,93 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
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
+	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
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
+	err = xe_oa_modify_ctx_image(stream, &stream->exec_q->lrc[0],
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
@@ -600,6 +696,10 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
+	/* disable the context save/restore or OAR counters */
+	if (stream->exec_q)
+		xe_oa_configure_oar_context(stream, false);
+
 	/* Make sure we disable noa to save power. */
 	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
 
@@ -727,6 +827,7 @@ static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
 static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 {
 	u32 oa_debug, sqcnt1;
+	int ret;
 
 	/*
 	 * Wa_1508761755:xehpsdv, dg2
@@ -764,6 +865,12 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 
 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
 
+	if (stream->exec_q) {
+		ret = xe_oa_configure_oar_context(stream, true);
+		if (ret)
+			return ret;
+	}
+
 	return xe_oa_emit_oa_config(stream);
 }
 
@@ -911,6 +1018,78 @@ static const struct file_operations xe_oa_fops = {
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
+static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
+{
+	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
+	u32 len = (xe_lrc_size(stream->oa->xe, stream->hwe->class) +
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
@@ -928,6 +1107,17 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
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
index 539830f5f0b24..d93b7b490563b 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -13,6 +13,7 @@
 
 #include <drm/xe_drm.h>
 #include "regs/xe_reg_defs.h"
+#include "xe_hw_engine_types.h"
 
 #define XE_OA_BUFFER_SIZE SZ_16M
 
@@ -132,6 +133,9 @@ struct xe_oa {
 	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
 	struct idr metrics_idr;
 
+	/** @ctx_oactxctrl_offset: offset of OACTXCONTROL register in context image */
+	u32 ctx_oactxctrl_offset[XE_ENGINE_CLASS_MAX];
+
 	/** @oa_formats: tracks all OA formats across platforms */
 	const struct xe_oa_format *oa_formats;
 
-- 
2.41.0

