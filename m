Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0491073CAD
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 12:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21EC10E63C;
	Wed,  8 Apr 2026 12:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0L06flZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A13C10E633;
 Wed,  8 Apr 2026 12:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775651786; x=1807187786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+VgAV5N2WyymHL49Xhk4irPSnOUNt2qaRJfwQZ1Bc4=;
 b=a0L06flZG1adviPf4jQFeVijDJOomNe+1Ayc9yBlTo0ol9vVGtiigB5A
 XKkkFeKBKWFOL6WS8TLR4IFjlw98MyA/BTMmHbEi7ykCA9J8Wt9LQ4sTJ
 S5IoesvO68Hjz75BwZhPcMavAoAvxk26mMTaxmW5YoWv0ZkOATxsIqpVq
 jZV+qDnwuetqrRrnTYDWbMpGOoo3sBYjsNyi3m20JaAKbfOAKWOqdKw8S
 B9yz2iKARNxm8M9R6xviiVQB/0Va13gD4AuSRpb456xvh/DtadlnupxdF
 0YPzCv4P00vmpbH8seY2nXv/7ZY+uSAQwwnzQldUFCy7iNdniwX5ufWi4 Q==;
X-CSE-ConnectionGUID: tkWx7GioTd67hQ8+uPPjTw==
X-CSE-MsgGUID: j+HyXl4gRkeVZ/hkowlCUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="88016866"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="88016866"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 05:32:04 -0700
X-CSE-ConnectionGUID: 0qtEc8UzSZGFbmzlyX+JYw==
X-CSE-MsgGUID: pxf44EP8RPSjWeHBqXClBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="224159226"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.73])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 05:32:01 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH v3 9/9] drm/i915/scaler: Use the actual scale factors for
 vblank length check
Date: Wed,  8 Apr 2026 15:31:14 +0300
Message-ID: <20260408123115.15716-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260408123115.15716-1-ville.syrjala@linux.intel.com>
References: <20260408123115.15716-1-ville.syrjala@linux.intel.com>
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

Now that the scaler assignment has been moved to an earlier point
we can start to use the actual scale factors in the prefill vs.
vblank length check.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 77 ++++++++++++++++++++---
 1 file changed, 67 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 165c403d1e5c..28b8c9a0065a 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -1023,22 +1023,79 @@ void adl_scaler_ecc_unmask(const struct intel_crtc_state *crtc_state)
 	intel_de_write(display, XELPD_DISPLAY_ERR_FATAL_MASK, 0);
 }
 
+static unsigned int skl_scaler_scale(const struct intel_crtc_state *crtc_state, int i)
+{
+	const struct intel_crtc_scaler_state *scaler_state =
+		&crtc_state->scaler_state;
+
+	return DIV_ROUND_UP_ULL(mul_u32_u32(scaler_state->scalers[i].hscale,
+					    scaler_state->scalers[i].vscale),
+				0x10000);
+}
+
+static unsigned int skl_scaler_downscale(const struct intel_crtc_state *crtc_state, int i)
+{
+	return max(0x10000, skl_scaler_scale(crtc_state, i));
+}
+
+static unsigned int skl_plane_scaler_downscale(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
+	const struct intel_crtc_scaler_state *scaler_state =
+		&crtc_state->scaler_state;
+	unsigned int scale = 0x10000;
+	int i;
+
+	for (i = 0; i < crtc->num_scalers; i++) {
+		/* ignore pfit */
+		if (i == scaler_state->scaler_id)
+			continue;
+
+		if (!scaler_state->scalers[i].in_use)
+			continue;
+
+		scale = max(scale, skl_scaler_downscale(crtc_state, i));
+	}
+
+	return scale;
+}
+
+static unsigned int skl_pipe_scaler_downscale(const struct intel_crtc_state *crtc_state)
+{
+	const struct intel_crtc_scaler_state *scaler_state =
+		&crtc_state->scaler_state;
+
+	if (!crtc_state->pch_pfit.enabled)
+		return 0x10000;
+
+	return skl_scaler_downscale(crtc_state, scaler_state->scaler_id);
+}
+
 unsigned int skl_scaler_1st_prefill_adjustment(const struct intel_crtc_state *crtc_state)
 {
-	/*
-	 * FIXME don't have scalers assigned yet
-	 * so can't look up the scale factors
-	 */
-	return 0x10000;
+	const struct intel_crtc_scaler_state *scaler_state =
+		&crtc_state->scaler_state;
+	int num_scalers = hweight32(scaler_state->scaler_users);
+
+	if (num_scalers < 1)
+		return 0x10000;
+
+	if (num_scalers == 1 && crtc_state->pch_pfit.enabled)
+		return skl_pipe_scaler_downscale(crtc_state);
+	else
+		return skl_plane_scaler_downscale(crtc_state);
 }
 
 unsigned int skl_scaler_2nd_prefill_adjustment(const struct intel_crtc_state *crtc_state)
 {
-	/*
-	 * FIXME don't have scalers assigned yet
-	 * so can't look up the scale factors
-	 */
-	return 0x10000;
+	const struct intel_crtc_scaler_state *scaler_state =
+		&crtc_state->scaler_state;
+	int num_scalers = hweight32(scaler_state->scaler_users);
+
+	if (num_scalers < 2)
+		return 0x10000;
+
+	return skl_pipe_scaler_downscale(crtc_state);
 }
 
 unsigned int skl_scaler_1st_prefill_lines(const struct intel_crtc_state *crtc_state)
-- 
2.52.0

