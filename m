Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85234C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA7F10E2FC;
	Tue, 15 Sep 2026 20:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PF0JzflE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDE810E2FC;
 Tue, 15 Sep 2026 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502992; x=1821038992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tkSgLeyIUi3Pfg9ybfDgZRzJvhviIh7ajKooLWCiILM=;
 b=PF0JzflErTvX7MseUaIoTRjIXCnGaHqY/t/jaBUW2Tk94u9vgMlYkGbc
 Lgxu3xtT9GHsQHsHlP5fVr0x3WGO2neXr8NIIN+QfxeCRzyHwRw4HSpy7
 hUL6FDzfNmmzCiXYizmZKbjcpAhk5IGkqoE4ZtlplVk501ykLvGD82kxD
 MaIUrKHJRC6qwK/Ock3wpFE50oMPyGIm3AJhW2qHUtAD9OykNnn4hNnfF
 bDcGtrBqUs1HwgBy1ponkcI9EvSP6d+TtL4d2LftkIry4EAtwTWOwGaUB
 LjjW8uoK6xmKbXdb0sergSlm3linEXn9Mx7OKipdyadjSbX8pxFp8sahb g==;
X-CSE-ConnectionGUID: +c1lIciwQyWWl/K7f7A57w==
X-CSE-MsgGUID: wesMnUl7Tu2cIVczoRJ7Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89015011"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89015011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:52 -0700
X-CSE-ConnectionGUID: 80zwE0zsSda1bGFX4M3Bxg==
X-CSE-MsgGUID: 0NY1Y1ByQlWcZH1EOUmAFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272644446"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 06/10] drm/i915/gem: use intel_gtt_view_is_*() helpers more
Date: Tue, 15 Sep 2026 23:09:17 +0300
Message-ID: <331196f4bdfbc084fe414e1e6eb73adb092717d1.1789502902.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
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

Prefer using the intel_gtt_view_is_*() helpers instead of comparing the
view type directly.

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

