Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E86103A9BD
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 13:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135AB10E7B8;
	Wed, 25 Mar 2026 13:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWcV4JKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C4110E7B8;
 Wed, 25 Mar 2026 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774447160; x=1805983160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wlJddk724qSs0mn6PBbefqbuP0vyQguKk03yq6F8Hl4=;
 b=BWcV4JKheFcemZ1p914JnGYPj7qxE2OiKRb3XY8e9uPmUccYc7sWIMS9
 P35R0keKhzZcl0LpPtI8fbsB9pyJn9U26fqkcwEzZJAiHfBYrpU+60mJs
 WZtZZpBxwMsBcEUPD0lGEFntWLUG3xc55eytM7TfRjSr844wENSzMU36W
 aH73FkSeRx+Iy0Htu4W/wPc9Htpk5i1lBUvZozfFPCkNqw3qJ67sOVkTe
 48zt1b+OTGTx5QQ+X1vC4Fhl5IhIK9iCB08hOr3/u8B2tQMK8NmGePnbP
 LNvOG9L80FE4twKee6uaZODdSzRu+aRb7D1Z3phVgJxApxDr2KV7shnR3 w==;
X-CSE-ConnectionGUID: SEfZ73o7QjydMSH2G3AnVQ==
X-CSE-MsgGUID: cSz8l8DKS6KA4vv9MGP/qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75365907"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75365907"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:59:18 -0700
X-CSE-ConnectionGUID: k3KFI5dyTXqY6C59/uoUqg==
X-CSE-MsgGUID: aDmR/pgTSw+6dws8/zKwNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="248197489"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:59:17 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915: Move the sharness filter dump next to pfit
Date: Wed, 25 Mar 2026 15:58:49 +0200
Message-ID: <20260325135849.12603-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
References: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Group the sharpness filter parameters next to all the other pfit
stuff in the state dump.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index e0c292c703c1..c85ba9a95322 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -348,6 +348,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   str_enabled_disabled(pipe_config->pch_pfit.enabled),
 			   str_yes_no(pipe_config->pch_pfit.force_thru));
 
+	drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpness enable: %d\n",
+		   pipe_config->hw.casf_params.strength,
+		   pipe_config->hw.casf_params.win_size,
+		   pipe_config->hw.casf_params.casf_enable);
+
 	drm_printf(&p, "ips: %i, double wide: %i, drrs: %i\n",
 		   pipe_config->ips_enabled, pipe_config->double_wide,
 		   pipe_config->has_drrs);
@@ -383,11 +388,6 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 
 	intel_vdsc_state_dump(&p, 0, pipe_config);
 
-	drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpness enable: %d\n",
-		   pipe_config->hw.casf_params.strength,
-		   pipe_config->hw.casf_params.win_size,
-		   pipe_config->hw.casf_params.casf_enable);
-
 dump_planes:
 	if (!state)
 		return;
-- 
2.52.0

