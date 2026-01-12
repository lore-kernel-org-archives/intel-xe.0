Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071AECF45C5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 18:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD9810E063;
	Mon, 12 Jan 2026 18:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qilly1qz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A429310E063
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768243049; x=1799779049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=46JSPcnY5nsfxJJ65sYOiUFA2sGEmvsto35D1BnFey4=;
 b=Qilly1qzvYyY1QcdnoxgvrS1mHCph1fc2dGAisNybTtGl5Me1Hh0SmR1
 9S+Kc1CXZlsz3/b8DEh4cbBHMxHaEBlYETA6BGUZdhbQlYRGK+fEzQinx
 hejMxp5dSOwGio5Ecn8n1QgozA1KTkw8Sy4jN5DALMY/4hTXVdSVHqDN3
 zh+HxC9Yb0WOQsmOZ5u2jQn+HuFMzW9smvcrtTzqsMtfiXbyaGUMTF8Oq
 3v/n+bQoHIwCbzY4GYJDcIGOn2AtcUiZ/QdJKxiTJGhMqUMemyw/iyjs8
 yRcZl/hpRZFQilDpJl0n2Ro+sWopbUxj0kZvBLS0wZzjw+DxgbNUWZHe4 Q==;
X-CSE-ConnectionGUID: 3rax01lAT9q1bsyLvHsogg==
X-CSE-MsgGUID: 6se2+Y/CSYWU+PfyM5ZDvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73366570"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="73366570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:37:28 -0800
X-CSE-ConnectionGUID: gC+3aIhMQa+1NqYQLLw4oQ==
X-CSE-MsgGUID: Sz8dI+K0TTGjcvDWxvLFsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="208996811"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:37:26 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH] drm/xe/mert: Improve handling of MERT CAT errors
Date: Mon, 12 Jan 2026 19:37:16 +0100
Message-ID: <20260112183716.28700-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

All MERT catastrophic errors but VF's LMTT fault are serious, so
we shouldn't limit our handling only to print debug messages.

Change CATERR message to error level and then declare the device
as wedged to match expectation from the design document. For the
LMTT faults, add a note about adding tracking of this unexpected
VF activity.

While at it, rename register fields defnitions to match the BSpec.
Also drop trailing include guard name from the regs.h file.

BSpec: 74625
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h | 10 +++---
 drivers/gpu/drm/xe/xe_mert.c           | 43 ++++++++++++++++++++------
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
index c345e11ceea8..99e5a26da657 100644
--- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -11,11 +11,13 @@
 #define MERT_LMEM_CFG				XE_REG(0x1448b0)
 
 #define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
-#define   MERT_TLB_CT_VFID_MASK			REG_GENMASK(16, 9)
-#define   MERT_TLB_CT_ERROR_MASK		REG_GENMASK(5, 0)
-#define     MERT_TLB_CT_LMTT_FAULT		0x05
+#define   CATERR_VFID				REG_GENMASK(16, 9)
+#define   CATERR_CODES				REG_GENMASK(5, 0)
+#define     CATERR_NO_ERROR			0x00
+#define     CATERR_UNMAPPED_GGTT		0x01
+#define     CATERR_LMTT_FAULT			0x05
 
 #define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
 #define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
 
-#endif /* _XE_MERT_REGS_H_ */
+#endif
diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index fc027d2d7a5e..f637df95418b 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -9,6 +9,7 @@
 #include "xe_device.h"
 #include "xe_mert.h"
 #include "xe_mmio.h"
+#include "xe_sriov_printk.h"
 #include "xe_tile.h"
 
 /**
@@ -55,6 +56,37 @@ int xe_mert_invalidate_lmtt(struct xe_device *xe)
 	return 0;
 }
 
+static void mert_handle_cat_error(struct xe_device *xe)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	u32 reg_val, vfid, code;
+
+	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT);
+	if (!reg_val)
+		return;
+	xe_mmio_write32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT, 0);
+
+	vfid = FIELD_GET(CATERR_VFID, reg_val);
+	code = FIELD_GET(CATERR_CODES, reg_val);
+
+	switch (code) {
+	case CATERR_NO_ERROR:
+		break;
+	case CATERR_UNMAPPED_GGTT:
+		xe_sriov_err(xe, "MERT: CAT_ERR: Access to an unmapped GGTT!\n");
+		xe_device_declare_wedged(xe);
+		break;
+	case CATERR_LMTT_FAULT:
+		xe_sriov_dbg(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
+		/* XXX: track/report malicious VF activity */
+		break;
+	default:
+		xe_sriov_err(xe, "MERT: Unexpected CAT_ERR code=%#x!\n", code);
+		xe_device_declare_wedged(xe);
+		break;
+	}
+}
+
 /**
  * xe_mert_irq_handler - Handler for MERT interrupts
  * @xe: the &xe_device
@@ -68,20 +100,11 @@ void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
 	struct xe_mert *mert = &tile->mert;
 	unsigned long flags;
 	u32 reg_val;
-	u8 err;
 
 	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
 		return;
 
-	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT);
-	xe_mmio_write32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT, 0);
-
-	err = FIELD_GET(MERT_TLB_CT_ERROR_MASK, reg_val);
-	if (err == MERT_TLB_CT_LMTT_FAULT)
-		drm_dbg(&xe->drm, "MERT catastrophic error: LMTT fault (VF%u)\n",
-			FIELD_GET(MERT_TLB_CT_VFID_MASK, reg_val));
-	else if (err)
-		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected fault (0x%x)\n", err);
+	mert_handle_cat_error(xe);
 
 	spin_lock_irqsave(&mert->lock, flags);
 	if (mert->tlb_inv_triggered) {
-- 
2.47.1

