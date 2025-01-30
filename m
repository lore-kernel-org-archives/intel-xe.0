Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FC2C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 05:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9123C10E8ED;
	Thu, 30 Jan 2025 05:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gtjem7pb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ADF10E8ED
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 05:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738216797; x=1769752797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EEcNnlPeeaS0lYsT0DsCBsjVM4gCzrNBAd2JTDCS+AU=;
 b=Gtjem7pbqRMBuIrmmtZDZEQgpAiZRi/Yebq2D1AGgNflr4bhejHitADU
 SadvkhZEtydU2J7+EUWiWTvwNvbDCWS1MtxrMcmiDHyho1CsO1DrpES0V
 bYt0lZQDTmpayFXsYL9JLU0XemH62nhrS6kFSK/B/34QvhqfcgHcLO31G
 tQmz5XEJuI4abO+IYOvloY+dArboOkBJFQ0MM+h0opI+jgkZU+kzAb4uQ
 y1xGqbooCEiXxkUwHFJ8dGHdXpgGOs1xX0F+CCkkpUsyw3Wln6N6lpEwv
 hYi69sMcFlIj3Vn9MqD4dJV29icHirrvK9cILEIF3sMpCCWiRhXXd2XAr w==;
X-CSE-ConnectionGUID: 566IqMKBQ16me+/uipqLSQ==
X-CSE-MsgGUID: /wpaV6ZzSjS9WZscc2wsfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38917056"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38917056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 21:59:57 -0800
X-CSE-ConnectionGUID: wxsiKxSFT9CndD+APSgEeA==
X-CSE-MsgGUID: Ja/EeN4PR8GIHb15L4vJ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="140133518"
Received: from dut2050adlp.iind.intel.com (HELO DUT2050ADLP..)
 ([10.190.239.12])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 21:59:55 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v4 1/2] drm/xe: Add Wa_16021333562 and Wa_14016712196
Date: Thu, 30 Jan 2025 05:59:38 +0000
Message-ID: <20250130055939.282988-2-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250130055939.282988-1-aradhya.bhatia@intel.com>
References: <20250130055939.282988-1-aradhya.bhatia@intel.com>
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
index 9f327f27c072..29cd7b548493 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -192,6 +192,10 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
+	if (XE_WA(gt, 14016712196))
+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
+				      LRC_PPHWSP_SCRATCH_ADDR, 0);
+
 	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
 }
 
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
2.45.2

