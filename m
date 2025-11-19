Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20535CF256A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 03:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF47E10E0B8;
	Wed, 19 Nov 2025 03:23:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C779F10E0B8;
 Wed, 19 Nov 2025 03:23:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/exec=3A_Validate_n?=
 =?utf-8?q?um=5Fsyncs_to_prevent_oversized_allocations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 03:23:54 -0000
Message-ID: <176352263481.6923.4819663909328888661@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251119024253.91942-2-shuicheng.lin@intel.com>
In-Reply-To: <20251119024253.91942-2-shuicheng.lin@intel.com>
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

Series: drm/xe/exec: Validate num_syncs to prevent oversized allocations (rev2)
URL   : https://patchwork.freedesktop.org/series/157757/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 44ec5a3507e48893c41b17fa866c6b2369f3ce53
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Nov 19 02:42:54 2025 +0000

    drm/xe/exec: Validate num_syncs to prevent oversized allocations
    
    The exec ioctl allows userspace to specify an arbitrary num_syncs
    value. Without bounds checking, a very large num_syncs can force
    an excessively large allocation, leading to kernel warnings from
    the page allocator as below.
    
    Introduce XE_EXEC_MAX_SYNCS (set to 64) and reject any request
    exceeding this limit.
    
    "
    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 1217 at mm/page_alloc.c:5124 __alloc_frozen_pages_noprof+0x2f8/0x2180 mm/page_alloc.c:5124
    ...
    Call Trace:
     <TASK>
     alloc_pages_mpol+0xe4/0x330 mm/mempolicy.c:2416
     ___kmalloc_large_node+0xd8/0x110 mm/slub.c:4317
     __kmalloc_large_node_noprof+0x18/0xe0 mm/slub.c:4348
     __do_kmalloc_node mm/slub.c:4364 [inline]
     __kmalloc_noprof+0x3d4/0x4b0 mm/slub.c:4388
     kmalloc_noprof include/linux/slab.h:909 [inline]
     kmalloc_array_noprof include/linux/slab.h:948 [inline]
     xe_exec_ioctl+0xa47/0x1e70 drivers/gpu/drm/xe/xe_exec.c:158
     drm_ioctl_kernel+0x1f1/0x3e0 drivers/gpu/drm/drm_ioctl.c:797
     drm_ioctl+0x5e7/0xc50 drivers/gpu/drm/drm_ioctl.c:894
     xe_drm_ioctl+0x10b/0x170 drivers/gpu/drm/xe/xe_device.c:224
     vfs_ioctl fs/ioctl.c:51 [inline]
     __do_sys_ioctl fs/ioctl.c:598 [inline]
     __se_sys_ioctl fs/ioctl.c:584 [inline]
     __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:584
     do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
     do_syscall_64+0xbb/0x380 arch/x86/entry/syscall_64.c:94
     entry_SYSCALL_64_after_hwframe+0x77/0x7f
    ...
    "
    
    v2: Add "Reported-by" and Cc stable kernels.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6450
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Reported-by: Koen Koning <koen.koning@intel.com>
    Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
    Cc: <stable@vger.kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch b603326a067916accf680fd623f4fc3c22bba487 drm-intel
44ec5a3507e4 drm/xe/exec: Validate num_syncs to prevent oversized allocations
-:46: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#46: 
Reported-by: Koen Koning <koen.koning@intel.com>
Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

-:47: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#47: 
Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: <stable@vger.kernel.org>

total: 0 errors, 2 warnings, 0 checks, 18 lines checked


