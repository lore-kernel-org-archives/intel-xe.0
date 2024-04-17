Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A1AC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 02:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB5810EBF4;
	Wed, 17 Apr 2024 02:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjemO2Vd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681AE10EBF4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 02:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713320308; x=1744856308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VFACLTcQXeF166uAoVypHUwcbhBSLYvV94jIeE6M0lg=;
 b=KjemO2VdoIWHQhBrykv6TKZ4jhTk+iX3r7b116g1NBz4KDp4qQzbE2VH
 P0gQo4Qe53PfG1+u3Ap/BnFGN9PBLLLgsBZ8VUuZu6RTkaU0rZ4VzOM8i
 LYPyRJLNXJzNGxGO8sANxpO9iK+3gHYVjfnnTjxgMOwX8Z1r0J0njfqD6
 4uaiPzNXGL9bXEb48qfqZ2j1sZWNSra2f2LjMVTbpF6BXYSvUveeOa1X2
 AemSK25u3lySYufp0AolMEr3FK7qYKidc3QHOEtntWeRafChByQLvFgDq
 gugaKZj9LvhPIdVtgb9DCTJTSAzJjClqUwF5Q5SzzFVAWT2g1OMWhJZdP Q==;
X-CSE-ConnectionGUID: tYhZBlN1QrSAfO076P8N3g==
X-CSE-MsgGUID: HeEZ3t0tThOmervMn66Q4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8964027"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8964027"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 19:18:28 -0700
X-CSE-ConnectionGUID: lA0LEPZ0RP+/nCcCwJm/yQ==
X-CSE-MsgGUID: 9VQvcF8UQT2y0RUiioI5zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22550496"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2024 19:18:26 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/xe2: Add workaround 14021402888
Date: Wed, 17 Apr 2024 07:48:40 +0530
Message-Id: <20240417021840.456641-1-krishnaiah.bommu@intel.com>
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

Sampler Cache Returning Incorrect Data Due to Mismatched Tagging of
Associated Partial Cache Lines and disabling sampler clear power
optimization gives better overall performance.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_wa.c           | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 94445810ccc9..d4ec82189ca2 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -344,12 +344,14 @@
 
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
+#define   SMP_FORCE_128B_OVERFETCH		REG_BIT(10)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
 #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
 
 #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
+#define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
 
 #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   DISABLE_ECC				REG_BIT(5)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 632bd9066f8d..91c9834c3e21 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -534,6 +534,14 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
 	},
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, SMP_FORCE_128B_OVERFETCH))
+	},
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
 
 	/* Xe2_HPM */
 
-- 
2.25.1

