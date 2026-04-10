Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEF7F36BA6
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 03:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D815710E00F;
	Fri, 10 Apr 2026 03:18:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A310610E00F;
 Fri, 10 Apr 2026 03:18:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/1=5D_drm/xe=3A_Fix_error_cleanup_in_xe=5Fexec=5Fqueue=5Fcreate?=
 =?utf-8?q?=5Fioctl=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 03:18:23 -0000
Message-ID: <177579110364.449057.7336473864425807945@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408020647.3397933-1-shuicheng.lin@intel.com>
In-Reply-To: <20260408020647.3397933-1-shuicheng.lin@intel.com>
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

Series: series starting with [1/1] drm/xe: Fix error cleanup in xe_exec_queue_create_ioctl() (rev2)
URL   : https://patchwork.freedesktop.org/series/164483/
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
commit 1249aa881479fc81bfbd25d0ae3cf7e897ca75ae
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Wed Apr 8 02:06:47 2026 +0000

    drm/xe: Fix error cleanup in xe_exec_queue_create_ioctl()
    
    Two error handling issues exist in xe_exec_queue_create_ioctl():
    
    1. When xe_hw_engine_group_add_exec_queue() fails, the error path jumps
       to put_exec_queue which skips xe_exec_queue_kill(). If the VM is in
       preempt fence mode, xe_vm_add_compute_exec_queue() has already added
       the queue to the VM's compute exec queue list. Skipping the kill
       leaves the queue on that list, leading to a dangling pointer after
       the queue is freed.
    
    2. When xa_alloc() fails after xe_hw_engine_group_add_exec_queue() has
       succeeded, the error path does not call
       xe_hw_engine_group_del_exec_queue() to remove the queue from the hw
       engine group list. The queue is then freed while still linked into
       the hw engine group, causing a use-after-free.
    
    Fix both by:
    - Changing the xe_hw_engine_group_add_exec_queue() failure path to jump
      to kill_exec_queue so that xe_exec_queue_kill() properly removes the
      queue from the VM's compute list.
    - Adding a del_hw_engine_group label before kill_exec_queue for the
      xa_alloc() failure path, which removes the queue from the hw engine
      group before proceeding with the rest of the cleanup.
    
    Fixes: 7970cb36966c ("'drm/xe/hw_engine_group: Register hw engine group's exec queues")
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Assisted-by: Claude:claude-opus-4.6
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 97d8833ffba6bd3d6aaa51169069620ac17a2e37 drm-intel
1249aa881479 drm/xe: Fix error cleanup in xe_exec_queue_create_ioctl()
-:33: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#33: 
Assisted-by: Claude:claude-opus-4.6

-:33: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4.6'
#33: 
Assisted-by: Claude:claude-opus-4.6

total: 1 errors, 1 warnings, 0 checks, 24 lines checked


