Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160E8C54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC11610F109;
	Fri,  8 Mar 2024 05:43:33 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D62B10F2C3;
 Fri,  8 Mar 2024 05:43:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Refactor_VM_bind_code_=28?=
 =?utf-8?q?rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 05:43:32 -0000
Message-ID: <170987661238.611088.3329029845788761144@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308050806.577176-1-matthew.brost@intel.com>
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
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

Series: Refactor VM bind code (rev5)
URL   : https://patchwork.freedesktop.org/series/125608/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 963ac62414c11d8147c0cf1ba3472815d9dac11f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Mar 7 21:08:06 2024 -0800

    drm/xe: Add PT exec queues
    
    Add PT exec queues which are used to implement VM bind / unbind
    operations. PT exec queues use a different DRM scheduler backend
    (compared GuC / execlist submission backends) which use the CPU to
    update page tables once all dependecies for a job are resolved.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b drm-intel
b0359b62ff4f drm/xe: Lock all gpuva ops during VM bind IOCTL
5c2bb244cc83 drm/xe: Add ops_execute function which returns a fence
c25dddd2f21f drm/xe: Move migrate to prefetch to op_lock function
3c4329f6998c drm/xe: Add struct xe_vma_ops abstraction
a152641ffa1e drm/xe: Update xe_vm_rebind to use dummy VMA operations
52836c487a33 drm/xe: Simplify VM bind IOCTL error handling and cleanup
9d3583625484 drm/xe: Update pagefaults to use dummy VMA operations
8a4469265798 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
a5d05a4b6b32 drm/xe: Add some members to xe_vma_ops
702c1328de9b drm/xe: Add vm_bind_ioctl_ops_install_fences helper
c3622e636aca drm/xe: Move setting last fence to vm_bind_ioctl_ops_install_fences
bc13f68d562f drm/xe: Move ufence check to op_lock
56f9f18c8675 drm/xe: Move ufence add to vm_bind_ioctl_ops_install_fences
f9838167e688 drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this
1b46c3e40cc3 drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
83453581d188 drm/xe: Use ordered WQ for TLB invalidation fences
3fceac50f83d drm/xe: Delete PT update selftest
d6d37941b3d3 drm/xe: Convert multiple bind ops into single job
1649e2f1820f drm/xe: Remove old functions defs in xe_pt.h
3a558d597a84 drm/xe: Update PT layer with better error handling
eac579e57853 drm/xe: Update xe_vm_rebind to return int
18d8618cf404 drm/xe: Move vma rebinding to the drm_exec locking loop
860b89bffac5 drm/xe: Update VM trace events
e289a054215d drm/xe: Update clear / populate arguments
74ffccb2f205 drm/xe: Add __xe_migrate_update_pgtables_cpu helper
e81db6fd1720 drm/xe: CPU binds for jobs
7e7df13f7d1f drm/xe: Don't use migrate exec queue for page fault binds
1c6f5a5f5400 drm/xe: Add VM bind IOCTL error injection
c81b1259db7e drm/xe/guc: Assert time'd out jobs are not from a VM exec queue
963ac62414c1 drm/xe: Add PT exec queues
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:455: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#455: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 789 lines checked


