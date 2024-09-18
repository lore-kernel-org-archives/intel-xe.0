Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210BACDD55C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 20:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2BE10E63A;
	Wed, 18 Sep 2024 20:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNynb2sg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EFF10E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 20:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726692524; x=1758228524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XITwlCF1RCw9nuNFW9dCURHO7Ee4vGFqbWQGxMU7dSY=;
 b=hNynb2sgysY3yBdNLEGaWslL+bxM3hl90qxzhf/go1MWbLW9sh9+2tzZ
 tyfirf8/qFGQQJmvq9IFyhpTlY3gijnuRKCNBToEvnKXha63sweU3gMvj
 SJ0a2aXHpGOLnD94Wgm7VyLHtd1cTWT9d8xJ64urBBO9RqEBCcczD2lG9
 J2jzQLNO8Wp/mVIbZo1QDWCofdwZKfjk/MOgerYU9yHU+WjBLcxTEmEll
 oy3h2KFHFRCauNStvhQvggN216MPLnJzCVyitiSIwXHbh+w2gZGarZY2M
 qYM74OFTkb3nYHW/ZmgG64apvj/DoVozLwPG7rFiCPXcJbqpxSFVy3bn7 Q==;
X-CSE-ConnectionGUID: OiyPfIcVQXi23kzBZ/lTUQ==
X-CSE-MsgGUID: WRtEt6xsRAuz7b32gBysvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25509479"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25509479"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:48:44 -0700
X-CSE-ConnectionGUID: Pc0Hh/n9QxGzESULb2Rslg==
X-CSE-MsgGUID: MDpbX1BJQ06CvZuPPgy3hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="74246611"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.109.171])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:48:43 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/3] drm/xe/xe2: Extend performance tuning to media GT
Date: Wed, 18 Sep 2024 17:47:29 -0300
Message-ID: <20240918204830.49880-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918204830.49880-1-gustavo.sousa@intel.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
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

With exception of "Tuning: L3 cache - media", we are currently applying
recommended performance tuning settings only for the primary GT. Let's
also implement them for the media GT when applicable.

According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exist
only in Xe2_LPM and their offsets do not match their primary GT
counterparts. Furthermore, the range where CCCHKNREG1 belongs is not
listed as a multicast range on the media GT. As such, we need to have
Xe2_LPM-specific definitions for those registers and apply the setting
only for that specific IP.

Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and the
offset on the media GT matches the one on the primary one. However, the
range that contains that register is not is not listed as a multicast
range, so we need two different entries for media.

v2:
  - Fix implementation with respect to multicast vs non-multicast
    registers. (Matt)
  - Add missing XE2LPM_CCCHKNREG1 on second action of "Tuning:
    Compression Overfetch - media".

Bspec: 72161
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cf21de3adca6..6ec2d2c11d77 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -80,6 +80,7 @@
 #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
 #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
 
+#define XELPMP_STATELESS_COMPRESSION_CTRL	XE_REG(0x4148)
 #define STATELESS_COMPRESSION_CTRL		XE_REG_MCR(0x4148)
 #define   UNIFIED_COMPRESSION_FORMAT		REG_GENMASK(3, 0)
 
@@ -169,6 +170,8 @@
 #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
 
+#define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
+
 #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
@@ -399,6 +402,10 @@
 #define SCRATCH1LPFC				XE_REG(0xb474)
 #define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
 
+#define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
+
+#define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
+
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index faa1bf42e50e..7a5b852af8d7 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -42,20 +42,44 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
 			 SET(CCCHKNREG1, L3CMPCTRL))
 	},
+	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
+			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
+	},
 	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
+	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3 - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
+	},
 	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG2,
 			     COMPMEMRD256BOVRFETCHEN))
 	},
+	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
+			     COMPMEMRD256BOVRFETCHEN))
+	},
 	{ XE_RTP_NAME("Tuning: Stateless compression control"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
 	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
 				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
 	},
+	{ XE_RTP_NAME("Tuning: Stateless compression control - media"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
+				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
+	},
+	{ XE_RTP_NAME("Tuning: Stateless compression control - media (Xe2_HPM)"),
+	  XE_RTP_RULES(MEDIA_VERSION(1301)),
+	  XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
+				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
+	},
 	{}
 };
 
-- 
2.46.1

