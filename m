Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDCAC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 11:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8210D113BB1;
	Thu, 18 Apr 2024 11:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nkpvd4p9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D339D113BB1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713439037; x=1744975037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TbgbVfMFwq1hL/8MbB5Le4XBTh02/0ivTruhX2FFKOI=;
 b=Nkpvd4p988mY11M2RZTKjh7+cTCrYa4UrsPc/qOTaOFH15vphxTII0iy
 ZpHiKwoe0WMvMl5yoAS4ZNUvXmMu/DHZkenMFr4065BsgMm0syft+8lma
 zjjBxM9/uKKToytWlEcqYVCkbyK0TRntuGT9tGUklRMOB5D8RjD5De5oY
 aevYUKsJ/TP+kDL3CL7mGTpdAkmn3pxMOGzgnzPV743a+syAdov26ekMl
 SPkmZhMXUFIyYDuKT3BRNfgpK3gpacvMQPkYLHa8m6gq1oc7lkgWXKBOa
 Aj+42ElesFdVJw3Dl7/TeLUGK4yVARx+zJiV8bn8bpaEpsdxPtzf6KSaS Q==;
X-CSE-ConnectionGUID: CMdSDMK9RvqIcFcJWNrRYA==
X-CSE-MsgGUID: 3ef4fLtpSSC6B3jBn3YKsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8813879"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8813879"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:15:23 -0700
X-CSE-ConnectionGUID: WDsJKREOR9uIUJdIsrnRoA==
X-CSE-MsgGUID: FfJUPuAsRlSI0QHnnTHaWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23464797"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa007.jf.intel.com with ESMTP; 18 Apr 2024 04:15:19 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2] drm/xe/xe2: Add workaround 14021402888
Date: Thu, 18 Apr 2024 16:45:34 +0530
Message-Id: <20240418111534.481568-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

This workaround applies to Graphics 20.01 as RCS engine workaround

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 94445810ccc9..23c302af4cd5 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -350,6 +350,7 @@
 
 #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
+#define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
 
 #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   DISABLE_ECC				REG_BIT(5)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 632bd9066f8d..31e140968f4a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -534,6 +534,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
 	},
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
 
 	/* Xe2_HPM */
 
-- 
2.25.1

