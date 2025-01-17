Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E16FC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 02:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE2989F41;
	Fri, 17 Jan 2025 02:08:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BB110E180;
 Fri, 17 Jan 2025 02:08:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/xe/pmu=3A_PMU_interf?=
 =?utf-8?q?ace_for_Xe_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 02:08:51 -0000
Message-ID: <173707973139.484510.6012572804281674917@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116230718.82460-1-lucas.demarchi@intel.com>
In-Reply-To: <20250116230718.82460-1-lucas.demarchi@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe (rev13)
URL   : https://patchwork.freedesktop.org/series/139121/
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
+ /root/linux/maintainer-tools/dim sparse --fast 58078c97cb752a5ea9ae2f2e3ab898945153d39e
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1963:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1976:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:
+drivers/gpu/drm/i915/gt/intel_reset.c:1544:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
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
+drivers/gpu/drm/i915/i915_irq.c:453:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:453:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:461:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:461:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:466:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:466:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:466:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:503:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:503:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:511:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:511:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:516:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:516:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:516:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:559:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:559:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:562:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:562:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:566:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:566:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:573:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:573:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:573:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:573:9: warning: unreplaced symbol '<noident>'
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

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


