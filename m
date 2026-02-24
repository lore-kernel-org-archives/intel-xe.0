Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C561EFB7F7
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DDF10E4A1;
	Tue, 24 Feb 2026 03:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0GM7tb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C70E10E49D;
 Tue, 24 Feb 2026 03:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771904735; x=1803440735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=90cQgoKaqzDNQfgVFzrh3DJFmVNoNJYk6bNJjAc/LnY=;
 b=c0GM7tb7Aup7HjhkEo4rVh0KX9sCKSK7qvpSsUDkTtPqeNkamSWS6o2Q
 49Rfa/IWwZqf22oXiQJau1nbkRuZAnC7dQys17Drxbmcl0v2TyF/BdwZR
 rvGlfDE18LQ5jjAewlA4/Sfj6bod6mJEODTzpMDVVpZ0CpRrpbo71zxin
 1Efti1m6EFLwPMz2Wn3ILxzAyfdNiTf0c3vq10EjaespIME2aaMQ4rEt0
 zWUqdVaTd3BzFFYMN/1Ku7pk1M4ahy83g6ha82AiaJgHNPXAApVmJG6w8
 Dz1K9Z29+EDg5t3tih9FITW/CkXhKApGy9TzpKL+6Hu+WS11uN7CUHWaS A==;
X-CSE-ConnectionGUID: MBfbdTw0QD+dKecs/x07VQ==
X-CSE-MsgGUID: 7N2EDFxZQFy6mKxOIO21SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72817861"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72817861"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:45:35 -0800
X-CSE-ConnectionGUID: XcklmGEkR9ieXt6eknQtXg==
X-CSE-MsgGUID: vLmJDQPgRQ6uWtJe/GV9Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215010624"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 19:45:33 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 3/8] drm/i915/backlight: Take luminance_set into account
 for VESA backlight
Date: Tue, 24 Feb 2026 09:15:21 +0530
Message-Id: <20260224034526.2730130-4-suraj.kandpal@intel.com>
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
index 05d6d033f60b..cb39696491a1 100644
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

