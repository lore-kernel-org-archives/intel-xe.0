Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D3FC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8611D10E7EE;
	Tue, 13 Feb 2024 15:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/2qt6Bo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213D110E7F0
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839056; x=1739375056;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LMfrg5E82PrLXtzcErt8gJmySC3y5hU+cqqwnQbRvK4=;
 b=F/2qt6BoJ7XHdDCmxiJbV9nlS97hxpg2xYIqbHY9T48FLtGgMItIG7js
 YuhrhGYVvcd8vGLCJC+J6hf1a0of1sEPb21VMENLxyBImg8mg1ZuWEs65
 cp3+BdTHptQ8rJEYs1o1BrZpvLVAKRbgtiKA9VS93KhUfXTdtC1BDGdAy
 ussJJOYz1Z9zZy3BEI/bWEBSsRhPF0nGwX/O8ONvFkPoAWOtwF4OzbiZj
 SnWr9pSzdid0K3e/gfQ0PrgBVu46TWgn746cg00zLgPaP5Rd0hXq2NYh+
 xCyh32k1jT26qzRnCxjz/kSz5CP0ED1EaALmbZKunzjzdu1dQwayQ/KRH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262924"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564505"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:16 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 5/8] drm/xe/vf: Don't check if LMEM is initialized if VF
Date: Tue, 13 Feb 2024 16:43:52 +0100
Message-Id: <20240213154355.1221-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

It is PF driver responsibility to verify that LMEM was correctly
initialized, also VF drivers don't have access to GU_CNTL register.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5f6b53ea5528..e3db3a178760 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -20,6 +20,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
+#include "xe_sriov.h"
 #include "xe_tile.h"
 
 #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
@@ -363,13 +364,19 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 
+	if (!IS_DGFX(xe))
+		return 0;
+
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	/*
 	 * The boot firmware initializes local memory and assesses its health.
 	 * If memory training fails, the punit will have been instructed to
 	 * keep the GT powered down; we won't be able to communicate with it
 	 * and we should not continue with driver initialization.
 	 */
-	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
+	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
 		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
 		return -ENODEV;
 	}
-- 
2.43.0

