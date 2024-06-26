Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE4DC30659
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 08:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7DB10E7C7;
	Wed, 26 Jun 2024 08:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrB9HCgR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835EF10E7C9
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719391402; x=1750927402;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8kBUvXC6J0y7AV91S0iWan4BlbPqmBLkwLTKsmSYP+A=;
 b=DrB9HCgRYzt5PCpk2STj/3hjCl+2XSf6pc095aOJqEZtlqPeqHC9cKvP
 2+sl1j1CALrCFb2KGbBKGjAswjLML59h/jFTn2NekDfvLFAsHkHF0Yj7U
 JDIST1Mxf+kB7P5bU2a3FTAPP+9i8QK37fTU0lIYW9pnWE39Hkxbr1chA
 daJsA+pTJH0yRq6LiyhTmgUDAiZvJYhXjlkNZvPRvz8TtFULqvLZgB+9Z
 onFOl5hZA/Y4UxgqWzbCuoAvDm/MhZwknf7WvKSVn1tDZl/+UQGFeJCHc
 1VSNlEQjIaRT3slfkfJnBcMJUo0hT74qJ8Opl2icibm5i2JaWiG2itAA4 w==;
X-CSE-ConnectionGUID: 6IiHdaA4QDiIncl3nV6kNg==
X-CSE-MsgGUID: 6e+/dT9gTp2xZJB+cEtp6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33982786"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="33982786"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 01:43:22 -0700
X-CSE-ConnectionGUID: EcZXbOzdQHKGQ2oDtJLu8Q==
X-CSE-MsgGUID: cTTB9l3oSYaI4tR65/+bCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48532640"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 01:43:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/vf: Track writes to inaccessible registers from VF
Date: Wed, 26 Jun 2024 10:43:03 +0200
Message-Id: <20240626084304.1345-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240626084304.1345-1-michal.wajdeczko@intel.com>
References: <20240626084304.1345-1-michal.wajdeczko@intel.com>
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

Only limited set of registers is accessible for the VF driver.
The hardware will silently drop writes to inaccessible registers,
but to improve our driver lets track all such unexpected writes
on debug builds.

We will explicitly allow bad writes to SOFTWARE_FLAGS_SPR33 since
it is used by the driver just to mimic wmb and we do not have any
similar unused scratch register accessible from the VF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
v2: update commit message (Gustavo)
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 41e46a00c01e..36cefe3161e1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -892,6 +892,28 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
 	return rr->value;
 }
 
+/**
+ * xe_gt_sriov_vf_write32 - Track writes to an inaccessible registers.
+ * @gt: the &xe_gt
+ * @reg: the register to write
+ * @val: value to write
+ *
+ * This function is for VF use only.
+ * This function is dedicated for registers that VFs can't write directly.
+ * It will trigger a WARN if running on debug build.
+ */
+void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
+{
+	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, !reg.vf);
+
+	xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+		   "VF is trying to write %#x to an inaccessible register %#x+%#x\n",
+		   val, reg.addr, addr - reg.addr);
+}
+
 /**
  * xe_gt_sriov_vf_print_config - Print VF self config.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 0de7f8cbcfa6..e541ce57bec2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -22,6 +22,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
+void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
 
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f92faad4b96d..ff72afd79272 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -151,7 +151,11 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
 	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
 
 	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
-	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
+
+	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)) && reg.addr != SOFTWARE_FLAGS_SPR33.addr)
+		xe_gt_sriov_vf_write32(gt, reg, val);
+	else
+		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
 }
 
 u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
-- 
2.43.0

