Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A04C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 00:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355810E161;
	Wed,  2 Apr 2025 00:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilq8hWBl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E9D10E694;
 Wed,  2 Apr 2025 00:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743553342; x=1775089342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GVPUndsBr2P3AJzYUAPkmVvSR6RDyld3076th5+bZr8=;
 b=ilq8hWBle4Tfdk3Ku9MA7PiwtZ4D35y9vmkg4As0cGKxqLzbdevk+Pfa
 AVh0t9wuBs2ttsgCrFtfOVlpx3Q4Wb0fpSaEDXM4iK141z1jHzFe0sEZZ
 LxshToKDLPzpOf/RnXQSrFp/23scaShz6jVvyUNvt6/jAmo5tQZZttb1O
 XMY3hUN8mEQR1o1WnXoYH1JG6UUl+6xnJLmOR/TRFs9vaNzZdvObpIxYh
 GAG7JMvgveVVUwsr+t9sk7gHMVvoZ1PScgrsGUD9hBivRVZhmy7Y0RiNh
 RtiBYwPpxxhPN2Iveczhda+QjeXkEuKK4VGG76zGLCxTSR4nZRhWA+Rzq A==;
X-CSE-ConnectionGUID: LaF5UdcqS6SG7wtg6kyznw==
X-CSE-MsgGUID: RL2nJdLgRqmF9NuUPvtD3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45021916"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="45021916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 17:22:22 -0700
X-CSE-ConnectionGUID: T2GisVAeTM6fA45E0JmN0A==
X-CSE-MsgGUID: nSZHZvTjTE+v0utEPxYk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="131729582"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 01 Apr 2025 17:22:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Apr 2025 03:22:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/9] drm/i915: Move the intel_dpt_offset() check into
 intel_plane_pin_fb()
Date: Wed,  2 Apr 2025 03:22:03 +0300
Message-ID: <20250402002209.24987-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250402002209.24987-1-ville.syrjala@linux.intel.com>
References: <20250402002209.24987-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Now that we handle all the other vma offset stuff in
intel_plane_pin_fb() it seems more proper to do the
dpt_vma offset check there as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb_pin.c        | 7 +++++++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index f2d8675dd98a..a5b9d87b2255 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -259,6 +259,7 @@ intel_plane_fb_vtd_guard(const struct intel_plane_state *plane_state)
 int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 		       const struct intel_plane_state *old_plane_state)
 {
+	struct intel_display *display = to_intel_display(plane_state);
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	const struct intel_framebuffer *fb =
 		to_intel_framebuffer(plane_state->hw.fb);
@@ -297,6 +298,12 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 		plane_state->dpt_vma = vma;
 
 		WARN_ON(plane_state->ggtt_vma == plane_state->dpt_vma);
+
+		/*
+		 * The DPT object contains only one vma, so
+		 * the VMA's offset within the DPT is always 0.
+		 */
+		drm_WARN_ON(display->drm, intel_dpt_offset(plane_state->dpt_vma));
 	}
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index b82a9e07350b..808580826b0e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1271,12 +1271,6 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 	u32 offset = plane_state->view.color_plane[color_plane].offset;
 
 	if (intel_fb_uses_dpt(fb)) {
-		/*
-		 * The DPT object contains only one vma, so the VMA's offset
-		 * within the DPT is always 0.
-		 */
-		drm_WARN_ON(display->drm, plane_state->dpt_vma &&
-			    intel_dpt_offset(plane_state->dpt_vma));
 		drm_WARN_ON(display->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
-- 
2.45.3

