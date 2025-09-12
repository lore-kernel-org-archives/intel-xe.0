Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB6ECAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BEA10EC91;
	Fri, 12 Sep 2025 14:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSlV3njf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B30610EC94;
 Fri, 12 Sep 2025 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757688602; x=1789224602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5tQzflHV506WJTSFWmPh6Kuu/XpH6gz6MX4zILoGIN4=;
 b=kSlV3njfRZ4DWUxv9TKKGvBpnKmSFvpuCR5XN8OxF7OjAGJTSI2x/+Qq
 vCR6x2lGLbdDGytHwG1Bq2nb/YBKiAxN57r20EOrbIhFgbrrFVYI2Vbgc
 VCA6cIr+ZBUmLMWQZqpLCsuB4jMOfo8N4T/x/EHL8pBG0MtN5SyJjUp6n
 KWcmNT/p2amO01Wlg2EkJfoTF7MrdopRvcx0E4OULVTmfvp9NL7f+pTDt
 Jg+PRfY0rd0Ife21oA9MYeN6RPkNKlD4KxKTHqu3m85xu7+zGXegFkYGF
 2vNx9UgdoneG+Zzf6jcpBNRLvEF45x9qQFxdKakrJDHajc0PdwCyHDj0w A==;
X-CSE-ConnectionGUID: m5huCaPCTK2AbH3GCfUYOA==
X-CSE-MsgGUID: slryEOPBQheGd9HOsL1Sog==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="63858252"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="63858252"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:50:02 -0700
X-CSE-ConnectionGUID: rm+wCW7uRAmKgoenlmNSFw==
X-CSE-MsgGUID: 1VEItV5LSyKIUi68ccx5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174424170"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.212])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:50:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 michal.grzelak@intel.com
Subject: [PATCH v2 11/15] drm/i915: remove vlv_get_cck_clock_hpll()
Date: Fri, 12 Sep 2025 17:48:50 +0300
Message-ID: <1e5ef7a14cdf42048a03719cff380fee6c3016e0.1757688216.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1757688216.git.jani.nikula@intel.com>
References: <cover.1757688216.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The function has become so trivial it's no longer necessary. Inline it
at the call sites.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7b5379262a37..8f200593053e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -179,16 +179,11 @@ static int vlv_get_cck_clock(struct drm_device *drm,
 	return DIV_ROUND_CLOSEST(ref_freq << 1, divider + 1);
 }
 
-static int vlv_get_cck_clock_hpll(struct drm_device *drm,
-				  const char *name, u32 reg)
-{
-	return vlv_get_cck_clock(drm, name, reg, vlv_clock_get_hpll_vco(drm));
-}
-
 int vlv_clock_get_hrawclk(struct drm_device *drm)
 {
 	/* RAWCLK_FREQ_VLV register updated from power well code */
-	return vlv_get_cck_clock_hpll(drm, "hrawclk", CCK_DISPLAY_REF_CLOCK_CONTROL);
+	return vlv_get_cck_clock(drm, "hrawclk", CCK_DISPLAY_REF_CLOCK_CONTROL,
+				 vlv_clock_get_hpll_vco(drm));
 }
 
 int vlv_clock_get_czclk(struct drm_device *drm)
@@ -196,8 +191,8 @@ int vlv_clock_get_czclk(struct drm_device *drm)
 	struct drm_i915_private *i915 = to_i915(drm);
 
 	if (!i915->czclk_freq)
-		i915->czclk_freq = vlv_get_cck_clock_hpll(drm, "czclk",
-							  CCK_CZ_CLOCK_CONTROL);
+		i915->czclk_freq = vlv_get_cck_clock(drm, "czclk", CCK_CZ_CLOCK_CONTROL,
+						     vlv_clock_get_hpll_vco(drm));
 
 	return i915->czclk_freq;
 }
-- 
2.47.3

