Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE03C2BD05
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 01:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7147710E55A;
	Tue, 18 Jun 2024 01:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2aUVohY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDD610E55E
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 01:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718675181; x=1750211181;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=q1lswruCe5sTu+e3zblP2yiaTT7T0rkaESQuFpAOe9w=;
 b=Y2aUVohYkOyCRrERXu9dkNSZ5yGIdG/8q96Xl06wNP7/oqK1+++hTMj7
 YaDFAZuM96UQMCGwBuI0O+/CjhczpV7gWD3bYUdfJKv0rvgONKlawNif5
 jcrH0xdu4T5CDUZfqgciFNL0Bfilii//gUT+ICcvNMYN5O7ARiiTLWsLh
 74CFEXpCjWM0K1FwZu/8+53y/WDjReSXHICNY62+YReU4OqOIfBVIc2Mo
 nndE5RKFM/ygxWeFpJJZpKk5ILZMVKUpHkZJ2idN5+ZYySrjEOrFD/yua
 UYqKK0Oyk23Pg3maVlC5JYZWadJuUflgpqgmcgSQTlnKTgoFjZdnlEfnF g==;
X-CSE-ConnectionGUID: 7983G9OsS+uwo0XrqELI9g==
X-CSE-MsgGUID: DSHcLFIvQ+e9cJX+iPtIoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38051505"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="38051505"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 18:46:20 -0700
X-CSE-ConnectionGUID: dV8lpa1tTCexF5snRUqQ9g==
X-CSE-MsgGUID: ZqQje3xJSpa3Zs3a69KZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41314326"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 18:46:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 14/17] drm/xe/oa: Add MMIO trigger support
Date: Mon, 17 Jun 2024 18:46:06 -0700
Message-ID: <20240618014609.3233427-15-ashutosh.dixit@intel.com>
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

Add MMIO trigger support and allow-list required registers for MMIO trigger
use case. Registers are whitelisted for the lifetime of the driver but MMIO
trigger is enabled only for the duration of the stream.

Bspec: 45925, 60340, 61228

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h  |  5 +++++
 drivers/gpu/drm/xe/xe_oa.c            | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 24 +++++++++++++++++++++++-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 2c9e1214e2af..1189f5a540a8 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -60,6 +60,10 @@
 #define  OA_OACONTROL_COUNTER_SIZE_MASK		REG_GENMASK(8, 8)
 
 #define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
+#define  OAG_OA_DEBUG_DISABLE_MMIO_TRG			REG_BIT(14)
+#define  OAG_OA_DEBUG_START_TRIGGER_SCOPE_CONTROL	REG_BIT(13)
+#define  OAG_OA_DEBUG_DISABLE_START_TRG_2_COUNT_QUAL	REG_BIT(8)
+#define  OAG_OA_DEBUG_DISABLE_START_TRG_1_COUNT_QUAL	REG_BIT(7)
 #define  OAG_OA_DEBUG_INCLUDE_CLK_RATIO			REG_BIT(6)
 #define  OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS		REG_BIT(5)
 #define  OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
@@ -69,6 +73,7 @@
 #define  OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
 #define  OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
 #define  OASTATUS_REPORT_LOST		REG_BIT(0)
+#define OAG_MMIOTRIGGER			XE_REG(0xdb1c)
 /* OAC unit */
 #define OAC_OACONTROL			XE_REG(0x15114)
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 00654213cd93..beafe409dba9 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -760,6 +760,13 @@ static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
 
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
@@ -775,6 +782,9 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
 	}
 
+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
+			oag_configure_mmio_trigger(stream, false));
+
 	/* disable the context save/restore or OAR counters */
 	if (stream->exec_q)
 		xe_oa_configure_oa_context(stream, false);
@@ -927,9 +937,17 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
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
@@ -2203,6 +2221,10 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
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

