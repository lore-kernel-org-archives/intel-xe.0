Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D6DC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 12:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7026C10E7BC;
	Fri, 21 Mar 2025 12:55:08 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB27A10E7BC;
 Fri, 21 Mar 2025 12:55:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_Implement_Wa=5F140217687?=
 =?utf-8?q?92_to_bypass_m=5Fn_ratio_limit_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 12:55:07 -0000
Message-ID: <174256170775.64531.12661680334253100201@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321112650.3594298-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321112650.3594298-1-ankit.k.nautiyal@intel.com>
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

Series: Implement Wa_14021768792 to bypass m_n ratio limit (rev4)
URL   : https://patchwork.freedesktop.org/series/138256/
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
+ /root/linux/maintainer-tools/dim sparse --fast b15a87713d14b1c2986f47a622c5a8c5458e2396
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/gt/intel_reset.c:1571:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_irq.c:491:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:491:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:499:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:499:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:504:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:504:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:504:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:542:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:542:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:550:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:550:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:555:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:555:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:555:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:599:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:599:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:602:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:602:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:606:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:606:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:613:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:613:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:613:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:613:9: warning: unreplaced symbol '<noident>'
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

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


