Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989E7D17148
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 23:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B7C10E2C0;
	Mon, 21 Oct 2024 23:48:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7C010E21D;
 Mon, 21 Oct 2024 23:47:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dmc=5Fwl=3A?=
 =?utf-8?q?_Fixes_and_enablement_for_Xe3=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 23:47:59 -0000
Message-ID: <172955447970.1306617.8061427304275618720@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021222744.294371-1-gustavo.sousa@intel.com>
In-Reply-To: <20241021222744.294371-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Fixes and enablement for Xe3_LPD
URL   : https://patchwork.freedesktop.org/series/140283/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: aa0898115bcf drm-tip: 2024y-10m-21d-17h-57m-13s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Mimic i915 behavior for non-sleeping MMIO wait
Applying: drm/i915/dmc_wl: Use non-sleeping variant of MMIO wait
Applying: drm/i915/dmc_wl: Check for non-zero refcount in release work
Applying: drm/i915/dmc_wl: Get wakelock when disabling dynamic DC states
Applying: drm/i915/dmc_wl: Use sentinel item for range tables
Applying: drm/i915/dmc_wl: Extract intel_dmc_wl_addr_in_range()
Applying: drm/i915/dmc_wl: Check ranges specific to DC states
Applying: drm/i915/dmc_wl: Allow simpler syntax for single reg in range tables
Applying: drm/i915/dmc_wl: Deal with existing references when disabling
Applying: drm/i915/dmc_wl: Couple enable/disable with dynamic DC states
Applying: drm/i915/dmc_wl: Add and use HAS_DMC_WAKELOCK()
Applying: drm/i915/dmc_wl: Sanitize enable_dmc_wl according to hardware support
Applying: drm/i915/xe3lpd: Use DMC wakelock by default


