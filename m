Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F34D5E146
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 13:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CCA10E969;
	Tue, 16 Dec 2025 13:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fu33P1N6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A8910E7E3;
 Tue, 16 Dec 2025 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765890246; x=1797426246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xBwTA9Istr+bytxUSDmN3Q4KXncHHZw/yKkNjExx06E=;
 b=fu33P1N6uLFBx1euzeArEt17fdiaCG7Ngvj0EAZxv0lS4T8PIqGcX2sr
 w7UhH9W2wJGatma+3/r+Qi6oxgNvyrX4vl8HS4R2vhJdlJvzPMze93P0q
 z5GeAqbSIq1RqdcO70UiLt8fe8az6MMgiiFHlXp2FQD0bAAu3Ov7lVeRn
 1UyNxT49NLw4vQFgHm3A8zXhUBmpO7dhpML8PTAJRet6D2vRRKBLp+p39
 NK6YviTtG6pyFWbbCMH+mUineQHj6fPSRg+h+5MphG4k4tBrlwqRC79iK
 Dmh0Zj3se2E0x9dKRM/fTtvjpGsmNrXUk43dQ0P5vVbaOKvjTVFp5Yala Q==;
X-CSE-ConnectionGUID: GN8YU5TyT3KDJM8CPf87kA==
X-CSE-MsgGUID: L+OB9jhWTOKr3XYiLUu43g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55377848"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="55377848"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 05:04:06 -0800
X-CSE-ConnectionGUID: rMcnPhJ3T3+r/v7IMFOtnQ==
X-CSE-MsgGUID: bRdmfd6cTvebTDlwClVePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="202921623"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.133])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 05:04:04 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/i915/display: Allow async flip when Selective Fetch is
 enabled
Date: Tue, 16 Dec 2025 15:03:51 +0200
Message-ID: <20251216130351.2799110-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Fix silent conflict during drm-next backmerge causing async flips being
rejected when Selective Fetch is enabled.

Fixes: b8304863a399 ("Merge drm/drm-next into drm-intel-next")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9c6d3ecdb589e..d5947cc9b94c5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6026,14 +6026,6 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
 		return -EINVAL;
 	}
 
-	/* FIXME: selective fetch should be disabled for async flips */
-	if (new_crtc_state->enable_psr2_sel_fetch) {
-		drm_dbg_kms(display->drm,
-			    "[CRTC:%d:%s] async flip disallowed with PSR2 selective fetch\n",
-			    crtc->base.base.id, crtc->base.name);
-		return -EINVAL;
-	}
-
 	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
 					     new_plane_state, i) {
 		if (plane->pipe != crtc->pipe)
-- 
2.43.0

