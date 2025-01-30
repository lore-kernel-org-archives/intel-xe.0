Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF2EC02193
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 05:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA2910E24E;
	Thu, 30 Jan 2025 05:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcukYXEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD6D10E249;
 Thu, 30 Jan 2025 05:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738214356; x=1769750356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Go6kSLsbtp8przDIz/wG0ggNBsxoeUYWkWrtPsdqa8o=;
 b=TcukYXEYWtJ1yRRQ7syHd2+0l+J0wuaujzantLQcs8zGPE1GEKLJmgWJ
 Qj0JJOZ9gALBcpBYRxNPgr6RaQJV6HUF4KW07fye6TlotTInilU9M9ZLH
 q5pxssHlwQ2AoUIVMeIW2Us0CYZv3pW8wl4KjpGkAHqCknHeTkYbWII0Z
 rUuTxWFNbchsdY4WWU3LriS5iGUSF0VaEc5wkVzIispRjV8LVWf+BKXu+
 0aba+J+UKnyqdlHLqOsHTXrDBdjOjm71zmnGsm8wDPyKQHrNDHj5OZ5A1
 FnoTyqkbFxVG0vSK1svd+eM2GXBPIlTH2MPvPuXHdX92Ou3jdqxsVzVwz w==;
X-CSE-ConnectionGUID: ZkFFvUXHQPSofaQXGXodOQ==
X-CSE-MsgGUID: qr9XNWmISxmUtOCykYzpuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="50133475"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="50133475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 21:19:16 -0800
X-CSE-ConnectionGUID: pPjZvxt8TD2NAGXA4gQiYA==
X-CSE-MsgGUID: 2LwEJazCQP6RQzkh2cYLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109060345"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jan 2025 21:19:14 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v6 1/6] drm/i915/vrr: Add crtc_state dump for vrr.vsync params
Date: Thu, 30 Jan 2025 10:46:04 +0530
Message-ID: <20250130051609.1796524-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250130051609.1796524-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250130051609.1796524-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add crtc_state dump for vrr.vsync_{start/end} params to track the
state correctly.

--v2:
- remove vrr_ pretext and use space instead of underscore (Jani).

--v3:
- Rebase to latest drm-tip.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 1fbaa67e2fea..36076e8d639b 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -292,10 +292,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		   pipe_config->hw.adjusted_mode.crtc_vdisplay,
 		   pipe_config->framestart_delay, pipe_config->msa_timing_delay);
 
-	drm_printf(&p, "vrr: %s, vmin: %d, vmax: %d, flipline: %d, pipeline full: %d, guardband: %d\n",
+	drm_printf(&p, "vrr: %s, vmin: %d, vmax: %d, flipline: %d, pipeline full: %d, guardband: %d vsync start: %d, vsync end: %d\n",
 		   str_yes_no(pipe_config->vrr.enable),
 		   pipe_config->vrr.vmin, pipe_config->vrr.vmax, pipe_config->vrr.flipline,
-		   pipe_config->vrr.pipeline_full, pipe_config->vrr.guardband);
+		   pipe_config->vrr.pipeline_full, pipe_config->vrr.guardband,
+		   pipe_config->vrr.vsync_start, pipe_config->vrr.vsync_end);
 
 	drm_printf(&p, "vrr: vmin vblank: %d, vmax vblank: %d, vmin vtotal: %d, vmax vtotal: %d\n",
 		   intel_vrr_vmin_vblank_start(pipe_config), intel_vrr_vmax_vblank_start(pipe_config),
-- 
2.48.1

