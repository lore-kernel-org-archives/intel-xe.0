Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCDDFF4937
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 03:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BE310E2F9;
	Wed,  1 Apr 2026 03:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNuFpv67";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0739010E254;
 Wed,  1 Apr 2026 03:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775015022; x=1806551022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rcwfHzATsqDw9RmVO/vzkBWtRwZvNF8CM1mzbMfOpfM=;
 b=iNuFpv67k4i7Q+/Qkmfkd9707RV6vUPkTAq4NP5poRuFIUeQbqadzUnD
 4r1jGhIIUQW0ymJnc1ed8QQ4gCoky9Nor0SK+JhKj0WARrxLRXq8fZsUn
 bEQ5voQJEx7XRqP3OgoPGF5/e3l3zI4FkbVEsKO969pm82z/dg57a+lSv
 4+ictzw/Wt1kktUgGVQeZ0NTrL3SvAAWF4i2AaugHKHO2HLsp3L1sZCIZ
 4ADjIX89FH8NgCcYfG4bfM/FTJRtHPYGoI2OukrYbk7SKOw2sjWUBr3Ok
 XHcbjJWET4dr3FG/EyVxMxqszDJX3hsFgYxDCu5ynibvmfC44ag6KGdHr g==;
X-CSE-ConnectionGUID: fRFe3aBqRkK4dy9yx9vrvw==
X-CSE-MsgGUID: LrSXAPbJSceqcUT6V6MLPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87503108"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87503108"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 20:43:41 -0700
X-CSE-ConnectionGUID: 29FxLsKHRoeb3mtRyMRv7A==
X-CSE-MsgGUID: 2SNpZIiYR2qtpGz2V4vNdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228159126"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 20:43:40 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, ville.syrjala@linux.intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/backlight: Fix VESA backlight possible check
 condition
Date: Wed,  1 Apr 2026 09:13:32 +0530
Message-Id: <20260401034332.1321585-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

VESA backlight is possible through AUX only when
BACKLIGHT_AUX_ENABLE_CAPABLE is true or when we use BL_ENABLE bit
to enable backlight. Since that is not implemented we need to make
sure we do not try to manipulate backlight when
BACKLIGHT_AUX_ENABLE_CAPABLE is not set.
Also fix return value when condition is not fulfilled.

Fixes: 40d2f5820951 ("drm/i915/backlight: Remove try_vesa_interface")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index d0c76632a946..138d5b5e5482 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -615,8 +615,9 @@ check_if_vesa_backlight_possible(struct intel_dp *intel_dp)
 	int ret;
 	u8 bit_min, bit_max;
 
-	if (!(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
-		return true;
+	if (!(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP &&
+	      intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))
+		return false;
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
 	if (ret < 0)
-- 
2.34.1

