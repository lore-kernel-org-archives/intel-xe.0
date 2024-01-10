Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D26C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 06:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A370210E116;
	Wed, 10 Jan 2024 06:15:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB8710E116
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 06:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704867340; x=1736403340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V5xqG7Zks1z0mTKrqoaEhX5Gju1T745i2Qf1SJWn9sg=;
 b=fjW/2kI8pNUmNekztqsL6L3lFBWtnpR7UMvyenDgatAIZFLIt1ppAGUh
 pqA0Is2WCMkeYbndiLQCSmE8P+vEwMGY/Ttlksj1iZqGWUBvKZRsn6x6H
 xeX54ZM6lMAk/e6Td6g3q2hDXP4BZ+E1e3fhgbJHmQIILtu3TO8StlRyj
 4NOlk7X6xRvrZyGgObcTvgrqPCO79/jfoih4UMlPVBQG51sDdbMDVrAXh
 zyG7epvaDsCK/WZtizl4YnOsctA5RWAaD1JfyPqXHRb9QtRSdohzeUAdm
 VR3Cz03mHTcKIhqNdlRelgoKlMz8DgB+ZGKd3mpmNUXrGBMvyhD9379zR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5790353"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5790353"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 22:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113330227"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1113330227"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 22:15:38 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/xe/xe2_lpg: Introduce performance guide changes
Date: Wed, 10 Jan 2024 11:45:30 +0530
Message-Id: <20240110061531.780038-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add various performance guide changes to Xe2LPG.

BSpec: 72161
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 15 ++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4017319c6300..77dd11be9816 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -144,6 +144,10 @@
 
 #define GSCPSMI_BASE				XE_REG(0x880c)
 
+#define CCCHKNREG1				XE_REG_MCR(0x8828)
+#define   COMPOVFDIS				REG_BIT(25)
+#define   ENCOMPPERFFIX				REG_BIT(18)
+
 /* Fuse readout registers for GT */
 #define XEHP_FUSE4				XE_REG(0x9114)
 #define   CFEG_WMTP_DISABLE			REG_BIT(20)
@@ -289,12 +293,17 @@
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
+#define L3SQCREG3				XE_REG_MCR(0xb108)
+#define   COMPPWOVERFETCHEN			REG_BIT(28)
+
 #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
 #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
 
 #define XEHP_L3SCQREG7				XE_REG_MCR(0xb188)
 #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
 
+#define L3SCRUB_LBCF_GFX			XE_REG_MCR(0xb18c)
+
 #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
 
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 53ccd338fd8c..c0bc86f131a7 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -37,7 +37,20 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
-
+	{ XE_RTP_NAME("Tuning: L3 Scrubber Parameters"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(L3SCRUB_LBCF_GFX, 0x1006))
+	},
+	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(CCCHKNREG1,
+			     COMPOVFDIS |
+			     ENCOMPPERFFIX)),
+	},
+	{ XE_RTP_NAME("Tuning: Compressible Partial Write Overfetch Optimization"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
+	},
 	{}
 };
 
-- 
2.34.1

