Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785E7606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F2XrAVSj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3405E11286B;
	Fri, 20 Nov 2026 09:56:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D44112861;
 Fri, 20 Nov 2026 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795168563; x=1826704563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P2ogfKDcDzDZAGajZNcvLth4J7bBJT83aPIgKjngeTU=;
 b=F2XrAVSjFQXTNEv9X/R8uzH/BEfeVb3tQAFqaoMZMrD1wR2G0qylc095
 jSnCPbofF/n7s94MrBvXkJ7IRHHJPfbtuWjba2ZCKndtxiCNIC8ElO3Pc
 yPz0HiCGMTcn1Urr90ZtC2SWkx9tU07BZnFCI7j1iqbnJ6RrPTFgfFg9d
 WVvlEqy0S9xdauLoZSSJtJ++2QPPjoiRLSyURXWr9X+vT1OtXXRwOQ1ij
 4yTPetrZd/8KValhI2zPhnOdye/3cmww/4CmzeKnPjtcUu6xZA3gYwVuI
 7XZh44GvJRNNboVT12JTPE3M/cF1kQEtybbWRHKR/yFy+DYOGOo+tOw/P Q==;
X-CSE-ConnectionGUID: 61X0nL2SR5ifOlLUPKbNMw==
X-CSE-MsgGUID: LsU39YbpTyGxyuyZlILbuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072518"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4072518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:56:03 -0800
X-CSE-ConnectionGUID: qT2GeUoJQQOczIQFZ1GsLw==
X-CSE-MsgGUID: Pcrd6OHtS0ySVRFeTNNn9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10566989"
Received: from lpankiew-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:56:00 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mika Kahola <mika.kahola@intel.com>, stable@vger.kernel.org
Subject: [PATCH 1/4] drm/i915/psr: Update planes when early transport SU start
 moves
Date: Fri, 20 Nov 2026 11:55:38 +0200
Message-ID: <20261120095541.1325118-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120095541.1325118-1-jouni.hogander@intel.com>
References: <20261120095541.1325118-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With early transport the plane selective fetch position is relative to
the SU area start. Planes are updated only when their selective fetch
area changes, so a plane keeping its area while the SU start moves is
left with a stale position.

Update planes with a selective fetch area also when the SU start moves
and early transport is in use.

Fixes: b10c83af60cb ("drm/i915/psr: Disable linked plane sel fetch as well")
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index bd16563603249..2c759f9e81fca 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3114,6 +3114,8 @@ static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
 					bool full_update)
 {
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
+	const struct intel_crtc_state *old_crtc_state =
+		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_plane_state *new_plane_state, *old_plane_state;
 	struct intel_plane *plane;
 	struct drm_rect display_area = {
@@ -3122,6 +3124,7 @@ static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
 		.x2 = drm_rect_width(&crtc_state->pipe_src),
 		.y2 = drm_rect_height(&crtc_state->pipe_src),
 	};
+	bool et_pos_changed;
 	int i;
 
 	/*
@@ -3133,6 +3136,10 @@ static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
 	if (full_update)
 		crtc_state->psr2_su_area = display_area;
 
+	/* With early transport the plane position is relative to the SU start. */
+	et_pos_changed = crtc_state->enable_psr2_su_region_et &&
+		crtc_state->psr2_su_area.y1 != old_crtc_state->psr2_su_area.y1;
+
 	/*
 	 * Now that we have the pipe damaged area check if it intersect with
 	 * every plane, if it does set the plane selective fetch area.
@@ -3154,7 +3161,8 @@ static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
 		}
 
 		if (!drm_rect_equals(&old_plane_state->psr2_sel_fetch_area,
-				     sel_fetch_area))
+				     sel_fetch_area) ||
+		    (et_pos_changed && drm_rect_height(sel_fetch_area) > 0))
 			crtc_state->update_planes |= BIT(plane->id);
 
 		/*
@@ -3177,7 +3185,8 @@ static int psr2_sel_fetch_apply_su_area(struct intel_atomic_state *state,
 			linked_sel_fetch_area->y2 = sel_fetch_area->y2;
 
 			if (!drm_rect_equals(&linked_old_plane_state->psr2_sel_fetch_area,
-					     linked_sel_fetch_area))
+					     linked_sel_fetch_area) ||
+			    (et_pos_changed && drm_rect_height(linked_sel_fetch_area) > 0))
 				crtc_state->update_planes |= BIT(linked->id);
 		}
 	}
-- 
2.53.0

