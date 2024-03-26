Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECD6C54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 22:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ED310F43E;
	Tue, 26 Mar 2024 22:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUNUZOcx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D6F10F43E
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 22:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711493104; x=1743029104;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W/vAHmD3L0hWsTFGSTqJp6qFdo8+FJxGQmyB9JQfNwE=;
 b=SUNUZOcxRNlp09eOSNzhndHXj8+1YbP8tv9z8hkeP+UAVONZo6jZjgNk
 Et6KX/vToNvZgqrw0+YReBzH/nWs9/LerhZG4jg0mm2GeIFmPDoykOyA9
 0KRfe6kAVhoAe10EomV90WYbFuY1jzapcD0FGuVZepYrRWRpcnqk/mXZT
 q/Vk/XAK4/83VXq+eR/JMQKkWN4xv2FJrF7NFN6jVH0RSXBIWowmFQIHY
 vI2jR95kCTNVmGt+tSsAUnc5FCtElLNPeXesXiE+Zs94brYclaU5cKYw7
 NvZUSm+ZkfRdsv2QDm0wYdrcml4bwvHL2STs1lYlh5nZlik/ngXoEcvt5 w==;
X-CSE-ConnectionGUID: GoKHxB5zTkWEiI+71HS9gg==
X-CSE-MsgGUID: pU7yW9GDTdWZxvRTjzvSww==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17116570"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="17116570"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 15:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="20819540"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 15:45:04 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe/gsc: Implement WA 14018094691
Date: Tue, 26 Mar 2024 15:44:56 -0700
Message-ID: <20240326224456.518548-1-daniele.ceraolospurio@intel.com>
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

v2: fix location of register def (Matt)

Bspec: 55928
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_gsc.c          | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 65af9fe95db5..d5b21f03beaa 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -370,6 +370,9 @@
 #define RT_CTRL					XE_REG_MCR(0xe530)
 #define   DIS_NULL_QUERY			REG_BIT(10)
 
+#define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
+#define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
+
 #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 8339b0b49dfb..92dc442a5114 100644
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

