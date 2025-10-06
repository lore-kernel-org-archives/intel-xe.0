Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B39CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 16:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D6510E433;
	Mon,  6 Oct 2025 16:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBqTPmNM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1190A10E432;
 Mon,  6 Oct 2025 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759769216; x=1791305216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVf6TAVbjs+BpS2s4xoozCVyRBswqm4QdISBzNPQ2vA=;
 b=hBqTPmNMy/RrS3iRUZ/EKqbH1aqEiK0fPcoOJo1KseGS6cEsN+F0lzgh
 XCkO9VVckiKZuBJRPtiGNKvZHglPs9FGXH9w0ykr59XxB0WCHIp8jg3np
 SntuAOE7woyyO44euJYZkVUa+d9QYQMHzB2Ugq0AwzfEnN+d0yfA4m5dh
 k3hhOPZdrFNsyg1KwXkj9qzd61PIjYqaL3RH6r/Co/srGSCLRobpxX66S
 GHYInR2ygZn8ck729SrVNiqDi47HjpQxpCFGW98KET4hMcD1MfBmkDYsC
 qMlKKbLDNAlXPxDZ4mKfBgMKDmnzFpg4KqQGnEUZvW59qRQvIR7QPIhAu Q==;
X-CSE-ConnectionGUID: 3BGoZWmRQg2X5tCBHKOnbA==
X-CSE-MsgGUID: 4TvVEQ2uRpSSv8xDkFrk7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65795638"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="65795638"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 09:46:56 -0700
X-CSE-ConnectionGUID: INwI7eBBTvCXk0ZgNJCHLw==
X-CSE-MsgGUID: M+rQxijqSASxxYqde2NI0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179861474"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.80])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 09:46:54 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/10] drm/i915/overlay: Drop the DIRTYFB flush
Date: Mon,  6 Oct 2025 19:46:39 +0300
Message-ID: <20251006164648.6761-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251006164648.6761-1-ville.syrjala@linux.intel.com>
References: <20251006164648.6761-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I don't even know why we have this DIRTYFB flush in the overlay
code. We'll anyway call intel_frontbuffer_flip() so there should
be no need to pretend that this is some kind of frontbuffer only
rendering operation.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 272f9e7af4d4..8400a0236cdd 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -821,8 +821,6 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 		goto out_pin_section;
 	}
 
-	i915_gem_object_flush_frontbuffer(new_bo, ORIGIN_DIRTYFB);
-
 	if (!overlay->active) {
 		const struct intel_crtc_state *crtc_state =
 			overlay->crtc->config;
-- 
2.49.1

