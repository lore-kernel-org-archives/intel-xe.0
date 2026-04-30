Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8462DFF8875
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 13:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD310E7E1;
	Thu, 30 Apr 2026 13:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLqXlImy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C946E10E5AF;
 Thu, 30 Apr 2026 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777555629; x=1809091629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cn86+/wG9q20GY40uK4gIMGTIgVyVSOLZnEWzliMBss=;
 b=lLqXlImy45nuTBeGHxNRlmki8LbFVhC+vpWl/L1wFPbwpgOEohGPlYgq
 qmb2YYhBtDXniwQTr+LRuYp1XijwlaBdDcDQcxpHAaynkFVax/lYh7Pq4
 JvxxDpgLfzIoEio9BW31MGBTvv02OmjA7ZDNC2+DBL8526TvJdTQHtQgS
 Tyk3jr+xVNwwWAIhsT4HlSWhqOGq3hdX9n37wGlmulKIKqDsQAX6bwHIk
 uaErfP0B+Lyy8hVAtAoRbFDeAGES9rpfFIpq1GlBdJjUGKDVBKGvgS2Ec
 RGHaH1Fug450WvozZzG5eSqTye16y9zEkLhJ8lCEMpkEdc+MDRmz9RRoP w==;
X-CSE-ConnectionGUID: cVh0xJ8nTPKHiW0kvSdwTQ==
X-CSE-MsgGUID: GHS/s9oiT5ytLr/6PFx+vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78398727"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78398727"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:27:09 -0700
X-CSE-ConnectionGUID: yqMJz7BEQ3ejj8w18rH3AQ==
X-CSE-MsgGUID: 8z9OsFn0Q6Wf9sYqNo4KrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="257919882"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:27:07 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 4/5] drm/i915/intel_sdvo: Drop call to
 intel_panel_fixed_mode() from compute_config
Date: Thu, 30 Apr 2026 18:42:19 +0530
Message-ID: <20260430131220.3891497-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260430131220.3891497-1-ankit.k.nautiyal@intel.com>
References: <20260430131220.3891497-1-ankit.k.nautiyal@intel.com>
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

Currently, in intel_sdvo_compute_config(), intel_panel_fixed_mode() is
called to get the fixed mode. However, since the call is made after
intel_panel_compute_config, that copies the selected fixed mode to the
adjusted mode, we can directly use the crtc_state->hw.adjusted_mode.

So remove the extra call to intel_panel_fixed_mode() and use adjusted
mode instead.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_sdvo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 7843eb13f2e3..c18e7d5e9c34 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1395,8 +1395,7 @@ static int intel_sdvo_compute_config(struct intel_encoder *encoder,
 							   adjusted_mode);
 		pipe_config->sdvo_tv_clock = true;
 	} else if (IS_LVDS(intel_sdvo_connector)) {
-		const struct drm_display_mode *fixed_mode =
-			intel_panel_fixed_mode(&intel_sdvo_connector->base, mode);
+		const struct drm_display_mode *fixed_mode;
 		int ret;
 
 		ret = intel_panel_compute_config(&intel_sdvo_connector->base,
@@ -1404,6 +1403,8 @@ static int intel_sdvo_compute_config(struct intel_encoder *encoder,
 		if (ret)
 			return ret;
 
+		fixed_mode = &pipe_config->hw.adjusted_mode;
+
 		if (!intel_sdvo_set_output_timings_from_mode(intel_sdvo,
 							     intel_sdvo_connector,
 							     fixed_mode))
-- 
2.45.2

