Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE5FC3DA66
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 17:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B3189B57;
	Wed, 23 Aug 2023 17:12:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9ABB689B57;
 Wed, 23 Aug 2023 17:12:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9245EA47E9;
 Wed, 23 Aug 2023 17:12:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 23 Aug 2023 17:12:33 -0000
Message-ID: <169281075359.16624.2977613319919861925@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230823170740.1180212-1-lucas.demarchi@intel.com>
In-Reply-To: <20230823170740.1180212-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Enable_Lunar_Lake_display?=
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

Series: Enable Lunar Lake display
URL   : https://patchwork.freedesktop.org/series/122798/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 8ca78f69c drm/xe: Drop xe_mmio_write64()
=== git am output follows ===
Applying: drm/i915: Start using plane scale factor for relative data rate
Applying: drm/i915/display: Remove unused POWER_DOMAIN_MASK
Applying: drm/i915/cx0: Add intel_cx0_get_owned_lane_mask()
Applying: drm/i915: Simplify intel_cx0_program_phy_lane() with loop
Applying: drm/i915/cx0: Enable/disable TX only for owned PHY lanes
Applying: drm/i915/cx0: Program vswing only for owned lanes
Applying: drm/i915/tc: rename mtl_tc_port_get_pin_assignment_mask()
Applying: drm/i915/tc: make intel_tc_port_get_lane_mask() static
Applying: drm/i915/tc: move legacy code out of the main _max_lane_count() func
Applying: drm/i915/tc: remove "fia" from intel_tc_port_fia_max_lane_count()
Applying: drm/xe/lnl: Add IS_LUNARLAKE
Applying: drm/i915/lnl: Add display definitions
Applying: drm/i915: Re-order if/else ladder in intel_detect_pch()
Applying: drm/i915/lnl: Add fake PCH
Applying: drm/i915/xe2lpd: Treat cursor plane as regular plane for DDB allocation
Applying: drm/i915/xe2lpd: Move D2D enable/disable
Applying: drm/i915/xe2lpd: D2D Enable preserve bits in DDI_BUF_CTL
Applying: drm/i915/xe2lpd: Move registers to PICA
Applying: drm/i915/xe2lpd: Don't try to program PLANE_AUX_DIST
Applying: drm/i915/xe2lpd: Register DE_RRMR has been removed
Applying: drm/i915/xe2lpd: Add display power well
Applying: drm/i915/xe2lpd: Add DC state support
Applying: drm/i915/xe2lpd: FBC is now supported on all pipes
Applying: drm/i915/display: Remove FBC capability from fused off pipes
Applying: drm/i915/xe2lpd: Add support for DP aux channels
Applying: drm/i915/xe2lpd: Handle port AUX interrupts
Applying: drm/i915/xe2lpd: Read pin assignment from IOM
Applying: drm/i915/xe2lpd: enable odd size and panning for planar yuv on xe2lpd
Applying: drm/i915/xe2lpd: Add support for HPD
Applying: drm/i915/xe2lpd: Extend Wa_15010685871
Applying: drm/i915/lnl: Add gmbus/ddc support
Applying: drm/i915/lnl: Introduce MDCLK
Applying: drm/i915/lnl: Add CDCLK table
Applying: drm/i915/lnl: Start using CDCLK through PLL
Applying: drm/i915/lnl: Introduce MDCLK_CDCLK ratio to DBuf
Applying: drm/i915/lnl: Add support for CDCLK initialization sequence
Applying: drm/i915/xe2lpd: Write DBuf after CDCLK change in post plane
Applying: drm/i915/lnl: Serialize global state if mdclk/cdclk ratio changes.
Applying: drm/i915/lnl: Add pll table for LNL platform
Applying: drm/i915/lnl: Add support to check c10 phy link rate
Applying: drm/i915/xe2lpd: Update mbus on post plane updates
Applying: drm/xe/lnl: Enable the display support


