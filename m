Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A1BC61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DFF10F6FD;
	Fri,  4 Sep 2026 00:47:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2957F10F3A4;
 Fri,  4 Sep 2026 00:47:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CPU_binds_and_ULLS_on_mig?=
 =?utf-8?q?ration_queue_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 00:47:37 -0000
Message-ID: <178848285716.121713.4687700422228971607@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903235842.3401722-1-matthew.brost@intel.com>
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
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

Series: CPU binds and ULLS on migration queue (rev6)
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
commit 68b14d4b181af4041d0b713be2e643a1b354ce00
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Sep 3 16:58:42 2026 -0700

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
e99c82be4164 drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear vfuns
68aec156a212 drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
a5af43ce36a5 drm/xe: Decouple exec queue idle check from LRC
35d716c3dd93 drm/xe: Add job count to GuC exec queue snapshot
f785360d5554 drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
35b631062bcf drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
64c2c47db7e1 drm/xe: Update scheduler job layer to support PT jobs
f88fc942b036 drm/xe: Add helpers to access PT ops
23d3af849e14 drm/xe: Add struct xe_pt_job_ops
-:179: WARNING:ALLOC_WITH_SIZEOF: Prefer kmalloc_obj over kmalloc with sizeof
#179: FILE: drivers/gpu/drm/xe/xe_pt.c:2980:
+	pt_job_ops = kmalloc(sizeof(*pt_job_ops), GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 296 lines checked
a7f9dded5697 drm/xe: Update GuC submission backend to run PT jobs
-:125: CHECK:LINE_SPACING: Please don't use multiple blank lines
#125: FILE: drivers/gpu/drm/xe/xe_migrate.h:167:
 
+

total: 0 errors, 0 warnings, 1 checks, 100 lines checked
4768e31ab635 drm/xe: Store level in struct xe_vm_pgtable_update
d23af916d835 drm/xe: Don't use migrate exec queue for page fault binds
f8002c748c36 drm/xe: Enable CPU binds for jobs
524c3c0e0390 drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
f0becdf6a0cf drm/xe: Make bind queues operate cross-tile
-:222: ERROR:SPACING: space required after that ';' (ctx:VxV)
#222: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:1737:
+	q->tlb_inval[idx].last_fence = NULL;}
 	                                   ^

-:306: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#306: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__q, __i)	\
+	for (__i = 0; __i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++__i)	\
+		for_each_if((__q)->tlb_inval[__i].dep_scheduler)

total: 1 errors, 0 warnings, 1 checks, 624 lines checked
5ba4a71dee84 drm/xe: Add CPU bind layer
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2324 lines checked
71733aacb3f3 drm/xe: Add device flag to enable PT mirroring across tiles
361e0da643ed drm/xe: Add xe_hw_engine_write_ring_tail
653cc5b6c569 drm/xe: Add ULLS support to LRC
54fa13a279b6 drm/xe: Add ULLS migration job support to migration layer
cb3dc4613fc2 drm/xe: Add ULLS migration job support to ring ops
990cfae4513a drm/xe: Add ULLS migration job support to GuC submission
3152a92a32db drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
d2215068cd3e drm/xe: Add modparam to enable / disable ULLS on migrate queue
68b14d4b181a drm/xe: Document ULLS for migration jobs


