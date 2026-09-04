Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C35EC624DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBA610E4CB;
	Fri,  4 Sep 2026 02:29:25 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6632F10E4CB;
 Fri,  4 Sep 2026 02:29:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CPU_binds_and_ULLS_on_mig?=
 =?utf-8?q?ration_queue_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 02:29:24 -0000
Message-ID: <178848896438.121713.5059540556641811784@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260904022207.3490018-1-matthew.brost@intel.com>
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
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

Series: CPU binds and ULLS on migration queue (rev7)
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
commit 961ffbfef88b621426a94b5d6ecfb25319823735
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Sep 3 19:22:07 2026 -0700

    drm/xe: Document ULLS for migration jobs
    
    Add a kernel-doc DOC section at the top of xe_migrate.c describing the
    Ultra Low Latency Submission (ULLS) scheme used for migration jobs.
    
    Cover the motivation (removing the H2G / GuC / context switch latency
    from the page fault and SVM prefetch critical paths), the platform
    requirements, the LRC PPHWSP semaphore layout and its relationship to
    the migration queue job count, the ring preamble / postamble emitted by
    the ring ops, the MMIO tail write submission fast path in the GuC
    backend, and the enter / delayed exit flow along with the ULLS job
    flags.
    
    Hook the new section into Documentation/gpu/xe/xe_migrate.rst.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Assisted-by: Github-Copilot:Claude-opus-5
+ /mt/dim checkpatch 71bc3b7cc55631a9b3807da98e2b2880838b9623 drm-intel
1c6df1997f19 drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear vfuns
0dd32ab605a1 drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
1ed45fab0ad3 drm/xe: Decouple exec queue idle check from LRC
d62dd3fc9792 drm/xe: Add job count to GuC exec queue snapshot
928725823327 drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
4bf1a8fe5084 drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
03b988260327 drm/xe: Update scheduler job layer to support PT jobs
54bed5b08598 drm/xe: Add helpers to access PT ops
98816c5de410 drm/xe: Add struct xe_pt_job_ops
41e9e6dafb13 drm/xe: Update GuC submission backend to run PT jobs
2d90557510af drm/xe: Store level in struct xe_vm_pgtable_update
3337871a8c95 drm/xe: Don't use migrate exec queue for page fault binds
829dfa7fbf57 drm/xe: Enable CPU binds for jobs
7e20bd926c21 drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
3783b4633ceb drm/xe: Make bind queues operate cross-tile
-:306: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#306: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__q, __i)	\
+	for (__i = 0; __i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++__i)	\
+		for_each_if((__q)->tlb_inval[__i].dep_scheduler)

total: 0 errors, 0 warnings, 1 checks, 624 lines checked
17fda0399c46 drm/xe: Add CPU bind layer
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2327 lines checked
5d3046682ea8 drm/xe: Add device flag to enable PT mirroring across tiles
ff5799dd2ace drm/xe: Add xe_hw_engine_write_ring_tail
48eb8aab5882 drm/xe: Add ULLS support to LRC
8cb9a475038e drm/xe: Add ULLS migration job support to migration layer
7858592a3e78 drm/xe: Add ULLS migration job support to ring ops
9afba951d8c5 drm/xe: Add ULLS migration job support to GuC submission
662eb7941204 drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
5d65a745b07e drm/xe: Add modparam to enable / disable ULLS on migrate queue
961ffbfef88b drm/xe: Document ULLS for migration jobs


