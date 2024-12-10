Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5206AE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 14:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1918310E8F6;
	Tue, 10 Dec 2024 14:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CnkHguv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C1B10E8F6
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733842044; x=1765378044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f8G9A3Fep8PItx6R3ddOuRhaPKsDnXZORKDNPxCf6hg=;
 b=CnkHguv5c6OD3hG4umKhHeslkECvwbZQ/Xn4qxknImn2E/k2haQ3lblD
 PjeE8bT/c04T5tf9UN4olTwC/XZDK5KW5ICS3OzHDqoMa28IQdQhlOI0c
 igbb0b8aIphUXtJvLoRSsPxQDuxlJ4sapjQFbtVNnvRdbGkcRC9qgSC6L
 2n2aoHtm6KUfiDOTwcQ9lFvv5kXbWHtzsCfxoXvwQbVdYC3QxwnsnOAAe
 5v20MGK8NITnJekFiD5J5xF+AnxNm0+GKz97IT9e+sIkP9p6B7L80xwwn
 tpxj986Gz1Adsjjd5DHmcVLzjPuu1uxZdcvzia8mEo5F/+S9HWMvEpzZg w==;
X-CSE-ConnectionGUID: k6Fgf/NwSU6Rqe/+GZNViQ==
X-CSE-MsgGUID: UQGwOwbOSNihvP6D/tkraw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44796148"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="44796148"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:47:23 -0800
X-CSE-ConnectionGUID: BCbjRXPmTSabUl2O5TV3vw==
X-CSE-MsgGUID: s/mvqSS7T5GiDY8YzIegpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="118676529"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:47:22 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/ptl: Apply Wa_14023061436
Date: Tue, 10 Dec 2024 16:06:21 +0100
Message-ID: <20241210150621.781462-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Enable WMTP for the BTD kernel to address Wa14023061436 by setting the
proper TDL Chicken Bit.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 162f18e975da..6829fbed1803 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -496,6 +496,9 @@
 #define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
 #define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
 
+#define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
+#define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
+
 #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 570fe0376402..2889d6f65f51 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -637,6 +637,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC))
 	},
+	{ XE_RTP_NAME("14023061436"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
+	},
 
 	/* DG1 */
 
-- 
2.46.0

