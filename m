Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21613C44515
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA510E4A2;
	Fri, 17 Jul 2026 15:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMRYCmIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA17A10E4A8;
 Fri, 17 Jul 2026 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784302975; x=1815838975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NM6XozpZqsdqK1NGWHNqo2Et334rXwcx+V1NHdOpjdQ=;
 b=mMRYCmIHfQCAA4IIkCDFpS8HGRamqWVlBL+rUSQyV3U/NYFZPu4uY2Kk
 qS+9WdAcnP8ZgfHZ7oJxNCWpuq6TxsqWvwjpyHmZkDuLLhwFHd4Pd6KSz
 lKHb0JhHrRC4+1Et42mKZCdfFeL9ZGyspN2w+4lDyzSzgFzcDUvy8ywzH
 7jagRVqRNJsZJgU1Dgx+hadQq0FSFIr8rn42glP56o2uD7J8zn+7XtnrW
 Kq+A8w4rau8RX/aTYFWbi18zxNFU6XW08t8aRS66AX/mPxDHJDTjz1y6y
 n0O6t34Kb3C0Tg/2ir2TkrYdq5aSf6IMZzl5CXSHjNhYUPBZJLQTt39Sd A==;
X-CSE-ConnectionGUID: fJphQ2+NQ46V15p4Tnw3rg==
X-CSE-MsgGUID: jeHh5JwrR2iyLAsoSrtjvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88652137"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88652137"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:55 -0700
X-CSE-ConnectionGUID: Y57URAm3RIqCfIcE0lB8jQ==
X-CSE-MsgGUID: mOl91LPeQferY2I5HlqIXQ==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:42:53 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/7] drm/i915: Return just the 'fb' from
 intel_reuse_initial_plane_obj()
Date: Fri, 17 Jul 2026 18:42:34 +0300
Message-ID: <20260717154238.10792-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
References: <20260717154238.10792-1-ville.syrjala@linux.intel.com>
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

Now that we no longer need to shuttle the vma around in
intel_find_initial_plane_obj() intel_reuse_initial_plane_obj()
can return just the fb instead of the whole plane state.

And to make things a bit less confusing rename
intel_reuse_initial_plane_obj() to intel_reuse_initial_plane_fb().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_initial_plane.c   | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index ea3defcc760b..a19c5487ccf3 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -43,9 +43,9 @@ void intel_initial_plane_vblank_wait(struct intel_crtc *crtc)
 			 crtc->base.base.id, crtc->base.name);
 }
 
-static const struct intel_plane_state *
-intel_reuse_initial_plane_obj(struct intel_crtc *this,
-			      const struct intel_initial_plane_configs *all_plane_configs)
+static struct drm_framebuffer *
+intel_reuse_initial_plane_fb(struct intel_crtc *this,
+			     const struct intel_initial_plane_configs *all_plane_configs)
 {
 	struct intel_display *display = to_intel_display(this);
 	struct intel_crtc *crtc;
@@ -66,7 +66,7 @@ intel_reuse_initial_plane_obj(struct intel_crtc *this,
 
 		if (all_plane_configs->config[this->pipe].base ==
 		    all_plane_configs->config[crtc->pipe].base)
-			return plane_state;
+			return plane_state->hw.fb;
 	}
 
 	return NULL;
@@ -135,13 +135,9 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	if (intel_alloc_initial_plane_obj(display, plane_config)) {
 		fb = plane_config->fb;
 	} else {
-		const struct intel_plane_state *other_plane_state;
-
-		other_plane_state = intel_reuse_initial_plane_obj(crtc, all_plane_configs);
-		if (!other_plane_state)
+		fb = intel_reuse_initial_plane_fb(crtc, all_plane_configs);
+		if (!fb)
 			goto nofb;
-
-		fb = other_plane_state->hw.fb;
 	}
 
 	plane_state->uapi.rotation = plane_config->rotation;
-- 
2.54.0

