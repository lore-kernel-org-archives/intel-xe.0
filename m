Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E16D41C36
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 11:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DFB10E6D4;
	Wed, 13 Nov 2024 11:03:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26B610E6D4;
 Wed, 13 Nov 2024 11:03:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2C1/9=5D_drm/i915=3A_Remove_vga_and_gmbus_seq_out_of_i915?=
 =?utf-8?q?=5Frestore=5Fdisplay_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 11:03:53 -0000
Message-ID: <173149583379.3541234.9273318982603686606@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241111193947.128871-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241111193947.128871-1-rodrigo.vivi@intel.com>
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

Series: series starting with [CI,1/9] drm/i915: Remove vga and gmbus seq out of i915_restore_display (rev2)
URL   : https://patchwork.freedesktop.org/series/141181/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 169c7cd31a37 drm-tip: 2024y-11m-13d-10h-31m-31s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Remove vga and gmbus seq out of i915_restore_display
Applying: drm/i915/display: Convert i915_suspend into i9xx_display_sr
Applying: drm/i915/display: Move regfile registers intel_display.restore
Applying: drm/{i915, xe}/display: Move DP MST calls to display_driver
Applying: drm/xe/display: Delay hpd_init resume
Applying: drm/xe/display: Delay dsm handler registration
Applying: drm/{i915, xe}: Move power_domains suspend/resume to display_power
Applying: drm/{i915, xe}: Move remaining intel_power_domains to intel_display
Applying: drm/{i915, xe}/display: Move dsm registration under intel_driver


