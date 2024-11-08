Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE16D5C0C3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 13:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFEC10E995;
	Fri,  8 Nov 2024 13:09:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E43810E995;
 Fri,  8 Nov 2024 13:09:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dmc=5Fwl=3A?=
 =?utf-8?q?_Fixes_and_enablement_for_Xe3=5FLPD_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 13:09:30 -0000
Message-ID: <173107137051.1426848.15949354054765242049@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108130218.24125-1-gustavo.sousa@intel.com>
In-Reply-To: <20241108130218.24125-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Fixes and enablement for Xe3_LPD (rev4)
URL   : https://patchwork.freedesktop.org/series/140283/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5521311ecd7f drm-tip: 2024y-11m-08d-12h-38m-02s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dmc_wl: Use i915_mmio_reg_offset() instead of reg.reg
Applying: drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
Applying: drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
Applying: drm/i915/dmc_wl: Check for non-zero refcount in release work
Applying: drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
Applying: drm/i915/dmc_wl: Use sentinel item for range tables
Applying: drm/i915/dmc_wl: Extract intel_dmc_wl_reg_in_range()
Applying: drm/i915/dmc_wl: Rename lnl_wl_range to powered_off_ranges
Applying: drm/i915/dmc_wl: Track registers touched by the DMC
Applying: drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
Applying: drm/i915/dmc_wl: Deal with existing references when disabling
Applying: drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
Applying: drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
Applying: drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
Applying: drm/i915/xe3lpd: Use DMC wakelock by default


