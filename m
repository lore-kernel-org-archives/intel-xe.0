Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C1BCCFA15
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 05:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFD410E87E;
	Thu, 26 Sep 2024 05:31:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9307F89A4E;
 Thu, 26 Sep 2024 05:29:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Reconcile_i915=27s_a?=
 =?utf-8?q?nd_xe=27s_display_power_mgt_sequences?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 05:29:12 -0000
Message-ID: <172732855259.1104416.289512266022626912@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924204222.246862-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240924204222.246862-1-rodrigo.vivi@intel.com>
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

Series: Reconcile i915's and xe's display power mgt sequences
URL   : https://patchwork.freedesktop.org/series/139061/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 88d592f72f7b drm-tip: 2024y-09m-25d-19h-23m-21s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Remove vga and gmbus seq out of i915_restore_display
Applying: drm/i915/display: Convert i915_suspend into i9xx_display_sr
Applying: drm/i915/display: Move regfile registers intel_display.restore
Applying: drm/i915/display: Move shutdown sequences under display driver
Applying: drm/xe: At shutdown disable commit helpers instead of flushing
Applying: drm/xe: Use i915-display shutdown sequence directly
Applying: drm/{i915, xe}/display: Move DP MST calls to display_driver
Applying: drm/i915/display: Move suspend sequences to intel_display_driver
Applying: drm/xe/display: Delay hpd_init resume
Applying: drm/xe/display: Spin-off xe_display runtime/d3cold sequences
Applying: drm/{i915,xe}: Consolidate display resume functions
Applying: drm/i915: Remove lingering pci_save_state
Applying: drm/{i915,xe}: Consolidate display suspend functions
Applying: drm/i915/display: Move resume sequences to intel_display_driver
Applying: drm/xe/display: Delay dsm handler registration
Applying: drm/{i915, xe}: Move power_domains suspend/resume to display_power
Applying: drm/{i915, xe}: Move remaining intel_power_domains to intel_display
Applying: drm/i915/display: Split resume_noirq calls for now
Applying: drm/xe/display: Align display resume sequence with i915
Applying: drm/xe/display: Align suspend sequence with i915
Applying: drm/{i915, xe}/display: Move dsm registration under intel_driver
Applying: drm/i915/display: Move runtime pm related calls under intel_display_driver
Applying: drm/xe/display: Prepare runtime pm functions
Applying: drm/xe/display: Call intel_hpd_init on every runtime resume
Applying: drm/xe/display: Move hpd_poll calls to later runtime stages
Applying: drm/xe/display: Add missing watermark ipc update at runtime resume
Applying: drm/xe/display: Notify opregion upon runtime suspend/resume non-d3cold
Applying: drm/xe/display: Move display runtime suspend to a later point
Applying: drm/xe/display: Kill crtc commit flush
Applying: drm/xe/display: Add missing power display handling on non-d3cold rpm
Applying: drm/{i915, xe}/display: Consolidade entire runtime pm sequence


