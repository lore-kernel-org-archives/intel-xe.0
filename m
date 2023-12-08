Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA278C46CA3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685D010E9F7;
	Fri,  8 Dec 2023 06:43:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302BC10E9D9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702017817; x=1733553817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3YCXAaDXLa7yzlHKJevisZc8Kbb3NgzakxUvZNK89uc=;
 b=URSDS4NbUnWNQRXD+UTbvonc8WT8SS/jvurAQpfug+q+H6a65EC0otZ7
 +ylPB5BkQneizIDSEsoBq3GuEnhOIwfmLh6/TSxw71+HIOoWrjusIfhLS
 GFIdAWJJHom9Qy86nMncH2YHNp2dgbjhy4wv+nOnCMoZMZYzmdakY4dCM
 95EdZISR4T56RdIiiYlJGhbWh8GKzv4J5ywWvauGFRQuNCdc+yjzvnQfm
 tlJvvTOm0MLnSFI0ozIF4+98jLzmLYviQ8PTOmKUWtczuPLiFns6DiXSD
 AMtPVaNfdwV05Z25olwhlZkXnNRYILuP6p1eDqQ5ltYZ+sbEcbcGrHsyr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373866617"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="373866617"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775699269"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="775699269"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:43:36 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 16/17] drm/xe/oa: Add MMIO trigger support
Date: Thu,  7 Dec 2023 22:43:28 -0800
Message-ID: <20231208064329.2387604-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
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

Add MMIO trigger support and allow-list required registers for MMIO trigger
use case. Registers are whitelisted for the lifetime of the driver but MMIO
trigger is enabled only for the duration of the stream.

Bspec: 45925, 60340, 61228

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  7 ++++++
 drivers/gpu/drm/xe/xe_oa.c            | 34 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 23 ++++++++++++++++++
 include/uapi/drm/xe_drm.h             |  3 +++
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index b66cd95b795e7..1ce27a72079ad 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -64,16 +64,23 @@
 #define  OA_OACONTROL_COUNTER_SIZE_MASK		REG_GENMASK(8, 8)
 
 #define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
+#define  OAG_OA_DEBUG_DISABLE_MMIO_TRG			REG_BIT(14)
+#define  OAG_OA_DEBUG_START_TRIGGER_SCOPE_CONTROL	REG_BIT(13)
+#define  OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL	REG_BIT(8)
+#define  OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL	REG_BIT(7)
 #define  OAG_OA_DEBUG_INCLUDE_CLK_RATIO			REG_BIT(6)
 #define  OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS		REG_BIT(5)
 #define  OAG_OA_DEBUG_DISABLE_GO_1_0_REPORTS		REG_BIT(2)
 #define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
 
 #define OAG_OASTATUS XE_REG(0xdafc)
+#define  OAG_OASTATUS_MMIO_TRG_Q_FULL	REG_BIT(6)
 #define  OAG_OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
 #define  OAG_OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
 #define  OAG_OASTATUS_REPORT_LOST	REG_BIT(0)
 
+#define OAG_MMIOTRIGGER			XE_REG(0xdb1c)
+
 /* OAC unit */
 #define OAC_OACONTROL			XE_REG(0x15114)
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 97779cbb83ee8..13c6e516d9169 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -525,6 +525,16 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
 		oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
 	}
 
+	if (oastatus & OAG_OASTATUS_MMIO_TRG_Q_FULL) {
+		ret = xe_oa_append_status(stream, buf, count, offset,
+					  DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL);
+		if (ret)
+			return ret;
+
+		xe_mmio_rmw32(stream->gt, oastatus_reg,
+			      OAG_OASTATUS_MMIO_TRG_Q_FULL, 0);
+	}
+
 	if (oastatus & OAG_OASTATUS_REPORT_LOST) {
 		ret = xe_oa_append_status(stream, buf, count, offset,
 					  DRM_XE_OA_RECORD_OA_REPORT_LOST);
@@ -835,6 +845,13 @@ static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
 
 #define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
 
+static u32 oag_configure_mmio_trigger(const struct xe_oa_stream *stream, bool enable)
+{
+	return _MASKED_FIELD(OAG_OA_DEBUG_DISABLE_MMIO_TRG,
+			     enable && stream && stream->sample ?
+			     0 : OAG_OA_DEBUG_DISABLE_MMIO_TRG);
+}
+
 static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 {
 	u32 sqcnt1;
@@ -850,6 +867,9 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
+			oag_configure_mmio_trigger(stream, false));
+
 	/* disable the context save/restore or OAR counters */
 	if (stream->exec_q)
 		xe_oa_configure_oa_context(stream, false);
@@ -1031,9 +1051,17 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
 	oa_debug = OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS |
 		OAG_OA_DEBUG_INCLUDE_CLK_RATIO;
 
+	if (GRAPHICS_VER(stream->oa->xe) >= 20)
+		oa_debug |=
+			/* The three bits below are needed to get PEC counters running */
+			OAG_OA_DEBUG_START_TRIGGER_SCOPE_CONTROL |
+			OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL |
+			OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL;
+
 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
 			_MASKED_BIT_ENABLE(oa_debug) |
-			oag_report_ctx_switches(stream));
+			oag_report_ctx_switches(stream) |
+			oag_configure_mmio_trigger(stream, true));
 
 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
 			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
@@ -2259,6 +2287,10 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
 		}
 
+		/* Ensure MMIO triggers remain disabled till there is a stream */
+		xe_mmio_write32(gt, u->regs.oa_debug,
+				oag_configure_mmio_trigger(NULL, false));
+
 		/* Set oa_unit_ids now to ensure ids remain contiguous */
 		u->oa_unit_id = gt_to_xe(gt)->oa.oa_unit_ids++;
 	}
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index e66ae1bdaf9c0..267af6759332b 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -7,6 +7,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_oa_regs.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
@@ -56,6 +57,28 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_DENY,
 				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("oa_reg_render"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
+			 WHITELIST(OAG_OASTATUS,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD),
+			 WHITELIST(OAG_OAHEADPTR,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
+				   RING_FORCE_TO_NONPRIV_RANGE_4))
+	},
+	{ XE_RTP_NAME("oa_reg_compute"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+		       ENGINE_CLASS(COMPUTE)),
+	  XE_RTP_ACTIONS(WHITELIST(OAG_MMIOTRIGGER,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
+			 WHITELIST(OAG_OASTATUS,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD),
+			 WHITELIST(OAG_OAHEADPTR,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
+				   RING_FORCE_TO_NONPRIV_RANGE_4))
+	},
 	{}
 };
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 5f41c5bfe5e0e..34cd7d5206834 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1357,6 +1357,9 @@ enum drm_xe_oa_record_type {
 	 */
 	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
 
+	/** @DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL: Status indicating MMIO trigger queue full */
+	DRM_XE_OA_RECORD_OA_MMIO_TRG_Q_FULL = 4,
+
 	DRM_XE_OA_RECORD_MAX /* non-ABI */
 };
 
-- 
2.41.0

