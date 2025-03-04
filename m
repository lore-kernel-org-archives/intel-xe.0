Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A218DC282D0
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 12:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7205510E5A8;
	Tue,  4 Mar 2025 12:25:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC8410E5A8;
 Tue,  4 Mar 2025 12:25:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_Introduce_drm_sharpness_?=
 =?utf-8?q?property_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 12:25:34 -0000
Message-ID: <174109113464.586116.17674799709094145491@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304102857.326544-1-nemesa.garg@intel.com>
In-Reply-To: <20250304102857.326544-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev10)
URL   : https://patchwork.freedesktop.org/series/139954/
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
+ /root/linux/maintainer-tools/dim sparse --fast 1cf56e26a93292ca26fbf891368b75a67e8700dc
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/display/intel_casf.c:44:11: warning: symbol 'filtercoeff_1' was not declared. Should it be static?
+drivers/gpu/drm/i915/display/intel_casf.c:50:11: warning: symbol 'filtercoeff_2' was not declared. Should it be static?
+drivers/gpu/drm/i915/display/intel_casf.c:56:11: warning: symbol 'filtercoeff_3' was not declared. Should it be static?
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1993:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2006:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2006:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c:106:17: warning: cast truncates bits from constant value (e8d4a51000 becomes d4a51000)
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
+drivers/gpu/drm/i915/i915_irq.c:490:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:490:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:498:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:498:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:503:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:503:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:503:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:540:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:540:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:548:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:548:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:553:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:553:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:553:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:596:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:596:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:599:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:599:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:603:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:603:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:610:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:610:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:610:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:610:9: warning: unreplaced symbol '<noident>'
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


