Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86591CCD187
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 10:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C2610E209;
	Thu,  9 Oct 2025 10:35:43 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91C110E209;
 Thu,  9 Oct 2025 10:35:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_User_readable_error_code?=
 =?utf-8?q?s_on_atomic=5Fioctl_failure_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Oct 2025 10:35:42 -0000
Message-ID: <176000614281.22793.10284115489404185321@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
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

Series: User readable error codes on atomic_ioctl failure (rev5)
URL   : https://patchwork.freedesktop.org/series/152277/
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
+ /root/linux/maintainer-tools/dim sparse --fast e4621fd776939016f32f5585b188429d68e5ae5b
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/drm_drv.c:449:6: warning: context imbalance in 'drm_dev_enter' - different lock contexts for basic block
+drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
+drivers/gpu/drm/drm_plane.c:213:24: warning: Using plain integer as NULL pointer
+drivers/gpu/drm/i915/display/intel_alpm.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2042:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2055:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2055:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2055:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_hotplug.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:
+drivers/gpu/drm/i915/gt/intel_reset.c:1569:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/gt/intel_sseu.c:598:17: error: too long token expansion
+drivers/gpu/drm/i915/i915_active.c:1062:16: warning: context imbalance in '__i915_active_fence_set' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: error: incompatible types in comparison expression (different address spaces):
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    expected struct list_head const *list
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    got struct list_head [noderef] __rcu *pos
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9:    struct list_head [noderef] __rcu *
+drivers/gpu/drm/i915/i915_drm_client.c:92:9: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/i915/i915_gpu_error.c:692:3: warning: symbol 'guc_hw_reg_state' was not declared. Should it be static?
+drivers/gpu/drm/i915/i915_irq.c:465:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:465:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:473:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:473:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:478:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:478:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:478:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:516:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:516:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:524:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:524:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:529:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:529:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:529:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:573:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:573:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:576:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:576:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:580:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:580:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:587:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:587:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:587:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:587:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/intel_uncore.c:1928:1: warning: context imbalance in 'fwtable_read8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1929:1: warning: context imbalance in 'fwtable_read16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1930:1: warning: context imbalance in 'fwtable_read32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1931:1: warning: context imbalance in 'fwtable_read64' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1996:1: warning: context imbalance in 'gen6_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1997:1: warning: context imbalance in 'gen6_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1998:1: warning: context imbalance in 'gen6_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2018:1: warning: context imbalance in 'fwtable_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2019:1: warning: context imbalance in 'fwtable_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2020:1: warning: context imbalance in 'fwtable_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_wakeref.c:146:19: warning: context imbalance in 'wakeref_auto_timeout' - unexpected unlock
+drivers/gpu/drm/ttm/ttm_bo.c:1198:31: warning: symbol 'ttm_swap_ops' was not declared. Should it be static?
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:329:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:332:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:335:38:    expected void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:335:38:    got void [noderef] __iomem *
+drivers/gpu/drm/ttm/ttm_bo_util.c:335:38: warning: incorrect type in assignment (different address spaces)
+drivers/gpu/drm/ttm/ttm_bo_util.c:467:28:    expected void volatile [noderef] __iomem *addr
+drivers/gpu/drm/ttm/ttm_bo_util.c:467:28:    got void *virtual
+drivers/gpu/drm/ttm/ttm_bo_util.c:467:28: warning: incorrect type in argument 1 (different address spaces)
+./include/linux/srcu.h:373:9: warning: context imbalance in 'drm_dev_exit' - unexpected unlock

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


