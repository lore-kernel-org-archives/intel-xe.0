Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C938C71137
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 17:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E18510E6D8;
	Wed, 11 Jun 2025 17:17:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6467110E6D8;
 Wed, 11 Jun 2025 17:17:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915/dmc=3A_Deal_wit?=
 =?utf-8?q?h_loss_of_pipe_DMC_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 17:17:40 -0000
Message-ID: <174966226040.68680.17659715285252056551@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611155241.24191-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250611155241.24191-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dmc: Deal with loss of pipe DMC state
URL   : https://patchwork.freedesktop.org/series/150112/
State : warning

== Summary ==

+ trap cleanup EXIT
+ KERNEL=/kernel
+ MT=/root/linux/maintainer-tools
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools /root/linux/maintainer-tools
Cloning into '/root/linux/maintainer-tools'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ make -C /root/linux/maintainer-tools
make: Entering directory '/root/linux/maintainer-tools'
cc -O2 -g -Wextra -o remap-log remap-log.c
make: Leaving directory '/root/linux/maintainer-tools'
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ /root/linux/maintainer-tools/dim sparse --fast aafbd01c99cde1b0b8a117e0ae1b77e87554c7b6
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1995:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2008:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2008:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:
+drivers/gpu/drm/i915/gt/intel_reset.c:1571:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_irq.c:492:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:492:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:500:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:500:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:505:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:505:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:505:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:543:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:543:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:551:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:551:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:556:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:556:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:556:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:600:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:600:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:603:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:603:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:607:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:607:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:614:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:614:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:614:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:614:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/intel_uncore.c:1927:1: warning: context imbalance in 'fwtable_read8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1928:1: warning: context imbalance in 'fwtable_read16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1929:1: warning: context imbalance in 'fwtable_read32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1930:1: warning: context imbalance in 'fwtable_read64' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1995:1: warning: context imbalance in 'gen6_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1996:1: warning: context imbalance in 'gen6_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1997:1: warning: context imbalance in 'gen6_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2017:1: warning: context imbalance in 'fwtable_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2018:1: warning: context imbalance in 'fwtable_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2019:1: warning: context imbalance in 'fwtable_write32' - unexpected unlock

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


