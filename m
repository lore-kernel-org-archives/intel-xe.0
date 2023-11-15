Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C98C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 18:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B00510E564;
	Wed, 15 Nov 2023 18:30:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F1710E564
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700073043; x=1731609043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xc+d3gp8nYa2MREPnJsC2wart2Hfjyvr089QC22AQrI=;
 b=n7nyY+l9EWSxvMwk49lq6Y5Nb9MUUXpi1f9Nn8s7R05VgeSdAQYBWj/U
 FCEjgIaqujiYPO/HsuPccJdSFu5lXP7gyVeKiKgCrOlOA8zbO4PRoCgZo
 GOeemhy4QC7+Ndfnxc2SqnYUd+DcLt+CrRrUz8com1EicY2P/UNkOCZzT
 bAf6DOOa2C6DSyoKSGVbDAM/BB4hG6Ae2/dNovZIw0IaFh8tMQ9wPO3xA
 HsWk5X5+aH1ifhKQcx4aEJuBLqMCvNRLpnvy1tkd3iDxMKp0MOzvaij4D
 7O/hRKN9qDanMfgCJmtYpgWrXwagdbwSAKvU5xSFI6Nb7C/TsH1bVNQgw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381324877"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="381324877"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 10:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1012355917"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="1012355917"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 10:30:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 10:30:30 -0800
Message-ID: <20231115183029.2649992-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/dg2: Wa_18028616096 now applies to all DG2
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

The workaround database was just updated to extend this workaround to
DG2-G11 (whereas previously it applied only to G10 and G12).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index d03e6674519f..6572715dfc09 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -403,12 +403,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     PERF_FIX_BALANCING_CFE_DISABLE))
 	},
 	{ XE_RTP_NAME("18028616096"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3))
-	},
-	{ XE_RTP_NAME("18028616096"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G12),
+	  XE_RTP_RULES(PLATFORM(DG2),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3))
 	},
-- 
2.41.0

