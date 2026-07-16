Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D072FC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 03:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BEF10F1B4;
	Thu, 16 Jul 2026 03:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjoFunPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078A510F1B3;
 Thu, 16 Jul 2026 03:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784171403; x=1815707403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bMFFfG0LvOk9QpM+iSOuX6PnpuCcnCKfZPATzlQMRDA=;
 b=kjoFunPIFUNpCZFEwWX2yJtGezODfSSmej16tmZrJe8KUImA7SdapWd3
 JFGUtgDkUnd6FFUSRpEtfLGrmuijMwkRpgUAgKk+qwo+rNwkWT363oo97
 cyQKYG8gpDagnOhdMsnJrAfIu64BSsPoZlzk7ATVVBE7iPhmd5IJmvj8N
 c/dbEjA6DIw1Zxb/l+RubFMD7Mc+zqBAS50/KJ2yNE/AGiB7UuvLsswFf
 hR6hZCedqDzOnQfPP5Or7kxnrPlHjid7zwAZ+ZOyKLfL2CQcSb90YLnrb
 TvOM74U6EQwFdDNXwKT2PvVTKpXySGZE/Rm+jctrNr5j0YTchsAgDNCjp Q==;
X-CSE-ConnectionGUID: itW0eZyCRhCmtrci4aeDmQ==
X-CSE-MsgGUID: n5B4LXwdRkeSWWu7D70S5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84677015"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84677015"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 20:10:02 -0700
X-CSE-ConnectionGUID: 0yiHGt1xSsavZxwJnlCXCA==
X-CSE-MsgGUID: 1I68SdXbSuOrK9D9Lq175w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="279630270"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 15 Jul 2026 20:10:01 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/backlight: Remove DP_EDP_BACKLIGHT_AUX_ENABLE_CAP
 check for DPCD backlight
Date: Thu, 16 Jul 2026 08:39:59 +0530
Message-Id: <20260716030959.436430-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716030701.432951-1-suraj.kandpal@intel.com>
References: <20260716030701.432951-1-suraj.kandpal@intel.com>
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

Turns out Some panels allow only backlight AUX based backlight
by just setting the DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and
not setting the DP_EDP_BACKLIGHT_AUX_ENABLE_CAP.
If we make DP_EDP_BACKLIGHT_AUX_ENABLE_CAP a necessity for AUX
based DPCD backlight these panels loose the ability to manipulate
backlight via AUX, specially ones with no PWM controller.
Remove this check from function so that panels who do not advertise
DP_EDP_BACKLIGHT_AUX_ENABLE_CAP but advertise
DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP are able to manipulate
backlight again.

Fixes: ed8be780bdbc ("drm/i915/backlight: Fix VESA backlight possible check condition")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16507
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 7a6c07f6aaeb..83245cb738e5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -619,8 +619,7 @@ check_if_vesa_backlight_possible(struct intel_dp *intel_dp)
 	 * Since we only support Fully AUX Based VESA Backlight interface make sure
 	 * backlight enable is possible via AUX along with backlight adjustment
 	 */
-	if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP &&
-	      intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
+	if (!(intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP))
 		return false;
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &bit_min);
-- 
2.34.1

