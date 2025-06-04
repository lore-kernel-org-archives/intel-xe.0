Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14104C5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 20:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B293710E85C;
	Wed,  4 Jun 2025 20:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahEizI9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0221E10E85C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749068960; x=1780604960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7RKs9pZmpLTHIpZRUuKF3i+p3fIf18WQ4WCMAwG746c=;
 b=ahEizI9oIwY/QWYSLRoBqKzucRVXAHRDhFAxSr9kFvt/HkE19mFc3HQC
 QHA57mUDlfhoL0IN4Y8UMKD9KNNXa83wYL78/SAWs5xtHBzOFuQkyemC4
 fsm/nJ2+Hplpb/3+y4RQlljrFydRcrmHjwdBDj8K+n9BSYBe0ZJTRcLMZ
 EsYdwnKKi8Ps3Otgf2i79P7iT0w9yIlHMGlqUqxb80PzVw6FInbUMjpnP
 iQ56XR7Hgzp2iSkiidOsMR7M+r5/cgVy5Hd7nRgM1vPJLbfd386wDUr+W
 Rz+1hUQdXmek9o5DiuFQLBg+TACWTsTvXTKTI0reoPbZex8qrxoAoxRGW A==;
X-CSE-ConnectionGUID: Y8l1nff8TtiBJqdyeoiNew==
X-CSE-MsgGUID: aObnx2MUSt6qs0p7t+rW9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51039066"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="51039066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:29:20 -0700
X-CSE-ConnectionGUID: IE6kK2dcTim2iFePwuwFEQ==
X-CSE-MsgGUID: HVgDDiS1QtesohfA+KJsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145257210"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:29:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/3] drm/xe/topology: Simplify code for loading DSS mask
Date: Wed,  4 Jun 2025 22:29:06 +0200
Message-Id: <20250604202908.769-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250604202908.769-1-michal.wajdeczko@intel.com>
References: <20250604202908.769-1-michal.wajdeczko@intel.com>
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

Instead of passing registers using va_list we can keep them in
the static array and pass as such and also lower driver footprint:

  add/remove: 2/0 grow/shrink: 0/2 up/down: 24/-175 (-151)
  Function                                     old     new   delta
  geometry_regs                                  -      12     +12
  compute_regs                                   -      12     +12
  xe_gt_topology_init                          550     527     -23
  load_dss_mask                                449     297    -152

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 35 ++++++++++++++++-------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index acec6559e2f2..62bfb6e1a166 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -16,20 +16,17 @@
 #include "xe_mmio.h"
 #include "xe_wa.h"
 
-static void
-load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
+static void load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs,
+			  const struct xe_reg regs[])
 {
-	va_list argp;
 	u32 fuse_val[XE_MAX_DSS_FUSE_REGS] = {};
 	int i;
 
 	if (drm_WARN_ON(&gt_to_xe(gt)->drm, numregs > XE_MAX_DSS_FUSE_REGS))
 		numregs = XE_MAX_DSS_FUSE_REGS;
 
-	va_start(argp, numregs);
 	for (i = 0; i < numregs; i++)
-		fuse_val[i] = xe_mmio_read32(&gt->mmio, va_arg(argp, struct xe_reg));
-	va_end(argp);
+		fuse_val[i] = xe_mmio_read32(&gt->mmio, regs[i]);
 
 	bitmap_from_arr32(mask, fuse_val, numregs * 32);
 }
@@ -219,9 +216,19 @@ get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
 void
 xe_gt_topology_init(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-	struct drm_printer p;
+	static const struct xe_reg geometry_regs[] = {
+		XELP_GT_GEOMETRY_DSS_ENABLE,
+		XE2_GT_GEOMETRY_DSS_1,
+		XE2_GT_GEOMETRY_DSS_2,
+	};
+	static const struct xe_reg compute_regs[] = {
+		XEHP_GT_COMPUTE_DSS_ENABLE,
+		XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
+		XE2_GT_COMPUTE_DSS_2,
+	};
 	int num_geometry_regs, num_compute_regs;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct drm_printer p;
 
 	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
 
@@ -233,14 +240,10 @@ xe_gt_topology_init(struct xe_gt *gt)
 	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
 
 	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
-		      num_geometry_regs,
-		      XELP_GT_GEOMETRY_DSS_ENABLE,
-		      XE2_GT_GEOMETRY_DSS_1,
-		      XE2_GT_GEOMETRY_DSS_2);
-	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
-		      XEHP_GT_COMPUTE_DSS_ENABLE,
-		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
-		      XE2_GT_COMPUTE_DSS_2);
+		      num_geometry_regs, geometry_regs);
+	load_dss_mask(gt, gt->fuse_topo.c_dss_mask,
+		      num_compute_regs, compute_regs);
+
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
 	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
 
-- 
2.47.1

