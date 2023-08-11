Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0749EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBF110E6B1;
	Fri, 11 Aug 2023 16:08:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026EE10E6AE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770127; x=1723306127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YWkPLOqfSzX1SzDhcA6f4I/6AsEE6DyvaJGcB2JQfe8=;
 b=bBo+4mdFk9xSVmS04p+4NbeOo9hk+FoKJm2LUpXXpMfJVw5ivX+93PtA
 dT8yVBwaJGTgWhPhUkeWtfHOEsqKWZNnqqM0ZzZQQeOTTejPVjW17JHm4
 8pqg+Cg2JvFNZ0FvLeydk0QZR+UswVOI6W5PzhRldoX9H7I89dj4CzQEf
 bw+AINgXSFpAL0xMLoLsNg7cFSkbwX9rBMMskaSXZm+kTDG3lA10ylRjx
 iYTyvsTsG9msR1x1g38fCA3XvHQqg7tib9rGPtpFtWjw+GGY+KnPxbhuq
 1SimhZLXDE8msMqwj7TjwTmeho0vQJl+VsJCuamVjoWmGZz6Ylsjwpjb4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438044327"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="438044327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726300457"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="726300457"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:06:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 09:06:09 -0700
Message-Id: <20230811160618.477297-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230811160618.477297-1-lucas.demarchi@intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/15] drm/xe/xe2: Handle fused-off CCS engines
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

On Xe2 platforms, availability of the CCS engines is reflected in the
FUSE4 register.

Bspec: 62483
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c    | 29 +++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5bc6c7fa4759f..b8dde495b8a32 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -154,6 +154,7 @@
 
 /* Fuse readout registers for GT */
 #define XEHP_FUSE4				XE_REG(0x9114)
+#define   CCS_EN_MASK				REG_GENMASK(19, 16)
 #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
 
 #define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b8fcc6e985cfc..d2c358e711cb6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -529,7 +529,7 @@ static void read_copy_fuses(struct xe_gt *gt)
 	}
 }
 
-static void read_compute_fuses(struct xe_gt *gt)
+static void read_compute_fuses_from_dss(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -556,6 +556,33 @@ static void read_compute_fuses(struct xe_gt *gt)
 	}
 }
 
+static void read_compute_fuses_from_reg(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 ccs_mask;
+
+	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
+	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
+
+	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
+		if (!(gt->info.engine_mask & BIT(i)))
+			continue;
+
+		if ((ccs_mask & BIT(j)) == 0) {
+			gt->info.engine_mask &= ~BIT(i);
+			drm_info(&xe->drm, "ccs%u fused off\n", j);
+		}
+	}
+}
+
+static void read_compute_fuses(struct xe_gt *gt)
+{
+	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20)
+		read_compute_fuses_from_reg(gt);
+	else
+		read_compute_fuses_from_dss(gt);
+}
+
 int xe_hw_engines_init_early(struct xe_gt *gt)
 {
 	int i;
-- 
2.40.1

