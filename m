Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41764106B53F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 13:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E9610E7B7;
	Wed, 25 Mar 2026 13:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLHvnorF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD7E10E778;
 Wed, 25 Mar 2026 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774447151; x=1805983151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qsKrW65o5eEBCmW46iA45oqhDn30TAkmv43FaNFr3A8=;
 b=QLHvnorFwZoTPLv6LmqMZpSGrG/E5REOoe/Mddk5hk/6ufKLryjiSu9D
 GLBDc3xFzs3GLdAowysBOam6jfEHa6tuYAMn08PybhDn5J/ui/3p/XUpL
 MZ4zTyUIpNzvWBEvAnfB21A9YVS21yT8yJXgYMyGsGAD+hLGNk3TP8OfL
 VwZBMSZWLqIYo+N328joktWd2JreLUt5iwq6wNo/CbYscL2xIP2Qg+K1o
 GyQ4ekoRd4jFWUFbZOTDPvRGk6VupqXmD0mvUrxsdA9kVHjF29KNnx4xJ
 F5TbMgvTw0tIKVIwNJi2tqUiW2dGNDLbRgN2y1xMt7BsKHbqPTbkZ7bdY g==;
X-CSE-ConnectionGUID: wBiuAR2rSYKnEu0coaV5oQ==
X-CSE-MsgGUID: NLgK/EgUSB6BCNsTm3EYKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75365868"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75365868"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:59:10 -0700
X-CSE-ConnectionGUID: yuT4hmPpQAmdFy46wGjjvQ==
X-CSE-MsgGUID: EJ7KjJWpSpe0ImU0YO3DdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="248197473"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:59:09 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915: Include the crtc min_voltage_level in the state
 dump
Date: Wed, 25 Mar 2026 15:58:47 +0200
Message-ID: <20260325135849.12603-5-ville.syrjala@linux.intel.com>
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

Include the pipe's min_voltage_level in its state dump, to help
with debugging.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 63a61caa059e..ec667a3d09d6 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -320,9 +320,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 	drm_printf(&p, "pipe mode: " DRM_MODE_FMT "\n",
 		   DRM_MODE_ARG(&pipe_config->hw.pipe_mode));
 	intel_dump_crtc_timings(&p, &pipe_config->hw.pipe_mode);
-	drm_printf(&p, "port clock: %d, pixel rate %d, min cdclk %d\n",
+	drm_printf(&p, "port clock: %d, pixel rate %d, min cdclk %d, min voltage level %d\n",
 		   pipe_config->port_clock, pipe_config->pixel_rate,
-		   pipe_config->min_cdclk);
+		   pipe_config->min_cdclk, pipe_config->min_voltage_level);
 
 	drm_printf(&p, "linetime: %d, ips linetime: %d\n",
 		   pipe_config->linetime, pipe_config->ips_linetime);
-- 
2.52.0

