Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4057C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 21:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FC210FF5D;
	Wed, 20 Mar 2024 21:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WofCTKzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8010310FF5D
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 21:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710969506; x=1742505506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mTiE2pfPisTnUIiHU5T2juxVUZpD0oisiplaEBZ2Wa0=;
 b=WofCTKzFrUJV0+zf14oBwT6GJtjHG/oVUu3AEE4i0Rtf+dVdPVYr1j7r
 UELhZwWsCdCwWOwxNOH1TBf9jK+wWAXdwn7IS2tlGdhVQ8X0MRP+P93M7
 a+4zsvGfz2TMFGAwAJwGvLakzQTO474Gmo8OiqrsJw1BvA1xXU1bTKyhS
 nudGcu7/MFoN/a3V2s8wZw2s9bN78n3G0dD52P5NEdTmhdjLJUeTGOFrw
 wDp+QqKGgcayPvgcV2eMOTI8DHcMJzS3Gqk4CafBGeQB+/yA0bjdycHC7
 Xltby4qp+Dx50HiXzP33wUqmEfLS4PSSOQZhzMx9AytJAWU5f6HwwKg4R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="31361572"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="31361572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 14:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14690703"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 14:18:25 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/gsc: Implement WA 14018094691
Date: Wed, 20 Mar 2024 14:18:19 -0700
Message-ID: <20240320211819.211624-1-daniele.ceraolospurio@intel.com>
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

The WA states that we need to keep the primary GT powered up during GSC
load to allow the GSC FW to access its registers. We also need to make
sure that one of the registers is locked before starting the load.

Bspec: 55928
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_gsc.c          | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 95969935f58b..713e4d590fc0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -373,6 +373,9 @@
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
 
+#define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
+#define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
+
 #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
 #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
 #define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 09f6e7899921..c9a139d45095 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -17,6 +17,7 @@
 #include "xe_gsc_proxy.h"
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_huc.h"
 #include "xe_map.h"
@@ -252,9 +253,30 @@ static int gsc_upload(struct xe_gsc *gsc)
 static int gsc_upload_and_init(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_tile *tile = gt_to_tile(gt);
 	int ret;
 
+	if (XE_WA(gt, 14018094691)) {
+		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
+
+		/*
+		 * If the forcewake fails we want to keep going, because the worst
+		 * case outcome in failing to apply the WA is that PXP won't work,
+		 * which is not fatal. We still throw a warning so the issue is
+		 * seen if it happens.
+		 */
+		xe_gt_WARN_ON(tile->primary_gt, ret);
+
+		xe_gt_mcr_multicast_write(tile->primary_gt,
+					  EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK,
+					  EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT);
+	}
+
 	ret = gsc_upload(gsc);
+
+	if (XE_WA(gt, 14018094691))
+		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 48cdba1cbf95..68600cdead84 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -19,3 +19,4 @@
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
+14018094691	GRAPHICS_VERSION(2004)
-- 
2.43.0

