Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD27CD6E62
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96C3112F6E;
	Mon,  1 Jun 2026 08:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZXJFx/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67995112F66;
 Mon,  1 Jun 2026 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780301871; x=1811837871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1OVnYw2Z5GGCcKklj4wein5BzmanwWGx1NEXr1GGSBs=;
 b=nZXJFx/MKCjX9Jdrqcvq1Xrf9nUQJ/b+5wZJijA25/OpaFv1bO62G3/O
 ooVQuYAfaJRTks/z0M8iJ944eRZ+qcfyrJn7nnDsSTaPNIOAQkF+D/+5p
 JP5BxdGtRofPfRZvBw1V1XXaKEwgevHRZ1vHaL4GfmvQ38Xx55fGxsvPk
 8eitMv8DzIEyDLqe8E/V1IGBBWXZWo7+KKCPcXEO8xNtdGw69Xl2/6S4L
 V8GLvP7FrGFB+PrcufGlDrWWpFSPA41yIaMU9/jHBH0+4EvmnC/NNjHqh
 59bY4Ds3Xg9DIVQ3gykfm60dF0NPI5iWTBYrSag776ireVlgZc+jE9LiK w==;
X-CSE-ConnectionGUID: P4YG0bAlSD65r44hPrF5jw==
X-CSE-MsgGUID: zEiEkgY9Rb+l0wQhr3DQng==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80786194"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80786194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:17:44 -0700
X-CSE-ConnectionGUID: dUHiysvnQYyyJ6lmCMPnxQ==
X-CSE-MsgGUID: auaxpi4zRbynAcjZTpk46Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="248602104"
Received: from abityuts-desk.ger.corp.intel.com (HELO hazy) ([10.245.245.124])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:17:43 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v4 2/4] drm/i915/display: harden shifts in
 ICL_DPCLKA_CFGCR0_DDI_CLK_SEL macros
Date: Mon,  1 Jun 2026 11:14:33 +0300
Message-ID: <20260601081730.3146922-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601081730.3146922-1-luciano.coelho@intel.com>
References: <20260601081730.3146922-1-luciano.coelho@intel.com>
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

ICL_DPCLKA_CFGCR0 has a 2-bit DDI_CLK_SEL field per combo PHY, for
PHY_A..PHY_D only.  Any other phy value (PHY_NONE, TypeC/SNPS PHYs) is
not valid here.

This is not a problem with the current implementation, because phy is
always valid when these macros are called, but it's more robust to
cast to unsigned so the shift is always well-defined.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../gpu/drm/i915/display/intel_display_regs.h    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 4321f8b529da..2dcbbad70174 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2869,9 +2869,19 @@ enum skl_power_gate {
 #define  ICL_DPCLKA_CFGCR0_TC_CLK_OFF(tc_port)	(1 << ((tc_port) < TC_PORT_4 ? \
 						       (tc_port) + 12 : \
 						       (tc_port) - TC_PORT_4 + 21))
-#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	((phy) * 2)
-#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)	(3 << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
-#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy)	((pll) << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
+
+/*
+ * ICL_DPCLKA_CFGCR0 has a 2-bit DDI_CLK_SEL field per combo PHY, for
+ * PHY_A..PHY_D only.  Any other phy value (PHY_NONE, TypeC/SNPS PHYs)
+ * is not valid here.
+ */
+#define ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	_PICK(phy & 0x3, 0, 2, 4, 6)
+#define ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy) \
+	REG_GENMASK(ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy) + 1, \
+		    ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
+#define ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy) \
+	((pll) << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
+
 #define  RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	_PICK(phy, 0, 2, 4, 27)
 #define  RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy) \
 	(3 << RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
-- 
2.53.0

