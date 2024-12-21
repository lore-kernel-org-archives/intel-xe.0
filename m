Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06155E77188
	for <intel-xe@archiver.kernel.org>; Sat, 21 Dec 2024 00:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FDC10E00C;
	Sat, 21 Dec 2024 00:04:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AC110E00C;
 Sat, 21 Dec 2024 00:04:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/xe/vf=3A_Post-migrat?=
 =?utf-8?q?ion_recovery_of_GGTT_nodes_and_CTB_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 21 Dec 2024 00:04:49 -0000
Message-ID: <173473948946.959220.18129818184186045495@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220233409.2956004-1-tomasz.lis@intel.com>
In-Reply-To: <20241220233409.2956004-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of GGTT nodes and CTB (rev4)
URL   : https://patchwork.freedesktop.org/series/141439/
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
+ /root/linux/maintainer-tools/dim sparse --fast 0eede13975362b755a208b2e2ba322940013f183
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1965:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:
+drivers/gpu/drm/i915/gt/intel_reset.c:1541:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_active.c:1081:16: warning: context imbalance in '__i915_active_fence_set' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    expected struct list_head const *list
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    got struct list_head [noderef] __rcu *pos
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/i915/i915_irq.c:451:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:451:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:459:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:459:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:464:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:464:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:464:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:501:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:501:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:509:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:509:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:514:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:514:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:514:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:557:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:557:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:560:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:560:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:564:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:564:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:571:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:571:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:571:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:571:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/intel_uncore.c:1925:1: warning: context imbalance in 'fwtable_read8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1926:1: warning: context imbalance in 'fwtable_read16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1927:1: warning: context imbalance in 'fwtable_read32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1928:1: warning: context imbalance in 'fwtable_read64' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1993:1: warning: context imbalance in 'gen6_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1994:1: warning: context imbalance in 'gen6_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1995:1: warning: context imbalance in 'gen6_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2015:1: warning: context imbalance in 'fwtable_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2016:1: warning: context imbalance in 'fwtable_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2017:1: warning: context imbalance in 'fwtable_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_wakeref.c:145:19: warning: context imbalance in 'wakeref_auto_timeout' - unexpected unlock
+drivers/gpu/drm/ttm/ttm_bo.c:1155:31: warning: symbol 'ttm_swap_ops' was not declared. Should it be static?
+drivers/gpu/drm/ttm/ttm_bo_util.c:324:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:324:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:324:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:327:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:327:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:327:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:330:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:330:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:330:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:436:28:    expected void volatile [noderef] __iomem *addr
+drivers/gpu/drm/ttm/ttm_bo_util.c:436:28:    got void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:436:28: warning: incorrect type in argument 1 (different address spaces)

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


