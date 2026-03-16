Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C9EF53D70
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 16:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD39C10E2DF;
	Mon, 16 Mar 2026 16:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oi5zgbPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48310E2DD;
 Mon, 16 Mar 2026 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773679212; x=1805215212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=acFVAbOsLZTzwNRjuyrAAZSFXUFtzlCBOyUs4KCKZdg=;
 b=Oi5zgbPE9PkJGQ640TV+6L6wpbvEofhe24AI3R3u5gGA0jAEECIB26RJ
 HAcBubN7A9LvfyZzPIMn9umjoz+RdsC2OqbOGlGe5aYtzXJ8Bh+wAt24j
 exPpAgsMpDP1nlMjAAgGlrjbDU7l5qWHavH+wOa3ZYs0PMQ13Hwr51tX5
 WKNccV3WceZqu9Q1QOa2PpJ80AGMdlQaAF53j6gAiVbeeOfgCZI/BaRgj
 amZWf0BdPaF3iiM09XhSLjcy0i2pSHmtzljYQ7zPrxN7Nny/01vDAvnTV
 ppbS5/2p3OZpCrFYAdzdlh4tUCVV3uZXr86bx67bxPKhqNn6wX0r84sRO w==;
X-CSE-ConnectionGUID: Rhd13fAWRr6F7iNd0gQvHQ==
X-CSE-MsgGUID: wr4QPMFuQDyE55DGaltbeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="92085630"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="92085630"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:40:12 -0700
X-CSE-ConnectionGUID: c7aeiS8rSwGBRFu3Ag7xiQ==
X-CSE-MsgGUID: ZE+cMUABTSihn/ri9wWQlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222190563"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:40:09 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Subject: [PATCH 3/3] drm/i915: Skip redundant NV12 plane unlinking
Date: Mon, 16 Mar 2026 18:39:53 +0200
Message-ID: <20260316163953.12905-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316163953.12905-1-ville.syrjala@linux.intel.com>
References: <20260316163953.12905-1-ville.syrjala@linux.intel.com>
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

plane_atomic_check() will already have unlinked the
old NV12 planes by the time icl_check_nv12_planes()
gets called. Drop the redundant second unlinking.

Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index bc1c801a06d7..5390ceb21ca4 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1547,17 +1547,6 @@ static int icl_check_nv12_planes(struct intel_atomic_state *state,
 	if (DISPLAY_VER(display) < 11)
 		return 0;
 
-	/*
-	 * Destroy all old plane links and make the Y plane invisible
-	 * in the crtc_state->active_planes mask.
-	 */
-	for_each_new_intel_plane_in_state(state, plane, plane_state, i) {
-		if (plane->pipe != crtc->pipe)
-			continue;
-
-		unlink_nv12_plane(crtc_state, plane_state);
-	}
-
 	if (!crtc_state->nv12_planes)
 		return 0;
 
-- 
2.52.0

