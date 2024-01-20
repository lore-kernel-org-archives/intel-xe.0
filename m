Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ABBC47DB7
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04D010EAE8;
	Sat, 20 Jan 2024 02:00:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6D710EADE
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jan 2024 02:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705716032; x=1737252032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7KX5ANhyKfoexyQX4aaCcEagaC+rGiLfFPxzlZOq7zo=;
 b=FzOzgE+XPQUJDZVXtzf7dX2Yvg3vGkChgI7E+EhiQu82ByBC2CM71D1B
 xICRPXRhwohXG9MissY7I1NtOdgL/7J+9kEcxohjlfGRKdsHBE81lsKdi
 BBaiinaJZmdZbZkFfz+L0cjDJl7jcHLSVHOyfVlzwWYAiwufThoU1qY2F
 2HMMxGDDsb5cmJYucS2h5TY+ZD+Xd8HIt5HlFJy1jPDYsaXXXmudXFuoh
 tCWaJYqQDlXI/OsOJMd2Xs9zBo2Dsi7jC+OLjsJMeryPo3qYl3kbVkrs4
 khwispFEBopdr6irIo+g0JpBwk1lKze7VoKd3Yj5/M/jxgVMfWC8Qg6yM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19472947"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="19472947"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="778125724"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="778125724"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 18:00:30 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/16] drm/xe/oa: Add OAC support
Date: Fri, 19 Jan 2024 18:00:22 -0800
Message-ID: <20240120020026.1261201-13-ashutosh.dixit@intel.com>
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

Similar to OAR, allow userspace to execute MI_REPORT_PERF_COUNT on compute
engines of a specified exec queue.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h     |  3 +
 drivers/gpu/drm/xe/xe_oa.c               | 74 +++++++++++++++++++++++-
 3 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index b6ef2df0e5ac0..9e430f56b3b83 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -127,6 +127,7 @@
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
+#define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 09d6d4f169f52..6f7d300f56c86 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -69,6 +69,9 @@
 #define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
 
 #define OAG_OASTATUS			XE_REG(0xdafc)
+/* OAC unit */
+#define OAC_OACONTROL			XE_REG(0x15114)
+
 /* OAM unit */
 #define OAM_HEAD_POINTER_OFFSET			(0x1a0)
 #define OAM_TAIL_POINTER_OFFSET			(0x1a4)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index b693c302777c9..eed89649daa08 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -406,6 +406,19 @@ static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel
 		REG_FIELD_PREP(OA_OACONTROL_COUNTER_SIZE_MASK, format->counter_size);
 }
 
+static u32 __oa_ccs_select(struct xe_oa_stream *stream)
+{
+	u32 val;
+
+	if (stream->hwe->class != XE_ENGINE_CLASS_COMPUTE)
+		return 0;
+
+	val = REG_FIELD_PREP(OAG_OACONTROL_OA_CCS_SELECT_MASK, stream->hwe->instance);
+	xe_assert(stream->oa->xe,
+		  REG_FIELD_GET(OAG_OACONTROL_OA_CCS_SELECT_MASK, val) == stream->hwe->instance);
+	return val;
+}
+
 static void xe_oa_enable(struct xe_oa_stream *stream)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
@@ -420,7 +433,7 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 
 	regs = __oa_regs(stream);
 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
-		OAG_OACONTROL_OA_COUNTER_ENABLE;
+		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
 
 	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
 }
@@ -679,6 +692,57 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 	return xe_oa_load_with_lri(stream, &reg_lri);
 }
 
+static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
+{
+	const struct xe_oa_format *format = stream->oa_buffer.format;
+	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
+	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
+	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
+		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
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
+				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0) |
+			_MASKED_FIELD(CTX_CTRL_RUN_ALONE,
+				      enable ? CTX_CTRL_RUN_ALONE : 0),
+		},
+	};
+	struct xe_oa_reg reg_lri = { OAC_OACONTROL, oacontrol };
+	int err;
+
+	/* Set ccs select to enable programming of OAC_OACONTROL */
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, __oa_ccs_select(stream));
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
+static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
+{
+	switch (stream->hwe->class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return xe_oa_configure_oar_context(stream, enable);
+	case XE_ENGINE_CLASS_COMPUTE:
+		return xe_oa_configure_oac_context(stream, enable);
+	default:
+		/* Video engines do not support MI_REPORT_PERF_COUNT */
+		return 0;
+	}
+}
+
 #define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
 
 static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
@@ -698,7 +762,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 
 	/* disable the context save/restore or OAR counters */
 	if (stream->exec_q)
-		xe_oa_configure_oar_context(stream, false);
+		xe_oa_configure_oa_context(stream, false);
 
 	/* Make sure we disable noa to save power. */
 	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
@@ -865,8 +929,9 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 
 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
 
+	/* Configure OAR/OAC */
 	if (stream->exec_q) {
-		ret = xe_oa_configure_oar_context(stream, true);
+		ret = xe_oa_configure_oa_context(stream, true);
 		if (ret)
 			return ret;
 	}
@@ -1496,6 +1561,9 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
 		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
 			return -ENOENT;
+
+		if (param.exec_q->width > 1)
+			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
 	}
 
 	/*
-- 
2.41.0

