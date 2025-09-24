Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C767CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 17:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258F610E24E;
	Wed, 24 Sep 2025 17:19:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72FC10E24E;
 Wed, 24 Sep 2025 17:19:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/=7Bi915=2Cxe=7D/stol?=
 =?utf-8?q?en=3A_refactor_and_unify_interfaces?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 17:19:10 -0000
Message-ID: <175873435080.362669.13053931394346111559@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1758732183.git.jani.nikula@intel.com>
In-Reply-To: <cover.1758732183.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}/stolen: refactor and unify interfaces
URL   : https://patchwork.freedesktop.org/series/154984/
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
+ /root/linux/maintainer-tools/dim sparse --fast a4d9163251f4832a7d34d4b59449f9a68b9b7adf
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hotplug.c: note: in included file:
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
+drivers/gpu/drm/i915/i915_irq.c:466:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:466:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:474:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:474:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:479:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:479:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:479:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:517:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:517:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:525:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:525:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:530:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:530:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:530:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:574:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:574:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:577:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:577:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:581:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:581:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:588:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:588:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:588:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:588:9: warning: unreplaced symbol '<noident>'
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

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


