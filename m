Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE129C46CD8
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38E710E37F;
	Mon, 18 Dec 2023 19:01:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C7410E3C2
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926048; x=1734462048;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XBntlVls0WMfwvISPU4j0IzPL1+tVvj6NuekA1KINnY=;
 b=P8AIu3UYmuVuFMaYsVy6ID//U/GvRnVQdNdSIrU3NnQfJ28mLgswlrJE
 +TGTv/G4WF9yI07lStUZg3FVhfULky3lxBcXmzFdQO5M5uE57HDQCLaQj
 8/pwSRJjSoNWeq9CjQTri3b/IrhjOOZ2r1znKDm4GaDuK3Bf5ZVNhn3IN
 X3zNAL+Iv3ClBOCqZgtkjvOpmbPX5jT0WDg0YXXsi6pu/saYM7J9YdNij
 VKosepCcy81efruqXkNPWJIoKKftbGrJbwomrFjN7vwnzuJr63fw4bgPL
 e1blN75v9ueho2+bSkQD3jiapxvV3XrFyZAkSdMJlxxMf6E2CVOS6+Sog w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984344"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984344"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157449"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157449"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:54:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 10/10] drm/xe/vf: Add VF specific interrupt handler
Date: Mon, 18 Dec 2023 17:53:44 +0100
Message-Id: <20231218165344.458-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218165344.458-1-michal.wajdeczko@intel.com>
References: <20231218165344.458-1-michal.wajdeczko@intel.com>
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

There are small differences in handling of the register based
interrupts on the VF driver as some registers are not accessible
to the VF driver. Additionally VFs must support Memory Based
Interrupts. Add VF specific interrupt handler for this.

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231214185955.1791-11-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 71 +++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index d1f5ba4bb745..907c8ff0fa21 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -17,7 +17,9 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
+#include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 
 /*
  * Interrupt registers for a unit are always consecutive and ordered
@@ -498,6 +500,9 @@ static void xelp_irq_reset(struct xe_tile *tile)
 
 	gt_irq_reset(tile);
 
+	if (IS_SRIOV_VF(tile_to_xe(tile)))
+		return;
+
 	mask_and_disable(tile, PCU_IRQ_OFFSET);
 }
 
@@ -508,6 +513,9 @@ static void dg1_irq_reset(struct xe_tile *tile)
 
 	gt_irq_reset(tile);
 
+	if (IS_SRIOV_VF(tile_to_xe(tile)))
+		return;
+
 	mask_and_disable(tile, PCU_IRQ_OFFSET);
 }
 
@@ -518,11 +526,34 @@ static void dg1_irq_reset_mstr(struct xe_tile *tile)
 	xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
 }
 
+static void vf_irq_reset(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	if (GRAPHICS_VERx100(xe) < 1210)
+		xelp_intr_disable(xe);
+	else
+		xe_assert(xe, xe_device_has_memirq(xe));
+
+	for_each_tile(tile, xe, id) {
+		if (xe_device_has_memirq(xe))
+			xe_memirq_reset(&tile->sriov.vf.memirq);
+		else
+			gt_irq_reset(tile);
+	}
+}
+
 static void xe_irq_reset(struct xe_device *xe)
 {
 	struct xe_tile *tile;
 	u8 id;
 
+	if (IS_SRIOV_VF(xe))
+		return vf_irq_reset(xe);
+
 	for_each_tile(tile, xe, id) {
 		if (GRAPHICS_VERx100(xe) >= 1210)
 			dg1_irq_reset(tile);
@@ -545,8 +576,26 @@ static void xe_irq_reset(struct xe_device *xe)
 	}
 }
 
+static void vf_irq_postinstall(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+
+	for_each_tile(tile, xe, id)
+		if (xe_device_has_memirq(xe))
+			xe_memirq_postinstall(&tile->sriov.vf.memirq);
+
+	if (GRAPHICS_VERx100(xe) < 1210)
+		xelp_intr_enable(xe, true);
+	else
+		xe_assert(xe, xe_device_has_memirq(xe));
+}
+
 static void xe_irq_postinstall(struct xe_device *xe)
 {
+	if (IS_SRIOV_VF(xe))
+		return vf_irq_postinstall(xe);
+
 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
 
 	/*
@@ -563,8 +612,30 @@ static void xe_irq_postinstall(struct xe_device *xe)
 		xelp_intr_enable(xe, true);
 }
 
+static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	unsigned int id;
+
+	spin_lock(&xe->irq.lock);
+	if (!xe->irq.enabled) {
+		spin_unlock(&xe->irq.lock);
+		return IRQ_NONE;
+	}
+	spin_unlock(&xe->irq.lock);
+
+	for_each_tile(tile, xe, id)
+		xe_memirq_handler(&tile->sriov.vf.memirq);
+
+	return IRQ_HANDLED;
+}
+
 static irq_handler_t xe_irq_handler(struct xe_device *xe)
 {
+	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
+		return vf_mem_irq_handler;
+
 	if (GRAPHICS_VERx100(xe) >= 1210)
 		return dg1_irq_handler;
 	else
-- 
2.25.1

