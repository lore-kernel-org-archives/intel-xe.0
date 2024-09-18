Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56124CCD191
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 08:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2286610E565;
	Wed, 18 Sep 2024 08:58:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A2210E568;
 Wed, 18 Sep 2024 08:58:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915_=26_drm/xe?=
 =?utf-8?q?=3A_kill_off_-Ddrm=5Fi915=5Fgem=5Fobject=3Dxe=5Fbo_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 08:58:11 -0000
Message-ID: <172664989113.1025091.7843224883663385064@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726589119.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726589119.git.jani.nikula@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915 & drm/xe: kill off -Ddrm_i915_gem_object=xe_bo (rev2)
URL   : https://patchwork.freedesktop.org/series/138773/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a7c4f56f92ff drm-tip: 2024y-09m-18d-06h-57m-14s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: start a buffer object abstraction layer
Applying: drm/i915/display: convert intel_atomic_plane.c to struct drm_gem_object
Applying: drm/i915/fb: convert parts of intel_fb.c to struct drm_gem_object
Applying: drm/i915/fbdev: convert intel_fbdev.c to struct drm_gem_object
Applying: drm/i915/display: convert skl_universal_plane.c to struct drm_gem_object
Applying: drm/i915/fb: convert intel_framebuffer_init() to struct drm_gem_object
Applying: drm/i915/fb: convert intel_fb_bo_lookup_valid_bo() to struct drm_gem_object
Applying: drm/i915/fb: convert intel_fb_bo_framebuffer_init() to struct drm_i915_gem_object
Applying: drm/i915/fb: convert intel_fb_bo_framebuffer_fini() to struct drm_i915_gem_object
Applying: drm/xe/display: use correct bo type in intel_fbdev_fb_alloc()
Applying: drm/i915/fb: convert intel_framebuffer_create() to struct drm_gem_object
Applying: drm/xe/display: stop using intel_fb_obj() in xe_fb_pin.c
Applying: drm/i915/display: add intel_bo_read_from_page() and use it
Applying: drm/i915/display: add intel_bo_get/set_frontbuffer() and use them
Applying: drm/i915/frontbuffer: convert intel_frontbuffer_get() to struct drm_gem_object
Applying: drm/i915/frontbuffer: convert frontbuffer->obj to struct drm_gem_object
Applying: drm/i915/display: add intel_bo_describe() and use it
Applying: drm/i915/fb: remove intel_fb_obj()
Applying: drm/i915/display: clean up some gem/ includes
Applying: drm/xe/compat: remove a bunch of compat gem headers
Applying: drm/xe: remove a number of superfluous compat macros
Applying: drm/xe: eradicate -Ddrm_i915_gem_object=xe_bo


