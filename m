Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AF8EFB7F4
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D777F10E4A6;
	Tue, 24 Feb 2026 03:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NdReJwJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144CB10E4A3;
 Tue, 24 Feb 2026 03:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771904737; x=1803440737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UkV8WdZpff13TxR7oc99hCDfKnmoHH7CjnvSYsTNq8Q=;
 b=NdReJwJANFjV58p+euptYM8ir5ZrMbe8Ttcm8Y0CZ79ORrhKOYXDkCfm
 qDiGugWpn65yTG2TxPBfrn0l6RhCZs90hUClGCkIkgJOF8qjaiQ1TH8fC
 B/d8vAscSuI8mu2v+QTPmNHGWKwEhWbuabUa7UE/XvrNR6CfqBWixunoK
 jRlzCF6UCzoa8gBFnEjxEfpwtGzmkyRyq6beW+6VNGBbmaWOkicx+6RUN
 vcpbtR4QikaC+hnjodFXtvsaxaka87JzICcLPdcGAOtQPs4VaBLlKrVmu
 8HKBQO9R8OPuv1kCPxTbOrg3xou7RmQLBWO8KWxHnyHHrCSK3IYJtkOt6 Q==;
X-CSE-ConnectionGUID: Gj+vi+EBTjGHiwtSGIKv6Q==
X-CSE-MsgGUID: zO5QXNtcSdmygu9EevPdXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72817863"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72817863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:45:37 -0800
X-CSE-ConnectionGUID: FDp0f2KNQAeNt4yLnFgnRw==
X-CSE-MsgGUID: lUwnjroYRDKIxIhix1xdgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215010628"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 19:45:35 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 4/8] drm/i915/backlight: Check luminance_set when disabling
 PWM via AUX VESA backlight
Date: Tue, 24 Feb 2026 09:15:22 +0530
Message-Id: <20260224034526.2730130-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224034526.2730130-1-suraj.kandpal@intel.com>
References: <20260224034526.2730130-1-suraj.kandpal@intel.com>
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

When deciding what if PWM funcs need to be disabled take into account
luminance_set too. We do this since it is also used to decide if
we are enabling PWM backlight funcs or not.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15671
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index cb39696491a1..a921bb4ccacf 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -511,7 +511,8 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
 
 	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.info);
 
-	if (!panel->backlight.edp.vesa.info.aux_enable)
+	if (!(panel->backlight.edp.vesa.info.aux_enable ||
+	      panel->backlight.edp.vesa.info.luminance_set))
 		panel->backlight.pwm_funcs->disable(old_conn_state,
 						    intel_backlight_invert_pwm_level(connector, 0));
 }
-- 
2.34.1

