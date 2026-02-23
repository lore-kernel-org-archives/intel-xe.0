Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082E9EA4FC1
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BD810E3EB;
	Mon, 23 Feb 2026 14:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8UQ+PG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E556F10E3E2;
 Mon, 23 Feb 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855210; x=1803391210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IzC0TZkyJMSrIDpNuRyzTnrnsg1iZE7Cn3o+a+uXwV8=;
 b=Z8UQ+PG/sSkzdAs+IieTGhgCwij0pmt2mSo+BPH06EtRlF/CsHRK4NAt
 Xq5qIgmbOdFHqdnyJ/dn7Qgyz6D89fTdTRe3PkzUBUKUaP2fWJ+EtyGAv
 k3DR85HCitKACk2wIEbQN99A0F9Z/p3/AhAStGyaH1E+DZrWskiatEOU1
 klN2b2/OMKJhf0H3fAN6EAAmOin6evoEtn7NWICfzTJeS5Ibwm1nbU/sy
 6qI+XEFeS7VZJ84uO0jobXN6Q4M0ovzoNefTBdQrIW41xjnhZljTH3X30
 5pqXq+8r2uY5Dh+L3Lqfg7HRxk5S3cBudRa0qlCg+bPG7w+CmgHuymsHX A==;
X-CSE-ConnectionGUID: rklHIYaZQUyBA9+bn9OnKQ==
X-CSE-MsgGUID: voiF6j/QTsW5xWEcHwXh0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72827041"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72827041"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:10 -0800
X-CSE-ConnectionGUID: EbVBVmFPTJq+Ph6e9KCa3g==
X-CSE-MsgGUID: g+DyT2NlSAutKW8BuM4RjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212961181"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:07 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 04/14] drm/i915/dp: Update the helper intel_dp_needs_as_sdp()
 for CMRR
Date: Mon, 23 Feb 2026 19:14:21 +0530
Message-ID: <20260223134431.1639308-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
References: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
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

