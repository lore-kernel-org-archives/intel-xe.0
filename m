Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7660AC001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4602210E6FE;
	Thu, 13 Jul 2023 15:30:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAA8110E6FC;
 Thu, 13 Jul 2023 15:30:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 49859A47E9;
 Thu, 13 Jul 2023 15:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 13 Jul 2023 15:30:09 -0000
Message-ID: <168926220929.14983.16074244764969192426@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230713132244.459605-12-matthew.auld@intel.com>
In-Reply-To: <20230713132244.459605-12-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?=5Fdevice=5Fmem=5Faccess_fixes_and_related_bits_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: xe_device_mem_access fixes and related bits (rev3)
URL   : https://patchwork.freedesktop.org/series/119213/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c106f9f368146c8189643b2020418d56a03aaf7
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Jul 13 14:22:55 2023 +0100

    drm/xe: add lockdep annotation for xe_device_mem_access_get()
    
    The atomics here might hide potential issues, also rpm core is not
    holding any lock when calling our rpm resume callback, so add a dummy lock
    with the idea that xe_pm_runtime_resume() is eventually going to be
    called when we are holding it. This only needs to happen once and then
    lockdep can validate all callers and their locks.
    
    v2: (Thomas Hellström)
     - Prefer static lockdep_map instead of full blown mutex.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ccde558371c92a1f8b3707fe7cf274e388c434dd drm-intel
40ebb9935 drm/xe: fix xe_device_mem_access_get() races
-:76: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "xe_pm_read_callback_task"
#76: FILE: drivers/gpu/drm/xe/xe_device.c:417:
+	if (xe_pm_read_callback_task(xe) != NULL)

-:238: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!xe_pm_read_callback_task"
#238: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1122:
+	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)

total: 0 errors, 0 warnings, 2 checks, 298 lines checked
beff01b1f drm/xe/vm: tidy up xe_runtime_pm usage
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
1fca4d354 drm/xe/debugfs: grab mem_access around forcewake
1a43ed19f drm/xe/guc_pc: add missing mem_access for freq_rpe_show
6a7abe621 drm/xe/mmio: grab mem_access in xe_mmio_ioctl
7f2aae5e7 drm/xe: ensure correct access_put ordering
46b6c8cb2 drm/xe: drop xe_device_mem_access_get() from guc_ct_send
d0a98a710 drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
72ddc926a drm/xe: drop xe_device_mem_access_get() from invalidation_vma
2c106f9f3 drm/xe: add lockdep annotation for xe_device_mem_access_get()


