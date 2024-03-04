Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230C6C54E49
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 23:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEEC112700;
	Mon,  4 Mar 2024 23:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaIlzdv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95936112700
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709595043; x=1741131043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nMSWml+dRTeBNoFpUHKyVKm4vOryB6SkgM1C0g4klUE=;
 b=VaIlzdv4Pr4PuHVtw0zqHy3L7pRPUF1KZjEGMKR0jPRMc4KlwW1CVPYF
 h1GxYaLnsevvXYPeeh0LtPDF5iI7P+ugKaTTpnvvta7t+72O/YgUmEd2G
 bO1oXw16k/nsKoO0X+KI9FHluvydlsFGBhcc2XD4zi+Nyp46jWgrq8wmr
 juvsyktAgmm4DJ/BjCu3yVHO33rHJQbnHFvfBluz0G2lOkUpzuEhKGO5I
 Z1jb/lgNSplpv6Cun6zrQrvIoEK/59/gN1tEZZ3Ad500ko5ab9RUlW/oM
 NH+e5UIWsQBK/IyRmOYgUjHDP7XJzfu1YnOsy/QPJQ7s2OKVb1j/+mntf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14759661"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="14759661"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 15:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="40153528"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 15:30:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH] drm/xe: Drop WA 16015675438
Date: Mon,  4 Mar 2024 15:31:03 -0800
Message-ID: <20240304233103.1687412-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

With dynamic load-balancing disabled on the compute side, there's no
reason left to enable WA 16015675438. Drop it from both PVC and DG2.

Note that this can be done because now the driver always set a fixed
partition of EUs during initialization via the ccs_mode configuration.

Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        |  2 +-
 drivers/gpu/drm/xe/xe_wa.c         | 11 -----------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  3 ---
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0d2a2dd13f11..caa86ccbe9e7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -164,7 +164,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
-	if ((XE_WA(gt, 16015675438) || XE_WA(gt, 18020744125)) &&
+	if (XE_WA(gt, 18020744125) &&
 	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a0264eedd443..b972e281d891 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -328,12 +328,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
 	},
-	{ XE_RTP_NAME("16015675438"),
-	  XE_RTP_RULES(PLATFORM(DG2),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2(RENDER_RING_BASE),
-			     PERF_FIX_BALANCING_CFE_DISABLE))
-	},
 	{ XE_RTP_NAME("18028616096"),
 	  XE_RTP_RULES(PLATFORM(DG2),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -383,11 +377,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE))
 	},
-	{ XE_RTP_NAME("16015675438"),
-	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2(RENDER_RING_BASE),
-			     PERF_FIX_BALANCING_CFE_DISABLE))
-	},
 	{ XE_RTP_NAME("14014999345"),
 	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
 		       GRAPHICS_STEP(B0, C0)),
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index b138cbd51bdb..48cdba1cbf95 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -4,9 +4,6 @@
 22011391025	PLATFORM(DG2)
 22012727170	SUBPLATFORM(DG2, G11)
 22012727685	SUBPLATFORM(DG2, G11)
-16015675438	PLATFORM(PVC)
-		SUBPLATFORM(DG2, G10)
-		SUBPLATFORM(DG2, G12)
 18020744125	PLATFORM(PVC)
 1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
-- 
2.43.0

