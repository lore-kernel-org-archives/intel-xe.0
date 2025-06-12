Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD21C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E87110E778;
	Thu, 12 Jun 2025 10:20:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFF010E76E;
 Thu, 12 Jun 2025 10:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915=3A_Add_drm=5Fpa?=
 =?utf-8?q?nic_support_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 10:20:20 -0000
Message-ID: <174972362095.70743.17419881569701008524@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612081344.225200-1-jfalempe@redhat.com>
In-Reply-To: <20250612081344.225200-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support (rev9)
URL   : https://patchwork.freedesktop.org/series/141937/
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
+ /root/linux/maintainer-tools/dim sparse --fast 75238c32deae15ee4120b42a5be556ec36807a84
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/display/intel_display_types.h:1997:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1997:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1997:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1997:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1997:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2010:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_panel.c:505:30: warning: symbol 'dummy_panel_funcs' was not declared. Should it be static?
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c:106:17: warning: cast truncates bits from constant value (e8d4a51000 becomes d4a51000)
+drivers/gpu/drm/i915/gt/intel_reset.c:1571:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/gt/intel_sseu.c:598:17: error: too long token expansion
+drivers/gpu/drm/i915/i915_active.c:1063:16: warning: context imbalance in '__i915_active_fence_set' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    expected struct list_head const *list
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    got struct list_head [noderef] __rcu *pos
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: warning: incorrect type in argument 1 (different address spaces)
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
+drivers/gpu/drm/i915/intel_wakeref.c:145:19: warning: context imbalance in 'wakeref_auto_timeout' - unexpected unlock
+drivers/gpu/drm/ttm/ttm_bo.c:1196:31: warning: symbol 'ttm_swap_ops' was not declared. Should it be static?
+drivers/gpu/drm/ttm/ttm_bo_util.c:326:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:326:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:326:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:465:28:    expected void volatile [noderef] __iomem *addr
+drivers/gpu/drm/ttm/ttm_bo_util.c:465:28:    got void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:465:28: warning: incorrect type in argument 1 (different address spaces)

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


