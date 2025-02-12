Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09134C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 20:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42D810E98C;
	Wed, 12 Feb 2025 20:32:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E19810E98C;
 Wed, 12 Feb 2025 20:32:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?conversions_to_struct_intel=5Fdisplay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 20:32:39 -0000
Message-ID: <173939235957.1417159.8652424310367542161@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1739378095.git.jani.nikula@intel.com>
In-Reply-To: <cover.1739378095.git.jani.nikula@intel.com>
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

Series: drm/i915/display: conversions to struct intel_display
URL   : https://patchwork.freedesktop.org/series/144749/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1e935d0d2896 drm-tip: 2025y-02m-12d-20h-05m-00s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: convert g4x_dp.[ch] to struct intel display
Applying: drm/i915/hdmi: convert g4x_hdmi.[ch] to struct intel_display
Applying: drm/i915/ips: convert hsw_ips.c to struct intel_display
Applying: drm/i915/display: convert assert_transcoder*() to struct intel_display
Applying: drm/i915/display: convert assert_port_valid() to struct intel_display
Applying: drm/i915/hpd: drop dev_priv parameter from intel_hpd_pin_default()
Applying: drm/i915/display: convert intel_set_{cpu, pch}_fifo_underrun_reporting() to intel_display
Applying: drm/i915/sdvo: convert intel_sdvo.[ch] to struct intel_display
Applying: drm/i915/display: convert intel_cpu_transcoder_mode_valid() to intel_display
Applying: drm/i915/display: convert intel_mode_valid_max_plane_size() to intel_display
Applying: drm/i915/dsi: convert platform checks to display->platform.<platform> style
Applying: drm/i915/combo-phy: convert intel_combo_phy.[ch] to struct intel_display
Applying: drm/i915/display: convert intel_fifo_underrun.[ch] to struct intel_display
Applying: drm/i915/display: convert i915_pipestat_enable_mask() to struct intel_display


