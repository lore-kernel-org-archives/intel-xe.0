Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE7ACD4851
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 16:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DC910EF4C;
	Wed, 13 May 2026 16:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYxg9wTx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FD710EF27;
 Wed, 13 May 2026 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778688821; x=1810224821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LDydVRaEM958IHJLPLMwXA734tpeLHIczm9ZN/7UYOQ=;
 b=jYxg9wTxQXhjrXK3j/gV4UuXJMZDtvW3TgHdvJrbWDkArGwwsrdKSVHE
 VzzT3eH9jHsw5qgI5NvGnoTWv3bRk7hNVAhl6t7hj/nzdoPXV7vzRIMk+
 ah7ZsAmkB/c+pv6aue3ah2BBA8CmfpCSf70BVtjQOR3Zt3mzaMJ/zSuBb
 IPKJtFq3OEHcwHkWgFQfaZlHyum79vnLm7HjvmA9BpteIzROn4/quF5hp
 TJrRldQj/+3Q9qKGTHtGfcWrqzQczVgjBfh2I/3VI1DFpEZ7OQMUMwzOv
 igkCkI41pCeskEWouC6gnGZutD1mWifK+J8gf+IlqQCTl9NtCsQ0UML+q w==;
X-CSE-ConnectionGUID: EvX38bfKTOSQR48Cx+LSOg==
X-CSE-MsgGUID: YLQScPb8RVOpTlUwAmWaow==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79517151"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79517151"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 09:13:40 -0700
X-CSE-ConnectionGUID: dTyhBY22SmuwofxvQk6/Ag==
X-CSE-MsgGUID: GjuJEcqUSXWo7krpPv8XWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="261631655"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.124])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 09:13:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 1/8] drm/i915/irq: deduplicate dg1_de_irq_postinstall() and
 gen11_de_irq_postinstall()
Date: Wed, 13 May 2026 19:13:24 +0300
Message-ID: <bbbec68fe398175b1609049771810fb6a8b7b7e6.1778688699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778688699.git.jani.nikula@intel.com>
References: <cover.1778688699.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 9 ---------
 drivers/gpu/drm/i915/display/intel_display_irq.h | 1 -
 drivers/gpu/drm/i915/i915_irq.c                  | 2 +-
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 27fb72e5cefb..a1dbf20c2e02 100644
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

