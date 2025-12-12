Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B33D59D71
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 15:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0B910E8FA;
	Fri, 12 Dec 2025 15:59:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143C510E8F6;
 Fri, 12 Dec 2025 15:59:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915/display=3A_All_?=
 =?utf-8?q?patches_to_make_PREEMPT=5FRT_work_on_xe=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Dec 2025 15:59:09 -0000
Message-ID: <176555514906.81112.5414952101581282442@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212143504.973839-14-dev@lankhorst.se>
In-Reply-To: <20251212143504.973839-14-dev@lankhorst.se>
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

Series: drm/i915/display: All patches to make PREEMPT_RT work on xe. (rev2)
URL   : https://patchwork.freedesktop.org/series/158855/
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
-
+drivers/gpu/drm/drm_bridge.c:220:6: warning: context imbalance in 'drm_bridge_enter' - different lock contexts for basic block
+drivers/gpu/drm/drm_bridge.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
+drivers/gpu/drm/drm_drv.c:449:6: warning: context imbalance in 'drm_dev_enter' - different lock contexts for basic block
+drivers/gpu/drm/drm_drv.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
+drivers/gpu/drm/drm_gem.c:487:9: warning: context imbalance in 'drm_gem_handle_create_tail' - unexpected unlock
+drivers/gpu/drm/drm_syncobj.c:602:24: warning: context imbalance in 'drm_syncobj_get_handle' - unexpected unlock
+drivers/gpu/drm/drm_syncobj.c:727:24: warning: context imbalance in 'drm_syncobj_fd_to_handle' - unexpected unlock
+./include/linux/srcu.h:389:9: warning: context imbalance in 'drm_bridge_exit' - unexpected unlock
+./include/linux/srcu.h:389:9: warning: context imbalance in 'drm_dev_exit' - unexpected unlock

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


