Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7733C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 14:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE0211A4D2;
	Thu, 25 Apr 2024 14:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKP0BeZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB7C11A4CE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055995; x=1745591995;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yia7yJEILfj6WHOfB7hwOTrEAnJQFblxUdbg3zMDvSI=;
 b=NKP0BeZ+NbrlRS43P0XcNo1Gj41mmjcDZjvaviHjWLRSoD/sMVDcpCQI
 c4Xswu2b4zCXSTPhbjR5raQqMKmlvsKRtc5PBTe1JT+sBjKa5LS3Z2wi3
 aR4x9/YZQeH5w1pPmYWczXKJHsivF57FUivvskBsfd5buASOXpHheZ4ku
 HHHES2d4TA8TGP7gmhIlzdZ1bxrAvHX9s6oI+vU46Je1e9fccKja6grdJ
 pEGeKAsG59ddEeJBgM8fcBu2mKA0Ln66mj3ZCV5zwcl6l5xJRAyh3CMkl
 w6LV52wkkZ4lI4pRDUJI7LJ6CnneCYrzcQE5sbGiX6vmGOtrcA84leD3H w==;
X-CSE-ConnectionGUID: WSfGQ+DiQMynj1rjbLJp6w==
X-CSE-MsgGUID: CnpyB9MITRG8+KFvfd7JiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9596155"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9596155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:54 -0700
X-CSE-ConnectionGUID: L/pq3mQnT7WFBCRXuzKUVg==
X-CSE-MsgGUID: QsKt8sz3QK6ERQAdUHmSUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25511781"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.254.134])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:39:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/pf: Re-initialize SR-IOV specific HW settings
Date: Thu, 25 Apr 2024 16:39:26 +0200
Message-Id: <20240425143927.2265-1-michal.wajdeczko@intel.com>
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

On older platforms (12.00) the PF driver must explicitly unblock
VF's modifications to the GGTT. On newer platforms this capability
is enabled by default.

Bspec: 49908, 53204
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_gt.c              |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c     | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h     |  5 +++++
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
index 617ddb84b7fa..017b4ddd1ecf 100644
--- a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
@@ -14,6 +14,9 @@
 #define   LMEM_EN			REG_BIT(31)
 #define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
 
+#define VIRTUAL_CTRL_REG		XE_REG(0x10108c)
+#define   GUEST_GTT_UPDATE_EN		REG_BIT(8)
+
 #define VF_CAP_REG			XE_REG(0x1901f8, XE_REG_OPTION_VF)
 #define   VF_CAP			REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e922e77f5010..7cd35871c978 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -477,6 +477,9 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
 		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
 
+	if (IS_SRIOV_PF(gt_to_xe(gt)))
+		xe_gt_sriov_pf_init_hw(gt);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 
@@ -613,6 +616,9 @@ static int do_gt_restart(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
 		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
 
+	if (IS_SRIOV_PF(gt_to_xe(gt)))
+		xe_gt_sriov_pf_init_hw(gt);
+
 	xe_mocs_init(gt);
 	err = xe_uc_start(&gt->uc);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 791dcdd767e2..687ea81931d1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -5,8 +5,11 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_sriov_regs.h"
+
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_helpers.h"
+#include "xe_mmio.h"
 
 /*
  * VF's metadata is maintained in the flexible array where:
@@ -50,3 +53,25 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 
 	return 0;
 }
+
+static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) == 1200;
+}
+
+static void pf_enable_ggtt_guest_update(struct xe_gt *gt)
+{
+	xe_mmio_write32(gt, VIRTUAL_CTRL_REG, GUEST_GTT_UPDATE_EN);
+}
+
+/**
+ * xe_gt_sriov_pf_init_hw - Initialize SR-IOV hardware support.
+ * @gt: the &xe_gt to initialize
+ *
+ * On some platforms the PF must explicitly enable VF's access to the GGTT.
+ */
+void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
+{
+	if (pf_needs_enable_ggtt_guest_update(gt_to_xe(gt)))
+		pf_enable_ggtt_guest_update(gt);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index 05142ffc4319..37d7d6c3df03 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -10,11 +10,16 @@ struct xe_gt;
 
 #ifdef CONFIG_PCI_IOV
 int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
+void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
 #else
 static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 {
 	return 0;
 }
+
+static inline void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
+{
+}
 #endif
 
 #endif
-- 
2.43.0

