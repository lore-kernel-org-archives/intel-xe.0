Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284BAC5AD4C
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 22:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF2010E781;
	Fri, 17 Nov 2023 22:52:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE8A10E77A
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700261535; x=1731797535;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cJYzL4X6s6ELlYzRaqWdp4/EEXoiUlKoHz8kCCyCyX0=;
 b=QTyjX++hWtvCfu1mEcvHm4e7uZR5JmQkZDCJ2Y0RjC2AN7zYulG6G44H
 Rpl0j0WPBNfVER4RXUMXG1Wi6aQFGTxBo5qHHcIKc60aUUjBKY1vt8rTg
 R/ksvYDWujySV7TlDCooRNzG+kJ/3TnUN4P5xdg0c8WYw3JSUyMC7X8BP
 lJ5/JUNAxjzN1O8GTIqSaMkb7N0qwLdfBdZwLDaZ8vk8RNtQZTPeBIjKv
 1wg3qwSqrK4RSuItSq4MQh1At3LjVARL8SdB51/GPJv4zgLn/FhXfjtBn
 gZJDKMj+xnPhlNs4VkRGcyFR2dPvRdkwEHZ3vVXrZtPp88d4hxCYD7IZb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4465547"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4465547"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 14:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765736120"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="765736120"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 14:52:14 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 14:51:48 -0800
Message-ID: <20231117225155.2614535-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
References: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 06/10] drm/xe/gsc: Implement WA 14015076503
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

When the GSC FW is loaded, we need to inform it when a GSCCS reset is
coming and then wait 200ms for it to get ready to process the reset.

v2: move WA code to GSC file, use variable in Makefile (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/Makefile           | 11 +++++++++-
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h | 10 +++++++++
 drivers/gpu/drm/xe/xe_gsc.c           | 29 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h           |  4 ++++
 drivers/gpu/drm/xe/xe_gt.c            |  5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 6 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e366366e8f38..395324a39d67 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -37,7 +37,16 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
 $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)
+uses_generated_oob := \
+	$(obj)/xe_gsc.o \
+	$(obj)/xe_guc.o \
+	$(obj)/xe_migrate.o \
+	$(obj)/xe_ring_ops.o \
+	$(obj)/xe_vm.o \
+	$(obj)/xe_wa.o \
+	$(obj)/xe_ttm_stolen_mgr.o
+
+$(uses_generated_oob): $(generated_oob)
 
 # Please keep these build lists sorted!
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 22d2ad9cb64d..9a84b55d66ee 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -16,6 +16,13 @@
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
 
+#define HECI_H_CSR(base)	XE_REG((base) + 0x4)
+#define   HECI_H_CSR_IE		REG_BIT(0)
+#define   HECI_H_CSR_IS		REG_BIT(1)
+#define   HECI_H_CSR_IG		REG_BIT(2)
+#define   HECI_H_CSR_RDY	REG_BIT(3)
+#define   HECI_H_CSR_RST	REG_BIT(4)
+
 /*
  * The FWSTS register values are FW defined and can be different between
  * HECI1 and HECI2
@@ -26,4 +33,7 @@
 #define   HECI1_FWSTS1_PROXY_STATE_NORMAL		5
 #define   HECI1_FWSTS1_INIT_COMPLETE			REG_BIT(9)
 
+#define HECI_H_GS1(base)	XE_REG((base) + 0xc4c)
+#define   HECI_H_GS1_ER_PREP	REG_BIT(0)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index cc9c6cdc31aa..0def7c1ae84d 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "generated/xe_wa_oob.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -17,6 +18,7 @@
 #include "xe_mmio.h"
 #include "xe_sched_job.h"
 #include "xe_uc_fw.h"
+#include "xe_wa.h"
 #include "instructions/xe_gsc_commands.h"
 #include "regs/xe_gsc_regs.h"
 
@@ -300,3 +302,30 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
 	if (xe_uc_fw_is_loadable(&gsc->fw) && gsc->wq)
 		flush_work(&gsc->work);
 }
+
+/*
+ * wa_14015076503: if the GSC FW is loaded, we need to alert it before doing a
+ * GSC engine reset by writing a notification bit in the GS1 register and then
+ * triggering an interrupt to GSC; from the interrupt it will take up to 200ms
+ * for the FW to get prepare for the reset, so we need to wait for that amount
+ * of time.
+ * After the reset is complete we need to then clear the GS1 register.
+ */
+void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
+{
+	u32 gs1_set = prep ? HECI_H_GS1_ER_PREP : 0;
+	u32 gs1_clr = prep ? 0 : HECI_H_GS1_ER_PREP;
+
+	/* WA only applies if the GSC is loaded */
+	if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
+		return;
+
+	xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE), gs1_clr, gs1_set);
+
+	if (prep) {
+		/* make sure the reset bit is clear when writing the CSR reg */
+		xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+			      HECI_H_CSR_RST, HECI_H_CSR_IG);
+		msleep(200);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index f870eddc77d4..bc1ef7f31ea2 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -8,9 +8,13 @@
 
 #include "xe_gsc_types.h"
 
+struct xe_gt;
+
 int xe_gsc_init(struct xe_gsc *gsc);
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
 void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
 void xe_gsc_load_start(struct xe_gsc *gsc);
 
+void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6c885dde5d59..e591e9c72604 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -21,6 +21,7 @@
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
+#include "xe_gsc.h"
 #include "xe_gt_clock.h"
 #include "xe_gt_idle_sysfs.h"
 #include "xe_gt_mcr.h"
@@ -512,12 +513,16 @@ static int do_gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	xe_gsc_wa_14015076503(gt, true);
+
 	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
 	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
 		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
 			  ERR_PTR(err));
 
+	xe_gsc_wa_14015076503(gt, false);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 752842d734be..c7b7d40b5d57 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -20,3 +20,4 @@
 16017236439	PLATFORM(PVC)
 22010954014	PLATFORM(DG2)
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
+14015076503	MEDIA_VERSION(1300)
-- 
2.41.0

