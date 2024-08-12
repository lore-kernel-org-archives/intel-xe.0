Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C17C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 07:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C049E10E0EE;
	Mon, 12 Aug 2024 07:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZouPGkS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51F910E0EE
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 07:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723446042; x=1754982042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QAQKTike1Q/6905QL0Bju1mBdP57tF+KU4Hye5JL5Eo=;
 b=ZouPGkS5Iud8EaZleCQVNIefkFoxWopSDfWp6J/Kq2cBvjHDllTA6p1b
 FAF0V61sU2BLap63AROleqiRXzFAtO8PV3OxqGS7Aty79+pcUGvN5WQom
 3WMoUpvgsY15KWVnfpVDPqsuVvS2XE3MelTKSke3BLtJIPkZB5I1ciY5Q
 FWHIhMhHeCD719PpWXYq+O2/81uhaV5eNlTDjNcs4ntlEflLttLht3CdH
 bGRZdFgL8Dn0YtxfuThM6jIYZDeYKBG8cGfINYqXrG5nW5afPFrdGb8u5
 rbDgSwdILjR3AQioiHLFB9X7sShDof9Obq9RlgahwpUz2mjD8BN29Cm68 g==;
X-CSE-ConnectionGUID: XBkpzpQoRE+6q7OBd3xksA==
X-CSE-MsgGUID: 73iiQPmPSJ2o3yPG1i9pjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21708842"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21708842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 00:00:42 -0700
X-CSE-ConnectionGUID: fFc4kAfLTNafomR/zlHbOg==
X-CSE-MsgGUID: OluU0RNXQ4yCb/MHT2uhmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="63017700"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa003.jf.intel.com with ESMTP; 12 Aug 2024 00:00:40 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2hpg: Add Wa_14021821874
Date: Mon, 12 Aug 2024 12:32:51 +0530
Message-Id: <20240812070251.796744-1-tejas.upadhyay@intel.com>
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

Wa_14021821874 applies to xe2_hpg

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2c8c4d4218db..9054253f6aaa 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -451,6 +451,7 @@
 #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
 
 #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
+#define	  STK_ID_RESTRICT			REG_BIT(12)
 #define   SLM_WMTP_RESTORE			REG_BIT(11)
 
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 564e32e44e3b..28b7f95b6c2f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -542,6 +542,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
+	{ XE_RTP_NAME("14021821874"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
+	},
 
 	/* Xe2_LPM */
 
-- 
2.25.1

