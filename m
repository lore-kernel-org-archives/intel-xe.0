Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75183C369DC
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 06:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AFD10E74B;
	Wed,  7 May 2025 06:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNvQ/qBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2BB10E74B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 06:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746599828; x=1778135828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GC6hPMmSshNn6tUw8UAjSg4OtzlDCfVxc3smogq4+Z4=;
 b=MNvQ/qBQkVYPRV/Iy1vEDYuRHsE5OC/7DAOMJ7nFqJh+ktmQsx4sgj3j
 JXhWC/OIDvn01z599UXx4qruSAYnNTyoC3mc/v0p2C7p3l0ifYibf64fJ
 1nImj8jIlGMeK9CsfuJ8tczRsBtKRbyVZ2ykmoRXSSuhdJLRSpGyR4pde
 LhetJgRRgsGCMZudyOSfWkRDDwsdXWb3Qkzzivrwtklcb1ULDRoYkfAAi
 z9N8lwjHY/vHsbmD/ryKrGp2LbXbtyVDvC0BapsVH1H6Ipt710jNhaHup
 Jf6uPQWaLiDr1ZIVpXHYXUCYn0Qz4+dCTIudvF6IbeiJGj0jfnan05LdM g==;
X-CSE-ConnectionGUID: JRWGtEXVT0C37ciomLKBVA==
X-CSE-MsgGUID: JBYDhSSgR0OD8OR7G6d/og==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48214680"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="48214680"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 23:36:34 -0700
X-CSE-ConnectionGUID: AihYk15ESfyyhPoHxdD/gQ==
X-CSE-MsgGUID: QOWPMKGNRRO9TaTu2LmP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="166783299"
Received: from dut2050adlp.iind.intel.com (HELO DUT2050ADLP..)
 ([10.190.239.12])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 23:36:32 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH] drm/xe/xe2hpg: Add Wa_22021007897
Date: Wed,  7 May 2025 06:36:28 +0000
Message-ID: <20250507063628.3469-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
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

Add Wa_22021007897 for the Xe2_HPG (graphics version: 20.01) platform.
It is a permanent workaround, and applicable on all the steppings.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cbb9f7cbcfc0..a207eaa1615f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -156,6 +156,7 @@
 #define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
 
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
+#define   SBE_PUSH_CONSTANCE_BEHIND_FIX_ENABLE	REG_BIT(12)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
 #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 6f6563cc7430..bf77d5766821 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -827,6 +827,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
+	{ XE_RTP_NAME("22021007897"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANCE_BEHIND_FIX_ENABLE))
+	},
 
 	/* Xe3_LPG */
 	{ XE_RTP_NAME("14021490052"),

base-commit: 6ecf79fd8e91e4c2dfed778ba9b2e14dce4880a8
-- 
2.43.0

