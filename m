Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E186ACCFA06
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 10:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EF610EB8A;
	Fri, 31 Oct 2025 10:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrzCCd+I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EDF10EB73;
 Fri, 31 Oct 2025 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761907696; x=1793443696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pIEfTtTgiWcW48rNQzkcapMYhvhUCdQS8YnFV0etPVM=;
 b=KrzCCd+IOXRpFwOfh0qPb16fysn2BvyxnyBWTbdAtSq1vRzvxV7427WU
 cmUjeeHNhiUZ71cxs5oIBIavp3MBvA+wRI7EifBIUgfs/dVFDdm758XK2
 qIt6HK1LTjemVNNwaK7luJDGqP02D/ZHK5bu0RwnA561VlVcVbpJJIFiL
 jZOVzXtl3eRqVSU1aNV+ig/eomvCF+aB0WkWeN75hjk4QNr+0jiL5Sz6u
 6WxU9KZAeqAx44tUqEF5KzLW3cYb35y73d0h3iBRAxH9aSnqF3tACYVgU
 9lAwR3S0tumd+NCwGIRhTGlygBoWoXsxLTR/6Ndkuq0IapMfpGnb0XsMM A==;
X-CSE-ConnectionGUID: TpHc3PbLQ9erDS0sgJfkdw==
X-CSE-MsgGUID: aLqneBDuRH+t6yqlSvQNwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64217588"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64217588"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:48:15 -0700
X-CSE-ConnectionGUID: fxjN79A8QMK+iDK+5sNzDQ==
X-CSE-MsgGUID: /+oFTLsiTJ6q+gINu8IDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="223441433"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa001.jf.intel.com with ESMTP; 31 Oct 2025 03:48:14 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [CI 26/32] drm/i915/display: Add .get_freq to MTL+ platforms
Date: Fri, 31 Oct 2025 12:35:43 +0200
Message-Id: <20251031103549.173208-27-mika.kahola@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031103549.173208-1-mika.kahola@intel.com>
References: <20251031103549.173208-1-mika.kahola@intel.com>
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

Add .get_freq hook to support dpll framework for MTL+
platforms.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index db6ae7bc63d6..07bc99ae689c 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4379,8 +4379,21 @@ static bool mtl_pll_get_hw_state(struct intel_display *display,
 	return intel_cx0pll_readout_hw_state(encoder, &dpll_hw_state->cx0pll);
 }
 
+static int mtl_pll_get_freq(struct intel_display *display,
+			    const struct intel_dpll *pll,
+			    const struct intel_dpll_hw_state *dpll_hw_state)
+{
+	struct intel_encoder *encoder = get_intel_encoder(display, pll);
+
+	if (drm_WARN_ON(display->drm, !encoder))
+		return -EINVAL;
+
+	return intel_cx0pll_calc_port_clock(encoder, &dpll_hw_state->cx0pll);
+}
+
 static const struct intel_dpll_funcs mtl_pll_funcs = {
 	.get_hw_state = mtl_pll_get_hw_state,
+	.get_freq = mtl_pll_get_freq,
 };
 
 static const struct dpll_info mtl_plls[] = {
-- 
2.34.1

