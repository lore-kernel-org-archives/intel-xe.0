Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E409FC77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 23:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FFE10E0D9;
	Fri,  2 Jun 2023 23:11:02 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF8010E0D9
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 23:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685747460; x=1717283460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jkZ34oXqs2FvcSj9ptY8NsUI6EugCPiVxmBHRuqN3YA=;
 b=CpGjLwtpfX4EXf6qpBSxM+QwsKzusN0xb9ANZLPsNmFvOBkLb0H4i9Fy
 JPg0gvrGEmEpg3cOUGpyyT8O63jwPKlCdNlFl7Nf4lMjdrI0Q0a4zmj8v
 jNKiWXOwMz/5G7jiPJi3uEyt3nH3QsMOc/qlVoFi7QXTuynCbokCKvFQB
 mqChGVd1Wqoeoi9RrVgTzc+bWi1tQ7ubtbFWdgPjHUhuRzXzTzd6kOiZ3
 axm2y8UeRK752GDSKDmOLCx4R51hr74euaWu/d8ZTCD7qfUQDne8kDb04
 7XevoEJAgB3sV0XbVcq1GpHwOMRBkHkxAbSW/dyT4lWsSQgqRIsGPdVtL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="336355562"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; d="scan'208";a="336355562"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 16:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658423378"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; d="scan'208";a="658423378"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 16:10:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 16:10:54 -0700
Message-Id: <20230602231054.1306865-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/wa: Extend scope of Wa_14015795083
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

Wa_14015795083 was already implemented for DG2 and PVC, but the
workaround database has been updated to extend it to more platforms.  It
should now apply to all platforms with graphics versions 12.00 - 12.60,
as well as A-step of Xe_LPG (12.70 / 12.71).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d9906f326d38..e5b3ff669465 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -107,6 +107,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
 	  XE_RTP_ACTIONS(SET(DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
 	},
+	{ XE_RTP_NAME("14015795083"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1260)),
+	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
+	},
 
 	/* DG1 */
 
@@ -195,10 +199,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(CLR(SARB_CHICKEN1, COMP_CKN_IN))
 	},
-	{ XE_RTP_NAME("14015795083"),
-	  XE_RTP_RULES(PLATFORM(DG2)),
-	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
-	},
 	{ XE_RTP_NAME("18018781329"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
@@ -219,10 +219,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* PVC */
 
-	{ XE_RTP_NAME("14015795083"),
-	  XE_RTP_RULES(PLATFORM(PVC)),
-	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
-	},
 	{ XE_RTP_NAME("18018781329"),
 	  XE_RTP_RULES(PLATFORM(PVC)),
 	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
@@ -234,6 +230,13 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(PLATFORM(PVC)),
 	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC))
 	},
+
+	/* Xe_LPG */
+	{ XE_RTP_NAME("14015795083"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
+	},
+
 	{}
 };
 
-- 
2.40.1

