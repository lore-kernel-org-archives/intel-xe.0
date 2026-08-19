Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5319C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F6C10E564;
	Wed, 19 Aug 2026 14:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCP7/boM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3A410E564;
 Wed, 19 Aug 2026 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787148322; x=1818684322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O1Saacerl79a01+K8w23l27XRpzrj8Okm8VujDh6kbw=;
 b=aCP7/boMBw4k/XQ/hBAYjMHXJML+3Ztsf+iZtbXWsYXUWd848xOmLtBB
 zQet0VapZY2KWMnYtas2L+ZnoD3y6uQGnQyWeupvB5CdHMV5D148rOesK
 /FUPzovLdx6Q2Rb+ajtoKTZSb5GpEbuEXtkAfVVEWjC/2WA/ozjn/suvO
 lsVMcIaLiJbDw+4m6NOv4kk/pvqp+GzbQeCrTq06mHe6OTw7bieRNVVlF
 6Lv6OIpJaCP0oqJas31NgiOW+moAr9nQgJsLlb6SFkYfBojgMhvjtIxMX
 EM+0Xym5lftR47AeaUR3FGhL1NwY9fTymTvYTcUfrD5QbJrrFFuuLQcO4 Q==;
X-CSE-ConnectionGUID: 00v8DAFFQWax6aWAd2Pq7Q==
X-CSE-MsgGUID: YOwFuiiTSX6uVno11G4M8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87582405"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87582405"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:22 -0700
X-CSE-ConnectionGUID: 6YaMrtcyQQCn5jVF3uuNUw==
X-CSE-MsgGUID: rGS7s1AtS1qcDF0w659EgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="259393246"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 1/4] drm/i915/display: use struct intel_atomic_state *state
 variable naming
Date: Wed, 19 Aug 2026 17:05:10 +0300
Message-ID: <957d574cb8472e5d4455f647cfd83a6db1c648b0.1787148235.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787148235.git.jani.nikula@intel.com>
References: <cover.1787148235.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

The struct intel_atomic_state * pointer variables and parameters are
named "state" everywhere. Follow suit in
intel_atomic_commit_fence_wait().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 553c60d452dd..12916e313821 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7272,14 +7272,14 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 	drm_WARN_ON(display->drm, update_pipes);
 }
 
-static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_state)
+static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 {
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
 	long ret;
 	int i;
 
-	for_each_new_plane_in_state(&intel_state->base, plane, new_plane_state, i) {
+	for_each_new_plane_in_state(&state->base, plane, new_plane_state, i) {
 		if (new_plane_state->fence) {
 			ret = dma_fence_wait_timeout(new_plane_state->fence, false,
 						     i915_fence_timeout());
-- 
2.47.3

