Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91D4C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 09:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A049810E4A7;
	Thu, 20 Feb 2025 09:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwqlLcP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8172610E4A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740044851; x=1771580851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4GpZPAeXovmjgxzecVIjsOMYPA2WMRM2mNmLwRHvSVw=;
 b=OwqlLcP/wMc6kqfK70qNLAiwpT68Ib/HE04xRqxvk773Yb5XAv3wl4gu
 7RBgBfj92JUAzBVkjXSvb4D1v+3ZP/LeyeNtCW8Qj3F2weICwnvstoyzX
 Fdwf/4/n7JgxfHFO6wgEV2pkhSNyYuMTHAdjz/P/oGZshvebDE2vThpXB
 0j/xzIs0uleiSMDEo5oNgCiaBUHS6XZBnXmGqEp51bgMBS6Oc57waqMIr
 mVOKfbaQxcawsrAb1z/2RrhzN0nwoIQoPUqmOYKqFyIpt0tyZhp8B7KrZ
 0btAXwWbAsl8PgBDHO6fiCLbuCt18JVes7tkDBPK0myiLZxQtl492GcBg Q==;
X-CSE-ConnectionGUID: IqrzvQYbSuu8K+RX0NXr+g==
X-CSE-MsgGUID: 11wssUnCR+6pJ6AeKw0nEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40004634"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40004634"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 01:47:22 -0800
X-CSE-ConnectionGUID: GoH9UQFmSXWmavN0nBSRkw==
X-CSE-MsgGUID: AS1stcS+SWyOC89WUkRzdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120215751"
Received: from unknown (HELO aradhyab-desk.iind.intel.com) ([10.190.216.90])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 01:47:20 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v5 1/2] drm/xe: Add Wa_16021333562 and Wa_14016712196
Date: Thu, 20 Feb 2025 15:16:44 +0530
Message-Id: <20250220094645.358647-2-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220094645.358647-1-aradhya.bhatia@intel.com>
References: <20250220094645.358647-1-aradhya.bhatia@intel.com>
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

Wa_16021333562 and Wa_14016712196 are permanent workarounds that apply
to multiple platforms. Wa_16021333562 applies to platforms ranging from
TGL (12.00) to Xe_LPM (13.00), while Wa_14016712196 from DG2 (12.55) to
Xe_LPG (12.74).

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    | 2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c   | 4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index fab259adc380..e7c9e095a19f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -342,7 +342,7 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	offset = guc_ads_waklv_offset(ads);
 	remain = guc_ads_waklv_size(ads);
 
-	if (XE_WA(gt, 14019882105))
+	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
 		guc_waklv_enable_simple(ads,
 					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
 					&offset, &remain);
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 0c230ee53bba..d2f604aa96fa 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -177,6 +177,10 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
 	u32 flags;
 
+	if (XE_WA(gt, 14016712196))
+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
+				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
+
 	flags = (PIPE_CONTROL_CS_STALL |
 		 PIPE_CONTROL_TILE_CACHE_FLUSH |
 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 228436532282..ea72bcc02e1e 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -43,3 +43,7 @@
 no_media_l3	MEDIA_VERSION(3000)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+16021333562	GRAPHICS_VERSION_RANGE(1200, 1274)
+		MEDIA_VERSION(1300)
+14016712196	GRAPHICS_VERSION(1255)
+		GRAPHICS_VERSION_RANGE(1270, 1274)
-- 
2.34.1

