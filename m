Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC926CD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C91C1128B9;
	Mon,  8 Apr 2024 17:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDdT3OrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014571128C3
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595949; x=1744131949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6GNPrE3TKeuT2hVk8Ws6SoIWgUQLCJV5c54WRbHbkY=;
 b=kDdT3OrEOAUB5Vrv4VAFXrBrApXTISp3skQAS3hesHY7nHMlpDCADY6F
 au5u4VHGfWDaFZHM31o8FUXSgTvNcH7dlqijUUtBvyjkrtF5D5K/yvSQP
 W9m4GfGZehHsO0HSOB2YKHEWDmh1vl3z5Ic3fz/QYzOCu0rKbqdIWkKn7
 xHgEUus/KsnuSf/Bo3RuqLTvIlEXNvvz/4bTPFa+yOaJ+FYHZ8XL8gl3x
 +V7shtHHzh836gbDUY/n6jqQ7moF/CwrTe395I0s9NfEAFjuMXCFvZ5OH
 /3+YEDcvPDmuk2rOox/pZTQl2ZEj4d40j9IQD+OabJk0H7Gwxp+MZg+r8 Q==;
X-CSE-ConnectionGUID: yp1IeAFRTgS/Zj6tz7giVQ==
X-CSE-MsgGUID: K4zBSl07QiyFWzgX/s9N+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679180"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679180"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:48 -0700
X-CSE-ConnectionGUID: ezu9rpToQ8WPK6aOMB+e8w==
X-CSE-MsgGUID: FF5nCULlQVydQYPf6giXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733899"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:46 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 11/11] drm/xe/xe2hpm: Add initial set of workarounds
Date: Mon,  8 Apr 2024 22:35:45 +0530
Message-Id: <20240408170545.3769566-12-balasubramani.vivekanandan@intel.com>
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

Define the initial set of workarounds for Xe2_HPM.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_wa.c           | 32 ++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0ce79ba19bda..8fe811ea404a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -280,6 +280,10 @@
 #define FORCEWAKE_GT				XE_REG(0xa188)
 
 #define PG_ENABLE				XE_REG(0xa210)
+#define   VD2_MFXVDENC_POWERGATE_ENABLE		REG_BIT(8)
+#define   VD2_HCP_POWERGATE_ENABLE		REG_BIT(7)
+#define   VD0_MFXVDENC_POWERGATE_ENABLE		REG_BIT(4)
+#define   VD0_HCP_POWERGATE_ENABLE		REG_BIT(3)
 
 #define CTC_MODE				XE_REG(0xa26c)
 #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 014d27c126ae..632bd9066f8d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -228,6 +228,28 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
 
+	/* Xe2_HPM */
+
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("14020316580"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301)),
+	  XE_RTP_ACTIONS(CLR(PG_ENABLE,
+			     VD0_HCP_POWERGATE_ENABLE |
+			     VD0_MFXVDENC_POWERGATE_ENABLE |
+			     VD2_HCP_POWERGATE_ENABLE |
+			     VD2_MFXVDENC_POWERGATE_ENABLE)),
+	},
+	{ XE_RTP_NAME("14019449301"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	{}
 };
 
@@ -513,6 +535,16 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
 	},
 
+	/* Xe2_HPM */
+
+	{ XE_RTP_NAME("16021639441"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
+			     GHWSP_CSB_REPORT_DIS |
+			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+
 	{}
 };
 
-- 
2.25.1

