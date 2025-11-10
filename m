Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FBBCCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 21:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B1910E0D1;
	Mon, 10 Nov 2025 21:01:11 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7454410E0D1;
 Mon, 10 Nov 2025 21:01:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/irq?=
 =?utf-8?q?=3A_clarify_display_and_parent_driver_interfaces?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Nov 2025 21:01:10 -0000
Message-ID: <176280847046.35467.10530939680247234784@10055242dc62>
X-Patchwork-Hint: ignore
References: <cover.1762803004.git.jani.nikula@intel.com>
In-Reply-To: <cover.1762803004.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}/irq: clarify display and parent driver interfaces
URL   : https://patchwork.freedesktop.org/series/157350/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ba2812718b9a3d81f01809e67ec2e0bfa0924ffc
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Nov 10 21:31:39 2025 +0200

    drm/i915/display: shorten the intel_display_irq_regs_* function names
    
    Shorten the intel_display_irq_regs_* function names to the underlying
    function names with a _wl suffix for clarity.
    
    - intel_display_irq_regs_init() -> irq_init_wl()
    - intel_display_irq_regs_reset() -> irq_reset_wl()
    - intel_display_irq_regs_assert_irr_is_zero() -> assert_iir_is_zero_wl()
    
    This emphasizes the difference is the wakelock. Platforms without the
    DMC wakelock mechanism can use the non-wl versions.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a9792b1ab75123e4aceaba953a89809e745919c6 drm-intel
0ce42a75ee7a drm/{i915, xe}/display: move irq calls to parent interface
b0302a83c7ac drm/{i915, xe}/display: duplicate gen2 irq/error init/reset in display irq
-:62: WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#62: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:59:
+#if 0	/* FIXME */

-:130: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#130: 
deleted file mode 100644

total: 0 errors, 2 warnings, 0 checks, 95 lines checked
13af8d5327e6 drm/i915/display: convert the display irq interfaces to struct intel_display
ba2812718b9a drm/i915/display: shorten the intel_display_irq_regs_* function names


