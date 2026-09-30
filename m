Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C3ECA5FCD
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 15:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6467210F47C;
	Wed, 30 Sep 2026 15:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hdwhzz6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B55610F476;
 Wed, 30 Sep 2026 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790780440; x=1822316440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ns6t80O+S998KOR7Cif5jCrkDPUm2E6V60sO4/VKeWg=;
 b=Hdwhzz6li6QptX5F1JFFH13Nydr/5i/JWS0ZgVaS7Tv+6fCboOH9ne3R
 GvbyPVnH09jJrq0tCy4nbg0WFy/sx2r+8nycI0uCaaO1MbiqE0wTTAsTF
 mXePQFMLOQAECkD1UEUEQaL2T3IsIekznbjuihC/RQSQJTjk/3ADXtAFC
 n7rFKy9vFZzNgIHYUUpsq9y3c2P5LW8/vzfENUkxGek2NAQDCVFTB6HxW
 C7qy+sevmX7vUHOUbsaQ+TidV92Tvy7APrV+0WP4t+xf6mNHFrW52Syyu
 yBRFybwLCfSkL4a1YEbSDi22Mz0pzV8UoF/cLuAfUbmq8Bls1lBo/KLtW w==;
X-CSE-ConnectionGUID: op3+DinDRqqazPc8a2oaHw==
X-CSE-MsgGUID: UgaDjfjDSvacRb9zRPRXuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90284177"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90284177"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:39 -0700
X-CSE-ConnectionGUID: uZkgvcbfRVO1CScFjKCK7g==
X-CSE-MsgGUID: +1ByfFIZRGKdLCThokkz1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275849598"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI v2 06/10] drm/i915/gem: use intel_gtt_view_is_*() helpers more
Date: Wed, 30 Sep 2026 18:00:02 +0300
Message-ID: <1b7f309d0c5c5891caa2ec84c04ce8a4438f1207.1790780340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790780340.git.jani.nikula@intel.com>
References: <cover.1790780340.git.jani.nikula@intel.com>
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

Prefer using the intel_gtt_view_is_*() helpers instead of comparing the
view type directly.

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 2 +-
 drivers/gpu/drm/i915/i915_gem.c            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 0cb41704e54e..9a82ed77ccaf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -462,7 +462,7 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 	 */
 	vma = ERR_PTR(-ENOSPC);
 	if ((flags & PIN_MAPPABLE) == 0 &&
-	    (!view || view->type == I915_GTT_VIEW_NORMAL))
+	    (!view || intel_gtt_view_is_normal(view)))
 		vma = i915_gem_object_ggtt_pin_ww(obj, ww, view, 0, alignment,
 						  flags | PIN_MAPPABLE |
 						  PIN_NONBLOCK);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index ee8fbbcbb5fe..055f8d3161da 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -396,7 +396,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 		unsigned int flags;
 
 		flags = PIN_MAPPABLE | PIN_NOSEARCH;
-		if (view.type == I915_GTT_VIEW_NORMAL)
+		if (intel_gtt_view_is_normal(&view))
 			flags |= PIN_NONBLOCK; /* avoid warnings for pinned */
 
 		/*
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 62987ae59a50..1209d5f1fc8d 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -913,7 +913,7 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 	GEM_WARN_ON(!ww);
 
 	if (flags & PIN_MAPPABLE &&
-	    (!view || view->type == I915_GTT_VIEW_NORMAL)) {
+	    (!view || intel_gtt_view_is_normal(view))) {
 		/*
 		 * If the required space is larger than the available
 		 * aperture, we will not able to find a slot for the
-- 
2.47.3

