Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B765C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 03:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4104111269D;
	Tue, 12 Mar 2024 03:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLqUeWJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE3810EE49
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 03:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710214761; x=1741750761;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q9fvG/pHRKNZcaThbhGUzmcwIAFtYURnmH8bY7hwVjg=;
 b=fLqUeWJj4ls7OUlvpXpdGDsWKfRR+CqC2kvd8qKp70akr6g5nyXSNqkJ
 FyUkqz0dpMiIVXKKDon2xQmM9FtCCqzu5+9puUsb949fbhw5aDqk2SKZi
 tRsiMm1STiYKH5bZKNZs16Uwm6Z5lwGk/Dy24v20egrb0zoOKE6PIqE4q
 RwkdVy5zZIjU240wKwhZDn8k2/tgdbvXiev6RxQHzCvcBguzqKDMX3c8z
 xdo0QkE/p1uKxmpUi54JyjQf5lkQ+ECHNw9E0DNTtoSSclu9CI7Fo3LE5
 HAbARj/XdW8TslVH+7RTUnPwOvL0nRfedqNJVUu6kjkTuKX4Vy91ndmmS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5080190"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5080190"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 20:39:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="11488744"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 20:39:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 14/17] drm/xe/oa: Add MMIO trigger support
Date: Mon, 11 Mar 2024 20:39:13 -0700
Message-ID: <20240312033914.2747740-15-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312033914.2747740-1-ashutosh.dixit@intel.com>
References: <20240312033914.2747740-1-ashutosh.dixit@intel.com>
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
index 6b682c0dda83..6ad3304c4d19 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -63,11 +63,16 @@
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
index f59d08894cd3..8b62ce6265a8 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -728,6 +728,13 @@ static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
 
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
@@ -743,6 +750,9 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
+			oag_configure_mmio_trigger(stream, false));
+
 	/* disable the context save/restore or OAR counters */
 	if (stream->exec_q)
 		xe_oa_configure_oa_context(stream, false);
@@ -894,9 +904,17 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
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
@@ -2113,6 +2131,10 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
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
index 3fa2ece7d228..3996934974fa 100644
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

