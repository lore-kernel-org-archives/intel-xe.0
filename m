Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D02DCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 03:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E9110E6F9;
	Wed, 15 Oct 2025 03:45:41 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4B810E6F0;
 Wed, 15 Oct 2025 03:45:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915/display=3A_Add_?=
 =?utf-8?q?initial_support_for_Xe3p=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 03:45:40 -0000
Message-ID: <176049994095.14218.11583233747534432721@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015-xe3p_lpd-basic-enabling-v1-0-d2d1e26520aa@intel.com>
In-Reply-To: <20251015-xe3p_lpd-basic-enabling-v1-0-d2d1e26520aa@intel.com>
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

Series: drm/i915/display: Add initial support for Xe3p_LPD
URL   : https://patchwork.freedesktop.org/series/155951/
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
+ /root/linux/maintainer-tools/dim sparse --fast c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
+drivers/gpu/drm/i915/gt/intel_reset.c:1569:12: warning: context imbalance in '_intel_gt_reset_lock' - different lock contexts for basic block
+drivers/gpu/drm/i915/i915_gpu_error.c:692:3: warning: symbol 'guc_hw_reg_state' was not declared. Should it be static?
+drivers/gpu/drm/i915/i915_irq.c:465:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:465:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:473:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:473:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:478:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:478:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:478:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:516:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:516:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:524:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:524:16: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:529:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:529:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:529:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:573:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:573:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:576:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:576:15: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:580:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:580:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:587:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:587:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:587:9: warning: unreplaced symbol '<noident>'
+drivers/gpu/drm/i915/i915_irq.c:587:9: warning: unreplaced symbol '<noident>'

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


