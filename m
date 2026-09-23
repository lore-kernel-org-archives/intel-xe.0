Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5DBC9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 16:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF8010E94B;
	Wed, 23 Sep 2026 16:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsWe8Hvq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A8410E94B;
 Wed, 23 Sep 2026 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790181806; x=1821717806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2xuuMe/KUDQu8fOaTBW1zVt8L6yS7WQJN1wQVMb6Hqo=;
 b=RsWe8HvqDbWqSj7npPUFSxSdlk4CjvJ95NHtwnk2OA0aLfficfw9prVc
 +7BEnBPWicn+L1fHfbd8HFRkRT0/g8TSoPmuA74fgkFC260w9u+CHME8F
 hF8z0XHD4PloigTWVef0UIRmNjelskHtNY32VWozVRP6s94bQakF/725b
 dr42DQvHeQRrUWAaxP5jJvz8Y5noCIP2oGccrIiFnPLIRjlRAlFTdfnrk
 i/xecSxm4X9R3XqWvOESFYHhgxQQEMzrdCw2lN3p3aAVKNbIAPBN90p0x
 t0ojl2ON6tyq0FQWNGHyDphjzRyix/VyKz3imgbaeqAHjKNpJT4lRP4eG g==;
X-CSE-ConnectionGUID: yUmkgu0/ThiB4AQYYoG8Ww==
X-CSE-MsgGUID: a8wC+LwMTquIr0dW3/7IgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90922952"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90922952"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:43:26 -0700
X-CSE-ConnectionGUID: 5zCp1T8EQ26cR1pGuCLI/g==
X-CSE-MsgGUID: B7E4jUQhRzCSF0xl9yD06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4776632"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.46])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 09:43:25 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Xizhe Tang <xizheTang2005@163.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 1/3] drm/i915/vrr: Use vrr.in_range to determine if we need
 the AS SDP
Date: Wed, 23 Sep 2026 19:43:19 +0300
Message-ID: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

intel_vrr_possible() is seriously misnamed now. In the past it
used to tell us whether VRR might get enabled (now or later),
but now all it tell us whether we have something to program into
the VRR timing generator registers (which we pretty much always
do, even when we don't have a VRR monitor). Thus the use of
intel_vrr_possible() in intel_dp_needs_as_sdp() is nonsense.

Switch over the checking crtc_state->vrr.in_range instead, which
actually tells us whether actual VRR timings might get used
at some point. This is also what we use to program the DPCD
DP_MSA_TIMING_PAR_IGNORE_EN bit. Thus we shall only transmit the
AS SDP on VRR capable sinks, and only when the refresh rate is
in the VRR range.

The one slight snag with crtc_state->vrr.in_range is that we
don't have readout for it since it is derived from DPCD/EDID
which aren't part of readout. Thus the potential issue
highlighted in the comment in intel_dp_update_downspread_ctrl()
may now extend to the AS SDP bits as well. In particular if we
end up taking the full modeset path during during initial_commit(),
we may end up calculating the guardband differently than during
a later proper userspace commit (which will have access to
DPCD/EDID derived information). But the proper way to fix those
issues might be to eliminate all reasons for a full modeset
computation during initial_commit()...

Cc: Xizhe Tang <xizheTang2005@163.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9252
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ffddf4b33728..98349aedd855 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3113,7 +3113,7 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
 	    !intel_psr_pr_async_video_timing_supported(intel_dp))
 		return true;
 
-	return intel_vrr_possible(crtc_state);
+	return crtc_state->vrr.in_range;
 }
 
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
-- 
2.54.0

