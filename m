Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB051CD5BBF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 05:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C35E10E3E2;
	Mon, 25 May 2026 05:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1FueLew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E1610E3DC;
 Mon, 25 May 2026 05:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779687632; x=1811223632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Pr4XF06uWyckodvoQ6sT9ZDFJdf98+4qaMj8SZO8sk=;
 b=k1FueLewo2a+bg7ZjMGOO7vmBEH3Z5QG1gjCej0Al/xNRZJFt0I+Z06T
 /bZdyS30sFlFGvI37Vmijx9TASrP9dlLse7ulOsNLqQLmHdMfdZuvPGc8
 APXu3Zzv59IBI5fOhNEK1Pa1AM4Ke8o0roCwdq/63vsR+kmSFvyZ2AYuq
 GzyFpV9gMqS48RUJ/GFhMeHy4p8UBxup1UEtFpM5jpmyUyKJhUvlyTsbT
 GGQaPYKbU3gC9+tA84JqPfzLKa7ZOse4qTno39V0RyAKBVTozTZM8iBam
 2NCv467H29PwJvVjS9SwEAe/NkGHZS9z+Enn70dC3mTyk0Um6ILiYVcEV Q==;
X-CSE-ConnectionGUID: w9ZKgIsfRSKHTgtiVlwOzQ==
X-CSE-MsgGUID: vwK0WWcuRrqxJ+s9gXIM1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68030785"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68030785"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 22:40:32 -0700
X-CSE-ConnectionGUID: BHhSwY2WQ4unWr2AJ8sSaw==
X-CSE-MsgGUID: BkeBE7NsQQydMsaxkRpAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="237306478"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 22:40:30 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 03/11] drm/i915/dp: Allow AS SDP only if v2 is supported
Date: Mon, 25 May 2026 10:52:27 +0530
Message-ID: <20260525052235.560741-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260525052235.560741-1-ankit.k.nautiyal@intel.com>
References: <20260525052235.560741-1-ankit.k.nautiyal@intel.com>
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

We do not support AS SDP version 1, so allow AS SDP only if AS SDP v2 is
supported.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 92a650a728d8..7ce45c28cc3a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3172,11 +3172,11 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
 				  struct intel_crtc_state *crtc_state)
 {
-	if (!intel_dp->as_sdp_supported)
+	if (!intel_dp->as_sdp_v2_supported)
 		return false;
 
 	/*
-	 * #TODO Implement AS SDP for DP branch device.
+	 * #TODO: Add AS SDP v1 support for PCONs (DP branch devices).
 	 */
 	if (drm_dp_is_branch(intel_dp->dpcd))
 		return false;
-- 
2.45.2

