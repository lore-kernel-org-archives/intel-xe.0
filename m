Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E0ECFB45B
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 20:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D354610E5C0;
	Tue,  8 Oct 2024 20:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjHAYmNW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACAB10E5C1
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728420392; x=1759956392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9mQvLoR+RP/YMC/fONQe6kdycoed/+ccYDFbBj1MkG4=;
 b=WjHAYmNWifCLzbYaI5GdXmj0FOBLIatguvbHIX/mdwbEYw0C3kLBLUbD
 mmzoZ0ryPiNT4JVc8KfEERqkyeeOt+M7m0oUsDzFYxGYwijawTw0N9BIE
 03YRB5//2hrstd8r1MfSZFXRclJw9cSp+/9CnQwnjcaf5tsd3vMbL2BeY
 0Lw9l3P1VBNT2gap48uQLOPmy8lwdmbYY40hOQNvVcdQZcgC+xKAkmpRl
 AJH3HHwrIiX8xlUG8FV329gwRu3eIBYTHbfHRg4Y9LM1HIDhRSMIlg3k+
 XIyb+O1NbIONP3UlhePU0Gfw0Yw/vGFCLKTefy8ISYRtftq3JbURRjFMZ g==;
X-CSE-ConnectionGUID: aWWMEnIrTtG/c72YFjCTIw==
X-CSE-MsgGUID: bX9ZI0/cTeahqqxuU0YEkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27544899"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27544899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 13:46:31 -0700
X-CSE-ConnectionGUID: EV4qlAZHQl+5RP2Tg+JRcg==
X-CSE-MsgGUID: N4shu7xwRQ25Va5sZsDVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="113442649"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 13:46:31 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v4 1/1] drm/xe/xe3: Add initial set of workarounds
Date: Tue,  8 Oct 2024 13:46:26 -0700
Message-ID: <20241008204626.55802-2-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241008204626.55802-1-matthew.s.atwood@intel.com>
References: <20241008204626.55802-1-matthew.s.atwood@intel.com>
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
 drivers/gpu/drm/xe/xe_wa.c               | 47 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 4 files changed, 52 insertions(+)

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
index 55092089bff6..502a2804c1f0 100644
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
index 94ea76b098ed..0ee532eb26d6 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -252,6 +252,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
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
 
@@ -568,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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
 
@@ -739,6 +774,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
 
+	/* Xe3_LPG */
+	{ XE_RTP_NAME("14021490052"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
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
index 0154fbe154e9..264d6e116499 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -33,6 +33,7 @@
 		GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
+		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
-- 
2.45.0

