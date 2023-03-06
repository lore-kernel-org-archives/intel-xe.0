Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987F0C64EC4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 16:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6580610E0DB;
	Mon,  6 Mar 2023 16:59:35 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EBC10E0DB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678121973; x=1709657973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gPqKEcFG8EkrVZMuKEs/ru4bkv0XDk+MnxzcF+u5iek=;
 b=fNkvzA+ZSuH+5cbCLmS67rLnY2nwSE2nHlzNJKmPgn3BSQTl/huwWLhJ
 SUasS2lzIxPG+lfFCgdUc2ioAdYQLcSM0+RnJcxRNT5DYetq5u2AlPZ2d
 YjLBmzMz6qcA1Ou7RDBkeHrL5TEDS05jJJt7otlvL/NCFIBkZqiPP5Fsl
 k8A3zm+Bz8X/Eg/b2xPdqdmj0SGfDSFgaAJqVmGQZ2aWxQoxEizLaqVZL
 Mw5LrlRND+bSo5gR+3xIXLxbn9zY6OWRI2RELZgx9BAvdQKT/5ApR8D2s
 irLDaYqa43fqaq5vr+XeOB1XuEU3cgsrmIgRn+J01+3rJvUME8JhgaOt3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315264608"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="315264608"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 08:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676223178"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="676223178"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 08:59:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 08:57:57 -0800
Message-Id: <20230306165757.633796-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix ROW_CHICKEN2 define
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When this register was added in xe for some workarounds, it was copied
from i915 before the registers got changed to add the MCR annotation.
The register 0xe4f4 is MCR since gen8, long before any GPU supported by
the xe driver. Replace all occurrences with the right register.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_wa.c           | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4d0f09cd447c..3ba2b2978dd9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -231,7 +231,7 @@
 #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
 #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
 
-#define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
+#define GEN8_ROW_CHICKEN2			MCR_REG(0xe4f4)
 #define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
 #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
 #define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index df72b15dfeb0..5938e538ba7d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -191,7 +191,7 @@ static const struct xe_rtp_entry engine_was[] = {
 	},
 	{ XE_RTP_NAME("1606931601"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN7_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
+	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
 	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
@@ -213,7 +213,7 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
 		       ENGINE_CLASS(RENDER),
 		       IS_INTEGRATED),
-	  XE_RTP_ACTIONS(SET(GEN7_ROW_CHICKEN2, GEN12_PUSH_CONST_DEREF_HOLD_DIS,
+	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_PUSH_CONST_DEREF_HOLD_DIS,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
 	{ XE_RTP_NAME("14010229206, 1409085225"),
-- 
2.39.0

