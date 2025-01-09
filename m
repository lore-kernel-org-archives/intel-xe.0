Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86247E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 08:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4516B10E44C;
	Thu,  9 Jan 2025 08:09:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBE610E44C;
 Thu,  9 Jan 2025 08:09:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_PSR_DSB_support_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 08:09:46 -0000
Message-ID: <173641018606.1559502.4018802600792535530@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109073137.1977494-1-jouni.hogander@intel.com>
In-Reply-To: <20250109073137.1977494-1-jouni.hogander@intel.com>
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

Series: PSR DSB support (rev3)
URL   : https://patchwork.freedesktop.org/series/142521/
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
+ /root/linux/maintainer-tools/dim sparse --fast 9e5828f71dbb3bf6dff6a2bcfaa761d048344b2a
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
+drivers/gpu/drm/i915/display/intel_display_types.h:1976:24: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/display/intel_psr.c: note: in included file:
+drivers/gpu/drm/i915/i915_irq.c:451:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:451:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:459:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:459:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:464:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:464:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:464:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:501:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:501:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:509:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:509:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:514:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:514:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:514:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:557:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:557:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:560:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:560:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:564:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:564:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:571:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:571:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:571:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:571:9: warning: unreplaced symbol '<noident>'

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


