Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25A7CD37AC
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 14:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B607210E2F8;
	Sun, 17 May 2026 14:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCZNFFSy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE3E10E2F8;
 Sun, 17 May 2026 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779028941; x=1810564941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fOAv2qln8PL+Qsw/3usKiEERQf+3leV786w91t/aQ+U=;
 b=UCZNFFSyxeIjk5RagscGHzxXpkMQgzdCHeQYymo173jUu/bGBFEUSJ3V
 NI2X9Di5WJveOTxARwfPyCPbJ/MoeKR40YD/VJMWpZL7f8EvLeEOpm3cb
 jZEDK8lYH+ueAyLvZc+A2M2rKDrIc5eFJPVl/n4odgmkLa3oVucEOUCPj
 VQcjYd58ye930fIoKVPJOP+Yr7hk5pDtluWuTQ79f+j2oKwO5XxPZZ0UD
 4cXBMu3Zf+f/qK60Vu68UN9qKNehvbX22ud9w+V78VtodMs3gQFtjX7c1
 oVv9FgsiSrUl9KF23xfG2tQx3Y2iEm1t53JcQ6+BFcC3WFA/XxWNOqLHw w==;
X-CSE-ConnectionGUID: WzVLqCR2ScyjTtaKhan5MQ==
X-CSE-MsgGUID: b8wggB/FRgSePssYjvq6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="102575521"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; d="scan'208";a="102575521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 07:42:21 -0700
X-CSE-ConnectionGUID: 0nvb1auJQeegR77+7Smwxw==
X-CSE-MsgGUID: bVaG9P2mTGmlIP8AGxCdBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; d="scan'208";a="236552056"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 07:42:19 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 1/2] drm/i915/psr: Simplify the conditions for SCL computation
Date: Sun, 17 May 2026 19:57:52 +0530
Message-ID: <20260517142753.2813959-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260517142753.2813959-1-ankit.k.nautiyal@intel.com>
References: <20260517142753.2813959-1-ankit.k.nautiyal@intel.com>
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

'needs_sel_update' is common for both display version branches, so check it
once and keep the version specific checks as separate early returns.

v2: Split into separate early returns. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 546ce9846865..f6cd88902be9 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1477,15 +1477,18 @@ int _intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state
 	 * SRD_STATUS is used by PSR1 and Panel Replay DP on LunarLake.
 	 */
 
-	if (DISPLAY_VER(display) >= 30 && (needs_panel_replay ||
-					   needs_sel_update))
+	if (needs_sel_update)
 		return 0;
-	else if (DISPLAY_VER(display) < 30 && (needs_sel_update ||
-					       intel_crtc_has_type(crtc_state,
-								   INTEL_OUTPUT_EDP)))
+
+	if (DISPLAY_VER(display) < 30 &&
+	    intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
 		return 0;
-	else
-		return 1;
+
+	if (DISPLAY_VER(display) >= 30 &&
+	    needs_panel_replay)
+		return 0;
+
+	return 1;
 }
 
 static bool _wake_lines_fit_into_vblank(const struct intel_crtc_state *crtc_state,
-- 
2.45.2

