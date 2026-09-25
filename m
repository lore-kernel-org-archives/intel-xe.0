Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E056AC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 21:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500F710E24E;
	Fri, 25 Sep 2026 21:02:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A8F10E1D0;
 Fri, 25 Sep 2026 21:02:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CPU_binds_and_ULLS_on_mig?=
 =?utf-8?q?ration_queue_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Sep 2026 21:02:08 -0000
Message-ID: <179037012806.208168.15239142805408994679@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925201526.1355279-1-matthew.brost@intel.com>
In-Reply-To: <20260925201526.1355279-1-matthew.brost@intel.com>
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

Series: CPU binds and ULLS on migration queue (rev10)
URL   : https://patchwork.freedesktop.org/series/149888/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 62bf9bdad6b4f92e9b737f4695f48dae0311f46f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Sep 25 13:15:26 2026 -0700

    drm/xe: Document ULLS for migration jobs
    
    Add a kernel-doc DOC section at the top of xe_migrate.c describing the
    Ultra Low Latency Submission (ULLS) scheme used for migration jobs.
    
    Cover the motivation (removing the H2G / GuC / context switch latency
    from the page fault and SVM prefetch critical paths), the platform
    requirements, the LRC PPHWSP semaphore layout and its relationship to
    the migration queue job count, the fixed ULLS job size and why it is
    needed, the ring preamble / postamble emitted by the ring ops including
    the in-ring tail update, the semaphore-only submission fast path in the
    GuC backend, and the enter / delayed exit flow along with the ULLS job
    flags.
    
    Hook the new section into Documentation/gpu/xe/xe_migrate.rst.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Assisted-by: Github-Copilot:Claude-opus-5
    Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch d3e3b787ba0daa01200907e0efeaa3f7da201a74 drm-intel
8b87c37ccb79 drm/xe: reference VM from PT BOs
c837af88eb86 drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear vfuns
2779d996dbbe drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
63cf10c3b3d9 drm/xe: Decouple exec queue idle check from LRC
dae9ef19ad9c drm/xe: Add job count to GuC exec queue snapshot
b7e818b817ac drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
b20d33137ed1 drm/xe: Update scheduler job layer to support PT jobs
46eac24317bd drm/xe: Add helpers to access PT ops
295a0710c84e drm/xe: Add struct xe_pt_job_ops
e93ea5a95d49 drm/xe: Update GuC submission backend to run PT jobs
ee914b98d214 drm/xe: Store level in struct xe_vm_pgtable_update
f59dc8edfb0f drm/xe: Don't use migrate exec queue for page fault binds
3e5992082e5d drm/xe: Enable CPU binds for jobs
2a204b5b703c drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
b518a60decab drm/xe: Make bind queues operate cross-tile
-:306: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#306: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__q, __i)	\
+	for (__i = 0; __i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++__i)	\
+		for_each_if((__q)->tlb_inval[__i].dep_scheduler)

total: 0 errors, 0 warnings, 1 checks, 623 lines checked
0cac43dcdb99 drm/xe: Add CPU bind layer
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2309 lines checked
f5957b243fa9 drm/xe: Add device flag to enable PT mirroring across tiles
5a96ac520b34 drm/xe: Add ULLS support to LRC
c668ad151521 drm/xe: Add ULLS migration job support to migration layer
045a8ab544cf drm/xe: Add ULLS migration job support to ring ops
1859561c4230 drm/xe: Add ULLS migration job support to GuC submission
b25c6217b553 drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
1a3b43367a82 drm/xe: add migrate ULLS period configfs attribute
62bf9bdad6b4 drm/xe: Document ULLS for migration jobs


