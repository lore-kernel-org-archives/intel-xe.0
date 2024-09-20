Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5912ECF9C69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 21:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238A610E866;
	Fri, 20 Sep 2024 21:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7Rw8seB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A1810E883
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 21:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726866914; x=1758402914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hme3D41lXZftllW0MD7jz6IX4uo1/Bdd72x26IOnvwc=;
 b=X7Rw8seBpu/zmQExOEktg7zBq74Yfn/Ntdk3C1uP8owCYCSTRXefIqQG
 4L2pgyAR42tZIXtmdpZQqa6MXRkHyqogpjDDlC1N5kXIQ6N9qlv7LtlRI
 YJadeTZRxx8Dg8u5sNJxMsjPnGF+NMGQ/63lSWUmPQFXWka9zrorGcyqN
 ujyC6m9Y737zM7mqURq6KxGhiT6FnkiaHOlPRtsJL6A5jkZkiAhna/wjd
 Qa465LaWvVbkJ+mBGs1pINHdWbfjuzrDNHuk8nEP1M4UTuiOgJc7EXSjf
 4QZ4I0ap2ym841gWvTmotJbPGj8i4fBc1usox5GggUl7GeJ0vISJrzQpN Q==;
X-CSE-ConnectionGUID: 6uHD4xOVRoaZlc0tMVEpSw==
X-CSE-MsgGUID: wZv6gsrASqSZ9BilyDlGpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="28786495"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="28786495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:15:14 -0700
X-CSE-ConnectionGUID: WGah+3blQSaYvyjzazFnaw==
X-CSE-MsgGUID: QW0ONoKuR7mYoB6zxet33g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="93761638"
Received: from iweiny-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:15:12 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 2/4] drm/xe/xe2: Extend performance tuning to media GT
Date: Fri, 20 Sep 2024 18:13:16 -0300
Message-ID: <20240920211459.255181-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920211459.255181-1-gustavo.sousa@intel.com>
References: <20240920211459.255181-1-gustavo.sousa@intel.com>
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
offset on the media GT matches the one on the primary one. So we can
simply have a copy of "Tuning: Stateless compression control" for the
media GT.

v2:
  - Fix implementation with respect to multicast vs non-multicast
    registers. (Matt)
  - Add missing XE2LPM_CCCHKNREG1 on second action of "Tuning:
    Compression Overfetch - media".
v3:
  - STATELESS_COMPRESSION_CTRL on Xe2_HPM is also a multicast register,
    do not define a XE2HPM_STATELESS_COMPRESSION_CTRL register. (Tejas)

Bspec: 72161
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cf21de3adca6..07315eb72eff 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -169,6 +169,8 @@
 #define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
 
+#define XE2LPM_CCCHKNREG1			XE_REG(0x82a8)
+
 #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
@@ -399,6 +401,10 @@
 #define SCRATCH1LPFC				XE_REG(0xb474)
 #define   EN_L3_RW_CCS_CACHE_FLUSH		REG_BIT(0)
 
+#define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
+
+#define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
+
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index faa1bf42e50e..c798ae1b3f75 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -42,20 +42,40 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
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
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000)),
+	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
+				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
+	},
+
 	{}
 };
 
-- 
2.46.1

