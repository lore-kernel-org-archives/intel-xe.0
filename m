Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B951BEE499F
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFAE10E57A;
	Fri, 18 Aug 2023 22:08:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7956C10E2C9
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2sORZJVl32ERXcV4eZZcqj0+VGQjwTvHj9KXDCOppFA=;
 b=ElK8rx3nFwcrKHATIKMnNjPMZiaaNuDChZ/isC88YDdjW6L8YPzxwV7P
 Apjl5XhH3rTm79fkeVtZWVQ9PrnaaeB3djONMWl1mKhz21Vf7bSgR4J04
 xMKu0GDpSwpGp5h/WoLu+PWaNojVh2LAZ6lgmNlkVLe6du2LzIDiDEAVt
 EBEfLBIrBxIi4ahxdBcgUa/9pVdlhHJTqgcfgtcuLX+TEQps4/P5f2W02
 zcxyyP1lozceHzT39dSapi0IpsfDNNG9uOz+YDtpGXCqEwZHXWUT0/n+X
 vJW64Ovo/ecVqFz/Jbgi8Sg7XRWIBjKVSKSlG8JxoFgTQl9aAnPhfZ9P/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592988"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592988"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758192"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758192"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:15 -0700
Message-Id: <20230818220824.700519-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/15] drm/xe/xe2: Handle fused-off CCS engines
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

From: Matt Roper <matthew.d.roper@intel.com>

On Xe2 platforms, availability of the CCS engines is reflected in the
FUSE4 register.

Bspec: 62483
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c    | 29 +++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 366818127317..aa9d7fad41ee 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -152,6 +152,7 @@
 
 /* Fuse readout registers for GT */
 #define XEHP_FUSE4				XE_REG(0x9114)
+#define   CCS_EN_MASK				REG_GENMASK(19, 16)
 #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
 
 #define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 24b5226f1433..dd673a684b70 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -550,7 +550,7 @@ static void read_copy_fuses(struct xe_gt *gt)
 	}
 }
 
-static void read_compute_fuses(struct xe_gt *gt)
+static void read_compute_fuses_from_dss(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
@@ -577,6 +577,33 @@ static void read_compute_fuses(struct xe_gt *gt)
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

