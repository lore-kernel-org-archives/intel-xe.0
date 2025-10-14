Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EC4CCD192
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF44C10E534;
	Tue, 14 Oct 2025 03:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmnP6r5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255A010E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3G/efc2vURcO4g8/BVL2vmYP9td+eLUnC1RtwqM3SGc=;
 b=PmnP6r5oYtvj4LmjBw1LZFVyrkeG4SojB38eaB50V2uGgc2mK49m/06F
 bPqSWPlQcmT9yGnPz/r1CA/GHDagIOwV1obZofto9Ke6b34hzsTNofWUw
 Z+4tF6rpuyCJz/nP1rXxhGbr0Ic0FrqgNEWtjFsIdZbpCQWQveNJGvVVI
 HBfIZuPVdK6ZsWx9lvLSWIdHnzjeNWMYwwTbVN0UcntcLDXaG85lFXuXR
 mSwkvMpT3TacO8gLzuJEyz3ztzeeawm9wO6Sq8sQO2XZc+L8gdquTrKvy
 M9sBQ3xXU4U4ytqClr4pdwEKAqFouv2CuK5NX97FOQwurtAMxNX1Bxau8 w==;
X-CSE-ConnectionGUID: xicmWGrJSS+ximr/7bEN6w==
X-CSE-MsgGUID: 52lrUs8oTOiAat8ncXfhig==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414873"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: o9MwOOFoQ9SoeGhJ4ZPhgA==
X-CSE-MsgGUID: miKRUOCPSsqPzuBEToo11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567291"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 09/23] drm/xe/xe3p: Determine service copy availability from
 fuse
Date: Mon, 13 Oct 2025 20:24:41 -0700
Message-ID: <20251013-xe3p-v1-9-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 43 ++++++++++++++++++++++++++++--------
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 937dc341abe5e..b73efde21119f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -245,6 +245,9 @@
 #define XE2_GT_GEOMETRY_DSS_1			XE_REG(0x9150)
 #define XE2_GT_GEOMETRY_DSS_2			XE_REG(0x9154)
 
+#define SERVICE_COPY_ENABLE			XE_REG(0x9170)
+#define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
+
 #define GDRST					XE_REG(0x941c)
 #define   GRDOM_GUC				REG_BIT(3)
 #define   GRDOM_FULL				REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 5544d91c21e8e..275d522d301a3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -716,27 +716,52 @@ static void read_media_fuses(struct xe_gt *gt)
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

