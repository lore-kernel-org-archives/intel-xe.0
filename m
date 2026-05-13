Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE5BCD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 07:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E0510ED46;
	Wed, 13 May 2026 07:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSVuWX+t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F53910ED46;
 Wed, 13 May 2026 07:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778659139; x=1810195139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bae0w6bpiRCW3QhV0j+b3LZY4yKhvNDeTh3NLpc88fI=;
 b=nSVuWX+tLVw4GdHqeJInjKYp2wBEWF8IsRcwp4I37sXjOrw5lKGOQmpE
 voPQ7uQil/r3YMEykiZAw63QZJflSbpPQ4DsbGHMJOPIqsQAsOuvW0ey6
 DR/ZwrD0xvIhNd4whrp8B7zW84qoR5eM1afZuEcD2EUiLXH/OrWp/W6sZ
 104IuCyzgkFmdEO/0XkSvTakl4CtEXcgRKhtYUHiCRkRgVByZiQZ6bpZ8
 n/nHrKXNPtA2iAszGZLIPlR1pUSBVvGOQ5dFEzfyBsK1a2p0w/WATFb50
 1YXZV8xOogk4TFlqZYwEacJWsiz3kdGqTzxHrESNlzmS818cLOFZG1AcO g==;
X-CSE-ConnectionGUID: fPHVYyGYTe6bYNAjAM61ZA==
X-CSE-MsgGUID: XQDBy5o2QaGqoH0hg8gROQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78606885"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="78606885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 00:58:59 -0700
X-CSE-ConnectionGUID: wRbgmf2XT1e4WTW9mPq7pQ==
X-CSE-MsgGUID: t9XojvHoSEGnUnqsRKi/cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="238257273"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 00:58:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [RESEND 3/6] drm/i915/display: always pass display->drm to
 for_each_intel_crtc*()
Date: Wed, 13 May 2026 10:58:37 +0300
Message-ID: <447a5b2309e213abb849601727d45b406d440c88.1778659089.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778659089.git.jani.nikula@intel.com>
References: <cover.1778659089.git.jani.nikula@intel.com>
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
index 33d8f6b6afea..4cd07410ad72 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -3533,10 +3533,11 @@ static void ilk_pipe_wm_get_hw_state(struct intel_crtc *crtc)
 
 static int ilk_sanitize_watermarks_add_affected(struct drm_atomic_commit *state)
 {
+	struct intel_display *display = to_intel_display(state->dev);
 	struct drm_plane *plane;
 	struct intel_crtc *crtc;
 
-	for_each_intel_crtc(state->dev, crtc) {
+	for_each_intel_crtc(display->drm, crtc) {
 		struct intel_crtc_state *crtc_state;
 
 		crtc_state = intel_atomic_get_crtc_state(state, crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 682a0514ec81..7126a88ca090 100644
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
index a1f9558d53af..911ae261d1b5 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1794,6 +1794,7 @@ static u8 intel_joiner_affected_planes(struct intel_atomic_state *state,
 static int intel_joiner_add_affected_planes(struct intel_atomic_state *state,
 					    u8 joined_pipes)
 {
+	struct intel_display *display = to_intel_display(state);
 	u8 prev_affected_planes, affected_planes = 0;
 
 	/*
@@ -1811,7 +1812,7 @@ static int intel_joiner_add_affected_planes(struct intel_atomic_state *state,
 	do {
 		struct intel_crtc *crtc;
 
-		for_each_intel_crtc_in_pipe_mask(state->base.dev, crtc, joined_pipes) {
+		for_each_intel_crtc_in_pipe_mask(display->drm, crtc, joined_pipes) {
 			int ret;
 
 			ret = intel_crtc_add_planes_to_state(state, crtc, affected_planes);
-- 
2.47.3

