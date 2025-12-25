Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689BAE784A9
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC2F11A22E;
	Thu, 25 Dec 2025 01:25:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7240911A22E;
 Thu, 25 Dec 2025 01:25:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fence_deadlines_in_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Dec 2025 01:25:20 -0000
Message-ID: <176662592046.117299.17852896495800149792@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251225011734.341683-1-matthew.brost@intel.com>
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
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

Series: Fence deadlines in Xe
URL   : https://patchwork.freedesktop.org/series/159479/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 57a616bdccfbb37cf2e5ee97369a498393dbf2d2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Dec 24 17:17:34 2025 -0800

    drm/xe: Add exec queue deadline trace points
    
    Add exec queue deadline trace points to help debug and profile the
    deadline implementation.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5c680ac45628b1951d20a444f400c82242029031 drm-intel
c2c665d12514 drm/xe: Add dedicated message lock
0d853ea7942e drm/xe: Add EXEC_QUEUE_FLAG_CAP_SYS_NICE
373af0e47c0e drm/xe: Store exec queue in hardware fence
bfd1dcedf478 drm/xe: Add deadline exec queue vfuncs
8281afdd155f drm/xe: Export to_xe_hw_fence
27d2eb31dc5e drm/xe: Add deadline manager
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

-:119: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#119: FILE: drivers/gpu/drm/xe/xe_deadline_mgr.c:85:
+
+}

-:165: CHECK:LINE_SPACING: Please don't use multiple blank lines
#165: FILE: drivers/gpu/drm/xe/xe_deadline_mgr.c:131:
+
+

total: 0 errors, 1 warnings, 2 checks, 308 lines checked
482ae2e6dea1 drm/xe: Add deadline manager to user exec queues
819c1bd106be drm/xe: Stub out execlists deadline vfuncs as NOPs
a10c43abe6c5 drm/xe: Make scheduler message lock IRQ-safe
-:82: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'sched' may be better as '(sched)' to avoid precedence issues
#82: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:34:
+#define xe_sched_msg_lock(sched)	\
+	scoped_guard(spinlock_irqsave, &sched->msg_lock)

total: 0 errors, 0 warnings, 1 checks, 110 lines checked
91baa6abb5a6 drm/xe: Implement GuC submission backend ops for deadlines
6614fc118515 drm/xe: Enable deadlines on hardware fences
3066661b59d8 drm/xe: Add CONFIG_DRM_XE_DEADLINE_WINDOW
57a616bdccfb drm/xe: Add exec queue deadline trace points


