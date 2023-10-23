Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ED1C004C0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 15:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31C610E214;
	Mon, 23 Oct 2023 15:22:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C7810E215
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698074520; x=1729610520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20X27Bw7tClWfENfTkXVgY0g9pr2C9cxD0fS9SQZd4o=;
 b=GSrbafs72nmHMHtf6oJgv9gs6oSqsrhSCPITe0liz4wk8xtiKsHOWTc0
 Q45oVU3pgvpJth/HZk2jxIpA2Ts7skNc+3G0IE/2JitoTMORBnQbegGi4
 zBz+P9D7aWgsmVw8TjhqYR5NPlm00UvsMYAvHfxk6pJvHfwFJartGBZsJ
 pP1rack89bWxDL/ETN5nWgtushr3kTW0EVw7mPXihpV56lL++eZhxbu9j
 d+JM+iu96WBQhPzxWRuns6nmxtRLSPJnYhqYGHJ4wV5wK/0MlW6PaP5xr
 i4BzsicQO30MaTORXK8sLk/VBHYknwj1D9Ngb1D5vTcDGWOOyYUCOdR9r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="451089149"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="451089149"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 08:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="758161456"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="758161456"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 08:21:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 08:21:38 -0700
Message-Id: <20231023152138.132614-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231023152138.132614-1-lucas.demarchi@intel.com>
References: <20231023152138.132614-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add Wa_14019821291
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

This workaround is primarily implemented by the BIOS.  However if the
BIOS applies the workaround it will reserve a small piece of our DSM
(which should be at the top, right below the WOPCM); we just need to
keep that region reserved so that nothing else attempts to re-use it.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile            |  2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  2 ++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules     |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cee57681732d..ef9d954f5a75 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
 $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
+$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)
 
 # Please keep these build lists sorted!
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index ec9d11b57bef..e8a69e4b4836 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -155,6 +155,8 @@
 #define XEHP_SQCM				XE_REG_MCR(0x8724)
 #define   EN_32B_ACCESS				REG_BIT(30)
 
+#define GSCPSMI_BASE				XE_REG(0x880c)
+
 #define	MIRROR_FUSE3				XE_REG(0x9118)
 #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
 #define   L3BANK_PAIR_COUNT			4
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 79fbd74a3944..b23827534ab9 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -11,6 +11,8 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 
+#include "generated/xe_wa_oob.h"
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -19,6 +21,7 @@
 #include "xe_res_cursor.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_wa.h"
 
 struct xe_ttm_stolen_mgr {
 	struct xe_ttm_vram_mgr base;
@@ -112,6 +115,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
 static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_gt *media_gt = xe_device_get_root_tile(xe)->media_gt;
 	u32 stolen_size, wopcm_size;
 	u32 ggc, gms;
 
@@ -154,6 +158,26 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 
 	stolen_size -= wopcm_size;
 
+	if (XE_WA(media_gt, 14019821291)) {
+		u64 gscpsmi_base = xe_mmio_read64_2x32(media_gt, GSCPSMI_BASE);
+
+		/*
+		 * This workaround is primarily implemented by the BIOS.  We
+		 * just need to figure out whether the BIOS has applied the
+		 * workaround (meaning the programmed address falls within
+		 * the DSM) and, if so, reserve that part of the DSM to
+		 * prevent accidental reuse.  The DSM location should be just
+		 * below the WOPCM.
+		 */
+		if (gscpsmi_base >= mgr->io_base &&
+		    gscpsmi_base < mgr->io_base + stolen_size) {
+			xe_gt_dbg(media_gt,
+				  "Reserving %llu bytes of DSM for Wa_14019821291\n",
+				  mgr->io_base + stolen_size - gscpsmi_base);
+			stolen_size = gscpsmi_base - mgr->io_base;
+		}
+	}
+
 	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f3ff774dc4aa..752842d734be 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -19,3 +19,4 @@
 		SUBPLATFORM(DG2, G12)
 16017236439	PLATFORM(PVC)
 22010954014	PLATFORM(DG2)
+14019821291	MEDIA_VERSION_RANGE(1300, 2000)
-- 
2.40.1

