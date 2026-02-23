Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D75EA4FBE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503BE10E3AF;
	Mon, 23 Feb 2026 13:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7uxXj+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A3710E3B5;
 Mon, 23 Feb 2026 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771853410; x=1803389410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jN33Y9pcNncyIGU1GIc8V1mdV+9FTsJrJJR5oRkfGVk=;
 b=U7uxXj+EfNaZ0zUeseXOpTEJyxdzaqMPoGtNrGngNd8qc3FJyUq6GKGd
 huDIwG6//9wAhxSAX+XSr7oKpkKirKAPBfQV0TEpNb3OB4+giZojAJA8G
 i7GjorLhrpVv0+hsFUW7HOv4Bl0RUTqrY5LiPcMfbkxvWgCJN6P2MsGd1
 jP/4SbR91TECAJ4i8YXwnyGaFRcqUG4lzZeQi/Z3rz1h1CFuF982EsUYP
 of0Dsxo4q0OrkSA9YfGRdFaO7fFAkz5On14hcrLWnTIoJcJEBfI7cm/ai
 Ue5y3Uk35Nob14Ub0xcsihQqayiRPkFeIarYBTTVMhH1qVUWN9QjS5eNy w==;
X-CSE-ConnectionGUID: x06t8U67SRCDyxAgLdL0Pg==
X-CSE-MsgGUID: zaKbDvCrTCW9QkLFVKxGKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72724168"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72724168"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:10 -0800
X-CSE-ConnectionGUID: i5ReRbFzS1yFrGBDzEE0Lg==
X-CSE-MsgGUID: Umb9rCNOTfK3sJqP+VCoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215580372"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:08 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 06/14] drm/i915/dp: Use version field of AS SDP data structure
Date: Mon, 23 Feb 2026 18:44:18 +0530
Message-ID: <20260223131426.1638946-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
References: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
 <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
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

Use the newly added version field of struct drm_dp_as_sdp instead of
current hardcoding.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp.c      | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 33821cc2948b..309e28b15198 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4902,7 +4902,8 @@ static bool
 intel_compare_dp_as_sdp(const struct drm_dp_as_sdp *a,
 			const struct drm_dp_as_sdp *b)
 {
-	return a->vtotal == b->vtotal &&
+	return a->version == b->version &&
+		a->vtotal == b->vtotal &&
 		a->target_rr == b->target_rr &&
 		a->duration_incr_ms == b->duration_incr_ms &&
 		a->duration_decr_ms == b->duration_decr_ms &&
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5abb56fb26f7..5d173553a646 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3136,6 +3136,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
 	as_sdp->length = 0x9;
 	as_sdp->duration_incr_ms = 0;
+	as_sdp->version = 0x2;
 	as_sdp->vtotal = intel_vrr_vmin_vtotal(crtc_state);
 
 	if (crtc_state->cmrr.enable) {
@@ -5001,7 +5002,7 @@ static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
 	/* Prepare AS (Adaptive Sync) SDP Header */
 	sdp->sdp_header.HB0 = 0;
 	sdp->sdp_header.HB1 = as_sdp->sdp_type;
-	sdp->sdp_header.HB2 = 0x02;
+	sdp->sdp_header.HB2 = as_sdp->version;
 	sdp->sdp_header.HB3 = as_sdp->length;
 
 	/* Fill AS (Adaptive Sync) SDP Payload */
@@ -5188,13 +5189,11 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
 	if (sdp->sdp_header.HB1 != DP_SDP_ADAPTIVE_SYNC)
 		return -EINVAL;
 
-	if (sdp->sdp_header.HB2 != 0x02)
-		return -EINVAL;
-
 	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
 		return -EINVAL;
 
 	as_sdp->length = sdp->sdp_header.HB3 & DP_ADAPTIVE_SYNC_SDP_LENGTH;
+	as_sdp->version = sdp->sdp_header.HB2;
 	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
 	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
 	as_sdp->target_rr = ((sdp->db[4] & 0x3) << 8) | sdp->db[3];
-- 
2.45.2

