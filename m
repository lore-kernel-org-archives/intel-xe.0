Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA346CFD379
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 06:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800B410E34C;
	Tue, 25 Nov 2025 06:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVNL9Eui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBB910E34C;
 Tue, 25 Nov 2025 06:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764052393; x=1795588393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUUViv/t04hXV5XLzYXypv7loGN48K1kOpdHxHpmY9w=;
 b=iVNL9EuiAVIGDk059p3EFwO8LnNc99vr84yDLrmY0pinwlxyAeJQpvEv
 ygBfH55sO0fLf8NkvAeBjn01x5hwBdu022GHSZppevNI+0CAbS5/RoQTm
 Y8F6aJqbm1zhP7d+HM3oD792lbBv8QI+aI3PUssszGiPVHBqeLIBDWuhe
 JYDtVogxZnqr0569VOpnuYq8bN9N4IHQQBATdMmsEsMlnub9gznTrEYBP
 uiXNZTSxn2MgkrnDKC4hrZt+ziMxnIXKq6TVSKkmy+tW2aHWDJ2dkckWi
 8ME07Uz+nqHTUClktgmLeJXbCmqTHRi5AtRO9gPc+vqnYELFqNpmenmqa g==;
X-CSE-ConnectionGUID: 1AC74wCMSLGmRKgfo3avTA==
X-CSE-MsgGUID: PREe4WB1SIqf7Gi7NKhEhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68652132"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="68652132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 22:33:12 -0800
X-CSE-ConnectionGUID: 2vO6CggvRsKZobF0Ae00fA==
X-CSE-MsgGUID: lwjzj42aR4uhtMbHN9MXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="192991829"
Received: from carterle-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.198])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 22:33:11 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 4/4] drm/i915/psr: Allow async flip when Selective Fetch
 enabled
Date: Tue, 25 Nov 2025 08:32:53 +0200
Message-ID: <20251125063253.328023-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125063253.328023-1-jouni.hogander@intel.com>
References: <20251125063253.328023-1-jouni.hogander@intel.com>
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

Now as Selective Fetch is performing full frame update on async flip and
vblank evasion is done as needed we can allow async flip even when
Selective Fetch is enabled.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 04f5c488f399..a8a3e8000187 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6017,14 +6017,6 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
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

