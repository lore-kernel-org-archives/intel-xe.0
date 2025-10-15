Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E7DCCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D60C10E90B;
	Wed, 15 Oct 2025 22:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrFIocZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F2B10E902
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566031; x=1792102031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yHXQpBkBfnm/9pD510AriQb/4gDJE4y0UcVHNl8cbIU=;
 b=nrFIocZlTyB73WB1Ux3EseFH7QmtKCdwtcaweq0v4CaJynWSjzSNypj0
 nOLkLKqVU7UEJdMoZ1evgPD6sNUUO2k8gfU5e060V/6Xw6pjOO3qgmrBz
 t3CwA8l2msY/FtkgFa3e7YFvTP904PQA5jpHF38Kb4RPCOsMM0er1MMfJ
 rv2ASAGGQgAUY8wqHAc9stoBisDHzazrmPF7jlppWo54N/ywGYg6vsF4v
 DBX2vv58YRm4s6M5zBPgFyrXJ5fU+EzAMNgKMsC76jAU8U55cywsajXou
 ZBxfwlGZCXWDj9pvJ1n5FqLHKKCZzbmTzIoSPCws+Ds83SwFfVoByVtj1 w==;
X-CSE-ConnectionGUID: GoTy7cdQSzGF6VNbEhX3GA==
X-CSE-MsgGUID: 2OjB/07JR4SaAMFMfJvOnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794053"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794053"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: /xTU7668TY2Hxa1+7GDM+A==
X-CSE-MsgGUID: LI+YUSYoRh+KDXf8aMH+Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298283"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 08/22] drm/xe/xe3p: Determine service copy availability
 from fuse
Date: Wed, 15 Oct 2025 15:06:23 -0700
Message-ID: <20251015-xe3p-v2-8-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
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

