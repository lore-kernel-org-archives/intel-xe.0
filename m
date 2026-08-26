Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8CBC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F65A10ED27;
	Wed, 26 Aug 2026 13:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msQ+RZo3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3E210ED2A;
 Wed, 26 Aug 2026 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751667; x=1819287667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QTItlmHGrsoNaZHbDYyT3NnnroMoa4pstc3nm749DIc=;
 b=msQ+RZo3X3EFwrz+85CbJodfS3Fou2qROcH9hHhuksSwBpOBL1YmxVfi
 ZEsRI+Wo4Ds7D6411pz0ZFgcQP+yG0mdwfQ89MOmjPNNk39HYBGxMkZ09
 DU84vW5YUkfXaNCWQ9UUlfSMkqHOWJ5czTwf+UqekkDqxAHsoJGNOEHZM
 2VISV7vhcfsjc/mWg+73TMMCpdUxsc6QqMd1TtBYCWn4EockvGuGMbVFX
 iUeIHzgDggq3b5XuN2VHBfZ9ue8smthMC6OHY9dPY5GLE6TtFz54jQze3
 YmCR4EC5uVg/oB0ibR2oebHdtjF4Y0Aeqs8uqhrUrlr5DlI3JA9KdrenY A==;
X-CSE-ConnectionGUID: 4vyIXqVzSYmgDjIpvN63yw==
X-CSE-MsgGUID: gqv79pXoS7GeEA5meJff+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="92053071"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="92053071"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:07 -0700
X-CSE-ConnectionGUID: rtCx6a3SS9GBSjJ/IYtA2g==
X-CSE-MsgGUID: XkhA0trNRkK717zhNkBSWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="265780009"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 07/14] drm/i915/dg2: s/intel_/dg2_/ for DG2 specific stuff
Date: Wed, 26 Aug 2026 16:40:26 +0300
Message-ID: <20260826134033.13976-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
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

intel_pcode_*notify() are all DG2 specific code. Rename them
to have a dg2_ namespace.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 31 ++++++++++------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 6453a7cc0cee..5334abbaaed8 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2624,19 +2624,16 @@ void intel_cdclk_dump_config(struct intel_display *display,
 		    cdclk_config->voltage_level);
 }
 
-static void intel_pcode_notify(struct intel_display *display,
-			       u8 voltage_level,
-			       u8 active_pipe_count,
-			       u16 cdclk,
-			       bool cdclk_update_valid,
-			       bool pipe_count_update_valid)
+static void dg2_cdclk_pcode_notify(struct intel_display *display,
+				   u8 voltage_level,
+				   u8 active_pipe_count,
+				   u16 cdclk,
+				   bool cdclk_update_valid,
+				   bool pipe_count_update_valid)
 {
 	int ret;
 	u32 update_mask = 0;
 
-	if (!display->platform.dg2)
-		return;
-
 	update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
 
 	if (cdclk_update_valid)
@@ -2721,7 +2718,7 @@ static bool dg2_power_well_count(struct intel_display *display,
 	return display->platform.dg2 ? hweight8(cdclk_state->active_pipes) : 0;
 }
 
-static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
+static void dg2_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 {
 	struct intel_display *display = to_intel_display(state);
 	const struct intel_cdclk_state *old_cdclk_state =
@@ -2767,11 +2764,11 @@ static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
 	if (update_pipe_count)
 		num_active_pipes = dg2_power_well_count(display, new_cdclk_state);
 
-	intel_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
-			   change_cdclk, update_pipe_count);
+	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
+			       change_cdclk, update_pipe_count);
 }
 
-static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *state)
+static void dg2_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 {
 	struct intel_display *display = to_intel_display(state);
 	const struct intel_cdclk_state *new_cdclk_state =
@@ -2808,8 +2805,8 @@ static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *state)
 	if (update_pipe_count)
 		num_active_pipes = dg2_power_well_count(display, new_cdclk_state);
 
-	intel_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
-			   update_cdclk, update_pipe_count);
+	dg2_cdclk_pcode_notify(display, voltage_level, num_active_pipes, cdclk_mhz,
+			       update_cdclk, update_pipe_count);
 }
 
 bool intel_cdclk_is_decreasing_later(struct intel_atomic_state *state)
@@ -2875,7 +2872,7 @@ intel_set_cdclk_pre_plane_update(struct intel_atomic_state *state)
 	drm_WARN_ON(display->drm, !new_cdclk_state->base.changed);
 
 	if (display->platform.dg2)
-		intel_cdclk_pcode_pre_notify(state);
+		dg2_cdclk_pcode_pre_notify(state);
 
 	intel_set_cdclk(display, &cdclk_config, pipe,
 			"Pre changing CDCLK to");
@@ -2919,7 +2916,7 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 			"Post changing CDCLK to");
 
 	if (display->platform.dg2)
-		intel_cdclk_pcode_post_notify(state);
+		dg2_cdclk_pcode_post_notify(state);
 }
 
 /* pixels per CDCLK */
-- 
2.54.0

