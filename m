Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5A0E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CD510EB08;
	Fri,  6 Sep 2024 21:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqmHM5ah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05A510EB02
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659524; x=1757195524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bjSripAarfsQp1MJ9xTP4sTy5B00FSoT4WfTIoBWvu4=;
 b=dqmHM5ahdFYDgJOsiH+gEZsJWqKjYPbOOcOksHN6aHkJmnx7ykjAYNhf
 VE3xMcJ2sYX6W9FsKh/1FqqRUTTfdutHxsgWaZSLE8kefcVrdDYYINpe3
 zVroFycHckFRxvMyoq4itML1porwSkqe+bq1RNYuH2euUIbvdnlsiRcDI
 Ie4enL0t9yGZ+UNDjhebE9K3a+Dl/qzNMmMh3xzf9+kHMjFsTiuRNXbpr
 3U76Z53rn5xfVGCUI3zH6WnRB4+KRwQgdjsEm/yzLMDhpXfB17kvKlCcw
 wYasZVPBn/thBFHIuWZkUxAbJYBjOk7VeDXeNvn6fKoRFlZOWbvl3EMOT Q==;
X-CSE-ConnectionGUID: OD//MYUeRBSeCgCjR5qGLA==
X-CSE-MsgGUID: CW90QJp2RKiZyTSjpEX3Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580579"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580579"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:04 -0700
X-CSE-ConnectionGUID: 4t0oW7IpS+quBV9I07eH8w==
X-CSE-MsgGUID: AVfHrcxdSXmDUZY9DmTQQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656331"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:03 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 4/9] drm/xe/xe3: Add initial set of workarounds
Date: Fri,  6 Sep 2024 14:51:48 -0700
Message-ID: <20240906215153.31210-5-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

Implement the initial set of workarounds for Xe3 IPs.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
 drivers/gpu/drm/xe/xe_wa.c               | 46 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 81b71903675e..7c78496e6213 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -186,6 +186,7 @@
 
 #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
 #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
+#define   RAMDFTUNIT_CLKGATE_DIS		REG_BIT(9)
 
 #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
 #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8ed855b31e95..259221d2f217 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -286,6 +286,9 @@
 #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
 #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
 
+#define UNSLCGCTL9454				XE_REG(0x9454)
+#define   LSCFE_CLKGATE_DIS			REG_BIT(4)
+
 #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
 #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
 #define   L3_CLKGATE_DIS			REG_BIT(16)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 28b7f95b6c2f..d946b27ec4cd 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -251,6 +251,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
 
+	/* Xe3_LPG */
+
+	{ XE_RTP_NAME("14021871409"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
+	},
+
+	/* Xe3_LPM */
+
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("16021865536"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("14021486841"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	{}
 };
 
@@ -567,6 +595,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
 
+	/* Xe3_LPG */
+
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
+
 	{}
 };
 
@@ -734,6 +769,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_AUTOSTRIP))
 	},
 
+	/* Xe3_LPG */
+	{ XE_RTP_NAME("14021490052"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
+
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 920ca5060146..1949f8f3d7c2 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -33,6 +33,7 @@
 		GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
+		MEDIA_VERSION(3000)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
-- 
2.44.0

