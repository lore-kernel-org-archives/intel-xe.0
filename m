Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F09EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 10:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409AE10E2DD;
	Tue, 27 Jun 2023 10:22:51 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99BC10E2DD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 10:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687861369; x=1719397369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hP8FnaczWGE3M9fcKDQFgv+zpikdysjO2M0LfPErJlk=;
 b=aaZpvRB7SqloVEJWcZZZseYlu7lAuNnfN2WNSJLZBwIIYF8LYGOjJiCs
 T8UB4I44bny3HqKiQIywUyWpwG2RDyghosQ4beAPznLtv7yHYCpLpnMsR
 WzMZ1zrF44wPK1xW69GwYBYlu1Iorvx8GVMmH+emVV+JRicnGxiajxuy/
 NClvqx8pxaI30V3gNIMVNbfIeQXt8IQfkPbYEobzFpcc8WGZ45r4q/ord
 gKjnDgD3v76C0x0FJezupaoYlODT53auKAE4RRKWBUDSjc4CzeSwrtrBN
 9aUGjJGaWFqe1RyZOOjwAxbt4F4uvoCWY9IUzfbjDG4B84F+x6nr2i62Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="346295384"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="346295384"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 03:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="746146038"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="746146038"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 03:22:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 13:22:19 +0300
Message-Id: <20230627102223.260893-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627102223.260893-1-jani.nikula@intel.com>
References: <20230627102223.260893-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] drm/i915/uncore: add intel_uncore_regs()
 helper
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a helper for accessing uncore->regs instead of doing it
directly. This will help display code reuse with the xe driver.

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230627095128.208071-1-jani.nikula@intel.com
---
 .../gpu/drm/i915/display/intel_display_irq.c  |  4 ++--
 .../drm/i915/gt/intel_execlists_submission.c  |  6 +++---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  8 ++++----
 drivers/gpu/drm/i915/gt/intel_sa_media.c      |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               | 20 +++++++++----------
 drivers/gpu/drm/i915/intel_uncore.h           |  5 +++++
 drivers/gpu/drm/i915/selftests/intel_uncore.c |  2 +-
 7 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 3b2a287d2041..67c8107f9409 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1119,7 +1119,7 @@ void gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 
 u32 gen11_gu_misc_irq_ack(struct drm_i915_private *i915, const u32 master_ctl)
 {
-	void __iomem * const regs = i915->uncore.regs;
+	void __iomem * const regs = intel_uncore_regs(&i915->uncore);
 	u32 iir;
 
 	if (!(master_ctl & GEN11_GU_MISC_IRQ))
@@ -1140,7 +1140,7 @@ void gen11_gu_misc_irq_handler(struct drm_i915_private *i915, const u32 iir)
 
 void gen11_display_irq_handler(struct drm_i915_private *i915)
 {
-	void __iomem * const regs = i915->uncore.regs;
+	void __iomem * const regs = intel_uncore_regs(&i915->uncore);
 	const u32 disp_ctl = raw_reg_read(regs, GEN11_DISPLAY_INT_CTL);
 
 	disable_rpm_wakeref_asserts(&i915->runtime_pm);
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 750326434677..484e9683e494 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3555,16 +3555,16 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 	lrc_init_wa_ctx(engine);
 
 	if (HAS_LOGICAL_RING_ELSQ(i915)) {
-		execlists->submit_reg = uncore->regs +
+		execlists->submit_reg = intel_uncore_regs(uncore) +
 			i915_mmio_reg_offset(RING_EXECLIST_SQ_CONTENTS(base));
-		execlists->ctrl_reg = uncore->regs +
+		execlists->ctrl_reg = intel_uncore_regs(uncore) +
 			i915_mmio_reg_offset(RING_EXECLIST_CONTROL(base));
 
 		engine->fw_domain = intel_uncore_forcewake_for_reg(engine->uncore,
 				    RING_EXECLIST_CONTROL(engine->mmio_base),
 				    FW_REG_WRITE);
 	} else {
-		execlists->submit_reg = uncore->regs +
+		execlists->submit_reg = intel_uncore_regs(uncore) +
 			i915_mmio_reg_offset(RING_ELSP(base));
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index c0f3ff4746ad..d1fea0b0159e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -30,7 +30,7 @@ static u32
 gen11_gt_engine_identity(struct intel_gt *gt,
 			 const unsigned int bank, const unsigned int bit)
 {
-	void __iomem * const regs = gt->uncore->regs;
+	void __iomem * const regs = intel_uncore_regs(gt->uncore);
 	u32 timeout_ts;
 	u32 ident;
 
@@ -141,7 +141,7 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
 static void
 gen11_gt_bank_handler(struct intel_gt *gt, const unsigned int bank)
 {
-	void __iomem * const regs = gt->uncore->regs;
+	void __iomem * const regs = intel_uncore_regs(gt->uncore);
 	unsigned long intr_dw;
 	unsigned int bit;
 
@@ -176,7 +176,7 @@ void gen11_gt_irq_handler(struct intel_gt *gt, const u32 master_ctl)
 bool gen11_gt_reset_one_iir(struct intel_gt *gt,
 			    const unsigned int bank, const unsigned int bit)
 {
-	void __iomem * const regs = gt->uncore->regs;
+	void __iomem * const regs = intel_uncore_regs(gt->uncore);
 	u32 dw;
 
 	lockdep_assert_held(gt->irq_lock);
@@ -387,7 +387,7 @@ void gen6_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
 
 void gen8_gt_irq_handler(struct intel_gt *gt, u32 master_ctl)
 {
-	void __iomem * const regs = gt->uncore->regs;
+	void __iomem * const regs = intel_uncore_regs(gt->uncore);
 	u32 iir;
 
 	if (master_ctl & (GEN8_GT_RCS_IRQ | GEN8_GT_BCS_IRQ)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
index e8f3d18c12b8..8c1dbcbcbc4f 100644
--- a/drivers/gpu/drm/i915/gt/intel_sa_media.c
+++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
@@ -29,7 +29,7 @@ int intel_sa_mediagt_setup(struct intel_gt *gt, phys_addr_t phys_addr,
 	 * Standalone media shares the general MMIO space with the primary
 	 * GT.  We'll re-use the primary GT's mapping.
 	 */
-	uncore->regs = i915->uncore.regs;
+	uncore->regs = intel_uncore_regs(&i915->uncore);
 	if (drm_WARN_ON(&i915->drm, uncore->regs == NULL))
 		return -EIO;
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 82fbabcdd7a5..512fc0ef94a4 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -423,7 +423,7 @@ static irqreturn_t cherryview_irq_handler(int irq, void *arg)
 static irqreturn_t ilk_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private *i915 = arg;
-	void __iomem * const regs = i915->uncore.regs;
+	void __iomem * const regs = intel_uncore_regs(&i915->uncore);
 	u32 de_iir, gt_iir, de_ier, sde_ier = 0;
 	irqreturn_t ret = IRQ_NONE;
 
@@ -511,7 +511,7 @@ static inline void gen8_master_intr_enable(void __iomem * const regs)
 static irqreturn_t gen8_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private *dev_priv = arg;
-	void __iomem * const regs = dev_priv->uncore.regs;
+	void __iomem * const regs = intel_uncore_regs(&dev_priv->uncore);
 	u32 master_ctl;
 
 	if (!intel_irqs_enabled(dev_priv))
@@ -561,7 +561,7 @@ static inline void gen11_master_intr_enable(void __iomem * const regs)
 static irqreturn_t gen11_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private *i915 = arg;
-	void __iomem * const regs = i915->uncore.regs;
+	void __iomem * const regs = intel_uncore_regs(&i915->uncore);
 	struct intel_gt *gt = to_gt(i915);
 	u32 master_ctl;
 	u32 gu_misc_iir;
@@ -619,7 +619,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private * const i915 = arg;
 	struct intel_gt *gt = to_gt(i915);
-	void __iomem * const regs = gt->uncore->regs;
+	void __iomem * const regs = intel_uncore_regs(gt->uncore);
 	u32 master_tile_ctl, master_ctl;
 	u32 gu_misc_iir;
 
@@ -711,7 +711,7 @@ static void gen8_irq_reset(struct drm_i915_private *dev_priv)
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
-	gen8_master_intr_disable(uncore->regs);
+	gen8_master_intr_disable(intel_uncore_regs(uncore));
 
 	gen8_gt_irq_reset(to_gt(dev_priv));
 	gen8_display_irq_reset(dev_priv);
@@ -727,7 +727,7 @@ static void gen11_irq_reset(struct drm_i915_private *dev_priv)
 	struct intel_gt *gt = to_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
 
-	gen11_master_intr_disable(dev_priv->uncore.regs);
+	gen11_master_intr_disable(intel_uncore_regs(&dev_priv->uncore));
 
 	gen11_gt_irq_reset(gt);
 	gen11_display_irq_reset(dev_priv);
@@ -742,7 +742,7 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
 	struct intel_gt *gt;
 	unsigned int i;
 
-	dg1_master_intr_disable(dev_priv->uncore.regs);
+	dg1_master_intr_disable(intel_uncore_regs(&dev_priv->uncore));
 
 	for_each_gt(gt, dev_priv, i)
 		gen11_gt_irq_reset(gt);
@@ -836,7 +836,7 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
 	gen8_gt_irq_postinstall(to_gt(dev_priv));
 	gen8_de_irq_postinstall(dev_priv);
 
-	gen8_master_intr_enable(dev_priv->uncore.regs);
+	gen8_master_intr_enable(intel_uncore_regs(&dev_priv->uncore));
 }
 
 static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
@@ -853,7 +853,7 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 
 	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
 
-	gen11_master_intr_enable(uncore->regs);
+	gen11_master_intr_enable(intel_uncore_regs(uncore));
 	intel_uncore_posting_read(&dev_priv->uncore, GEN11_GFX_MSTR_IRQ);
 }
 
@@ -880,7 +880,7 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 				   GEN11_DISPLAY_IRQ_ENABLE);
 	}
 
-	dg1_master_intr_enable(uncore->regs);
+	dg1_master_intr_enable(intel_uncore_regs(uncore));
 	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
 }
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 9ea1f4864a3a..f419c311a0de 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -496,6 +496,11 @@ static inline int intel_uncore_write_and_verify(struct intel_uncore *uncore,
 	return (reg_val & mask) != expected_val ? -EINVAL : 0;
 }
 
+static inline void __iomem *intel_uncore_regs(struct intel_uncore *uncore)
+{
+	return uncore->regs;
+}
+
 /*
  * The raw_reg_{read,write} macros are intended as a micro-optimization for
  * interrupt handlers so that the pointer indirection on uncore->regs can
diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c b/drivers/gpu/drm/i915/selftests/intel_uncore.c
index e4281508d580..03ea75cd84dd 100644
--- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
+++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
@@ -210,7 +210,7 @@ static int live_forcewake_ops(void *arg)
 
 	for_each_engine(engine, gt, id) {
 		i915_reg_t mmio = _MMIO(engine->mmio_base + r->offset);
-		u32 __iomem *reg = uncore->regs + engine->mmio_base + r->offset;
+		u32 __iomem *reg = intel_uncore_regs(uncore) + engine->mmio_base + r->offset;
 		enum forcewake_domains fw_domains;
 		u32 val;
 
-- 
2.39.2

