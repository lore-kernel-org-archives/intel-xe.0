Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F58BCC6B1D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB59910F9A3;
	Tue, 13 Oct 2026 20:47:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E047610E93B;
 Tue, 13 Oct 2026 20:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791924467; x=1823460467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FwZoEe2O7U9d/UBaGsTCWBc9ie3w0wY7YKBXTe26gwU=;
 b=nIQfO/IzN5tYD8HO8PvnmPV+m/cj+jLS3wQ3dleZgZUJUefklqqMukGD
 6E651KYDAnqVsDza30APEMhmc6n+c2Hx897hayvUhkzBbhntZvUNtiPg/
 F3Ls1h1wjPULOgzNk1vCmF7YXFhR9i6wMsL7pU4+DN7p+gnyNcqOhkaF+
 GaeRvMSP/lWKQ/HWgCoXT6OQJCUCPga6GyRx++xiAki8sgS/PrWUcgQkD
 K/+XpXJRMafTWNnSYDkDigAPBjlzDr+D4YgfZ/hLcVh65A2GNzsVyZH+y
 fLMXjwjE5pPcXDVAd+btIpuRLssfL8TvShFxJs4Jnow8Vm4JtpUb7LgOo w==;
X-CSE-ConnectionGUID: g3960OlJQyu6tgxNTnGmqQ==
X-CSE-MsgGUID: 6Fqvd0AJRK20Ndsuiu2exQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="539281"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="539281"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:46 -0700
X-CSE-ConnectionGUID: d5/ZIICARHitiF0w6BLRJw==
X-CSE-MsgGUID: Lpu5d9z2SaubQvLJg5eOig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1189024"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:46 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 1/5] drm/i915/display: clean SKL_DSSM register macros
Date: Tue, 13 Oct 2026 22:47:00 +0200
Message-ID: <20261013204705.1574475-2-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
References: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Indent SKL_DSSM register macros. Define mask and register values with
REG_GENMASK() and REG_FIELD_PREP() instead of bit shifts. No functional
change.

v2->v3
- s/fix/clean/ (Jani)

v1->v2
- s/REG_GENMASK/REG_FIELD_PREP/ (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 8251ec15190b..0b3991bc3aef 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1779,10 +1779,10 @@
 #define   XE2LPD_DE_CAP_SCALER_SINGLE	1
 
 #define SKL_DSSM				_MMIO(0x51004)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_MASK		(7 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_24MHz		(0 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
-#define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_MASK	REG_GENMASK(31, 29)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_24MHz	REG_FIELD_PREP(ICL_DSSM_CDCLK_PLL_REFCLK_MASK, 0)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	REG_FIELD_PREP(ICL_DSSM_CDCLK_PLL_REFCLK_MASK, 1)
+#define   ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	REG_FIELD_PREP(ICL_DSSM_CDCLK_PLL_REFCLK_MASK, 2)
 
 /*GEN11 chicken */
 #define _PIPEA_CHICKEN				0x70038
-- 
2.45.2

