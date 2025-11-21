Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1084BCFA761
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 10:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE63E10E80A;
	Fri, 21 Nov 2025 10:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2gMX8Sm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EC410E80A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763719659; x=1795255659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wMnPlHSkRFRsl+c6isnnOCEWRsEFWDhgOhBk1Cu22eQ=;
 b=H2gMX8SmZsqK5tA6HwOAAEaPhiT047xkEF4wIlg6mSTlxsuiPF/ept87
 oXb3VvIyMUxfzNm7scZTBkrVffm6D4U6Oh+G4zsZ4bNzGsrgk+ZGIzfsC
 sKQPbDDEhslqlrsxZNTNUdnvEzXELy43qgFvhZb3RYEp1cbLEU7OfGpkt
 KW1/po0+N5vzTovwzjaWjJWOUheZloj7i2X3hFBkt3ZbUYTjQA0Ol/QLK
 WNRVaEFlRcupjnajz7HwDT3jANnbBnHCYfpWKq9zXh+bk/M2IF8hTspkp
 0aiSQspyGL5M5UYFw0ifh2OPhBvzH+A/V2HSl/nq6N2+DfoofjgdjR6LH g==;
X-CSE-ConnectionGUID: Boj78fnHThGaq3z1GmQorg==
X-CSE-MsgGUID: X+lgwMLpScWzFv4pZhcX6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65688163"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65688163"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 02:07:38 -0800
X-CSE-ConnectionGUID: nDa8ly0PRK2aukHrIV2Jbg==
X-CSE-MsgGUID: 7LGvvh3fSHumJs19VoqlkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="192103636"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 02:07:37 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe/xe3_lpg: Apply Wa_16028005424
Date: Fri, 21 Nov 2025 15:38:23 +0530
Message-ID: <20251121100822.20076-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

Applied Wa_16028005424 to Graphics version from 30.00 to 30.05

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

v2:
  Move register definition to place it as per its address (MattR)

---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_wa.c            | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 2118f7dec287..87984713dd12 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -90,6 +90,9 @@
 #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
 #define   GUC_SEND_TRIGGER			REG_BIT(0)
 
+#define GUC_INTR_CHICKEN			XE_REG(0xc50c)
+#define   DISABLE_SIGNALING_ENGINES		REG_BIT(1)
+
 #define GUC_BCS_RCS_IER				XE_REG(0xc550)
 #define GUC_VCS2_VCS1_IER			XE_REG(0xc554)
 #define GUC_WD_VECS_IER				XE_REG(0xc558)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 3764abca3d4f..7fdb2b7cb8e4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -15,6 +15,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
@@ -323,6 +324,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("16028005424"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
+	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+	},
 };
 
 static const struct xe_rtp_entry_sr engine_was[] = {
-- 
2.43.0

