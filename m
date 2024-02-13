Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6AFC48BEB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 06:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E9F10EB8B;
	Tue, 13 Feb 2024 06:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+ifBatT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D856710EB11
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806672; x=1739342672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Ozd1OaodkgtyOZNqUmNk+CU1lnWWSk6v48X1PnhCcM=;
 b=g+ifBatTn3Gpzn+/2N/n1YEYLZ7UUtSpq6UpOsvHocF5VV85dNIauFif
 U9VlzyotvYX0B2wvcatpyXa8BYILRm9B4IUbOwaPnn1D/eLL6Fz1bhd8q
 GaZb/NEJa5qbxthb2BCFz5Bjv12qX3T/NOjBiLtnO9W7ITK7EOrfymret
 lrqgasIVPtncNOxCU5ryLoRNmaGMsWQfBUA7l4PkJX8y0iVE0fpCBRzuS
 pEQp5NMToPIs8yEFC/Rm4nhGi9yNFyFriUW9h0+RaPX4G+JQpVuOLC8xk
 PLAyRArcw+sabWeKq8bFrNg/LuerzifecH1zqyx24hQpYLyw8WEahmld8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5621245"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="5621245"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="33599823"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:44:31 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 15/16] drm/xe/oa: Add MMIO trigger support
Date: Mon, 12 Feb 2024 22:44:22 -0800
Message-ID: <20240213064423.131601-16-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213064423.131601-1-ashutosh.dixit@intel.com>
References: <20240213064423.131601-1-ashutosh.dixit@intel.com>
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

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  5 +++++
 drivers/gpu/drm/xe/xe_oa.c            | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 24 +++++++++++++++++++++++-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 6f7d300f56c86..4c9eee27b5c48 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -64,11 +64,16 @@
 #define  OA_OACONTROL_COUNTER_SIZE_MASK		REG_GENMASK(8, 8)
 
 #define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
+#define  OAG_OA_DEBUG_DISABLE_MMIO_TRG			REG_BIT(14)
+#define  OAG_OA_DEBUG_START_TRIGGER_SCOPE_CONTROL	REG_BIT(13)
+#define  OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL	REG_BIT(8)
+#define  OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL	REG_BIT(7)
 #define  OAG_OA_DEBUG_INCLUDE_CLK_RATIO			REG_BIT(6)
 #define  OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS		REG_BIT(5)
 #define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
 
 #define OAG_OASTATUS			XE_REG(0xdafc)
+#define OAG_MMIOTRIGGER			XE_REG(0xdb1c)
 /* OAC unit */
 #define OAC_OACONTROL			XE_REG(0x15114)
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f34c3cc90dcbc..630aeddc4a533 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -745,6 +745,13 @@ static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
 
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
@@ -760,6 +767,9 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
+			oag_configure_mmio_trigger(stream, false));
+
 	/* disable the context save/restore or OAR counters */
 	if (stream->exec_q)
 		xe_oa_configure_oa_context(stream, false);
@@ -911,9 +921,17 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
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
@@ -2121,6 +2139,10 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
 		}
 
+		/* Ensure MMIO trigger remains disabled till there is a stream */
+		xe_mmio_write32(gt, u->regs.oa_debug,
+				oag_configure_mmio_trigger(NULL, false));
+
 		/* Set oa_unit_ids now to ensure ids remain contiguous */
 		u->oa_unit_id = gt_to_xe(gt)->oa.oa_unit_ids++;
 	}
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 3fa2ece7d2289..3996934974fa0 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -7,6 +7,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_oa_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
@@ -63,7 +64,28 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
 	},
-
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
 
-- 
2.41.0

