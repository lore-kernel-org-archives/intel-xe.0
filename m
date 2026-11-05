Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62481606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 20:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X394aKVO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281FA10E429;
	Thu,  5 Nov 2026 20:34:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CEA10E429;
 Thu,  5 Nov 2026 20:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793910882; x=1825446882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vm7PrRop5ZpfRDLMqDs7wUiV2dDv2+SIAuOOCQsKagg=;
 b=X394aKVO2WtGFbLSAD0NE+0EOpFVkPgbfv5EM8z76LWxrJVxqtDxyRdc
 lIzqp622F1L6Nt+8nOHYdJg8oGCjx4lBnE5kZFAdN80lnouUsx4tq50xe
 NzAWhiqgrV281jzluW3rGyPbx1OliqFJTin6QfExMeFaO0ta/uIsMLUmc
 QFFu/3W16RuVKqPWnJsDcTiXpGzuJNratqAliva11AZaFt7ePGjwuc3yR
 JO0FduVtRi4M3Dl0FuZpFgdf3PSx/DCYMlJ32Qf6CLrkNRLSNMbNdhdJv
 tdC2SSW/TH77J00BInfCQ+fxnzJrI5L8AlTIbrT6SOXZ2RaKudkjrAR/m A==;
X-CSE-ConnectionGUID: ACtU3b4QTvK45WZBs9aQew==
X-CSE-MsgGUID: GNev9lhTQvWhe25o8HTELg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2723958"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2723958"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:42 -0800
X-CSE-ConnectionGUID: hGcKQAwwRr67yzEOEG8hTg==
X-CSE-MsgGUID: uSm+6bUGS3qRNcVB9xDopA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6984109"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:41 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/irq:
 s/gen11_gu_misc_irq_handler()/intel_display_gse_irq_handler()/
Date: Thu,  5 Nov 2026 22:34:24 +0200
Message-ID: <20261105203427.8696-3-ville.syrjala@linux.intel.com>
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

Now that gen11_gu_misc_irq_handler() just handles the GSE
interrupt let's rename it to intel_display_gse_irq_handler().

And now that it's our generic GSE irq handler let's also
call it for all the GSE interrupts signaled via actual
display interrupts as well. The old GMCH ASLE/BLC interrupts
I left calling intel_opregion_asle_intr() directly, just
because the naming there makes more sense that way.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 8 ++++----
 drivers/gpu/drm/i915/display/intel_display_irq.h | 2 +-
 drivers/gpu/drm/i915/i915_irq.c                  | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index af8d6737d36c..5430eb5245da 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -904,7 +904,7 @@ static void _ilk_display_irq_handler(struct intel_display *display, u32 de_iir)
 		intel_dp_aux_irq_handler(display);
 
 	if (de_iir & DE_GSE)
-		intel_opregion_asle_intr(display);
+		intel_display_gse_irq_handler(display);
 
 	if (de_iir & DE_POISON)
 		drm_err(display->drm, "Poison interrupt\n");
@@ -971,7 +971,7 @@ static void _ivb_display_irq_handler(struct intel_display *display, u32 de_iir)
 		intel_dp_aux_irq_handler(display);
 
 	if (de_iir & DE_GSE_IVB)
-		intel_opregion_asle_intr(display);
+		intel_display_gse_irq_handler(display);
 
 	for_each_pipe(display, pipe) {
 		if (de_iir & DE_PIPE_VBLANK_IVB(pipe))
@@ -1279,7 +1279,7 @@ gen8_de_misc_irq_handler(struct intel_display *display, u32 iir)
 			found = true;
 		}
 	} else if (iir & GEN8_DE_MISC_GSE) {
-		intel_opregion_asle_intr(display);
+		intel_display_gse_irq_handler(display);
 		found = true;
 	}
 
@@ -1587,7 +1587,7 @@ static bool gen8_display_irq_handler(struct intel_display *display,
 	return true;
 }
 
-void gen11_gu_misc_irq_handler(struct intel_display *display)
+void intel_display_gse_irq_handler(struct intel_display *display)
 {
 	intel_opregion_asle_intr(display);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index 00dfed88eab7..1fd11328a264 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -52,7 +52,7 @@ void bdw_disable_vblank(struct drm_crtc *crtc);
 void ilk_display_irq_master_disable(struct intel_display *display, u32 *de_ier, u32 *sde_ier);
 void ilk_display_irq_master_enable(struct intel_display *display, u32 de_ier, u32 sde_ier);
 
-void gen11_gu_misc_irq_handler(struct intel_display *display);
+void intel_display_gse_irq_handler(struct intel_display *display);
 
 struct intel_display_irq_state {
 	u32 master_ctl;
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 1d03ac90b7e2..12082167face 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -536,7 +536,7 @@ static irqreturn_t gen11_irq_handler(int irq, void *arg)
 	gen11_master_intr_enable(regs);
 
 	if (gu_misc_iir & GEN11_GU_MISC_GSE)
-		gen11_gu_misc_irq_handler(display);
+		intel_display_gse_irq_handler(display);
 
 	pmu_irq_stats(i915, IRQ_HANDLED);
 
@@ -604,7 +604,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	dg1_master_intr_enable(regs);
 
 	if (gu_misc_iir & GEN11_GU_MISC_GSE)
-		gen11_gu_misc_irq_handler(display);
+		intel_display_gse_irq_handler(display);
 
 	pmu_irq_stats(i915, IRQ_HANDLED);
 
-- 
2.56.0

