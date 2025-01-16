Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667E3C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 09:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340F810E908;
	Thu, 16 Jan 2025 09:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfWze6hO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EEF10E906
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 09:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737018807; x=1768554807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fAyfDq5oCHiD08U3klhjeTVFHRLXlCMqJ7gpvOYGviQ=;
 b=UfWze6hOcCuDjPqdaCXRNqshCeggn+6V/KZX2Z1k7ga0lScm07x2kdDx
 qH79ESjgDPB0bLXRzUWPM4L2R4evEAWSGvdQ6I/Pfsjjx/vILdqiWSCUK
 0IYWkn18pz/Sr/nz/Y48/QW+Wp92yygGPcVLPaS33leiNKTDAnBkiOH0H
 mwl6QRH+S+zNgUXv5SsLgCimzp6rW8ofVfHHqdyNrVRcNVHbn336vM1Ff
 x6JLUMh6rLuKHqFHT5dazKgzrGdSuMtcBavMbL8ueLubO52tTKJTkTqGL
 0E2GeUcIeJZcjdST7VcC8AG1NUN+dLWXbO80uaYvrtCBkr9LNzosdFpdq Q==;
X-CSE-ConnectionGUID: dxAWR1RpQoCbyVVAiAjLag==
X-CSE-MsgGUID: S+ncqFMJS3eFSq+8F6XJPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37424001"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="37424001"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:13:27 -0800
X-CSE-ConnectionGUID: xeYtctGFR6mBSh+d7LX2zQ==
X-CSE-MsgGUID: HrX+quwhQbm9Op0RmCC/lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110399426"
Received: from aradhyab-desk.iind.intel.com ([10.145.169.55])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:13:25 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v2 1/2] drm/xe/xe: Add Wa_16021333562 and Wa_14016712196
Date: Thu, 16 Jan 2025 14:40:03 +0530
Message-Id: <20250116091004.3060996-2-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
References: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_ads.c    | 5 +++++
 drivers/gpu/drm/xe/xe_ring_ops.c   | 3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index fab259adc380..8ef044ddd682 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -376,6 +376,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
 					&offset, &remain);
 
+	if (XE_WA(gt, 16021333562))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 9f327f27c072..22c226c30df9 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -192,6 +192,9 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
 		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
+	if (XE_WA(gt, 14016712196))
+		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH, 0, 0);
+
 	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 40438c3d9b72..536b91cc4d3f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -42,3 +42,5 @@
 no_media_l3	MEDIA_VERSION(3000)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+16021333562	GRAPHICS_VERSION_RANGE(1200, 1300)
+14016712196	GRAPHICS_VERSION_RANGE(1255, 1274)
-- 
2.34.1

