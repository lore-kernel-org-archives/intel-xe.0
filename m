Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222BBCCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635DC10EAF0;
	Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXF8GMQ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE64F10EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668037; x=1792204037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yHXQpBkBfnm/9pD510AriQb/4gDJE4y0UcVHNl8cbIU=;
 b=AXF8GMQ23JQQMneJgOl11optiH3wkYQ/p6IWZszu59rupUgQHwZhYJ0z
 6+S1dL47Q4iozZOt13prO8E+rrm1DVDwTw9r9jrIWxxMcMe+lnpNdOiW5
 qPW1rSOQIlhxDlWGhYRBhD9cT2XZhMzxClAbJiKrIWlpqNwDhowx5kA7D
 vMTREeEnMa/6PbWw1ZsbNBdnGAn2dEJSj1OuvLuJX7lEeWF0rgaQ1gfRP
 +6pCPH706gQp58WKz4VTfM+Y+galJKKg10czdTiczkzu4O9lfwuhuXnSo
 kHUNzW34egwBqI9CXwkGGzK5nGqwEgHhceT7ohdxj/xDpJJ49wx3hrh8u A==;
X-CSE-ConnectionGUID: axfrwOTJRQydf1rhe8o6yg==
X-CSE-MsgGUID: 6PIaURR/QZSr7fZNmhLXbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739211"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739211"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
X-CSE-ConnectionGUID: Hevjy2QRTXGppDnnP7h8xQ==
X-CSE-MsgGUID: JwMWXH3EQcu/FrYJotNgyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089180"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 08/24] drm/xe/xe3p: Determine service copy availability
 from fuse
Date: Thu, 16 Oct 2025 19:26:27 -0700
Message-ID: <20251016-xe3p-v3-8-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe3p introduces a dedicated SERVICE_COPY_ENABLE fuse register to reflect
the availability of the service copy engines (BCS1-BCS8).

Bspec: 74624
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 43 ++++++++++++++++++++++++++++--------
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 21c15441c4537..228de47c0f3f5 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -239,6 +239,9 @@
 #define XE2_GT_GEOMETRY_DSS_1			XE_REG(0x9150)
 #define XE2_GT_GEOMETRY_DSS_2			XE_REG(0x9154)
 
+#define SERVICE_COPY_ENABLE			XE_REG(0x9170)
+#define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
+
 #define GDRST					XE_REG(0x941c)
 #define   GRDOM_GUC				REG_BIT(3)
 #define   GRDOM_FULL				REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b08a6d42c8ffc..073ecd263e543 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -718,27 +718,52 @@ static void read_media_fuses(struct xe_gt *gt)
 	}
 }
 
+static u32 infer_svccopy_from_meml3(struct xe_gt *gt)
+{
+	u32 meml3 = REG_FIELD_GET(MEML3_EN_MASK,
+				  xe_mmio_read32(&gt->mmio, MIRROR_FUSE3));
+	u32 svccopy_mask = 0;
+
+	/*
+	 * Each of the four meml3 bits determines the fusing of two service
+	 * copy engines.
+	 */
+	for (int i = 0; i < 4; i++)
+		svccopy_mask |= (meml3 & BIT(i)) ? 0b11 << 2 * i : 0;
+
+	return svccopy_mask;
+}
+
+static u32 read_svccopy_fuses(struct xe_gt *gt)
+{
+	return REG_FIELD_GET(FUSE_SERVICE_COPY_ENABLE_MASK,
+			     xe_mmio_read32(&gt->mmio, SERVICE_COPY_ENABLE));
+}
+
 static void read_copy_fuses(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 bcs_mask;
 
-	if (GRAPHICS_VERx100(xe) < 1260 || GRAPHICS_VERx100(xe) >= 1270)
-		return;
-
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
-	bcs_mask = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
-	bcs_mask = REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
+	if (GRAPHICS_VER(xe) >= 35)
+		bcs_mask = read_svccopy_fuses(gt);
+	else if (GRAPHICS_VERx100(xe) == 1260)
+		bcs_mask = infer_svccopy_from_meml3(gt);
+	else
+		return;
 
-	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
-	for (int i = XE_HW_ENGINE_BCS1, j = 0; i <= XE_HW_ENGINE_BCS8; ++i, ++j) {
+	/* Only BCS1-BCS8 may be fused off */
+	bcs_mask <<= XE_HW_ENGINE_BCS1;
+	for (int i = XE_HW_ENGINE_BCS1; i <= XE_HW_ENGINE_BCS8; ++i) {
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		if (!(BIT(j / 2) & bcs_mask)) {
+		if (!(bcs_mask & BIT(i))) {
 			gt->info.engine_mask &= ~BIT(i);
-			xe_gt_info(gt, "bcs%u fused off\n", j);
+			xe_gt_info(gt, "bcs%u fused off\n",
+				   i - XE_HW_ENGINE_BCS0);
 		}
 	}
 }

-- 
2.51.0

