Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D585EC30658
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 14:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A577910EBF9;
	Fri,  5 Jul 2024 14:58:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C868D10EBF9;
 Fri,  5 Jul 2024 14:58:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/=7Bi915=2C_xe=7D?=
 =?utf-8?q?=3A_FBC_cleanups_+_tweak_fbdev_stolen_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jul 2024 14:58:31 -0000
Message-ID: <172019151181.30984.13588957465048597032@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705145254.3355-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240705145254.3355-1-ville.syrjala@linux.intel.com>
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

Series: drm/{i915, xe}: FBC cleanups + tweak fbdev stolen usage
URL   : https://patchwork.freedesktop.org/series/135799/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: cdd1a80a2d16 drm-tip: 2024y-07m-05d-11h-19m-50s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/fbc: Extract intel_fbc_has_fences()
Applying: drm/i915/fbc: Convert to intel_display, mostly
Applying: drm/i915/fbc: s/_intel_fbc_cfb_stride()/intel_fbc_plane_cfb_stride()/
Applying: drm/i915/fbc: Extract intel_fbc_max_plane_size()
Applying: drm/i915/fbc: Extract intel_fbc_max_surface_size()
Applying: drm/i915/fbc: s/intel_fbc_hw_tracking_covers_screen()/intel_fbc_surface_size_ok()/
Applying: drm/i915/fbc: Adjust g4x+ platform checks
Applying: drm/i915/fbc: Extract _intel_fbc_cfb_stride()
Applying: drm/i915/fbc: s/lines/height/
Applying: drm/i915/fbc: Reoder CFB max height platform checks
Applying: drm/i915/fbc: Extract intel_fbc_max_cfb_height()
Applying: drm/i915/fbc: Extract _intel_fbc_cfb_size()
Applying: drm/i915/fbc: Extract intel_fbc_cfb_cpp()
Applying: drm/i915/fbc: Introduce intel_fbc_preferred_cfb_size()
Applying: drm/xe/fbdev: Fix BIOS FB vs.s stolen size checke
Applying: drm/i915/fbdev: Extract intel_fbdev_fb_prefer_stolen()
Applying: drm/xe/fbdev: Extract intel_fbdev_fb_prefer_stolen()
Applying: drm/xe/fbdev: Use the same logic for fbdev stolen takever and fresh allocation
Applying: drm/i915/fbdev: Adjust fbdev stolen mem usage heuristic
Applying: drm/xe/fbdev: Adjust fbdev stolen mem usage heuristic


