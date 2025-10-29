Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D26CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 12:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C345610E7B0;
	Wed, 29 Oct 2025 12:05:00 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C1E10E7AF;
 Wed, 29 Oct 2025 12:05:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_Testing_PREEMPT=5FRT_wit?=
 =?utf-8?q?h_disabling_preemption_in_the_most_critical_section=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Oct 2025 12:05:00 -0000
Message-ID: <176173950015.68102.15014022875630338657@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251029095934.16813-1-dev@lankhorst.se>
In-Reply-To: <20251029095934.16813-1-dev@lankhorst.se>
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

Series: Testing PREEMPT_RT with disabling preemption in the most critical section.
URL   : https://patchwork.freedesktop.org/series/156729/
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
+ /root/linux/maintainer-tools/dim sparse --fast 1a9600afa443248d01701fd489012edcfdc3e128
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/drm_drv.c:449:6: warning: context imbalance in 'drm_dev_enter' - different lock contexts for basic block
+drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
+drivers/gpu/drm/drm_gem.c:446:9: warning: context imbalance in 'drm_gem_handle_create_tail' - unexpected unlock
+drivers/gpu/drm/drm_plane.c:213:24: warning: Using plain integer as NULL pointer
+drivers/gpu/drm/drm_syncobj.c:602:24: warning: context imbalance in 'drm_syncobj_get_handle' - unexpected unlock
+drivers/gpu/drm/drm_syncobj.c:727:24: warning: context imbalance in 'drm_syncobj_fd_to_handle' - unexpected unlock
+./include/linux/srcu.h:389:9: warning: context imbalance in 'drm_dev_exit' - unexpected unlock

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


