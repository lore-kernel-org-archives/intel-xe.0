Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507DCC5ACAB
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA21910F4A9;
	Fri,  7 Aug 2026 12:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRNHAwVO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DAE10F4A4;
 Fri,  7 Aug 2026 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786104946; x=1817640946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZhufdFT0QbKDUZlF+CWQtRNGB6XONlnVgOVERwpA6s=;
 b=hRNHAwVOd1WG/aIVly5qeUfJ145qY/5nwGXVjoM6JsFzmEoaQSTE/6Zj
 21kNs1G3k9D45bSoo4sckpCJsKgoxoWyVSgO++y9yjETBtRJQUzzNApvP
 zGtusaSR0Dwtvo3vXMAWFuMDQsZYK8BSADW7QLpolh6BKDrIzgURDo7nb
 eTQETSt8u8qV/eaaifoZzCIciENHf3IUsmqG47hosxNzWjy4liIHDZluM
 8ng1MSnyhX91PALmF/UU/Zjlo1UIhFNcQgoXDrrNl2XN7iAKHrvFgJfIX
 6lzlzUaQ1bEex9F0tMZbtbBN0pOjPxrCAaJa0HokrLtuKdeKkwp2OJ7qq w==;
X-CSE-ConnectionGUID: jP3klyBISmqQutLQl7Ps+A==
X-CSE-MsgGUID: xW2qGJsSTAyoxGh0lVwUCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86562844"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86562844"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:15:46 -0700
X-CSE-ConnectionGUID: HlaKlTCGRTWlyep2PxHdAw==
X-CSE-MsgGUID: /BdTJeBkS4iMh87pRYExIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="260611618"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa006.jf.intel.com with ESMTP; 07 Aug 2026 05:15:45 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 2/3] drm/i915/display: Restrict flipq to simple single-plane
 updates
Date: Fri,  7 Aug 2026 12:15:39 +0000
Message-ID: <20260807121540.2032283-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807121540.2032283-1-mika.kahola@intel.com>
References: <20260807121540.2032283-1-mika.kahola@intel.com>
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

Our flipq eligibility check is too loose: it still lets through
commits that change the active/enabled plane mask, or need extra
pipe/M-N/LRR/watermark programming. Those aren't simple queued plane
updates and have no business going through flipq.

Found this chasing a CRC mismatch in kms_cursor_crc's
cursor-alpha-opaque: a plane enable/disable commit slipped through
flipq ahead of the plane-content commit the CRC actually checks.

Reject flipq for anything touching more than one plane, changing the
active/enabled plane masks, or needing async flip, VRR, PSR, color,
pipe, M/N, LRR or watermark updates. More conservative than strictly
necessary in some cases, but better safe than racy.

Assisted-by: Copilot:claude-sonnet-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 53 +++++++++++++++++---
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5cdaa59f005e..2483c031631c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7323,6 +7323,51 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
 	}
 }
 
+static bool intel_flipq_commit_is_eligible(struct intel_atomic_state *state,
+					   struct intel_crtc *crtc)
+{
+	struct intel_display *display = to_intel_display(state);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
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
+	if (!new_crtc_state->update_planes ||
+	    !is_power_of_2(new_crtc_state->update_planes))
+		return false;
+
+	if (new_crtc_state->do_async_flip ||
+	    new_crtc_state->vrr.enable ||
+	    new_crtc_state->has_psr)
+		return false;
+
+	if (old_crtc_state->active_planes != new_crtc_state->active_planes ||
+	    old_crtc_state->enabled_planes != new_crtc_state->enabled_planes)
+		return false;
+
+	/*
+	 * Flipq is only suitable for simple queued single-plane updates
+	 * that do not change plane topology and do not require additional
+	 * pipe/timing/watermark programming.
+	 */
+	if (new_crtc_state->update_pipe ||
+	    new_crtc_state->update_m_n ||
+	    new_crtc_state->update_lrr ||
+	    new_crtc_state->update_wm_pre ||
+	    new_crtc_state->update_wm_post)
+		return false;
+
+	return true;
+}
+
 static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 				     struct intel_crtc *crtc)
 {
@@ -7338,13 +7383,7 @@ static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
 
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

