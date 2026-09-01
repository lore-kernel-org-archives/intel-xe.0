Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77F0C61DE4
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616AE10E372;
	Tue,  1 Sep 2026 03:38:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AFB10E372;
 Tue,  1 Sep 2026 03:38:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/shrinker=3A_Runtim?=
 =?utf-8?q?e_PM_and_walk_termination_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Sep 2026 03:38:27 -0000
Message-ID: <178823390715.106089.13010191293365803582@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901033153.219481-1-shuicheng.lin@intel.com>
In-Reply-To: <20260901033153.219481-1-shuicheng.lin@intel.com>
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

Series: drm/xe/shrinker: Runtime PM and walk termination fixes
URL   : https://patchwork.freedesktop.org/series/173109/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9c5d926d7df7dbf5be6f314919b800440851243d
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Tue Sep 1 03:31:53 2026 +0000

    drm/xe/shrinker: Take a runtime PM ref before shrinking non-system memory
    
    __xe_shrinker_walk() walks the SYSTEM and TT LRUs without a runtime PM
    reference.  Shrinking a bo outside system memory invalidates its GPU
    mappings, which needs the device resumed, so while it is runtime
    suspended the page table zap trips an assert and the TLB invalidation
    returns -ENODEV:
    
      WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at xe_bo_move_notify+0x1fc/0x450 [xe]
       xe_bo_shrink+0x20f/0x2b0 [xe]
       __xe_shrinker_walk+0x174/0x410 [xe]
       xe_shrinker_scan+0x10c/0x1e0 [xe]
       do_shrink_slab+0x176/0x7e0
       drop_caches_sysctl_handler+0x9c/0xf0
    
    Take a reference before walking a memory type other than XE_PL_SYSTEM
    and stop there if the device is not active, queueing the shrinker PM
    worker so a later scan can pick those bos up.  Stop the walk once the
    scan target is met, so a satisfied scan does not wake the device.
    System memory is still reclaimed while the device is suspended.
    
    Gate this on xe_device_is_l2_flush_optimized(), the same condition under
    which xe_bo_trigger_rebind() issues the invalidation for a non-fault-mode
    vm, so reclaim is unaffected elsewhere.  The System CCS copy already has
    its own reference in xe_bo_shrink().
    
    Only a non-fault-mode vm can reach this, since a fault-mode vm requires
    LR mode and that holds a runtime PM reference for the vm's lifetime.
    
    Reproduced with igt@xe_madvise@dontneed-before-exec while the GPU is
    runtime suspended.
    
    v2: simplify needs_rpm check. (Matt)
        retarget Fixes tag since the issue occurs with the non-fault-mode
        path added by 4e7ebff69aed.
    v3: handle this in xe_shrinker.c instead of xe_bo.c (Thomas)
    v4: stop the walk once the scan target is met. (Sashiko)
    
    Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
    Assisted-by: Claude:claude-opus-5
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 767678cbbd122f2e17421e3474b3de1b9cec35f4 drm-intel
0be3a50d9764 drm/xe/shrinker: Do not abort the walk on unshrinkable bos
-:22: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#22: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
9c5d926d7df7 drm/xe/shrinker: Take a runtime PM ref before shrinking non-system memory


