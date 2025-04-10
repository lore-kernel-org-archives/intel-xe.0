Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6AAC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 10:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C71710E938;
	Thu, 10 Apr 2025 10:41:08 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088410E938;
 Thu, 10 Apr 2025 10:41:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?final_=28=3F!=29_mass_conversions_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 10:41:07 -0000
Message-ID: <174428166706.55177.16425010325591154743@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744222449.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744222449.git.jani.nikula@intel.com>
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

Series: drm/i915/display: final (?!) mass conversions to struct intel_display
URL   : https://patchwork.freedesktop.org/series/147489/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e74ca4100a9d drm-tip: 2025y-04m-10d-08h-54m-05s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/fb: convert intel_fbdev.[ch] and intel_fbdev_fb.[ch] to struct intel_display
Applying: drm/i915/display: convert intel_modeset_setup.[ch] to struct intel_display
Applying: drm/i915/display: convert intel_modeset_verify.c to struct intel_display
Applying: drm/i915/sprite: convert intel_sprite_uapi.c to struct intel_display
Applying: drm/i915/frontbuffer: convert intel_frontbuffer.[ch] to struct intel_display
Applying: drm/i915/crt: switch to display->platform based platform detection
Applying: drm/i915/dmc: switch to display->platform based platform detection
Applying: drm/i915/dp-aux: switch to display->platform based platform detection
Applying: drm/i915/dpio: switch to display->platform based platform detection
Applying: drm/i915/gmbus: switch to display->platform based platform detection
Applying: drm/i915/hdmi: switch to display->platform based platform detection
Applying: drm/i915/display: switch to display->platform.dgfx from IS_DGFX()
Applying: drm/i915/audio: don't set LPE audio irq chip data, it's unused
Applying: drm/xe/compat: clean up unused platform check macros


