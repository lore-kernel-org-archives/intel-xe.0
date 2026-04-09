Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C7C10FC456
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 00:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED59E10E717;
	Thu,  9 Apr 2026 00:44:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DB110E6F7;
 Thu,  9 Apr 2026 00:44:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_potential_N?=
 =?utf-8?q?ULL_deref_in_xe=5Fexec=5Fqueue=5Ftlb=5Finval=5Flast=5Ffence=5Fput?=
 =?utf-8?q?=5Funlocked?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Apr 2026 00:44:09 -0000
Message-ID: <177569544919.444591.5797901316358235729@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409003449.3405767-1-shuicheng.lin@intel.com>
In-Reply-To: <20260409003449.3405767-1-shuicheng.lin@intel.com>
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

Series: drm/xe: Fix potential NULL deref in xe_exec_queue_tlb_inval_last_fence_put_unlocked
URL   : https://patchwork.freedesktop.org/series/164582/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 49563b7509ba8e613905a4135cbfe0bfbe330a2c
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Apr 9 00:34:49 2026 +0000

    drm/xe: Fix potential NULL deref in xe_exec_queue_tlb_inval_last_fence_put_unlocked
    
    xe_exec_queue_tlb_inval_last_fence_put_unlocked() uses q->vm->xe as the
    first argument to xe_assert(). This function is called unconditionally
    from xe_exec_queue_destroy() for all queues, including kernel queues
    that have q->vm == NULL (e.g., queues created during GT init in
    xe_gt_record_default_lrcs() with vm=NULL).
    
    While current compilers optimize away the q->vm->xe dereference (even
    in CONFIG_DRM_XE_DEBUG=y builds, the compiler pushes the dereference
    into the WARN branch that is only taken when the assert condition is
    false), the code is semantically incorrect and constitutes undefined
    behavior in the C abstract machine for the NULL pointer case.
    
    Use gt_to_xe(q->gt) instead, which is always valid for any exec queue.
    This is consistent with how xe_exec_queue_destroy() itself obtains the
    xe_device pointer in its own xe_assert at the top of the function.
    
    Fixes: b2d7ec41f2a3 ("drm/xe: Attach last fence to TLB invalidation job queues")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch 08037efa91c349ee17b62ddd1908a846d7abd917 drm-intel
49563b7509ba drm/xe: Fix potential NULL deref in xe_exec_queue_tlb_inval_last_fence_put_unlocked
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#25: 
Assisted-by: Claude:claude-opus-4.6

-:25: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#25: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 8 lines checked


