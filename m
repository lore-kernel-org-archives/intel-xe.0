Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC670CD484A
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8156010E70E;
	Mon, 11 May 2026 12:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyqXcWn7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD28D10E704;
 Mon, 11 May 2026 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778503614; x=1810039614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qvcVGM6dVlwaNrWCQaDQmb/NiTFY1ffqreaIqVBvhiI=;
 b=IyqXcWn7DapDOCawLcd/qffBbNMMs6Pls6/h7M493+0AiljR71HQJbXF
 F1K3mvxABYImOC3ZF7+q4uTs8YZflGlfgnyBhDTlZHfUCd1lcglI/9l90
 0En45FcjQKUhxGQlyFghzw4Q3Nhehi4HpTupQv9ti3mRwVZrFC3j46lk7
 Tg3oOe5dw3vb7jUZitHKExWtoXO4IoStJotEZQDRI7MypQhmXMnyoOUF9
 uQQMy47d0umOfayMXTecP69ijwsbxaCLIVEkRmzPiu5xTAvsaC3ve2TgD
 A9pJO+zaEbyu46b4tKfTMypTJyCKw2nHX342LSdvIaO1G+6koC3fx+Ex5 Q==;
X-CSE-ConnectionGUID: /NznV+htTdiDSnfm49pUNQ==
X-CSE-MsgGUID: Xqwj5RMTSB+wfuhdIb4N1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90764821"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90764821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:46:54 -0700
X-CSE-ConnectionGUID: Bn2qBBrEQ7yo3LLjFT7oaw==
X-CSE-MsgGUID: RyZtwVyEQyamrZYAZYl/IQ==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:46:52 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/4] drm/i915/dp: Use revision field of AS SDP data structure
Date: Mon, 11 May 2026 18:02:16 +0530
Message-ID: <20260511123218.1589830-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260511123218.1589830-1-ankit.k.nautiyal@intel.com>
References: <20260511123218.1589830-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use the revision field of struct drm_dp_as_sdp instead of current
hardcoding for the AS SDP revisions.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp.c      | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d5cf1476c7b9..ca06a9d990f7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4881,7 +4881,8 @@ static bool
 intel_compare_dp_as_sdp(const struct drm_dp_as_sdp *a,
 			const struct drm_dp_as_sdp *b)
 {
-	return a->vtotal == b->vtotal &&
+	return a->revision == b->revision &&
+		a->vtotal == b->vtotal &&
 		a->target_rr == b->target_rr &&
 		a->duration_incr_ms == b->duration_incr_ms &&
 		a->duration_decr_ms == b->duration_decr_ms &&
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c9ec27e9e124..fa3b0a1b6bc1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3199,6 +3199,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
 	as_sdp->length = 0x9;
 	as_sdp->duration_incr_ms = 0;
+	as_sdp->revision = 0x2;
 	as_sdp->vtotal = intel_vrr_vmin_vtotal(crtc_state);
 
 	if (crtc_state->cmrr.enable) {
@@ -5175,7 +5176,7 @@ static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
 	/* Prepare AS (Adaptive Sync) SDP Header */
 	sdp->sdp_header.HB0 = 0;
 	sdp->sdp_header.HB1 = as_sdp->sdp_type;
-	sdp->sdp_header.HB2 = 0x02;
+	sdp->sdp_header.HB2 = as_sdp->revision;
 	sdp->sdp_header.HB3 = as_sdp->length;
 
 	/* Fill AS (Adaptive Sync) SDP Payload */
@@ -5362,13 +5363,11 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
 	if (sdp->sdp_header.HB1 != DP_SDP_ADAPTIVE_SYNC)
 		return -EINVAL;
 
-	if (sdp->sdp_header.HB2 != 0x02)
-		return -EINVAL;
-
 	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
 		return -EINVAL;
 
 	as_sdp->length = sdp->sdp_header.HB3 & DP_AS_SDP_LENGTH_MASK;
+	as_sdp->revision = sdp->sdp_header.HB2;
 	as_sdp->mode = sdp->db[0] & DP_AS_SDP_OPERATION_MODE_MASK;
 	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
 	as_sdp->target_rr = ((sdp->db[4] & 0x3) << 8) | sdp->db[3];
-- 
2.45.2

