Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDE1C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 12:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B55310F01B;
	Wed, 15 Jul 2026 12:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hh+gjpC7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137BE10F018;
 Wed, 15 Jul 2026 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117375; x=1815653375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DxxJA/mjWXXchxQrJQ3ms6VXET66Gqy0kLFG3Cg1Y+0=;
 b=hh+gjpC7byY+kDJaGASn5pwuWRqxzyrLBETrPD6yVm8TAaCpladTfsRD
 8HnaOpwrQ1pvAnT8kCxJNFtAIUwm9tXaMr0gVW6Xk9I6klJc5CjW2zYOu
 6DevpkD4d+I7W7CntS9mR499TuUyqmgIIQVYGe4fimeqFnMD8N25C+NkE
 CXapuIqDUkzVxPLi96jSDbghkNDkHnIQf8yzdGXUpeOjLz24Sfl++K/41
 laIWEOZacmdUf7iWXy2ZWCItSsDfBd3ve2j8PMEPjzj+fur9vzyNVyjVC
 AKXMgKXkYcoQUtPsuEhfLqNBzrEySRWxnJYXV+1Xj3X45Rwg7d45oPVuB A==;
X-CSE-ConnectionGUID: wrAAmGs5Qp6wq0y/7zW90w==
X-CSE-MsgGUID: +Jos+PSgQ/KuR8sC1wAP8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96120985"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="96120985"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:09:35 -0700
X-CSE-ConnectionGUID: xMH4tXSPQRe0eEVmyrYk4Q==
X-CSE-MsgGUID: j6ndZrIBTz6vJTO0BPXkIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="254420561"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:09:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/cdclk: Use intel_cdclk_ppc() in
 intel_modeset_readout_hw_state()
Date: Wed, 15 Jul 2026 15:09:23 +0300
Message-ID: <20260715120926.10786-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
References: <20260715120926.10786-1-ville.syrjala@linux.intel.com>
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

Replace the hand roller intel_cdclk_ppc() with the real thing
in intel_modeset_readout_hw_state().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.h         |  1 +
 drivers/gpu/drm/i915/display/intel_modeset_setup.c | 12 ++++--------
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index d3c5e3438d19..1d7ff2cbaebb 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2908,7 +2908,7 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 }
 
 /* pixels per CDCLK */
-static int intel_cdclk_ppc(struct intel_display *display, bool double_wide)
+int intel_cdclk_ppc(struct intel_display *display, bool double_wide)
 {
 	return DISPLAY_VER(display) >= 10 || double_wide ? 2 : 1;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.h b/drivers/gpu/drm/i915/display/intel_cdclk.h
index 1ff7d078b42c..a60cbf745ee2 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.h
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.h
@@ -22,6 +22,7 @@ struct intel_cdclk_config {
 	bool joined_mbus;
 };
 
+int intel_cdclk_ppc(struct intel_display *display, bool double_wide);
 void intel_cdclk_init_hw(struct intel_display *display);
 void intel_cdclk_uninit_hw(struct intel_display *display);
 void intel_init_cdclk_hooks(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index e27a531e1aa2..14d829171c7d 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -854,14 +854,10 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
 			 * FIXME don't have the fb yet, so can't
 			 * use plane->min_cdclk() :(
 			 */
-			if (plane_state->uapi.visible && plane->min_cdclk) {
-				if (crtc_state->double_wide || DISPLAY_VER(display) >= 10)
-					crtc_state->plane_min_cdclk[plane->id] =
-						DIV_ROUND_UP(crtc_state->pixel_rate, 2);
-				else
-					crtc_state->plane_min_cdclk[plane->id] =
-						crtc_state->pixel_rate;
-			}
+			if (plane_state->uapi.visible && plane->min_cdclk)
+				crtc_state->plane_min_cdclk[plane->id] =
+					DIV_ROUND_UP(crtc_state->pixel_rate,
+						     intel_cdclk_ppc(display, crtc_state->double_wide));
 			drm_dbg_kms(display->drm,
 				    "[PLANE:%d:%s] min_cdclk %d kHz\n",
 				    plane->base.base.id, plane->base.name,
-- 
2.54.0

