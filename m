Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758BC606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OJGpXD4E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CCF10E378;
	Thu,  5 Nov 2026 20:34:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C6A10E33C;
 Thu,  5 Nov 2026 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793910878; x=1825446878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I3JVR+34XMTNViQQKyi9CauY56JK0XAf7Ry65LHx27g=;
 b=OJGpXD4E87jWhKPVUscf4PckBJrw45sidQ/JDy69rkxtHMSruNCLPd4O
 /7fIgdC26P0vwJGYzKCvTa5t4ArFpbKC3G9eNt4lgDuE80bC0madm/z+h
 7bb0vQG8LBiMCKLdQxowxAiRqoBhWyqEe8A/cn9gpQWpeaWv9MO211xE3
 k8Nfnwpl1/A6xme/Ep60a2DQ353DC4SSRsCXGTFFCLgWcC+/7iX8UDvFB
 uXW59Taj0kYoTigjrKJcSR3z+KlIT6LrYLcc4BMItFC5AKkUe2/AoiZeH
 HgXc5L+rEolp4KADiaJmbrUFwHqrQGr3HnnkBazt7efG7XtYU/7pNolRC Q==;
X-CSE-ConnectionGUID: npE89lY0Q4qgLP/XWCGwrw==
X-CSE-MsgGUID: y5sYwKGSTwyuRJROS8KGcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2723956"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2723956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:37 -0800
X-CSE-ConnectionGUID: HTDR+1d1TiedO4F0EtXNMA==
X-CSE-MsgGUID: 5VQYyrq9RduixtJOCxKdsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6984089"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/irq: Relocate gen11_gu_misc_irq_ack()
Date: Thu,  5 Nov 2026 22:34:23 +0200
Message-ID: <20261105203427.8696-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
References: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The Gunit misc interrupts (GEN11_GU_MISC_*) aren't a display thing.
Currently the irq ack/handler live in intel_display_irq.c, whereas
the irq reset/postingstall lives in i915_irq.c.

gen11_gu_misc_irq_ack() belongs with its reset/postinstall
counterparts in i915_irq.c, so move it there. The handler we'll
leave in the display code.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 23 ++---------------
 .../gpu/drm/i915/display/intel_display_irq.h  |  3 +--
 drivers/gpu/drm/i915/i915_irq.c               | 25 ++++++++++++++++---
 3 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index b8d7e8de4ee8..af8d6737d36c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1587,28 +1587,9 @@ static bool gen8_display_irq_handler(struct intel_display *display,
 	return true;
 }
 
-u32 gen11_gu_misc_irq_ack(struct intel_display *display, const u32 master_ctl)
+void gen11_gu_misc_irq_handler(struct intel_display *display)
 {
-	u32 iir;
-
-	if (!(master_ctl & GEN11_GU_MISC_IRQ))
-		return 0;
-
-	intel_display_rpm_assert_block(display);
-
-	iir = intel_de_read_fw(display, GEN11_GU_MISC_IIR);
-	if (likely(iir))
-		intel_de_write_fw(display, GEN11_GU_MISC_IIR, iir);
-
-	intel_display_rpm_assert_unblock(display);
-
-	return iir;
-}
-
-void gen11_gu_misc_irq_handler(struct intel_display *display, const u32 iir)
-{
-	if (iir & GEN11_GU_MISC_GSE)
-		intel_opregion_asle_intr(display);
+	intel_opregion_asle_intr(display);
 }
 
 static bool gen11_display_irq_handler(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index 84446bf53401..00dfed88eab7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -52,8 +52,7 @@ void bdw_disable_vblank(struct drm_crtc *crtc);
 void ilk_display_irq_master_disable(struct intel_display *display, u32 *de_ier, u32 *sde_ier);
 void ilk_display_irq_master_enable(struct intel_display *display, u32 de_ier, u32 sde_ier);
 
-u32 gen11_gu_misc_irq_ack(struct intel_display *display, const u32 master_ctl);
-void gen11_gu_misc_irq_handler(struct intel_display *display, const u32 iir);
+void gen11_gu_misc_irq_handler(struct intel_display *display);
 
 struct intel_display_irq_state {
 	u32 master_ctl;
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 932409b943ad..1d03ac90b7e2 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -491,6 +491,21 @@ static inline void gen11_master_intr_enable(void __iomem * const regs)
 	raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, GEN11_MASTER_IRQ);
 }
 
+static u32 gen11_gu_misc_irq_ack(void __iomem * const regs,
+				 u32 master_ctl)
+{
+	u32 iir;
+
+	if (!(master_ctl & GEN11_GU_MISC_IRQ))
+		return 0;
+
+	iir = raw_reg_read(regs, GEN11_GU_MISC_IIR);
+	if (likely(iir))
+		raw_reg_write(regs, GEN11_GU_MISC_IIR, iir);
+
+	return iir;
+}
+
 static irqreturn_t gen11_irq_handler(int irq, void *arg)
 {
 	struct drm_i915_private *i915 = arg;
@@ -516,11 +531,12 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	if (master_ctl & GEN11_DISPLAY_IRQ)
 		intel_display_irq_handler(display, NULL);
 
-	gu_misc_iir = gen11_gu_misc_irq_ack(display, master_ctl);
+	gu_misc_iir = gen11_gu_misc_irq_ack(regs, master_ctl);
 
 	gen11_master_intr_enable(regs);
 
-	gen11_gu_misc_irq_handler(display, gu_misc_iir);
+	if (gu_misc_iir & GEN11_GU_MISC_GSE)
+		gen11_gu_misc_irq_handler(display);
 
 	pmu_irq_stats(i915, IRQ_HANDLED);
 
@@ -583,11 +599,12 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	if (master_ctl & GEN11_DISPLAY_IRQ)
 		intel_display_irq_handler(display, NULL);
 
-	gu_misc_iir = gen11_gu_misc_irq_ack(display, master_ctl);
+	gu_misc_iir = gen11_gu_misc_irq_ack(regs, master_ctl);
 
 	dg1_master_intr_enable(regs);
 
-	gen11_gu_misc_irq_handler(display, gu_misc_iir);
+	if (gu_misc_iir & GEN11_GU_MISC_GSE)
+		gen11_gu_misc_irq_handler(display);
 
 	pmu_irq_stats(i915, IRQ_HANDLED);
 
-- 
2.56.0

