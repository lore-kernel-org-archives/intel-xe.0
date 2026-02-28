Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60011048922
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875DE10E155;
	Sat, 28 Feb 2026 01:43:41 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC10610E1E0;
 Sat, 28 Feb 2026 01:43:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CPU_binds_and_ULLS_on_mig?=
 =?utf-8?q?ration_queue_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Feb 2026 01:43:39 -0000
Message-ID: <177224301987.297701.5009034042774121458@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260228013501.106680-1-matthew.brost@intel.com>
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
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

Series: CPU binds and ULLS on migration queue (rev3)
URL   : https://patchwork.freedesktop.org/series/149888/
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
commit 531eaee59c3ac68792e045084aa7d5ae6a0b0ea6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Feb 27 17:35:01 2026 -0800

    drm/xe: Add modparam to enable / disable ULLS on migrate queue
    
    Having modparam to enable / disable ULLS on migrate queue will help with
    quick experiments.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1 drm-intel
c6d7a5d86f5a drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear vfuns
03799a61f336 drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
7e1e3cd4526c drm/xe: Decouple exec queue idle check from LRC
06c680c5a5e4 drm/xe: Add job count to GuC exec queue snapshot
9b9d70d7490a drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
ac11091a4b48 drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
71e369db81f3 drm/xe: Update scheduler job layer to support PT jobs
84b14a4ca5b4 drm/xe: Add helpers to access PT ops
549a82d6b216 drm/xe: Add struct xe_pt_job_ops
-:177: WARNING:ALLOC_WITH_SIZEOF: Prefer kmalloc_obj over kmalloc with sizeof
#177: FILE: drivers/gpu/drm/xe/xe_pt.c:2769:
+	pt_job_ops = kmalloc(sizeof(*pt_job_ops), GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 296 lines checked
6a327420218d drm/xe: Update GuC submission backend to run PT jobs
-:122: CHECK:LINE_SPACING: Please don't use multiple blank lines
#122: FILE: drivers/gpu/drm/xe/xe_migrate.h:161:
 
+

total: 0 errors, 0 warnings, 1 checks, 99 lines checked
b856a54d5750 drm/xe: Store level in struct xe_vm_pgtable_update
53b3d37165f1 drm/xe: Don't use migrate exec queue for page fault binds
a627e2044eca drm/xe: Enable CPU binds for jobs
4435208ab89b drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
9a118a617834 drm/xe: Make bind queues operate cross-tile
-:304: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#304: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__q, __i)	\
+	for (__i = 0; __i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++__i)	\
+		for_each_if((__q)->tlb_inval[__i].dep_scheduler)

total: 0 errors, 0 warnings, 1 checks, 630 lines checked
c91664d91904 drm/xe: Add CPU bind layer
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2335 lines checked
e7a0e614bea1 drm/xe: Add device flag to enable PT mirroring across tiles
a2c648d76671 drm/xe: Add xe_hw_engine_write_ring_tail
31a9b7b87b03 drm/xe: Add ULLS support to LRC
c5f1ef0cc157 drm/xe: Add ULLS migration job support to migration layer
9c4f8e2efd57 drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
1cd235bcabf8 drm/xe: Add ULLS migration job support to ring ops
118337e217f7 drm/xe: Add ULLS migration job support to GuC submission
582f957830f0 drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
531eaee59c3a drm/xe: Add modparam to enable / disable ULLS on migrate queue


