Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFE2C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104E310E199;
	Fri,  4 Sep 2026 21:24:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB5210E22C;
 Fri,  4 Sep 2026 21:24:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CPU_binds_and_ULLS_on_mig?=
 =?utf-8?q?ration_queue_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 21:24:17 -0000
Message-ID: <178855705710.125641.14148958819839704948@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904211613.3934307-1-matthew.brost@intel.com>
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
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

Series: CPU binds and ULLS on migration queue (rev8)
URL   : https://patchwork.freedesktop.org/series/149888/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e92543fdc87afd04b2716f44030cb0b79a8b0538
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Sep 4 14:16:13 2026 -0700

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
+ /mt/dim checkpatch 313da1cc22491f07075c7ae36372343aa235d11e drm-intel
3f0964f19092 drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear vfuns
0bb0f74b37c4 drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
903bc751a0f4 drm/xe: Decouple exec queue idle check from LRC
3ae94e6432cf drm/xe: Add job count to GuC exec queue snapshot
74d624faf20e drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
e0fec97de72d drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
c55bdbf1cd3e drm/xe: Update scheduler job layer to support PT jobs
416b38624fd1 drm/xe: Add helpers to access PT ops
0a45e1658d52 drm/xe: Add struct xe_pt_job_ops
c33eb11129ab drm/xe: Update GuC submission backend to run PT jobs
4e1c7a1b0327 drm/xe: Store level in struct xe_vm_pgtable_update
6bf01c038cba drm/xe: Don't use migrate exec queue for page fault binds
682c481214c5 drm/xe: Enable CPU binds for jobs
7897ddeca8bb drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
f136941207a5 drm/xe: Make bind queues operate cross-tile
-:306: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#306: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__q, __i)	\
+	for (__i = 0; __i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++__i)	\
+		for_each_if((__q)->tlb_inval[__i].dep_scheduler)

total: 0 errors, 0 warnings, 1 checks, 624 lines checked
11ea65bba5b6 drm/xe: Add CPU bind layer
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2327 lines checked
18be7d565070 drm/xe: Add device flag to enable PT mirroring across tiles
30af6af543f0 drm/xe: Add ULLS support to LRC
b1686ea4a5c3 drm/xe: Add ULLS migration job support to migration layer
c126c1ce3e60 drm/xe: Add ULLS migration job support to ring ops
fc79d48c2f1f drm/xe: Add ULLS migration job support to GuC submission
4678e0f306bf drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
b3f372e9a7b0 drm/xe: Add modparam to enable / disable ULLS on migrate queue
e92543fdc87a drm/xe: Document ULLS for migration jobs


