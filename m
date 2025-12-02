Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08EBD12669
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B2E10E6A1;
	Tue,  2 Dec 2025 18:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiP1FOre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D503B10E6A1
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764700986; x=1796236986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ItH2Ajo3QATJBDOCpiipEIOLczjzvu/eQ8g/2DcYHGs=;
 b=NiP1FOreQr2GKKMbt86mUTq+0/A0/6kJm7VhxQpT8LOCQJptjmfnZE95
 SJFfwwxEoV8sH8PGaE0HdeWxQEVFMoWVvvNwppaiaTQj/tC7Fna6zbBNe
 BRgwKxMudzqLdHSnuWJ9waa3LlsE5W0zWgJJ+famTrS3w+KV55nZXdK1A
 CrHmfpKv8oJY5tEHqThmK03VyFA7k95v55kmuIuMp3iFC43VU3BdDYcbd
 KGLxeRERIkLl0w2K8tCNZyyQ19o+t19NXyUZGa9Fyh17Lf/AMcJnt5kNt
 2ulpMNmaUbn9aoOireCzLRtK7LoNKAYmoAc/A8MAKxkyNmc1T3ocQ85M9 g==;
X-CSE-ConnectionGUID: G4x0gVnqQ+WIuhU5yqUCYg==
X-CSE-MsgGUID: JkYkS+yiQna5iGDNPuLwNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78028488"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="78028488"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:43:06 -0800
X-CSE-ConnectionGUID: hNaLcOyRTZKu+AWdzFwy8Q==
X-CSE-MsgGUID: QHd75V2/R2+YsKpDE//T9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="225140727"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:43:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v4.1 2/2] drm/xe/lnl: Drop pre-production workaround support
Date: Tue,  2 Dec 2025 10:42:58 -0800
Message-ID: <20251202184256.1718298-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251202184256.1718298-3-matthew.d.roper@intel.com>
References: <20251202184256.1718298-3-matthew.d.roper@intel.com>
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

LNL has been out long enough that all of our internal usage of
pre-production hardware has been phased out and we no longer need to
maintain workarounds that were exclusive to pre-production parts.

Production LNL hardware always has B0 or later steppings for both
graphics and media IP.  Eliminate all workarounds that were exclusive to
A-step hardware and set the 'has_prod_wa_only' device flag for LNL to
make sure we warn and taint if someone tries to load the driver on an
old pre-production part.

Bspec: 70821
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_pci.c        |  1 -
 drivers/gpu/drm/xe/xe_ring_ops.c   | 14 ----------
 drivers/gpu/drm/xe/xe_wa.c         | 45 ------------------------------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  6 +---
 5 files changed, 2 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index bcb85a1bf26d..e06c6aa335bf 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -317,7 +317,7 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	offset = guc_ads_waklv_offset(ads);
 	remain = guc_ads_waklv_size(ads);
 
-	if (XE_GT_WA(gt, 14019882105) || XE_GT_WA(gt, 16021333562))
+	if (XE_GT_WA(gt, 16021333562))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
 				 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
 	if (XE_GT_WA(gt, 18024947630))
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b37b7e26bd2d..1e7489860e25 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -346,7 +346,6 @@ static const struct xe_device_desc lnl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_flat_ccs = 1,
-	.has_pre_prod_wa = 1,
 	.has_pxp = true,
 	.has_mem_copy_instr = true,
 	.max_gt_per_tile = 2,
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index ac0c6dcffe15..2c0ce6b5f9cd 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -201,18 +201,6 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
 }
 
-static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
-{
-	if (hwe->class != XE_ENGINE_CLASS_RENDER)
-		return i;
-
-	if (XE_GT_WA(hwe->gt, 16020292621))
-		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
-				      RING_NOPID(hwe->mmio_base).addr, 0);
-
-	return i;
-}
-
 static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
 			      int i)
 {
@@ -395,8 +383,6 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
-	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
-
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d606b058d588..aff7b08395ca 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -217,20 +217,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
 	},
 
-	/* Xe2_LPG */
-
-	{ XE_RTP_NAME("16020975621"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, SBEUNIT_CLKGATE_DIS))
-	},
-	{ XE_RTP_NAME("14018157293"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(XEHPC_L3CLOS_MASK(0), ~0),
-			 SET(XEHPC_L3CLOS_MASK(1), ~0),
-			 SET(XEHPC_L3CLOS_MASK(2), ~0),
-			 SET(XEHPC_L3CLOS_MASK(3), ~0))
-	},
-
 	/* Xe2_LPM */
 
 	{ XE_RTP_NAME("14017421178"),
@@ -509,11 +495,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
 	},
-	{ XE_RTP_NAME("14018957109"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
-	},
 	{ XE_RTP_NAME("14020338487"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
@@ -523,11 +504,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
-	{ XE_RTP_NAME("14019322943"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, TGM_WRITE_EOM_FORCE))
-	},
 	{ XE_RTP_NAME("14018471104"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
@@ -804,17 +780,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("16020518922"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(FF_MODE,
-			     DIS_TE_AUTOSTRIP |
-			     DIS_MESH_PARTIAL_AUTOSTRIP |
-			     DIS_MESH_AUTOSTRIP),
-			 SET(VFLSKPD,
-			     DIS_PARTIAL_AUTOSTRIP |
-			     DIS_AUTOSTRIP))
-	},
 	{ XE_RTP_NAME("14019386621"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
@@ -823,20 +788,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
 	},
-	{ XE_RTP_NAME("14020013138"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
-	},
 	{ XE_RTP_NAME("14019988906"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
 	},
-	{ XE_RTP_NAME("16020183090"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
-	},
 	{ XE_RTP_NAME("18033852989"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 7ca7258eb5d8..5cd7fa6d2a5c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -16,15 +16,11 @@
 16017236439	PLATFORM(PVC)
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
 14015076503	MEDIA_VERSION(1300)
-16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
-14018913170	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
-		MEDIA_VERSION(2000), GRAPHICS_STEP(A0, A1)
-		GRAPHICS_VERSION_RANGE(1270, 1274)
+14018913170	GRAPHICS_VERSION_RANGE(1270, 1274)
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
 14018094691	GRAPHICS_VERSION_RANGE(2001, 2002)
 		GRAPHICS_VERSION(2004)
-14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
 18024947630	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 		MEDIA_VERSION(2000)
-- 
2.51.1

