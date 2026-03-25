Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6BB106B53F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 13:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C7D10E571;
	Wed, 25 Mar 2026 13:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzwBBzSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5CB10E22A;
 Wed, 25 Mar 2026 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774447157; x=1805983157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0EyJU1L/T0xb0wU37sM621dxikIDtnyWyAqKC698SuA=;
 b=ZzwBBzSKBvnQNrSMzjlDuzdRdVBpOtRhdinFaoFGeCE5dyQyK3R6EBu6
 RtKkBGjtJspufHP6VwAdc8pWn+CQ0mrCckZIZhdRq6PUWJBc6xToRJs+J
 IJOBabm3Qu1Y1qCf+WVdWw1DL42KsNwzUlD+OLFycQv22DEAF/szqb5wY
 QSnI8jvsuIMAUrsZyOvZyvPpBu6yYzqepKXxKEpIQPUZgBg2zXAsXmFu9
 DxkLuGQb4Aa+srp85kAdHsH8lJ4v5DfMclkuh1NVMAjsrEIoj46O2ZXse
 rORyDYsQsGtbXbj9f0LHCu3KlxI8qhObjfRHkXp/GnU7C9dHju3b31RYZ A==;
X-CSE-ConnectionGUID: 4qkKrrHdSe2jX4urCQmV5A==
X-CSE-MsgGUID: B60VI07ESUewnOqqb/Q5AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75365895"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75365895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:59:14 -0700
X-CSE-ConnectionGUID: 7IhmWvvBR+CPtPTJ5XUQUg==
X-CSE-MsgGUID: +PuoSEqiSBysnPQvFalgRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="248197482"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 06:59:13 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915: Eliminate out of place "HBlank" CamelCase
Date: Wed, 25 Mar 2026 15:58:48 +0200
Message-ID: <20260325135849.12603-6-ville.syrjala@linux.intel.com>
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

Nothing else in the crtc state dump uses CamelCase, so
don't use it for "HBlank" either.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index ec667a3d09d6..e0c292c703c1 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -250,7 +250,7 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   str_enabled_disabled(pipe_config->has_sel_update),
 			   str_enabled_disabled(pipe_config->has_panel_replay),
 			   str_enabled_disabled(pipe_config->enable_psr2_sel_fetch));
-		drm_printf(&p, "minimum HBlank: %d\n", pipe_config->min_hblank);
+		drm_printf(&p, "minimum hblank: %d\n", pipe_config->min_hblank);
 	}
 
 	drm_printf(&p, "audio: %i, infoframes: %i, infoframes enabled: 0x%x\n",
-- 
2.52.0

