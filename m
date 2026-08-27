Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ECDC61DCD
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9317710EA8A;
	Thu, 27 Aug 2026 16:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcfyFcxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96AB10EA8A;
 Thu, 27 Aug 2026 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849085; x=1819385085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3eNTeqz29gXIA2Cqoo8BWcdQp6OhN1vB2690TSs6DvQ=;
 b=CcfyFcxK2dcvTwVrBZElBitTl3LOQgKOO0/oJcRFNAELJmAljCLWVHXU
 3TYC3jJ7F4Lf6cM49z2cKJWuYTPrJu8R59V05luckK2CzoOVIejfszjU/
 XnEJuzr08g/y+aBO7rApa2tZff/WHhxwLgP2s7NkH0ZWjl2y/f4gP0Mbq
 cuHWmCDhxKNiG7eyoSATG2At3grKo3Tepdo7S4s0JBD+TA/Z0xEcMJg06
 eojQOkHlthAubxASGlG6OciNth6mZOZL0IMKmqaFSmSCLLQ02MOZ1AA//
 tDxs6aYXGV10r10WUXZmNu0vbqnuPlLzGqDo4fjWdfQGTn7pvTQN+1EQ9 g==;
X-CSE-ConnectionGUID: ph3SUllNSRKHqXFgR8cs8Q==
X-CSE-MsgGUID: c0pfl8XiQ8GcP1DC8OWQjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88276130"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88276130"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:44:45 -0700
X-CSE-ConnectionGUID: JO6NwSjRSi6D5Fh2XOh+yQ==
X-CSE-MsgGUID: tKuVersFQyGjYrRYfc5lNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="306134051"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 27 Aug 2026 09:44:43 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 1/5] drm/i915/cursor: Check joiner cursor commit status
Date: Thu, 27 Aug 2026 22:11:59 +0530
Message-Id: <20260827164203.2371794-2-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827164203.2371794-1-nemesa.garg@intel.com>
References: <20260827164203.2371794-1-nemesa.garg@intel.com>
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

In joiner mode, secondary cursor commits may still be running
even when the primary cursor commit is done. Walking the secondary
pipes also requires holding the secondary planes modeset locks.
Add intel_cursor_lock_joined_planes() to acquire modeset locks
for all secondary cursor planes. Check all joined cursor commit
status before taking the fast path. If any commit is still pending,
fallback to slow path.

v2: Use intel_crtc_joined_pipe_mask(). [Ville]
v3: Lock secondary cursor CRTCs and planes. [sashiko]
v4: Iterate the full joined mask uniformly in both helpers, no
    primary special-case.
    Move the parameter-change check above the lock acquisition so
    we don't grab secondary locks just to fall to slow path. [Chaitanya]
v5: Remove extra header declaration. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 68 ++++++++++++++++++---
 1 file changed, 59 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 86bb96ac449b..47ddb213e547 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -801,6 +801,50 @@ void intel_cursor_unpin_work(struct kthread_work *base)
 	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
 }
 
+static int intel_cursor_lock_joined_planes(struct intel_display *display,
+					   const struct intel_crtc_state *crtc_state,
+					   struct drm_modeset_acquire_ctx *ctx)
+{
+	struct intel_crtc *pipe_crtc;
+	int ret;
+
+	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
+					 intel_crtc_joined_pipe_mask(crtc_state)) {
+		struct intel_plane *pipe_plane =
+			intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
+
+		ret = drm_modeset_lock(&pipe_crtc->base.mutex, ctx);
+		if (ret)
+			return ret;
+
+		ret = drm_modeset_lock(&pipe_plane->base.mutex, ctx);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static bool
+intel_cursor_joiner_commits_idle(struct intel_display *display,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_crtc *pipe_crtc;
+
+	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
+					 intel_crtc_joined_pipe_mask(crtc_state)) {
+		struct intel_plane *pipe_plane =
+			intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
+		struct intel_plane_state *pipe_plane_state =
+			to_intel_plane_state(pipe_plane->base.state);
+
+		if (pipe_plane_state->uapi.commit &&
+		    !try_wait_for_completion(&pipe_plane_state->uapi.commit->hw_done))
+			return false;
+	}
+
+	return true;
+}
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -838,15 +882,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	    crtc_state->joiner_pipes)
 		goto slow;
 
-	/*
-	 * Don't do an async update if there is an outstanding commit modifying
-	 * the plane.  This prevents our async update's changes from getting
-	 * overridden by a previous synchronous update's state.
-	 */
-	if (old_plane_state->uapi.commit &&
-	    !try_wait_for_completion(&old_plane_state->uapi.commit->hw_done))
-		goto slow;
-
 	/*
 	 * If any parameters change that may affect watermarks,
 	 * take the slowpath. Only changing fb or position should be
@@ -860,6 +895,21 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	    !old_plane_state->uapi.fb != !fb)
 		goto slow;
 
+	ret = intel_cursor_lock_joined_planes(display, crtc_state, ctx);
+	if (ret == -EDEADLK)
+		return ret;
+	if (ret)
+		goto slow;
+
+	/*
+	 * Don't do an async update if there is an outstanding commit modifying
+	 * any of the joined cursor planes. This prevents our async update's
+	 * changes from getting overridden by a previous synchronous update's
+	 * state.
+	 */
+	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
+		goto slow;
+
 	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
 	if (!new_plane_state)
 		return -ENOMEM;
-- 
2.25.1

