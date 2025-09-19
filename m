Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BB7CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 17:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384BC10EA67;
	Fri, 19 Sep 2025 17:15:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A229310EA65;
 Fri, 19 Sep 2025 17:15:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915/xe3=3A_Restrict?=
 =?utf-8?q?_PTL_intel=5Fencoder=5Fis=5Fc10phy=28=29_to_only_PHY_A_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Sep 2025 17:15:49 -0000
Message-ID: <175830214965.348815.16475835196363800795@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250919162233.1624905-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250919162233.1624905-1-dnyaneshwar.bhadane@intel.com>
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

Series: drm/i915/xe3: Restrict PTL intel_encoder_is_c10phy() to only PHY A (rev2)
URL   : https://patchwork.freedesktop.org/series/154233/
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
+ /root/linux/maintainer-tools/dim sparse --fast 6279a928fb7ed7a69e44171637abf2bf50668a9c
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/display/intel_alpm.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2023:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2036:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2036:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2036:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_hotplug.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:
+drivers/gpu/drm/i915/i915_irq.c:486:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:486:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:494:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:494:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:499:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:499:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:499:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:537:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:537:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:545:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:545:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:550:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:550:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:550:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:594:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:594:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:597:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:597:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:601:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:601:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:608:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:608:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:608:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:608:9: warning: unreplaced symbol '<noident>'
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

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


