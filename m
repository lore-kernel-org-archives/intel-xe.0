Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557AAC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8715B10E4C9;
	Wed,  2 Sep 2026 10:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSTAhJOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107B10E4C9;
 Wed,  2 Sep 2026 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788346493; x=1819882493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=++zfvfD/FER/X7MAOQhSrKf3h1WwqRVrRrouIGa0ADQ=;
 b=gSTAhJOYvKCcRUk6aCZowOolw9F3qKeLM4nmXLl5d/ykhy1ejQjGWJdx
 gPpvF3JPMl/mbhW7Cs/HBj4VDOgljCDluG1A2NydGO/CXTdt5ANVPzt2n
 p7gjTVm0UIvIqhUEbh7Zys1bxo9VFUymPdyzGRNic10NGkCk5pLlSGIGh
 +d1VpIZetXRHXCrzbwcVdj2QA0x107md2lFksuhnq+mwmT3Fr/kcnzb8C
 e9wvglp7cIUeviRGqdmBJr3i2TreYWIjI4ftUOuUc5Tp/d203TeK728vC
 ityCYFpJ4KH5j9lPzfXG9ahq8J+p7DkfMR5JUVN54VAMY/JHSFwEgTfSB Q==;
X-CSE-ConnectionGUID: Jk+b6O2OQfW92ITf6bqjjw==
X-CSE-MsgGUID: J3769Gk5S8SdbTQHwH1kAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="91311485"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="91311485"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:54:53 -0700
X-CSE-ConnectionGUID: qdIl9CgQR7qW7zHmuPiYAQ==
X-CSE-MsgGUID: cRXHQVS7TRCTpgEOgWji/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="273136876"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa004.jf.intel.com with ESMTP; 02 Sep 2026 03:54:52 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 1/2] drm/i915/display: Reject flipq for pipe or timing
 changes
Date: Wed,  2 Sep 2026 10:54:46 +0000
Message-ID: <20260902105448.809455-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902105448.809455-1-mika.kahola@intel.com>
References: <20260902105448.809455-1-mika.kahola@intel.com>
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

Our flipq eligibility check let pipe, M/N and LRR changes through.
Reject those too, alongside the existing async flip/VRR/PSR/color/
modeset/fastset exclusions.

v2:
- Drop the single-plane restriction, plane count doesn't matter (Ville)
- Drop the update_wm_pre/post check, dead code for flipq-capable hw (Ville)
- Drop the active/enabled planes check (Ville)

Assisted-by: Copilot:claude-sonnet-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 43 ++++++++++++++++----
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 553c60d452dd..f4b76a9547e3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7369,6 +7369,41 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
 	}
 }
 
+static bool intel_flipq_commit_is_eligible(struct intel_atomic_state *state,
+					   struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+
+	if (!intel_flipq_supported(display))
+		return false;
+
+	if (intel_crtc_needs_modeset(new_crtc_state) ||
+	    intel_crtc_needs_fastset(new_crtc_state) ||
+	    intel_crtc_needs_color_update(new_crtc_state))
+		return false;
+
+	if (!new_crtc_state->update_planes)
+		return false;
+
+	if (new_crtc_state->do_async_flip ||
+	    new_crtc_state->vrr.enable ||
+	    new_crtc_state->has_psr)
+		return false;
+
+	/*
+	 * Flipq is only suitable for simple queued plane updates that do
+	 * not require additional pipe or timing programming.
+	 */
+	if (new_crtc_state->update_pipe ||
+	    new_crtc_state->update_m_n ||
+	    new_crtc_state->update_lrr)
+		return false;
+
+	return true;
+}
+
 static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 				     struct intel_crtc *crtc)
 {
@@ -7384,13 +7419,7 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 
 	/* FIXME deal with everything */
 	new_crtc_state->use_flipq =
-		intel_flipq_supported(display) &&
-		!new_crtc_state->do_async_flip &&
-		!new_crtc_state->vrr.enable &&
-		!new_crtc_state->has_psr &&
-		!intel_crtc_needs_modeset(new_crtc_state) &&
-		!intel_crtc_needs_fastset(new_crtc_state) &&
-		!intel_crtc_needs_color_update(new_crtc_state);
+		intel_flipq_commit_is_eligible(state, crtc);
 
 	new_crtc_state->use_dsb =
 		!new_crtc_state->use_flipq &&
-- 
2.43.0

