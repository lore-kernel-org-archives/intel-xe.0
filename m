Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39667D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 13:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4F210E04B;
	Mon,  1 Dec 2025 13:52:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B5F10E04B;
 Mon,  1 Dec 2025 13:52:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_Switch_to_use_kernel_sta?=
 =?utf-8?q?ndard_fault_injection_in_i915_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 13:52:56 -0000
Message-ID: <176459717634.44391.14677577838377996942@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251201130559.731361-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20251201130559.731361-1-juhapekka.heikkila@gmail.com>
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

Series: Switch to use kernel standard fault injection in i915 (rev5)
URL   : https://patchwork.freedesktop.org/series/155986/
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
+ /root/linux/maintainer-tools/dim sparse --fast 7f7b6cfa09ab1155b3e92ccfb7ae4bbfd41fec0c
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/gt/intel_reset.c:1569:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/gt/intel_sseu.c:600:17: error: too long token expansion
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
+drivers/gpu/drm/i915/i915_irq.c:467:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:467:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:475:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:475:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:480:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:518:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:518:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:526:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:526:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:531:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:575:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:575:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:578:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:578:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:582:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:582:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:589:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/intel_uncore.c:1930:1: warning: context imbalance in 'fwtable_read8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1931:1: warning: context imbalance in 'fwtable_read16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1932:1: warning: context imbalance in 'fwtable_read32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1933:1: warning: context imbalance in 'fwtable_read64' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1998:1: warning: context imbalance in 'gen6_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:1999:1: warning: context imbalance in 'gen6_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2000:1: warning: context imbalance in 'gen6_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2020:1: warning: context imbalance in 'fwtable_write8' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2021:1: warning: context imbalance in 'fwtable_write16' - unexpected unlock
+drivers/gpu/drm/i915/intel_uncore.c:2022:1: warning: context imbalance in 'fwtable_write32' - unexpected unlock
+drivers/gpu/drm/i915/intel_wakeref.c:148:19: warning: context imbalance in 'wakeref_auto_timeout' - unexpected unlock

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


