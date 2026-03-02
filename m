Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920B2D58E4B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 04:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B5C10E423;
	Mon,  2 Mar 2026 04:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ko3Yqj+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C6410E422;
 Mon,  2 Mar 2026 04:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772424386; x=1803960386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PEEvaNaMHbZynwvQ/UfkjvdK55PhnlMG08iLHiOFZ5g=;
 b=Ko3Yqj+9G4tXX7EqrQNm5o2Qmp1NtP0/LfrVJyBG3De289WiJYprh7/4
 sB2euevsXiMDSLhIQQUdnUDDSuZ4GO0pEnMC1W4uhwixbLuVNb/M6QYWf
 69BuWo3U6EcaQGQBVpekgJN1CDHy2EQy00FjGiL5yUY5cvd26B6IHpfQu
 naRiK/DvQ6+JBdIdVmlsOgR+ShR98A7re7M+8Tgx2BDZqEGwbmGVwp1aD
 OWFhHKLFsyoYHdm3rjYTxMdjqQxLzDAUaSh6RBn9pTJZwiIeJy6pbXqf7
 YUjcGeOVD8EDcmJu8JQ6MZ3BlQrZzs+3HMGOR1tCKdi6p+srKCohsvHau A==;
X-CSE-ConnectionGUID: 2QbEhHnhQ6qI8YF3HAsPNA==
X-CSE-MsgGUID: xGs+pWRUT1ObYcK9PDstzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77294431"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="77294431"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 20:06:23 -0800
X-CSE-ConnectionGUID: 6SC65IItT0epgxGNq5cV3w==
X-CSE-MsgGUID: yOfIZSSvRN2B2abZyrZrCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217541005"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 01 Mar 2026 20:06:22 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [RESEND 3/8] drm/i915/backlight: Take luminance_set into account for
 VESA backlight
Date: Mon,  2 Mar 2026 09:36:08 +0530
Message-Id: <20260302040613.3324049-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302040613.3324049-1-suraj.kandpal@intel.com>
References: <20260302040613.3324049-1-suraj.kandpal@intel.com>
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

When deciding what functions to enable to help control backlight we
used to only check aux_enable. Now with PANEL_LUMINANCE_OVERRIDE in
picture we need to take care that we do not enable PWM function if
luminance_set is set.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index b139ab024e9a..f59a8a1994a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -486,7 +486,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
 	struct intel_panel *panel = &connector->panel;
 	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
 
-	if (!panel->backlight.edp.vesa.info.aux_enable) {
+	if (!(panel->backlight.edp.vesa.info.aux_enable ||
+	      panel->backlight.edp.vesa.info.luminance_set)) {
 		u32 pwm_level;
 
 		if (!panel->backlight.edp.vesa.info.aux_set)
-- 
2.34.1

