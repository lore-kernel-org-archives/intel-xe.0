Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8555D49234
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 14:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AB210E248;
	Fri, 12 Dec 2025 14:47:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48D210E248;
 Fri, 12 Dec 2025 14:47:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_c?=
 =?utf-8?q?lean_up_parent_interface_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Dec 2025 14:47:10 -0000
Message-ID: <176555083079.81112.828529689365556937@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1765548786.git.jani.nikula@intel.com>
In-Reply-To: <cover.1765548786.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: clean up parent interface definitions
URL   : https://patchwork.freedesktop.org/series/158862/
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
+ /root/linux/maintainer-tools/dim sparse --fast 39f65c105d5b1af093f9df6f3dc688a642f96456
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
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

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


