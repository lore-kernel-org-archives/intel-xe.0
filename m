Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2843FCD3436
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 22:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E082B10E3F1;
	Mon,  4 May 2026 22:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRFN9tGe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED82810E3F1;
 Mon,  4 May 2026 22:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777933585; x=1809469585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kKis4wOia3Y7LMA1Y6LRKN/sWwmPb8vEl/yEJq1Js7Y=;
 b=hRFN9tGeA32hpc2qAwe/FNnvxlP7VoD12wbriLpMJaRDs2TUjldablPM
 yBEO77X/uIoz+9j5cdbmDmzNJVHgVVBZm2KlCFifGiqIQOKcyCLu6gmuD
 1LVoTobBoMSLN7fG3wonLfi6G7BZLO94A43L3AQl3wQavDBKeLkCBbbbC
 kwYUm2qY/Q4BBgYuTj3Rdwmv4JyCtasS1ywv0HCCA6ForfQvppmh+44z+
 zp6gOWkP40Zt3+BHgBBsZcDdKaDDOZK2B2lzJbY60p4ZwW8mfpsw1Uhlh
 z2eIN95SofmnIGHwnqk8DD8/PXdYPjwSDggHPer1iM68tX7nk1rzGa2s3 A==;
X-CSE-ConnectionGUID: mnjawJz2SVKMJQbhaKvHsA==
X-CSE-MsgGUID: VZ76v9MjRuG+AQ0C++tnLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77820271"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="77820271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:26:24 -0700
X-CSE-ConnectionGUID: C4Q7QErGQ2+n4MMbEWGCMg==
X-CSE-MsgGUID: 4KW5aX7NQQWSRvZG/tOcGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235509337"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.157])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:26:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 1/6] drm/i915/irq: deduplicate dg1_de_irq_postinstall() and
 gen11_de_irq_postinstall()
Date: Tue,  5 May 2026 01:26:08 +0300
Message-ID: <6b37c63a0475ebeaca6ba37bc5f3a48bdcecf568.1777933454.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777933454.git.jani.nikula@intel.com>
References: <cover.1777933454.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

dg1_de_irq_postinstall() and gen11_de_irq_postinstall() are exactly the
same. Remove dg1_de_irq_postinstall() and call
gen11_de_irq_postinstall() instead.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 9 ---------
 drivers/gpu/drm/i915/display/intel_display_irq.h | 1 -
 drivers/gpu/drm/i915/i915_irq.c                  | 2 +-
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index b5bfdebc66ca..bf4b5e7b6011 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -2449,15 +2449,6 @@ void gen11_de_irq_postinstall(struct intel_display *display)
 	intel_de_write(display, GEN11_DISPLAY_INT_CTL, GEN11_DISPLAY_IRQ_ENABLE);
 }
 
-void dg1_de_irq_postinstall(struct intel_display *display)
-{
-	if (!HAS_DISPLAY(display))
-		return;
-
-	gen8_de_irq_postinstall(display);
-	intel_de_write(display, GEN11_DISPLAY_INT_CTL, GEN11_DISPLAY_IRQ_ENABLE);
-}
-
 struct intel_display_irq_funcs {
 	void (*reset)(struct intel_display *display);
 };
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.h b/drivers/gpu/drm/i915/display/intel_display_irq.h
index b25d180254d7..e2b1674fae06 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.h
@@ -71,7 +71,6 @@ void vlv_display_irq_postinstall(struct intel_display *display);
 void ilk_de_irq_postinstall(struct intel_display *display);
 void gen8_de_irq_postinstall(struct intel_display *display);
 void gen11_de_irq_postinstall(struct intel_display *display);
-void dg1_de_irq_postinstall(struct intel_display *display);
 
 u32 i915_pipestat_enable_mask(struct intel_display *display, enum pipe pipe);
 void i915_enable_pipestat(struct intel_display *display, enum pipe pipe, u32 status_mask);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index d4d8dd0a4174..ef9eadf38a53 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -778,7 +778,7 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
 
 	gen2_irq_init(uncore, GEN11_GU_MISC_IRQ_REGS, ~gu_misc_masked, gu_misc_masked);
 
-	dg1_de_irq_postinstall(display);
+	gen11_de_irq_postinstall(display);
 
 	dg1_master_intr_enable(intel_uncore_regs(uncore));
 	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
-- 
2.47.3

