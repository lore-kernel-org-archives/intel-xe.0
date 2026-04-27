Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C227FFF8861
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 11:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405A10E6C3;
	Mon, 27 Apr 2026 11:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/iNjQNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189F010E6C3;
 Mon, 27 Apr 2026 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777287890; x=1808823890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XBeCBGlcbECITO9efP6OulyvJDHuU+HxUiiZWNZKjMQ=;
 b=D/iNjQNOkM0/RGf15VqfImNCcoGmqKFsgUYlTQ+Xx2g+yG6vFqYPri+K
 TD9YG98IXjn/YalZEqbsIWdryQSnIH1qJkjhomF2OTIzaZG7z/ZxWcgXP
 vhFfJUbOGNXTSyOehNsU6ad3g4W1jhWNTHSb2e2mrNWkNo7/o9JuQuiT0
 fQO+B5MypZrS+qg5Fqf6DC07Ae4xwA7Hx4jvB9KAw/VAU+PIrhiDQyhvg
 0HkldGyUC9Z82oAw/CkwWnjoPJ56i9mPtZ9fctOKpxaw29Hz3pBvLa2+H
 XnquGc48d0rL2x3geF0Dfhq/bde6k4ZjEkMVhWOh/1j+W+No6PlGbR69P A==;
X-CSE-ConnectionGUID: SFGmrtTRQnqGMgy+MOgQ8Q==
X-CSE-MsgGUID: bwa1ZxM9S9+5mHtZEc5W3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78189067"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78189067"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 04:04:49 -0700
X-CSE-ConnectionGUID: SyaEZc1FQTC4Ko8NPo8EWQ==
X-CSE-MsgGUID: M2evg19DQBuD0MT9U+fkfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="256921714"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.53])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 04:04:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 3/6] drm/i915/display: always pass display->drm to
 for_each_intel_crtc*()
Date: Mon, 27 Apr 2026 14:04:29 +0300
Message-ID: <ba94e12a7fbc07abab3ed1b467de1aab74560d12.1777287836.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777287836.git.jani.nikula@intel.com>
References: <cover.1777287836.git.jani.nikula@intel.com>
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

In preparation for always passing struct intel_display to
for_each_intel_crtc*() family of iterators, start off by unifying their
usage to always having struct intel_display *display around, and passing
display->drm to them.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c       | 3 ++-
 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_plane.c   | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 02ac6f9a3d0e..99a528622989 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -3533,10 +3533,11 @@ static void ilk_pipe_wm_get_hw_state(struct intel_crtc *crtc)
 
 static int ilk_sanitize_watermarks_add_affected(struct drm_atomic_state *state)
 {
+	struct intel_display *display = to_intel_display(state->dev);
 	struct drm_plane *plane;
 	struct intel_crtc *crtc;
 
-	for_each_intel_crtc(state->dev, crtc) {
+	for_each_intel_crtc(display->drm, crtc) {
 		struct intel_crtc_state *crtc_state;
 
 		crtc_state = intel_atomic_get_crtc_state(state, crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 88642fd4b22a..8e27888c6db5 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5692,6 +5692,7 @@ int intel_modeset_commit_pipes(struct intel_display *display,
  */
 static int hsw_mode_set_planes_workaround(struct intel_atomic_state *state)
 {
+	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc_state *crtc_state;
 	struct intel_crtc *crtc;
 	struct intel_crtc_state *first_crtc_state = NULL;
@@ -5719,7 +5720,7 @@ static int hsw_mode_set_planes_workaround(struct intel_atomic_state *state)
 		return 0;
 
 	/* w/a possibly needed, check how many crtc's are already enabled. */
-	for_each_intel_crtc(state->base.dev, crtc) {
+	for_each_intel_crtc(display->drm, crtc) {
 		crtc_state = intel_atomic_get_crtc_state(&state->base, crtc);
 		if (IS_ERR(crtc_state))
 			return PTR_ERR(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index c2b58d3b9c23..be78c8ed76dd 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1678,6 +1678,7 @@ static u8 intel_joiner_affected_planes(struct intel_atomic_state *state,
 static int intel_joiner_add_affected_planes(struct intel_atomic_state *state,
 					    u8 joined_pipes)
 {
+	struct intel_display *display = to_intel_display(state);
 	u8 prev_affected_planes, affected_planes = 0;
 
 	/*
@@ -1695,7 +1696,7 @@ static int intel_joiner_add_affected_planes(struct intel_atomic_state *state,
 	do {
 		struct intel_crtc *crtc;
 
-		for_each_intel_crtc_in_pipe_mask(state->base.dev, crtc, joined_pipes) {
+		for_each_intel_crtc_in_pipe_mask(display->drm, crtc, joined_pipes) {
 			int ret;
 
 			ret = intel_crtc_add_planes_to_state(state, crtc, affected_planes);
-- 
2.47.3

