Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDA5E7315A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 10:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A35C10E23B;
	Mon,  2 Feb 2026 10:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h44LO5US";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF8B10E23B;
 Mon,  2 Feb 2026 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770029615; x=1801565615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cxn6EeGwMTuTKcnGEqHtvMdWoVPQBh+298qAW3ei4qk=;
 b=h44LO5USL/CP06h3zUn9EOWjNc2JzufpMhPqKP7U9GUAEILmkRlY1Gq+
 jHTzBz5rf5WBb4ACOeyRtxMxU1AnUFgVhF/KrjVaiXttbZBiSdbnyWgwy
 4I8sQSX3fyHBjjf8NcfSdrpMqpHT/IFN5vVjV3CD8KW2C+UgjwYG5etIN
 wAo4YxRrWPnzTFLRdSzimLo8nbwEP5TX3RFpRQcLPN6ByRGOBDR5nsBuG
 P7d+w0FnrmGumixHjmaD0Ya6Yc7mAze72tpO1YP2R5f9UmEaO7VWEEzd7
 PhOmMK4fq5FTGfj63D2aVJJOsXEWykNI8xKg82g9Q/hSyWfGlMV3EDb+T g==;
X-CSE-ConnectionGUID: 4aWJFj+KQCyTdOSYjBiSbQ==
X-CSE-MsgGUID: iGxlvIK1SCGT4Crm971k6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70385038"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="70385038"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:53:35 -0800
X-CSE-ConnectionGUID: lse7CuUgS2CBfjNrCI/pnQ==
X-CSE-MsgGUID: 4XhLYdDWQqmze5c+FSTCfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="232419850"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:53:33 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 11/17] drm/i915/dp: Remove unused joiner helpers
Date: Mon,  2 Feb 2026 16:07:25 +0530
Message-ID: <20260202103731.357416-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202103731.357416-1-ankit.k.nautiyal@intel.com>
References: <20260202103731.357416-1-ankit.k.nautiyal@intel.com>
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
index eecfbbddbb53..933d4d71aef1 100644
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

