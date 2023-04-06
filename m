Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27799C76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 09:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CC010EB46;
	Thu,  6 Apr 2023 09:19:45 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F194010EB46
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680772784; x=1712308784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R847HsQTw4zibPJxkekTPaK5HG2wDFbP0tV3meJNQuE=;
 b=L1JpDkSM8LXIURpERQD0VtsUvdqw16hNcNsj8CyUFdySQC8nzzwUCSI0
 H7WmU0HLl4ZTvxX92Gx7dNsE0/dllMp2Yn+feTNNmcRaZE1L1eq7jO0G0
 VhyB8vuo7SYNLNDi8Yc1eCVKONQzsWiiuNEXRtLeV5nPkacy6c7Tkt9Rm
 sADBHc70BF2/zSr37u5D4JkXpwKwVFIJEzgGSelyLJqV0OFlAYsiErPkf
 9jOMiasyT0p4Cz9IVZRDKzhPL2n2fNY2V6+lhb9VwoM6Ara+pALzXhlVh
 KBpU9p9QNXH+0IaCD/+PjR4zUFn86a4unP82g5If6btdBItijMSpJuaLJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322341901"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322341901"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 02:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680598093"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="680598093"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2023 02:19:39 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 14:52:20 +0530
Message-Id: <20230406092223.2819951-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406092223.2819951-1-himal.prasad.ghimiray@intel.com>
References: <20230406092223.2819951-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Handle GRF/IC ECC error irq
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
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Fernando Pacheco <fernando.pacheco@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The error detection and correction capability
for GRF and instruction cache (IC) will utilize
the new interrupt and error handling infrastructure
for dgfx products. The GFX device can generate
a number of classes of error under the new
infrastructure: correctable, non-fatal, and
fatal errors.

The non-fatal and fatal error classes distinguish
between levels of severity for uncorrectable errors.
All ECC uncorrectable errors will be reported as
fatal to produce the desired system response. Fatal
errors are expected to route as PCIe error messages
which should result in OS issuing a GFX device FLR.
But the option exists to route fatal errors as
interrupts.

Driver will only handle logging of errors. Anything
more will be handled at system level.

For errors that will route as interrupts, three
bits in the Master Interrupt Register will be used
to convey the class of error.

For each class of error:
1. Determine source of error (IP block) by reading
   the Device Error Source Register (RW1C) that
   corresponds to the class of error being serviced.
2. If the generating IP block is GT, read and log the
   GT Error Register (RW1C) that corresponds to the
   class of error being serviced. Non-GT errors will
   be logged in aggregate for now.

Bspec: 50875

Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Original-author: Fernando Pacheco
---
 drivers/gpu/drm/xe/regs/xe_regs.h |  29 ++++++++
 drivers/gpu/drm/xe/xe_irq.c       | 108 ++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index c1c829c23df1..dff74b093d4e 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -92,6 +92,10 @@
 #define   GEN11_GU_MISC_IRQ			(1 << 29)
 #define   GEN11_DISPLAY_IRQ			(1 << 16)
 #define   GEN11_GT_DW_IRQ(x)			(1 << (x))
+#define   XE_FATAL_ERROR_IRQ                 REG_BIT(28)
+#define   XE_NON_FATAL_ERROR_IRQ             REG_BIT(27)
+#define   XE_CORRECTABLE_ERROR_IRQ           REG_BIT(26)
+#define   XE_ERROR_IRQ(x)                    REG_BIT(26 + (x))
 
 #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
 #define   DG1_MSTR_IRQ				REG_BIT(31)
@@ -111,4 +115,29 @@
 #define GEN12_DSMBASE				_MMIO(0x1080C0)
 #define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
 
+enum hardware_error {
+	HARDWARE_ERROR_CORRECTABLE = 0,
+	HARDWARE_ERROR_NONFATAL = 1,
+	HARDWARE_ERROR_FATAL = 2,
+	HARDWARE_ERROR_MAX,
+};
+
+#define _DEV_ERR_STAT_FATAL             0x100174
+#define _DEV_ERR_STAT_NONFATAL          0x100178
+#define _DEV_ERR_STAT_CORRECTABLE       0x10017c
+#define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
+						_DEV_ERR_STAT_CORRECTABLE, \
+						_DEV_ERR_STAT_NONFATAL))
+#define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
+
+#define _ERR_STAT_GT_COR                0x100160
+#define _ERR_STAT_GT_NONFATAL           0x100164
+#define _ERR_STAT_GT_FATAL              0x100168
+#define ERR_STAT_GT_REG(x)              _MMIO(_PICK_EVEN((x), \
+						_ERR_STAT_GT_COR, \
+						_ERR_STAT_GT_NONFATAL))
+
+#define  EU_GRF_ERROR                   REG_BIT(15)
+#define  EU_IC_ERROR                    REG_BIT(14)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 529b42d9c9af..6b922332bff1 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -344,6 +344,113 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
 		dg1_intr_enable(xe, true);
 }
 
+static const char *
+hardware_error_type_to_str(const enum hardware_error hw_err)
+{
+	switch (hw_err) {
+	case HARDWARE_ERROR_CORRECTABLE:
+		return "CORRECTABLE";
+	case HARDWARE_ERROR_NONFATAL:
+		return "NONFATAL";
+	case HARDWARE_ERROR_FATAL:
+		return "FATAL";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static void
+xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	u32 other_errors = ~(EU_GRF_ERROR | EU_IC_ERROR);
+	u32 errstat;
+
+	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
+
+	errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
+
+	if (unlikely(!errstat)) {
+		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
+		return;
+	}
+
+	/*
+	 * TODO: The GT Non Fatal Error Status Register
+	 * only has reserved bitfields defined.
+	 * Remove once there is something to service.
+	 */
+	if (hw_err == HARDWARE_ERROR_NONFATAL) {
+		DRM_ERROR("detected Non-Fatal error\n");
+		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
+		return;
+	}
+
+	/*
+	 * TODO: The remaining GT errors don't have a
+	 * need for targeted logging at the moment. We
+	 * still want to log detection of these errors, but
+	 * let's aggregate them until someone has a need for them.
+	 */
+	if (errstat & other_errors)
+		DRM_ERROR("detected hardware error(s) in ERR_STAT_GT_REG_%s: 0x%08x\n",
+			  hw_err_str, errstat & other_errors);
+
+	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
+}
+
+static void
+xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
+{
+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
+	unsigned long flags;
+	u32 errsrc;
+
+	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
+	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
+	if (unlikely(!errsrc)) {
+		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
+		goto out_unlock;
+	}
+
+	if (errsrc & DEV_ERR_STAT_GT_ERROR)
+		xe_gt_hw_error_handler(gt, hw_err);
+
+	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
+		DRM_ERROR("non-GT hardware error(s) in DEV_ERR_STAT_REG_%s: 0x%08x\n",
+			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
+
+	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
+
+out_unlock:
+	spin_unlock_irqrestore(&gt_to_xe(gt)->irq.lock, flags);
+}
+
+/*
+ * XE Platforms adds three Error bits to the Master Interrupt
+ * Register to support dgfx card error handling.
+ * These three bits are used to convey the class of error:
+ * FATAL, NONFATAL, or CORRECTABLE.
+ *
+ * To process an interrupt:
+ *      1. Determine source of error (IP block) by reading
+ *	 the Device Error Source Register (RW1C) that
+ *	 corresponds to the class of error being serviced.
+ *      2. For GT as the generating IP block, read and log
+ *	 the GT Error Register (RW1C) that corresponds to
+ *	 the class of error being serviced.
+ */
+static void
+xe_hw_error_irq_handler(struct xe_gt *gt, const u32 master_ctl)
+{
+	enum hardware_error hw_err;
+
+	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
+		if (master_ctl & XE_ERROR_IRQ(hw_err))
+			xe_hw_error_source_handler(gt, hw_err);
+	}
+}
+
 static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
 	struct xe_device *xe = arg;
@@ -382,6 +489,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 		if (!xe_gt_is_media_type(gt))
 			xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
 		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
+		xe_hw_error_irq_handler(gt, master_ctl);
 	}
 
 	xe_display_irq_handler(xe, master_ctl);
-- 
2.25.1

