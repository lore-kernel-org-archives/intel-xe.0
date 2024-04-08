Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3A6CD129A
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB521128C4;
	Mon,  8 Apr 2024 17:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uhb3op1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60701128C7
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595946; x=1744131946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YMoD3REsghGXvfVeETvR+x3teWwOcKE2nvVuQn8Pz0Q=;
 b=Uhb3op1LtMcWa9rEA7dTxN/PJRwL+WR4N28Pw+z9nnU1F/0hQAARmJ66
 neIlIDkVrftEuy0aTY/F2qj9qhphRiQVKSY4Ow3mvisAuPltUeC2/NxHY
 oDKSL+q6VkDUs2YTuzvgmzR3LZ1Ef+7SKbADPrOob9lEzSJqktRE7IlJI
 5rjhDl8VABp6DCef1qU4UwS1CJyWpI3DI9++LfdMbHHT23rbbhQHHAJ9R
 kAQZ1JDbAK5FYl/M6ou5t6U5h5FHYifQkoufklSWBKLwSExTj9yKVVsyK
 u+9rmDhpTHK4MSIFvEnI2QewGjzB/GETpFg+/7bhKz2jt+ZoUvKjoTKGN A==;
X-CSE-ConnectionGUID: syp6DaISQgavHM6x2CxUAQ==
X-CSE-MsgGUID: tgQLmZrdSGyFDgHEvPHaPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679172"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:46 -0700
X-CSE-ConnectionGUID: 4JdiZtTYSKqYtTA8aPTv2A==
X-CSE-MsgGUID: 2pJhvtkHSjKT9x6POoOnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733894"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:44 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 10/11] drm/xe/xe2hpg: Introduce performance tuning changes
 for Xe2_HPG.
Date: Mon,  8 Apr 2024 22:35:44 +0530
Message-Id: <20240408170545.3769566-11-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Introduces performance tuning guide changes for Xe_HPG.

BSpec: 72161

v2: Switched to open upper bound for "Tuning: L3 Cache" setting.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index bb6db2817ada..d4e6fa918942 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -28,7 +28,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	/* Xe2 */
 
 	{ XE_RTP_NAME("Tuning: L3 cache"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
@@ -38,11 +38,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX)),
 	},
 	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
 	{}
-- 
2.25.1

