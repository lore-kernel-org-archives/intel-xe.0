Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C2DFF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 10:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DB810EF5B;
	Wed, 29 Apr 2026 10:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ak+KHX5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F6A10EF4F;
 Wed, 29 Apr 2026 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777458339; x=1808994339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kKis4wOia3Y7LMA1Y6LRKN/sWwmPb8vEl/yEJq1Js7Y=;
 b=ak+KHX5rFO9kO/1WaaqPa9dYR+RoBUk7vDdQVUlqC1AU3zfYGdq/hD50
 SZwK8B6HXmDuhnYnbINp41WpOudXVU2/LtKJPdzRZOL6iUkVZmlIiWydf
 ZWLA89urgHmg/zZ8EiQYx5ZYLXdy+XRwNy8srUEePPTia3gcVgPCZ9cPO
 icm3XPnvC0GDFJhuXrVrx+VF1hwMGI6DB/j89xaxkYiCrJkRe0tDaBOT2
 oDOwLqH3qB7sb5wieHHxCm3Go5aPBuWf2Y2G7Y+DzDMc33RjPXrdxQVGn
 KhaEfGRYX8nDOo7BiOPjmuc0c6et2CxD3jdTjPmAXXoB110Dq5KHwx5WR g==;
X-CSE-ConnectionGUID: jE3DFtm+T0KDEVE4WsZnMw==
X-CSE-MsgGUID: FNqG0Sk2TGWDQrh7NRA9xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="103838176"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="103838176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:25:39 -0700
X-CSE-ConnectionGUID: 9K62wX4pQSSX/aT8fp981w==
X-CSE-MsgGUID: FucQ7vCZSSGL5qRhbOokEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="257784008"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:25:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 09/15] drm/i915/irq: deduplicate dg1_de_irq_postinstall() and
 gen11_de_irq_postinstall()
Date: Wed, 29 Apr 2026 13:24:49 +0300
Message-ID: <b484c4a3160760df8cba2832622bce781b1d3fd8.1777458161.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777458161.git.jani.nikula@intel.com>
References: <cover.1777458161.git.jani.nikula@intel.com>
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

