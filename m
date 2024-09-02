Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69642CA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 19:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E7D10E3B2;
	Mon,  2 Sep 2024 19:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Unubakdj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD54B10E3B2
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725305409; x=1756841409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IgytDxyIoMJOVpms1sKbkLdI2cVLQOc3m2jIaiCYDpY=;
 b=UnubakdjR4T2XqtDmvl2vTyLqMBqCMchgOVF0zJeaJFIxj5PpnNDqKJY
 PjyuhIrjyitDh1aJzK3jA1RxUoePYgbyJSwaZhj4zOM7hM68CI5c29vql
 DisoUge0fddPdjEg1eO+AknuOEgNI5p0GgtsWydguS/xgcskVhRhTz1F3
 Qt/p4v0/ddHDKuTDnFobRIRkX39C6qi9r4oUCTc0O/QqacUwLA5M5RaRI
 4HMPrOA34B2pF/Luujnad+eCJXy3ty6H0dlYVezxLS5ICDzagCo4ZwOGl
 J+Wa3Yl/Bw9uP8JPkXKx5Uoq2FrBTcnvOXtKml84X/T/itg1XMix8tKLo Q==;
X-CSE-ConnectionGUID: JXzNkb8hQqShQ0uY1hfPQA==
X-CSE-MsgGUID: r3NbYn3rTKai0sbi8Shg+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27684109"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="27684109"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 12:30:09 -0700
X-CSE-ConnectionGUID: 1S54J5OPQNO2e+xrr6tCDg==
X-CSE-MsgGUID: FCSty8maRY2pHeTUM5UyVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="65406293"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 12:30:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Sanitize VF scratch registers on FLR
Date: Mon,  2 Sep 2024 21:29:53 +0200
Message-Id: <20240902192953.1792-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Some VF accessible registers (like GuC scratch registers) must be
explicitly reset during the FLR. While this is today done by the GuC
firmware, according to the design, this should be responsibility of
the PF driver, as future platforms may require more registers to be
reset. Likewise GuC, the PF can access VFs registers by adding some
platform specific offset to the original register address.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         | 52 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c |  3 +-
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 905f409db74b..919d960165d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -5,8 +5,10 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_guc_regs.h"
 #include "regs/xe_regs.h"
 
+#include "xe_gt.h"
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
@@ -89,6 +91,56 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 	xe_gt_sriov_pf_service_update(gt);
 }
 
+static u32 pf_get_vf_regs_stride(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
+}
+
+static struct xe_reg xe_reg_vf_to_pf(struct xe_reg vf_reg, unsigned int vfid, u32 stride)
+{
+	struct xe_reg pf_reg = vf_reg;
+
+	pf_reg.vf = 0;
+	pf_reg.addr += stride * vfid;
+
+	return pf_reg;
+}
+
+static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
+{
+	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
+	struct xe_reg scratch;
+	int n, count;
+
+	if (xe_gt_is_media_type(gt)) {
+		count = MED_VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
+			xe_mmio_write32(gt, scratch, 0);
+		}
+	} else {
+		count = VF_SW_FLAG_COUNT;
+		for (n = 0; n < count; n++) {
+			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
+			xe_mmio_write32(gt, scratch, 0);
+		}
+	}
+}
+
+/**
+ * xe_gt_sriov_pf_sanitize_hw() - Reset hardware state related to a VF.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	pf_clear_vf_scratch_regs(gt, vfid);
+}
+
 /**
  * xe_gt_sriov_pf_restart - Restart SR-IOV support after a GT reset.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index f0cb726a6919..96fab779a906 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -11,6 +11,7 @@ struct xe_gt;
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
 void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
+void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_restart(struct xe_gt *gt);
 #else
 static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 02f7328bd6ce..b4fd5a81aff1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -9,6 +9,7 @@
 
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
@@ -1008,7 +1009,7 @@ static bool pf_exit_vf_flr_reset_mmio(struct xe_gt *gt, unsigned int vfid)
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_MMIO))
 		return false;
 
-	/* XXX: placeholder */
+	xe_gt_sriov_pf_sanitize_hw(gt, vfid);
 
 	pf_enter_vf_flr_send_finish(gt, vfid);
 	return true;
-- 
2.43.0

