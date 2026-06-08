Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC8BCD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 06:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDF310ED7C;
	Mon,  8 Jun 2026 06:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IB4kCKI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6816A10ED7C;
 Mon,  8 Jun 2026 06:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780900248; x=1812436248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3T29CZBKwEBCXMX47yH4M1aPxuyyOe54+BX25HuaHSw=;
 b=IB4kCKI+cX+Rr8idlF3uwsWa5vK2F/lCzJ4GsurRIViw9MSBZ2Q6adA+
 teUDuvlcQNPZLXuFwBt0R9WLckhO3ewXD0YTFugb6CFd2z9R96UNzstzD
 lqhhh6x8xx0szteugwaKMvUesxMicWx3lpLiR92MVUYykst1vgza1BxZZ
 RA86+Qwi0wmG7bDevSGi3VUhKYR1p4BnJap1KdxoyQIu32OI/9sWjSfCp
 ZhFRo7C/x5HSSchKlO+MqXLNIVegB+qGtZ0u6OJ7lmjaleTDKOVl3GnMo
 c3Kh3r48bgywBvepeqMGsVzBKG3aHb6f+Mj7xg8+6qA6P3xbWWdlpXddR A==;
X-CSE-ConnectionGUID: wMtPqpjrSim0n7iFoYvK0w==
X-CSE-MsgGUID: M3q73AGBREaBvXbi5Ikc9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85482726"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85482726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 23:30:41 -0700
X-CSE-ConnectionGUID: gQFBUtZ6QdKNN7p3+Im7Tw==
X-CSE-MsgGUID: +YRQ8pE9RVq08o59sUfl4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269158666"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2026 23:30:38 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 5/6] drm/i915/cursor: Program secondary cursor planes
Date: Mon,  8 Jun 2026 11:56:28 +0530
Message-Id: <20260608062629.820477-6-nemesa.garg@intel.com>
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

During the vblank-evade, program all joined cursor
planes using intel_plane_update_noarm()/intel_plane_update_arm()
or intel_plane_disable_arm() based on plane visibility.

V2: Check primary and secondary pipe together. [Ville]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 147ed6efb174..cb1fcae8a445 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -896,6 +896,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	struct intel_vblank_evade_ctx evade;
 	struct intel_plane_state *old_pipe_states[4] = {};
 	struct intel_plane_state *new_pipe_states[4] = {};
+	struct intel_crtc_state *pipe_crtc_states[4] = {};
 	struct intel_plane *pipe_planes[4] = {};
 	struct intel_crtc *pipe_crtcs[4] = {};
 	struct intel_crtc *pipe_crtc;
@@ -977,6 +978,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	pipe_planes[num_pipes] = plane;
 	pipe_crtcs[num_pipes] = crtc;
+	pipe_crtc_states[num_pipes] = crtc_state;
 	old_pipe_states[num_pipes] = old_plane_state;
 	new_pipe_states[num_pipes] = new_plane_state;
 	num_pipes++;
@@ -1032,6 +1034,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 		pipe_planes[num_pipes] = pipe_plane;
 		pipe_crtcs[num_pipes] = pipe_crtc;
+		pipe_crtc_states[num_pipes] = pipe_crtc_state;
 		old_pipe_states[num_pipes] = old_pipe_plane_state;
 		new_pipe_states[num_pipes] = new_pipe_plane_state;
 		num_pipes++;
@@ -1087,11 +1090,17 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		local_irq_disable();
 	}
 
-	if (new_plane_state->uapi.visible) {
-		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
-		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
-	} else {
-		intel_plane_disable_arm(NULL, plane, crtc_state);
+	for (int i = 0; i < num_pipes; i++) {
+		if (new_pipe_states[i]->uapi.visible) {
+			intel_plane_update_noarm(NULL, pipe_planes[i],
+						 pipe_crtc_states[i],
+						 new_pipe_states[i]);
+			intel_plane_update_arm(NULL, pipe_planes[i],
+					       pipe_crtc_states[i],
+					       new_pipe_states[i]);
+		} else {
+			intel_plane_disable_arm(NULL, pipe_planes[i], pipe_crtc_states[i]);
+		}
 	}
 
 	local_irq_enable();
-- 
2.25.1

