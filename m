Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D294FED3FA
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB90F10E11F;
	Fri, 24 Apr 2026 20:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWkvkvdK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E8410E119
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063830; x=1808599830;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=O5tcU0W/OTBOqMC1CUo0gSiX9kNArfLWQhnBDgoskJA=;
 b=gWkvkvdKjxZowe21TbWbSHIkrObbIRBD2zL2E2Esg0aQv8jIV9bH4AeC
 2cLovzTcT9pIRGY/E8r2onYsJmCYcEAojXcv1dfR7H5Dbu5A+cCMArBuZ
 Ieqr/WyvBnN1pkE4jipx+vsnKY4VUAxBjTDv6BIxosWPVchqFn3IMGFE+
 XJETNCuH4S1DC21LoL5MdMlLNPOUYO+KmPLz4rSG2b0LhrOvjWL4pE5Kj
 OGyup2U54EFaTc50cBJaCKS5aPQtSftvaejiMBSh3zvzG3yuPQZppEmAz
 hswZg6AjkX9EDNEuq62MX8QfOEvk5zhY98szEaAemJiEMoLkUlrZT86Nt w==;
X-CSE-ConnectionGUID: 15Opw16/QOqOVTLisvmyRw==
X-CSE-MsgGUID: zl/VC0tyQKWMqlsemS8Zbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80633995"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80633995"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: nenlpQynRoONWyFyy8eFCQ==
X-CSE-MsgGUID: 5NrB/i2QRKeO/U4QQ5neIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560125"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:11 -0700
Subject: [PATCH v2 01/10] drm/xe: Move CCS enablement to engine setup RTP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-1-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4318;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=O5tcU0W/OTBOqMC1CUo0gSiX9kNArfLWQhnBDgoskJA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eTmv2k9fYS+igMzfaVwGWTucSXtLGoaFHCt
 NaeDyJ5XmKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXkwAKCRBNeSQFyHKQ
 BFauD/9QPYFylmu49qCsy+ITTw2LBJN3KBPvasDRY45h6LH3TDv76kgVVb/O/JCKDPorsh5J64i
 4IaNqHHa8yd8kY1u8aZ8IM5QsuPa0D+NYvLQEH2aQLx/pYHUmlWWhZgBSDla+MH/0ZRyxPfBnwf
 87Y8o6D9ewG4nM2od6v+HhHnznrO9CmWXdUeiRHjPcYv0zwmIV5q4UD3nmafQ2/8KtmWo7aUm4I
 KaC5o7nNof8B/OOXAfYlOLZwM+lVMDOU5oi9sAe6qiBVqEqEXQiww64u4Wz0qJGvCxKFhZ9SEgQ
 uBVkmLlTXDsmMvuXrAmyzL2EHV97pDCK3LSlkgP6mKfeB0K7A/lI9GefHRNiLCmoLChb2tIdpmT
 IAirPzcnKEKw8QCB/Uy7rI1KrfM1cZxiuuaHbeAr8UC5rfyWvnVezeDFvgvm3m/I1Bz+agSfrsl
 YzqL/TJAWxNw1E1bto4H+GnKnc0to6wNAkPtNEivLSrUVpNqNRuakv5+hfffY82KTMFpq9ZPWxQ
 MmPZW2vhY87CCvKz9sbav43b06XG1SdH/S1/PEpKU8m7EFhCfpnDSwTwHi0TsovaZDkFthjvI5v
 9v4YMsKwVv1UjAp9oup6D1+wIqPG9xzqdRB6b9oIXT/jsUX3k+mvPOio80HFDKC2asHxrrplVaF
 tXMOHZC+WsgMfHA==
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

Most register programming for engine setup happens via RTP tables in
hw_engine_setup_default_state().  Move the programming of RCU_MODE[0]
which enables the platform's CCS engine(s) there.  This both makes the
code more consistent (other RCU_MODE register programming is already
happening in this RTP table) and improves debuggability (since RTP
contents and checks of their correct programming are exposed via
debugfs).  It also helps consolidate the regular driver initialization
paths with the vestigial and currently unused execlist (i.e., non-GuC)
initialization.

With the original programming, the RCU_MODE register (which is a single
global register, not a per-engine register) was getting re-programmed
with the same value during the initialization of each CCS engine.  When
moved to the RTP table, we use the xe_rtp_match_first_render_or_compute
match function so that it will just be programmed once, while doing the
initialization for the first RCS/CCS engine, which avoids the redundant
and unnecessary repetition.

We can also safely drop the explicit addition of RCU_MODE from the GuC
ADS save-restore list now since all registers programmed via RTP tables
are automatically added to the GuC's list.

v2:
 - Only enable CCS engines on Xe_HP and later.  Even though Xe_LP
   platforms technically have a CCS engine, it's never been enabled on
   i915 or Xe due to other issues on these old platforms.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c  |  4 ----
 drivers/gpu/drm/xe/xe_guc_ads.c   |  1 -
 drivers/gpu/drm/xe/xe_hw_engine.c | 11 +++++------
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 1f8d358e60fd..026a1ec0c868 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -59,10 +59,6 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 		lrc_desc |= FIELD_PREP(SW_CTX_ID, ctx_id);
 	}
 
-	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		xe_mmio_write32(mmio, RCU_MODE,
-				REG_MASKED_FIELD_ENABLE(RCU_MODE_CCS_ENABLE));
-
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
 	lrc->ring.old_tail = lrc->ring.tail;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 92c6981fe220..d0497d9f43a2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -748,7 +748,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		{ .reg = RING_MODE(hwe->mmio_base),			},
 		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
 		{ .reg = RING_IMR(hwe->mmio_base),			},
-		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
 		{ .reg = CCS_MODE,
 		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_ccs_mode_enabled(hwe->gt) },
 	};
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 2f9c1c063f16..74f29025dd6c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -325,14 +325,8 @@ u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
-	u32 ccs_mask =
-		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
 	u32 ring_mode = REG_MASKED_FIELD_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
-	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
-		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
-				REG_MASKED_FIELD_ENABLE(RCU_MODE_CCS_ENABLE));
-
 	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
 	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 				  xe_bo_ggtt_addr(hwe->hwsp));
@@ -465,6 +459,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		{ XE_RTP_NAME("Enable CCS Engine(s)"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
+		},
 		/* Use Fixed slice CCS mode */
 		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
 		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),

-- 
2.53.0

