Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0DBFDEE57
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 22:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B343810E375;
	Thu, 23 Apr 2026 22:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kl8lQO3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1476B10E121
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776984548; x=1808520548;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=serCkpzQIfEk65OTSyn+PbZqEE+azfS2OmK67yM1d4k=;
 b=Kl8lQO3h+X+SMCney+tvi2RiR248wYePWxNUi19WGTIl62SbdjAxhunV
 QJeag/Jm2+P2hd18Wb3oFSS6Enc2tqBPfVoQRtgW/xog6rhp6ePCap2rf
 XnkvTdxfeB6RpkMy9AVsYO6PLAMruAgnWFAd0KfEyZmWNcSQA0/DdgnF+
 5QBoD+FZR4oeBsg3DLA/ZqX9or9FovCXzDGW86a0lZ3WJPGgGkwtJdhk+
 518m+cejsJDkdUv1GO1IqKhQEKQeYNiDyAPo7OQ/ausnJGec9BmPLOiT/
 PIoiwXAF22ins3FOGJJ7pFzDKg0oxVgq9qs+HfHmupDg/bTezuxjPtJ9q A==;
X-CSE-ConnectionGUID: tNSZotCTQVqG2/me7+z7Eg==
X-CSE-MsgGUID: dfm1hx8aSz23wMc973Jo5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65497062"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="65497062"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:07 -0700
X-CSE-ConnectionGUID: Zi/ZtCSoQnCmpDLP7CkXYA==
X-CSE-MsgGUID: ryiP0ZAISom5ZrCKyaDa1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="232696184"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 15:49:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 23 Apr 2026 15:48:48 -0700
Subject: [PATCH 01/10] drm/xe: Move CCS enablement to engine setup RTP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-engine-setup-v1-1-baa94014e3e5@intel.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4040;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=serCkpzQIfEk65OTSyn+PbZqEE+azfS2OmK67yM1d4k=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp6qHeNNSFalZWUVfxNVOZMz4+4TjwQSuyXLan8
 NLkxGBFNhGJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaeqh3gAKCRBNeSQFyHKQ
 BKc4D/9+gbpTfYHEhI5dQnXMJPSQ2CzPF3XPb6cXGq3jpOF6Sk/JGWlpFbhMlbOkhpg0ZgXvjQh
 K3LvXkH8xI5TCG8GOqb+kDQWOIdQsHSTp2G0gnfzjgRuDzuvt7KDdojv/QBuPal2axn98ypcbPu
 +ZqC/zEBzIhb7uRve8rvR+zwee4XRLIO6AE0jzfOz/w/z5elsgbPGIxFaDzc8ZVFXpoGBih9ytG
 hXHH9V8TGUEFjY3rD5C0tOSdUGNcvUt4vGNiwNlWrlk1xKZvj+fREtjZrag2do9DIKAHkX9b41u
 1FQeMMDJas+9Fnr8j05D1it207bky+30LpfAQsy2+1XOEkqVtlcEZmkzn02holGtA4hpvJ5ELPX
 PZ79nfJjgSryG2dSkFInFKC1d3s5cNjJTYlL1p54VFzGoHf3iFID7TmJnDyubyQcLsswkF9Vwt7
 sUkePqncyKSetPeRe6ZVbigf7+0VLBIuCimN9ccAq4LgxNI4XGf+Hw5jkLZLbVJmN7IjwhXTYOB
 oT4qTSlAzfZyMhocJSfOZ7ixrtibztFxH/JhpvM4w4DsVvI6uVHOnAQBaQntLwH22ZcWO1OSYPP
 P/E7BtXoaVcpQB+gazM1Bdsqm0dfFVTrIdGH77OYyoP/llbbBdl3tNa9QJdTCYzu2u4rPtD7nhw
 70dhSyXjhUbOoEw==
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c  |  4 ----
 drivers/gpu/drm/xe/xe_guc_ads.c   |  1 -
 drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++------
 3 files changed, 4 insertions(+), 11 deletions(-)

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
index 2f9c1c063f16..3d9931f54cee 100644
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
@@ -465,6 +459,10 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		{ XE_RTP_NAME("Enable CCS Engine(s)"),
+		  XE_RTP_RULES(FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
+		},
 		/* Use Fixed slice CCS mode */
 		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
 		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),

-- 
2.53.0

