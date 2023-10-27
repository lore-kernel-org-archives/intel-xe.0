Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D5AC25B72
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C031410EA61;
	Fri, 27 Oct 2023 22:29:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F20910EA5E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445784; x=1729981784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9m5jiuPpcEaQcqiXY5RrefKEbhyRJFj+lPi8HGbjxhQ=;
 b=aQo8VlIp4KM8ziYBkz3nVFUNw7W4Up5mL0BFGoKRqbBWvbReqTYxC0We
 UEk5UdBlr0u4veJ3NJEXYe7orVcSpmgjr507rDFZJHILd/UNt58OdgEhp
 8hLXZ7t3tS2Aad5szkSlHM/NKvvJIEmF1xJWH81KHg4aYidTZn1MrO/GT
 PUtdpMco8z+7gT6Wmt9Mne7ZzlmKN1vTmGvySGJMTHtRNk4LewsZo2cMp
 2h9e8z1+iljFuVL+/v2DqRRPS25hcW55gpa/5btuS4SWlpU1rPcDJrhRQ
 bfS/1iznUH5CiddOHSrmcht8YgtpzkFvrlsEha6+LLL82Q8fBAYaIEYV4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397779"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397779"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360371"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360371"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:21 -0700
Message-ID: <20231027222928.1981633-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/12] drm/xe/gsc: Implement WA 14015076503
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |  2 +-
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h | 10 ++++++
 drivers/gpu/drm/xe/xe_gt.c            | 44 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 4 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 474b6044d054..4a442dcf4d79 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
 $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
+$(obj)/xe_gt.o $(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
 
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
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 73c090762771..0e8e24bded1c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -10,8 +10,10 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "generated/xe_wa_oob.h"
 #include "instructions/xe_gfxpipe_commands.h"
 #include "instructions/xe_mi_commands.h"
+#include "regs/xe_gsc_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
 #include "xe_bb.h"
@@ -504,16 +506,58 @@ int xe_gt_init(struct xe_gt *gt)
 	return 0;
 }
 
+static int gsc_fw_is_loaded(struct xe_gt *gt)
+{
+	return xe_mmio_read32(gt, HECI_FWSTS1(MTL_GSC_HECI1_BASE)) &
+			      HECI1_FWSTS1_INIT_COMPLETE;
+}
+
+static void wa_14015076503_start(struct xe_gt *gt)
+{
+	/* WA only applies if the GSC is loaded */
+	if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
+		return;
+
+	/*
+	 * wa_14015076503: if the GSC FW is loaded, we need to alert it that
+	 * we're going to do a GSC engine reset and then wait for 200ms for the
+	 * FW to get ready for it.
+	 */
+	xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE),
+		      0, HECI_H_GS1_ER_PREP);
+
+	/* make sure the reset bit is clear when writing the CSR reg */
+	xe_mmio_rmw32(gt, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+		      HECI_H_CSR_RST, HECI_H_CSR_IG);
+	msleep(200);
+
+	return;
+}
+
+static void
+wa_14015076503_end(struct xe_gt *gt)
+{
+	if (!XE_WA(gt, 14015076503))
+		return;
+
+	xe_mmio_rmw32(gt, HECI_H_GS1(MTL_GSC_HECI2_BASE),
+		      HECI_H_GS1_ER_PREP, 0);
+}
+
 static int do_gt_reset(struct xe_gt *gt)
 {
 	int err;
 
+	wa_14015076503_start(gt);
+
 	xe_mmio_write32(gt, GDRST, GRDOM_FULL);
 	err = xe_mmio_wait32(gt, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
 	if (err)
 		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
 			  ERR_PTR(err));
 
+	wa_14015076503_end(gt);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f3ff774dc4aa..132c35497f74 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -19,3 +19,4 @@
 		SUBPLATFORM(DG2, G12)
 16017236439	PLATFORM(PVC)
 22010954014	PLATFORM(DG2)
+14015076503	MEDIA_VERSION(1300)
-- 
2.41.0

