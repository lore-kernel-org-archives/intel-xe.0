Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5BCC02199
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 21:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4096610E94F;
	Thu,  6 Feb 2025 21:05:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C920F10E948;
 Thu,  6 Feb 2025 21:03:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_intel=5F?=
 =?utf-8?q?display_conversions_and_some_debug_improvements_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 21:03:31 -0000
Message-ID: <173887581182.2236925.13845587431888480189@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206185533.32306-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250206185533.32306-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: intel_display conversions and some debug improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/143941/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f2401c718ce0 drm-tip: 2025y-02m-06d-20h-18m-27s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Pass intel_display to intel_scanout_needs_vtd_wa()
Applying: drm/i915: Decouple i915_gem_dumb_create() from the display a bit
Applying: drm/i915: Decouple intel_fb_bo.h interfaces from driver specific types
Applying: drm/i915: Convert intel_crtc.c to struct intel_display
Applying: drm/i915: Convert intel_fb.c to struct intel_display
Applying: drm/i915: Convert intel_display_power_{get, put}*() to intel_display
Applying: drm/i915: Convert i9xx_plane.c to struct intel_display
Applying: drm/i915: Finish intel_sprite.c struct intel_display conversion
Applying: drm/i915: Convert intel_cursor.c to struct intel_display
Applying: drm/i915: Convert skl_univeral_plane.c to struct intel_display
Applying: drm/i915: Use DRM_RECT_FMT & co. for plane debugs
Applying: drm/i915: Pimp plane debugs


