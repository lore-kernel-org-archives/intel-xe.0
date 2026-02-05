Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B642DECD9AA
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 21:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A39F10E142;
	Thu,  5 Feb 2026 21:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7i0F13A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739F510E12F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 21:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770327707; x=1801863707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6/pWvxHiazMMUvv31QMbFhb0QgD464bVf1FrZNzBWjc=;
 b=b7i0F13A42xvGLUh2EsnO5WonidrbAeg34nCG2ntivHztVOqHvHgKvLw
 YWr5m+NWXqkHvjsC34cPf+IjR7N1NYBtJ7JrfODhyFPCFYMXcQ3mFRnFu
 xLC+/XLrd2AbiyBJ+IYjiDgmOjV/ssfQWZ5kOL9imC5AF+AN0AtmOHruA
 98lLnqhk00FQ8YiCCVmrN2I05Pu9mC6sXg2wYq8rroNF5Mfu6jNGMuqGP
 kynO8Nut46Adkg6tTjrKDwbgR8mHjyPkLXEbXV0HsURxWkAVc0V1XcQpV
 0q6AU7pu/ydEytkvaTt6y/hDKtQvTAeyuPUe6QOzgCKviQBZF2nTnXWn3 Q==;
X-CSE-ConnectionGUID: 0HJOY/JNSUWMsiNF9llZ/g==
X-CSE-MsgGUID: esyNGu2JT4KdJvDVHWrk/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75387990"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="75387990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 13:41:47 -0800
X-CSE-ConnectionGUID: +baGbkr0Th6+h4XFfkYvcA==
X-CSE-MsgGUID: YUtnUO8ZT7q4WQIHrf7mLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="214844529"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 13:41:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 2/2] drm/xe/xe3p_xpc: XeCore mask spans four registers
Date: Thu,  5 Feb 2026 13:41:41 -0800
Message-ID: <20260205214139.48515-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205214139.48515-3-matthew.d.roper@intel.com>
References: <20260205214139.48515-3-matthew.d.roper@intel.com>
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

On Xe3p_XPC, there are now four registers reserved to express the XeCore
mask rather than just three. Define the new registers and update the IP
descriptor accordingly.

Note that this only applies to Xe3p_XPC for now; Xe3p_LPG still only
uses three registers to express the mask.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 2 ++
 drivers/gpu/drm/xe/xe_gt_types.h     | 2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 4 ++--
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 24fc64fc832e..1b7bd34dcc38 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -253,6 +253,8 @@
 #define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
 #define XE2_GT_GEOMETRY_DSS_1			XE_REG(0x9150)
 #define XE2_GT_GEOMETRY_DSS_2			XE_REG(0x9154)
+#define XE3P_XPC_GT_GEOMETRY_DSS_3		XE_REG(0x915c)
+#define XE3P_XPC_GT_COMPUTE_DSS_3		XE_REG(0x9160)
 
 #define SERVICE_COPY_ENABLE			XE_REG(0x9170)
 #define   FUSE_SERVICE_COPY_ENABLE_MASK		REG_GENMASK(7, 0)
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 575dcfd5eb9d..bfe87e682879 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -212,11 +212,13 @@ xe_gt_topology_init(struct xe_gt *gt)
 		XELP_GT_GEOMETRY_DSS_ENABLE,
 		XE2_GT_GEOMETRY_DSS_1,
 		XE2_GT_GEOMETRY_DSS_2,
+		XE3P_XPC_GT_GEOMETRY_DSS_3,
 	};
 	static const struct xe_reg compute_regs[] = {
 		XEHP_GT_COMPUTE_DSS_ENABLE,
 		XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
 		XE2_GT_COMPUTE_DSS_2,
+		XE3P_XPC_GT_COMPUTE_DSS_3,
 	};
 	struct drm_printer p;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 44a4e7af11b1..caf7e7e78be9 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -35,7 +35,7 @@ enum xe_gt_eu_type {
 	XE_GT_EU_TYPE_SIMD16,
 };
 
-#define XE_MAX_DSS_FUSE_REGS		3
+#define XE_MAX_DSS_FUSE_REGS		4
 #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_REGS		1
 #define XE_MAX_EU_FUSE_BITS		(32 * XE_MAX_EU_FUSE_REGS)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e3a574835f35..42f15cd394f6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -122,8 +122,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
 	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
 					 BIT(XE_ENGINE_CLASS_COMPUTE),
-	.num_geometry_xecore_fuse_regs = 3,
-	.num_compute_xecore_fuse_regs = 3,
+	.num_geometry_xecore_fuse_regs = 4,
+	.num_compute_xecore_fuse_regs = 4,
 };
 
 static const struct xe_media_desc media_xem = {
-- 
2.52.0

