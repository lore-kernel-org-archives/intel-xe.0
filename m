Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F85FDEE28
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AFF10E36C;
	Thu, 23 Apr 2026 22:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlRzSXnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD39510E107
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984549; x=1808520549;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=lr1GuQazOqVs4UPFWCwHXhKdMZqdWP78GVCi11iT/LY=;
 b=VlRzSXnQlmslGrJc8ipiX1b5AJ9ppNxOq5+nbRrWFA0JyHCFe/0c0S3M
 Ggr0/NDmw/V0RadBp7ACkJcA8eW9r5SLyG3rTEvyojfSn6a6mDX06mD0n
 sobHrvzrpFfVtL3rE4+BM0l2erCXiOfhVC+uyhl6G95ASK80YNgC24qHs
 hXomaHViiSbfd7UMR5/2bNP0lj/st3aOp2ZSfy0KPPcdekbmIn2YNfbly
 0N229R7aOII96NoYM7iqav7hbZBFommosmHkZtnbXRrv1cude88y16Gvm
 GpmVBvqXXIQwR+2yo6+KSVCicSL3p0ODXcDeUd/qD2mBtB4hY6aRsmuDE g==;
X-CSE-ConnectionGUID: aI8fuWJRTZGNZuPS3h+c5g==
X-CSE-MsgGUID: kvB0BcyXRaWcq4Uk12eJDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497071"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497071"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:08 -0700
X-CSE-ConnectionGUID: +OWti8PMThG3696pmlMvPQ==
X-CSE-MsgGUID: g4NaQO6KS/yxjub3Gpzt1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696202"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:54 -0700
Subject: [PATCH 07/10] drm/xe: Move GFX_MODE programming to RTP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-7-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5874;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=lr1GuQazOqVs4UPFWCwHXhKdMZqdWP78GVCi11iT/LY=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHeKme0U63/ZXBmv4UHqtFDy5syi8FZnYZuj
 tOARgkW6HqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3gAKCRBNeSQFyHKQ
 BI0DD/0RNeMw91DACSc/ur6hUMH5jYBhdcvp4KgxKq/YjZ5uB73f+I0HjOU0WzgUvRe8GcqJ89z
 7Nvv2zJzmOuDfCrHq1n6ysmGJzJXp0OyRB2Ju5TVu2C5dhQNujBs4+DxNsEbWbFBRNGJdv2cfCk
 qKpeGVv7rz0NtmoSqR7FTMHtUVMVO2zEdkMt0Z6yWqcoOkdSS2CwulnoGk3rQYl/WOO1UJSIbRB
 LdCIVNhNha+mkQTFYRFLGy7BpOJ5GKygDO+/dWd6Bb0meuHWaGiE149oepzQBziJTx304ndNN/n
 dMUWCrKK5v/oQHWqbe/KQ0GMjjJuYYblH955g6ECQhDJeutnxns3fEuLAArIQyLQL/Bz8O4MFzb
 owO3Ws21GWRwQsPRkF8ghhaPDT0pU0U3/8po/Su2s4s3dzkTU8hxkBVVqlzRAcYG3qEdO4XPKNa
 er7fymHbwdpK9QV1LaFfP17ller+8EUFShvBKZdYv4xD/wVE5IC2Fs+0ZyO5X4US1lPjgz250vL
 +jNebsL4AcBgKy/JU8sT5NNbn61rXQHwG4f7Sk+cwjcJrBwYUacM4S22q06eqDzAAphWTkNWENH
 s1YXlpxaM5aWSy/J6OKAH9JcMLCCQs14De8ruEuLgItej7/zkR5SrNW+5RSJGF1g+y2iEFTOWgT
 BCwd2JEMQguTYUw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The write GFX_MODE to disable engine "legacy mode" and to enable MSI-X
support was unnecessarily open-coded in xe_hw_engine_enable_ring();
it's preferable to do such programming in the engine_entries[] RTP table
since gets reflected/verified in debugfs, and will also automatically
ensure that the register is properly saved/restored around engine
resets.  This also helps consolidate common logic that was duplicated
between the main driver initialization path and the dead-code execlist
initialization path.

This also allows us to drop GFX_MODE from the list of extra registers to
be added to the GuC ADS' save-restore list since all registers on the
RTP table are added automatically.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c  |  5 -----
 drivers/gpu/drm/xe/xe_guc_ads.c   |  1 -
 drivers/gpu/drm/xe/xe_hw_engine.c | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_rtp.c       |  8 ++++++++
 drivers/gpu/drm/xe/xe_rtp.h       | 12 ++++++++++++
 5 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 337b9b4e8b4a..9fb99c038ea8 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -47,7 +47,6 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	struct xe_mmio *mmio = &gt->mmio;
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 lrc_desc;
-	u32 ring_mode = REG_MASKED_FIELD_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
 	lrc_desc = xe_lrc_descriptor(lrc);
 
@@ -78,10 +77,6 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 			xe_bo_ggtt_addr(hwe->hwsp));
 	xe_mmio_read32(mmio, RING_HWS_PGA(hwe->mmio_base));
 
-	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
-		ring_mode |= REG_MASKED_FIELD_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
-	xe_mmio_write32(mmio, GFX_MODE(hwe->mmio_base), ring_mode);
-
 	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
 			lower_32_bits(lrc_desc));
 	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base),
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index b403ee0b5e74..ce651da6f318 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -745,7 +745,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		struct xe_reg reg;
 		bool skip;
 	} *e, extra_regs[] = {
-		{ .reg = GFX_MODE(hwe->mmio_base),			},
 		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
 		{ .reg = RING_IMR(hwe->mmio_base),			},
 		{ .reg = CCS_MODE,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index d28f50a64d88..8d54f943f507 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -325,14 +325,8 @@ u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
-	u32 ring_mode = REG_MASKED_FIELD_ENABLE(GFX_DISABLE_LEGACY_MODE);
-
 	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 				  xe_bo_ggtt_addr(hwe->hwsp));
-
-	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
-		ring_mode |= REG_MASKED_FIELD_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
-	xe_hw_engine_mmio_write32(hwe, GFX_MODE(0), ring_mode);
 	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
 				  REG_MASKED_FIELD_DISABLE(STOP_RING));
 	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
@@ -441,6 +435,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		{ XE_RTP_NAME("Disable engine 'legacy' mode"),
+		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_DISABLE_LEGACY_MODE,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		/*
 		 * To allow the GSC engine to go idle on MTL we need to enable
 		 * idle messaging and set the hysteresis value (we use 0xA=5us
@@ -473,6 +472,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
 					   RCU_MODE_FIXED_SLICE_CCS_MODE))
 		},
+		{ XE_RTP_NAME("Enable MSI-X interrupt support"),
+		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_MSIX_INTERRUPT_ENABLE,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 	};
 
 	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries),
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 728933a1c34f..1a4dcbbbc176 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -10,6 +10,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_configfs.h"
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
 #include "xe_reg_sr.h"
@@ -404,3 +405,10 @@ bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
 {
 	return xe->info.has_flat_ccs;
 }
+
+bool xe_rtp_match_has_msix(const struct xe_device *xe,
+			   const struct xe_gt *gt,
+			   const struct xe_hw_engine *hwe)
+{
+	return xe_device_has_msix(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index d058a629cd3e..562082b18d7b 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -536,4 +536,16 @@ bool xe_rtp_match_has_flat_ccs(const struct xe_device *xe,
 			       const struct xe_gt *gt,
 			       const struct xe_hw_engine *hwe);
 
+/**
+ * xe_rtp_match_has_msix - Match when platform has MSI-X
+ * @xe: Device structure
+ * @gt: GT structure
+ * @hwe: Engine instance
+ *
+ * Returns: true if platform has MSI-X interrupt support
+ */
+bool xe_rtp_match_has_msix(const struct xe_device *xe,
+			   const struct xe_gt *gt,
+			   const struct xe_hw_engine *hwe);
+
 #endif

-- 
2.53.0

