Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21AAC3ABA3
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 10:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BF410E8C3;
	Fri,  2 May 2025 10:30:28 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0124D10E8C3;
 Fri,  2 May 2025 10:30:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_Panel_Replay_+_Adaptive_?=
 =?utf-8?q?sync?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 May 2025 10:30:27 -0000
Message-ID: <174618182701.34838.7735306624935765730@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250502085902.154740-1-jouni.hogander@intel.com>
In-Reply-To: <20250502085902.154740-1-jouni.hogander@intel.com>
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

Series: Panel Replay + Adaptive sync
URL   : https://patchwork.freedesktop.org/series/148540/
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
+ /root/linux/maintainer-tools/dim sparse --fast b99e82e12d60e6c2e158f8c810a11740c07f2196
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/display/intel_alpm.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1985:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1998:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1998:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c:106:17: warning: cast truncates bits from constant value (e8d4a51000 becomes d4a51000)
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

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


