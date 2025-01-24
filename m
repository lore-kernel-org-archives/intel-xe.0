Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A55C0218C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 15:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C341E10E998;
	Fri, 24 Jan 2025 15:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEHVaY7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3D310E9C1;
 Fri, 24 Jan 2025 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737731497; x=1769267497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IfPRb9xAuh/8MEZYrUP4uN3ZQj30pOYLG4Vrt2vE1FI=;
 b=GEHVaY7Y2Fe6r+92gVVDC17ezcLwKpSgXXRkbFyD1xfqBsiMLBKwS8Bp
 MYnUbx5JSiC2KDEpS8AL/NVbmac05HjdvPG1AGmMzZdvjIZmUVIp99SmX
 YH704Ojl6P+On5I88CRKayEM4zqKuUNBqLSluShbNyWAuZlCkatfgY08u
 +fuTjUVl6Ma/FxXQdcwTXlkmJFYJqi9eLKMNlJ7rwTyvjbPzw+dPQKf42
 m7+C4A54zE9O28OsWRsZZi0MYwvJ7bhs6iYVBWWuImK7O6LzOUO2EVxw+
 mg5oMkFAAKlSzCX8M4Z4lOpUQQDLORGGwUZ0ioDYeunmXuIQxxqq7GLqa g==;
X-CSE-ConnectionGUID: 52a7p2daQzK3vFiYLk+xKA==
X-CSE-MsgGUID: Ig4omf1DRNewXMHrIEx1pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38177369"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38177369"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 07:11:36 -0800
X-CSE-ConnectionGUID: rgmeB05ZQeq7o67lmhDoFg==
X-CSE-MsgGUID: pgYsyOECQD+pdX0S1VSOyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108221139"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 07:11:34 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 01/35] drm/i915/vrr: Add crtc_state dump for vrr.vsync params
Date: Fri, 24 Jan 2025 20:29:46 +0530
Message-ID: <20250124150020.2271747-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
References: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
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

From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

Add crtc_state dump for vrr.vsync_{start/end} params to track the
state correctly.

--v2:
- remove vrr_ pretext and use space instead of underscore (Jani).

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 1fbaa67e2fea..73579d942ffc 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -297,9 +297,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		   pipe_config->vrr.vmin, pipe_config->vrr.vmax, pipe_config->vrr.flipline,
 		   pipe_config->vrr.pipeline_full, pipe_config->vrr.guardband);
 
-	drm_printf(&p, "vrr: vmin vblank: %d, vmax vblank: %d, vmin vtotal: %d, vmax vtotal: %d\n",
+	drm_printf(&p, "vrr: vmin vblank: %d, vmax vblank: %d, vmin vtotal: %d, vmax vtotal: %d vsync start: %d vsync end %d \n",
 		   intel_vrr_vmin_vblank_start(pipe_config), intel_vrr_vmax_vblank_start(pipe_config),
-		   intel_vrr_vmin_vtotal(pipe_config), intel_vrr_vmax_vtotal(pipe_config));
+		   intel_vrr_vmin_vtotal(pipe_config), intel_vrr_vmax_vtotal(pipe_config),
+		   pipe_config->vrr.vsync_start,
+		   pipe_config->vrr.vsync_end);
 
 	drm_printf(&p, "requested mode: " DRM_MODE_FMT "\n",
 		   DRM_MODE_ARG(&pipe_config->hw.mode));
-- 
2.45.2

