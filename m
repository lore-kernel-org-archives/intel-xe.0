Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72559CD6E75
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D3911A1F8;
	Thu,  4 Jun 2026 17:22:07 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791BA10E1C2;
 Thu,  4 Jun 2026 17:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CPU_binds_and_ULLS_on_mig?=
 =?utf-8?q?ration_queue_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jun 2026 17:22:06 -0000
Message-ID: <178059372649.44886.9877454767397083147@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604171502.84047-1-dev@lankhorst.se>
In-Reply-To: <20260604171502.84047-1-dev@lankhorst.se>
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

Series: CPU binds and ULLS on migration queue (rev5)
URL   : https://patchwork.freedesktop.org/series/149888/
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
commit d600d3edc9510b5a99b0f219aa05a89ec9cb6d0f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 4 19:15:00 2026 +0200

    drm/xe: Add modparam to enable / disable ULLS on migrate queue
    
    Having modparam to enable / disable ULLS on migrate queue will help with
    quick experiments.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Link: https://patch.msgid.link/20260228013501.106680-26-matthew.brost@intel.com
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3 drm-intel
0d595a8f809e drm/xe: Drop struct xe_migrate_pt_update argument from populate/clear vfuns
1c5d2450e8e9 drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper
8cc4da8d685a drm/xe: Decouple exec queue idle check from LRC
5e2bbd0540a6 drm/xe: Add job count to GuC exec queue snapshot
b622e8edb8b7 drm/xe: Update xe_bo_put_deferred arguments to include writeback flag
f5ffc45edddb drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
a94c638bf1f0 drm/xe: Update scheduler job layer to support PT jobs
16162215462a drm/xe: Add helpers to access PT ops
ad6088ee8d2f drm/xe: Add struct xe_pt_job_ops
-:179: WARNING:ALLOC_WITH_SIZEOF: Prefer kmalloc_obj over kmalloc with sizeof
#179: FILE: drivers/gpu/drm/xe/xe_pt.c:2822:
+	pt_job_ops = kmalloc(sizeof(*pt_job_ops), GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 296 lines checked
b91e0054efd9 drm/xe: Update GuC submission backend to run PT jobs
-:124: CHECK:LINE_SPACING: Please don't use multiple blank lines
#124: FILE: drivers/gpu/drm/xe/xe_migrate.h:165:
 
+

total: 0 errors, 0 warnings, 1 checks, 99 lines checked
d91e3e1b5029 drm/xe: Store level in struct xe_vm_pgtable_update
39cde50b8f4d drm/xe: Don't use migrate exec queue for page fault binds
2b7661952cb4 drm/xe: Enable CPU binds for jobs
695fb17f5de5 drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
1e4b58690418 drm/xe: Make bind queues operate cross-tile
-:222: ERROR:SPACING: space required after that ';' (ctx:VxV)
#222: FILE: drivers/gpu/drm/xe/xe_exec_queue.c:1725:
+	q->tlb_inval[idx].last_fence = NULL;}
 	                                   ^

-:306: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#306: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__q, __i)	\
+	for (__i = 0; __i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++__i)	\
+		for_each_if((__q)->tlb_inval[__i].dep_scheduler)

total: 1 errors, 0 warnings, 1 checks, 624 lines checked
f09ee83540c9 drm/xe: Add CPU bind layer
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2331 lines checked
0851b2f0d6b1 drm/xe: Add device flag to enable PT mirroring across tiles
a0ee3639f1b3 drm/xe: Add xe_hw_engine_write_ring_tail
4e703062c9b8 drm/xe: Add ULLS support to LRC
e94280b85253 drm/xe: Add ULLS migration job support to migration layer
ba78d1b55cc1 drm/xe: Add ULLS migration job support to ring ops
89c5a3cd19ba drm/xe: Add ULLS migration job support to GuC submission
f14d70effb7d drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
d600d3edc951 drm/xe: Add modparam to enable / disable ULLS on migrate queue


