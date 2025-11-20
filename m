Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9A8CF8854
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DA710E067;
	Thu, 20 Nov 2025 13:19:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B391210E067;
 Thu, 20 Nov 2025 13:19:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_locking/ww=5Fmutex=2C_dm?=
 =?utf-8?q?a-buf/dma-resv=3A_Improve_detection_of_unheld_locks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 13:19:57 -0000
Message-ID: <176364479772.13718.11115139560644789886@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
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

Series: locking/ww_mutex, dma-buf/dma-resv: Improve detection of unheld locks
URL   : https://patchwork.freedesktop.org/series/157838/
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
+ /root/linux/maintainer-tools/dim sparse --fast 13909978d70fc4ded88b778a313b68ad86ba881a
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/drm_drv.c:449:6: warning: context imbalance in 'drm_dev_enter' - different lock contexts for basic block
+drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
+drivers/gpu/drm/i915/display/intel_alpm.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_casf.c:147:21: error: too long token expansion
+drivers/gpu/drm/i915/display/intel_ddi.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2072:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2085:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2085:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_display_types.h:2085:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_hdcp.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_hotplug.c: note: in included file:
+drivers/gpu/drm/i915/display/intel_lt_phy.c:1935:35: warning: Using plain integer as NULL pointer
+drivers/gpu/drm/i915/display/intel_pps.c: note: in included file:
+./include/linux/srcu.h:389:9: warning: context imbalance in 'drm_dev_exit' - unexpected unlock

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


