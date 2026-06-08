Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28134CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 06:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B6C10ED7A;
	Mon,  8 Jun 2026 06:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJ/BPMN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FC810ED76;
 Mon,  8 Jun 2026 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780900246; x=1812436246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rcp4Cud83cwBxr8/2c/DwdlpsmZq7KCl/Uc5QgMRduQ=;
 b=KJ/BPMN9NCwkdK+62mQsSvU3dQKPmXVP9nLlGmKxTfy8dRTcusBar+yO
 OhPpTIa+cFmKHAyggqtX+ZNd3DZlrlBUqHRe8n6ahi0qJpMNH1rByvfRq
 ylsFrDA9NdR57625PkgkOSh+sdTEFJxRYljbqxG1tBEgh/yWjfJTGtznD
 pzbLThI7PQiaJvR5HUGLzCHZf1M00A2AK4T2QaNDfcNry0bYWjRtUM8FF
 1K5vOa2DalW6vHbKSQHQoiFkLWfLDLubowPuahQ5OA4y0rsxCu61RkUYA
 KLbQ8VCZMYYEwQ8Jz2yJdPGzXQoXenAhGLTyd8q0t81iD0iN5ric/FCmI A==;
X-CSE-ConnectionGUID: CW9moZWwQJK3BlLWvG1UPA==
X-CSE-MsgGUID: A7143YLwR76tdEoXTExBTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85482697"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85482697"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 23:30:37 -0700
X-CSE-ConnectionGUID: cKMVm0KFRdqm6UtbVNxkaw==
X-CSE-MsgGUID: SteGbK9KRmCDiHBUjU2WEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269158625"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2026 23:30:36 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 4/6] drm/i915/cursor: Sync joiner secondary cursor state
Date: Mon,  8 Jun 2026 11:56:27 +0530
Message-Id: <20260608062629.820477-5-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260608062629.820477-1-nemesa.garg@intel.com>
References: <20260608062629.820477-1-nemesa.garg@intel.com>
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

Before entering the vblank evade window, swap in the new
plane states for all joined cursor planes uniformly and update
each pipe crtc's active_planes bitmask to reflect the
new cursor visibility.

The bitmask is updated on the live crtc state (read via
pipe_crtcs[i]->base.state) rather than on the duplicated
new_crtc_state, since the duplicate is destroyed at out_free and
its value would otherwise be lost. The same update is applied
uniformly to primary and secondary pipes based on
new_pipe_states[i]->uapi.visible.

v2: Check primary and secondary pipe together. [Ville]
v3: Update active_planes on the live crtc state for all pipes. [sashiko]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 3da2c2308081..147ed6efb174 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -1045,9 +1045,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 					to_intel_frontbuffer(new_pipe_states[i]->hw.fb),
 					pipe_planes[i]->frontbuffer_bit);
 
-	/* Swap plane state */
-	plane->base.state = &new_plane_state->uapi;
-
 	/*
 	 * We cannot swap crtc_state as it may be in use by an atomic commit or
 	 * page flip that's running simultaneously. If we swap crtc_state and
@@ -1058,7 +1055,17 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * planes atomically. If the cursor was part of the atomic update then
 	 * we would have taken the slowpath.
 	 */
-	crtc_state->active_planes = new_crtc_state->active_planes;
+	for (int i = 0; i < num_pipes; i++) {
+		struct intel_crtc_state *pipe_crtc_state =
+				to_intel_crtc_state(pipe_crtcs[i]->base.state);
+
+		pipe_planes[i]->base.state = &new_pipe_states[i]->uapi;
+
+		if (new_pipe_states[i]->uapi.visible)
+			pipe_crtc_state->active_planes |= BIT(PLANE_CURSOR);
+		else
+			pipe_crtc_state->active_planes &= ~BIT(PLANE_CURSOR);
+	}
 
 	intel_vblank_evade_init(crtc_state, crtc_state, &evade);
 
-- 
2.25.1

