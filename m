Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1AAC25B47
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 08:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F3110E94F;
	Fri, 27 Oct 2023 08:03:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03C8110E94F;
 Fri, 27 Oct 2023 08:03:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F1120AADD5;
 Fri, 27 Oct 2023 08:03:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 27 Oct 2023 08:03:33 -0000
Message-ID: <169839381395.19710.10043393171810978438@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Backport_display_parameter_patches?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Backport display parameter patches
URL   : https://patchwork.freedesktop.org/series/125671/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 76d7314ce drm/xe/huc: Define HuC for MTL
=== git am output follows ===
Applying: Revert "FIXME: drm/i915: xe doesn't have i915_modparams.verbose_state_checks"
Applying: drm/i915: convert INTEL_DISPLAY_ENABLED() into a function
Applying: drm/i915: separate display runtime info init
Applying: drm/i915: separate subplatform init and runtime feature init
Applying: drm/i915/display: Add framework to add parameters specific to display
Applying: drm/i915/display: Dump also display parameters
Applying: drm/i915/display: Move enable_fbc module parameter under display
Applying: drm/i915/display: Move psr related module parameters under display
Applying: drm/i915/display: Move vbt_firmware module parameter under display
Applying: drm/i915/display: Move lvds_channel_mode module parameter under display
Applying: drm/i915/display: Move panel_use_ssc module parameter under display
Applying: drm/i915/display: Move vbt_sdvo_panel_type module parameter under display
Applying: drm/i915/display: Move enable_dc module parameter under display
Applying: drm/i915/display: Move enable_dpt module parameter under display
Applying: drm/i915/display: Move enable_sagv module parameter under display
Applying: drm/i915/display: Move disable_power_well module parameter under display
Applying: drm/i915/display: Move enable_ips module parameter under display
Applying: drm/i915/display: Move invert_brightness module parameter under display
Applying: drm/i915/display: Move edp_vswing module parameter under display
Applying: drm/i915/display: Move enable_dpcd_backlight module parameter under display
Applying: drm/i915/display: Move load_detect_test parameter under display
Applying: drm/i915/display: Move force_reset_modeset_test parameter under display
Applying: drm/i915/display: Move disable_display parameter under display
Applying: drm/i915/display: Use device parameters instead of module in I915_STATE_WARN
Applying: drm/i915/display: Move verbose_state_checks under display
Applying: drm/i915/display: Move nuclear_pageflip under display
Applying: drm/i915/display: Move enable_dp_mst under display
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! drm/xe/display: Implement display support


