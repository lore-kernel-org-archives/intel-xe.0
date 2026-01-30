Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242E5D49C81
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 08:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C737710E942;
	Fri, 30 Jan 2026 08:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J83H73P4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D84810E93E;
 Fri, 30 Jan 2026 08:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769762062; x=1801298062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MsJy31EmzwSIAf8WKRd8HNqucbn9Apc/3gIob7HziaQ=;
 b=J83H73P4kT6G5+VM+5Ph1Dh2l/hVrSaciL6G7XocUxtC2oEHA0LiVU4C
 rHbg/VUjeYW38BcgC3HZCQ6+lPFdaw3F4MXZRGu1BvxqDHy8fcRp+pxLr
 d5QLVLEpI3sTtWYcdu2rDrAzuj1DzdF5ODhtPhf8rXrwj/a4XzD0qtHxV
 gVA8v/LZtbI2+bjwKfpvwxF7WgAZYi/mT2GUiNBCRRHw6iH7xQjlA0fjL
 doVzMT2iojdewWJPqBg3J4Zjss3GLiNSdfLV4J+xoabBsTICBRo2p0Yrn
 8ue4OuYm1oWU9n5RD5YKsY+LJxAE52HdsjUWLFBNbezlofG9WsWflqGEF g==;
X-CSE-ConnectionGUID: SXp+659WRHeFuYYCM+LG4A==
X-CSE-MsgGUID: 3eK0JbH8SJmGGLyQgnanWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74636656"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="74636656"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:22 -0800
X-CSE-ConnectionGUID: A3Cc5wpiTDSQB+GCONmmyA==
X-CSE-MsgGUID: 90PzrvK8RImrb4BEbgCeVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208910108"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:34:20 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 11/17] drm/i915/dp: Remove unused joiner helpers
Date: Fri, 30 Jan 2026 13:48:06 +0530
Message-ID: <20260130081812.32087-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
References: <20260130081812.32087-1-ankit.k.nautiyal@intel.com>
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

The helpers intel_dp_num_joined_pipes() and intel_dp_needs_joiner() are no
longer used now that joiner selection iterates over all candidates.
Remove them.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 37 -------------------------
 drivers/gpu/drm/i915/display/intel_dp.h |  4 ---
 2 files changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2a31543ce4d1..c5e2e29a751b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1376,43 +1376,6 @@ int intel_dp_max_hdisplay_per_pipe(struct intel_display *display)
 	return DISPLAY_VER(display) >= 30 ? 6144 : 5120;
 }
 
-static
-bool intel_dp_needs_joiner(struct intel_dp *intel_dp,
-			   struct intel_connector *connector,
-			   int hdisplay, int clock,
-			   int num_joined_pipes)
-{
-	struct intel_display *display = to_intel_display(intel_dp);
-
-	if (!intel_dp_has_joiner(intel_dp))
-		return false;
-
-	num_joined_pipes /= 2;
-
-	return clock > num_joined_pipes * display->cdclk.max_dotclk_freq ||
-	       hdisplay > num_joined_pipes * intel_dp_max_hdisplay_per_pipe(display);
-}
-
-int intel_dp_num_joined_pipes(struct intel_dp *intel_dp,
-			      struct intel_connector *connector,
-			      int hdisplay, int clock)
-{
-	struct intel_display *display = to_intel_display(intel_dp);
-
-	if (connector->force_joined_pipes)
-		return connector->force_joined_pipes;
-
-	if (HAS_ULTRAJOINER(display) &&
-	    intel_dp_needs_joiner(intel_dp, connector, hdisplay, clock, 4))
-		return 4;
-
-	if ((HAS_BIGJOINER(display) || HAS_UNCOMPRESSED_JOINER(display)) &&
-	    intel_dp_needs_joiner(intel_dp, connector, hdisplay, clock, 2))
-		return 2;
-
-	return 1;
-}
-
 bool intel_dp_has_dsc(const struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 6d409c1998c9..ebaa35d23c9c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -153,10 +153,6 @@ bool intel_dp_dsc_valid_compressed_bpp(struct intel_dp *intel_dp, int bpp_x16);
 u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 				int mode_clock, int mode_hdisplay,
 				int num_joined_pipes);
-int intel_dp_num_joined_pipes(struct intel_dp *intel_dp,
-			      struct intel_connector *connector,
-			      int hdisplay, int clock);
-
 static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 {
 	return ~((1 << lane_count) - 1) & 0xf;
-- 
2.45.2

