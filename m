Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D7CC55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 21:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2A410E120;
	Mon,  3 Aug 2026 21:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8EeGzgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E02710E095;
 Mon,  3 Aug 2026 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785793823; x=1817329823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XKZF1+8gJ6t0FMsjfKBFmMRvhXWSm57DLz8/RqdCai4=;
 b=j8EeGzgxGREurOxloPo2eK0/zxob8q8kcdWWFGq0E4HR97xKAtDO4DCa
 8ZCZbmFvNkTg1ofJExy70vXGPG5nwfUvq0NykfsmZXGpnpV2k2djbrjbq
 76rxwbGz2BZ5tN5CND7GgRqGt27/lbNiZ7nVa5T42Qj8khG5K9hRAfiv4
 oX3Oq2wjrXVnqL0kdLfDprzNbRapgsunqCQglFQg511JEEfu+S9BlcdGE
 rScKi0oA79HLxCGpAowfjkqs8s/cE2Hp+J+u9qZ8fH5Rol/iWm0HOq53K
 iqMkHilCDn/eiPsL2j426v+5tAsvDRvlWC97n0LnDBmNqSs7z79hbxIo/ A==;
X-CSE-ConnectionGUID: gAMzR4kSTt+mxwPIutysGg==
X-CSE-MsgGUID: ea1DYmJQQl24iMuBrg8DUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97849135"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="97849135"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:50:23 -0700
X-CSE-ConnectionGUID: XNKpUau9TK6LHTqo2NWDYA==
X-CSE-MsgGUID: cHXxfqkBROCmoLG7hxFepQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="291272059"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 14:50:22 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 1/4] drm/i915/display: fix SKL_DSSM register macros
Date: Mon,  3 Aug 2026 23:49:06 +0200
Message-ID: <20260803214909.3076716-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260803214909.3076716-1-michal.grzelak@intel.com>
References: <20260803214909.3076716-1-michal.grzelak@intel.com>
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
REG_GENMASK() and REG_FIELD_PREP() instead of bit shifts.

v1->v2
- s/REG_GENMASK/REG_FIELD_PREP/ (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 0f5018482497..740331ead20a 100644
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

