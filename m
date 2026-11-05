Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561D606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 20:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AkixFTCk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4518610F4C7;
	Thu,  5 Nov 2026 20:34:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FFF10F9B3;
 Thu,  5 Nov 2026 20:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793910887; x=1825446887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UbDZ1tvlNPoH+hQZQJgrcGRlvVhX9VtNLmijE7Ymx+o=;
 b=AkixFTCki6X1dW3I00Rw9iLPsgfjZu9CDpWwkcEgHTaLbyUwesk6nsAX
 zQ/KP7qWjxSYyIB3pFOyFQVkCXZVn1NdF1bNwwfcU+pddRgM8nFoprI5W
 ODpzQ/u0B1HK3+aTwSq//i4mTmFP6puncj0pjy+mvOJCGoFjmnbqx7oed
 v/navIqQ53SOkqDRAoubG98ze9we6C0wMxNCKJKObnL1hGNPGozGYeXRA
 fKZez8qMVdomN121rmUz8e+w0K4f61RrHFln1SPnrzLnKPWy5h3Jz3e9f
 Lbp2HNo2hSb2RzL6zQ203akR7KUwzXusEKet/+CX6PzfEbAN7haioX7P9 Q==;
X-CSE-ConnectionGUID: vlV/Wx5UQeKSMV/VDmFgjw==
X-CSE-MsgGUID: 4dJQG5m/S7e9ZlkyGYWZ7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2710490"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2710490"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:46 -0800
X-CSE-ConnectionGUID: DPI7dGTzRJWZyrLGm5bzaw==
X-CSE-MsgGUID: Etb93gzsS22LiPlU8jm7vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7090109"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:45 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915/irq: Extract gen11_gu_misc_irq_postinstall()
Date: Thu,  5 Nov 2026 22:34:25 +0200
Message-ID: <20261105203427.8696-4-ville.syrjala@linux.intel.com>
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

Both gen11 and dg1 duplicate the same code to set up the
GEN11_GU_MISC interrupts. Extract it to a shared helper.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 12082167face..823d97284d78 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -725,17 +725,26 @@ static void gen8_irq_postinstall(struct drm_i915_private *dev_priv)
 	gen8_master_intr_enable(intel_uncore_regs(&dev_priv->uncore));
 }
 
+static void gen11_gu_misc_irq_postinstall(struct drm_i915_private *dev_priv)
+{
+	struct intel_gt *gt = to_gt(dev_priv);
+	struct intel_uncore *uncore = gt->uncore;
+	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
+
+	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_masked);
+}
+
 static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
 {
 	struct intel_display *display = dev_priv->display;
 	struct intel_gt *gt = to_gt(dev_priv);
 	struct intel_uncore *uncore = gt->uncore;
-	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
 
 	gen11_gt_irq_postinstall(gt);
+
 	intel_display_irq_postinstall(display);
 
-	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_masked);
+	gen11_gu_misc_irq_postinstall(dev_priv);
 
 	gen11_master_intr_enable(intel_uncore_regs(uncore));
 	intel_uncore_posting_read(&dev_priv->uncore, GEN11_GFX_MSTR_IRQ);
@@ -745,14 +754,13 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 {
 	struct intel_display *display = dev_priv->display;
 	struct intel_uncore *uncore = &dev_priv->uncore;
-	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
 	struct intel_gt *gt;
 	unsigned int i;
 
 	for_each_gt(gt, dev_priv, i)
 		gen11_gt_irq_postinstall(gt);
 
-	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_masked);
+	gen11_gu_misc_irq_postinstall(dev_priv);
 
 	intel_display_irq_postinstall(display);
 
-- 
2.56.0

