Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7637AC3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 18:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C72410E5C3;
	Tue, 20 May 2025 18:09:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F04A10E5EA;
 Tue, 20 May 2025 18:09:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_Panel_Replay_+_Adaptive_?=
 =?utf-8?q?sync_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 18:09:36 -0000
Message-ID: <174776457658.6224.4802589577943457288@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
In-Reply-To: <20250520165326.1631330-1-jouni.hogander@intel.com>
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

Series: Panel Replay + Adaptive sync (rev2)
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
+ /root/linux/maintainer-tools/dim sparse --fast 45c2c8c74ab88c8fb741ea8349b051f5aec87320
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/display/intel_alpm.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_cdclk.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:1991:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2004:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2004:24: warning: unreplaced symbol '<noident>'
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


