Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298C3CC6B2C
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0A610E642;
	Wed, 14 Oct 2026 10:53:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F11910FCA7;
 Wed, 14 Oct 2026 10:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791975195; x=1823511195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ODs9WbicBO6FMpVDtAQaWfc/pS8h3HFtVdhIWy1bT2g=;
 b=QFF4dwzPl1iXFpUGDFg8WcUCfLafGOv99S5AjEN6cGxhJd+iOSv0yCMY
 MIUkCuQLFqfTFzj+LR1y/gtw4p6fyHA/7/Uvk+cNlh6TIQTXEIcRCR2Zm
 5wusP6pnwuXuK0dx3J+KSIlJcgGVcnJb/yN//btVaAD+QvLsK0RBgB95a
 sSiOgg2z2rSBEpkIRKHuRJLnOrREGUbvc99JSbSusYVEzJHr77a5VTK3V
 r3FKhK2WUbA4ds9aVBzQ+aWQ9uy2pxcETknnHCkkQB50EU39PZcOf7+Ns
 O2ZrFZCqCIE8THaIDgJ+3a8xgC9alJQTsi2TdMz1UaGg2mN0yBLIH2X+H Q==;
X-CSE-ConnectionGUID: 3B0tH6pnTYO5Ea5QWjTWBw==
X-CSE-MsgGUID: gtOUJTPNRZiG273l3kRQ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="596800"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="596800"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:53:14 -0700
X-CSE-ConnectionGUID: iU08fHYKRsynQ7zrvhjwqQ==
X-CSE-MsgGUID: tSG3Z5x/TxW7ypVVS4M4zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1416939"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 03:53:12 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 3/4] drm/i915/lt_phy: drop the unused pll argument from
 intel_lt_phy_pll_enable()
Date: Wed, 14 Oct 2026 10:53:05 +0000
Message-ID: <20261014105306.2761683-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014105306.2761683-1-mika.kahola@intel.com>
References: <20261014105306.2761683-1-mika.kahola@intel.com>
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

intel_lt_phy_pll_enable() never looks at the pll, it is there only
because intel_xe3plpd_pll_enable() forwards its own arguments. Drop it
so callers that have no pll do not have to pass NULL.

No functional change.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 3 +--
 drivers/gpu/drm/i915/display/intel_lt_phy.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index c626246b71f9..e05fd23b8a65 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1924,7 +1924,6 @@ intel_lt_phy_enable_disable_tx(struct intel_encoder *encoder,
 }
 
 void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
-			     struct intel_dpll *pll,
 			     const struct intel_dpll_hw_state *dpll_hw_state)
 {
 	struct intel_display *display = to_intel_display(encoder);
@@ -2300,7 +2299,7 @@ void intel_xe3plpd_pll_enable(struct intel_encoder *encoder,
 			      struct intel_dpll *pll,
 			      const struct intel_dpll_hw_state *dpll_hw_state)
 {
-	intel_lt_phy_pll_enable(encoder, pll, dpll_hw_state);
+	intel_lt_phy_pll_enable(encoder, dpll_hw_state);
 }
 
 void intel_xe3plpd_pll_disable(struct intel_encoder *encoder)
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index 16de39484779..368ceedb1e0a 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -19,7 +19,6 @@ struct intel_crtc;
 struct intel_lt_phy_pll_state;
 
 void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
-			     struct intel_dpll *pll,
 			     const struct intel_dpll_hw_state *dpll_hw_state);
 void intel_lt_phy_pll_disable(struct intel_encoder *encoder);
 int
-- 
2.43.0

