Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2356EEA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD85E10E3B0;
	Mon, 23 Feb 2026 13:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sz0HE9NO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED0610E3A7;
 Mon, 23 Feb 2026 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771853406; x=1803389406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IzC0TZkyJMSrIDpNuRyzTnrnsg1iZE7Cn3o+a+uXwV8=;
 b=Sz0HE9NOeHQtJ2DwJkj5IAKd7zcFpuDAYcB6ndsrqN/JTEL/zlNWA8Qn
 kE/FoW7XFp8cR/Zvu3GKH3Xm9cBUU5byUXFM8P/0MUbarrtMsp0vAEIGD
 jSc5bYyMjGO5iI5G3tlcF7+S0Q2HPpZDS20RE06WWVmBD9WVOMnzn2cec
 orWhXjAHG9SkoDJ8o11FLAR/O8xVCxLjododAW0/FS3UED5sCVmvf6Cts
 1n/v9zhhTCGCZvM9mYwrGtfJLf7JpVGFpqVroUANSvT1nXpJBzUTo6Zqy
 8XyTMJv6l2wIXrFwnFOJ8zIpRYqQPXeYdCN/NEhN3Z9LwTHglnjsxd5nY g==;
X-CSE-ConnectionGUID: ogKvoYJBRYSmWHAWyzasew==
X-CSE-MsgGUID: K7eooYHBRMG5AHtBtvXFEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72724159"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72724159"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:06 -0800
X-CSE-ConnectionGUID: aaUn9j/RRx6yga6XeOrQDA==
X-CSE-MsgGUID: dMtsY7WfShyBr/8lN3nBfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215580320"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:04 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 04/14] drm/i915/dp: Update the helper intel_dp_needs_as_sdp()
 for CMRR
Date: Mon, 23 Feb 2026 18:44:16 +0530
Message-ID: <20260223131426.1638946-5-ankit.k.nautiyal@intel.com>
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

AS SDP is supported for both VRR (AVT) and CMRR (FAVT). Update the check
to return true when either VRR or CMRR is enabled.

CMRR is currently disabled in i915, so this change has no functional
impact as of now, but it keeps the logic complete and ready for when CMRR
is enabled.

Subsequent changes will handle AS SDP requirements for Panel Replay.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 65764ab0bb9b..5abb56fb26f7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3114,7 +3114,8 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
 				  struct intel_crtc_state *crtc_state)
 {
-	return crtc_state->vrr.enable;
+	return crtc_state->vrr.enable ||
+	       crtc_state->cmrr.enable;
 }
 
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
-- 
2.45.2

