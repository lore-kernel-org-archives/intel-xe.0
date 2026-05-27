Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FB7CD5BDE
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 04:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8269D10E726;
	Wed, 27 May 2026 04:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVjKZwCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B3010E721;
 Wed, 27 May 2026 04:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779856134; x=1811392134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Pr4XF06uWyckodvoQ6sT9ZDFJdf98+4qaMj8SZO8sk=;
 b=BVjKZwCRv+fJMOXalCHyQ66PIDOlw1pCmfMauxFO6p6aOnhJyghynlvV
 rF6kvGBHoAx86YYpnCoLdY7fqj4FVnjmsd03VGlNWhFArgjIPBLnJtw/N
 NisAt8GF3iwlrkBFSOoH90QerJ7jDGvjPqdhW9Wp6cQUN8VoPGmeFeSkl
 kb2obkVae0OSNOtAwG48sQOKKkwt8DITwlnmFTNRiYaL5ub3BrhVA9cF6
 TMLibQ763v43SV3K50/HZUnCeVs7pC8/MhFZzuuCj2dKeUUCD7bgNfsYq
 pYf4usgKeouLC4TuQietLFhbqOQIut7+AJDax+S39OAUs2yn6Ry8ZTofa Q==;
X-CSE-ConnectionGUID: e7AyAirORXWlOlW2BBDWYg==
X-CSE-MsgGUID: w3evND7oTqmA/MsKW7Eu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80405801"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80405801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:28:52 -0700
X-CSE-ConnectionGUID: HyVtfEZiRoqI2DWFDB4UPA==
X-CSE-MsgGUID: zbjdr00FQQi/enmc7Aobmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="272452360"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:28:46 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 03/12] drm/i915/dp: Allow AS SDP only if v2 is supported
Date: Wed, 27 May 2026 09:40:41 +0530
Message-ID: <20260527041050.601735-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260527041050.601735-1-ankit.k.nautiyal@intel.com>
References: <20260527041050.601735-1-ankit.k.nautiyal@intel.com>
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

