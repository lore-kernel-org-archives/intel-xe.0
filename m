Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B14C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 09:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8862D10E027;
	Thu,  6 Mar 2025 09:23:26 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F48B10E027;
 Thu,  6 Mar 2025 09:23:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GPU_SVM_and_Xe_?=
 =?utf-8?q?SVM_implementation_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 09:23:25 -0000
Message-ID: <174125300551.66569.3063361690974411213@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306012657.3505757-1-matthew.brost@intel.com>
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation (rev8)
URL   : https://patchwork.freedesktop.org/series/137870/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 08d744f113ec553f3e3d5364900dcab240e52a60
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Mar 5 17:26:57 2025 -0800

    drm/doc: gpusvm: Add GPU SVM documentation
    
    Add documentation for agree upon GPU SVM design principles, current
    status, and future plans.
    
    v4:
     - Address Thomas's feedback
    v5:
     - s/Current/Basline (Thomas)
    v7:
     - Add license (CI)
     - Add examples for design guideline reasoning (Alistair)
     - Add snippet about possible livelock with concurrent GPU and and CPU
       access (Alistair)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Alistair Popple <apopple@nvidia.com>
+ /mt/dim checkpatch 6729782b064be5b1a67ff7ba2a0299532e19ff09 drm-intel
42eb82266949 drm/xe: Retry BO allocation
042ad8e9dab4 mm/migrate: Add migrate_device_pfns
37f85f88dfc3 mm/migrate: Trylock device page in do_swap_page
724b91dc96ef drm/pagemap: Add DRM pagemap
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
8837466a703f drm/xe/bo: Introduce xe_bo_put_async
259f1f7a68e0 drm/gpusvm: Add support for GPU Shared Virtual Memory
-:58: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#58: 
 - s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_page (Thomas)

-:135: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#135: 
new file mode 100644

-:333: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#333: FILE: drivers/gpu/drm/drm_gpusvm.c:194:
+ *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed

-:540: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#540: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:540: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#540: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:540: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#540: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:587: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#587: FILE: drivers/gpu/drm/drm_gpusvm.c:448:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:587: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#587: FILE: drivers/gpu/drm/drm_gpusvm.c:448:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:603: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#603: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:603: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#603: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:603: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#603: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:2755: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gpusvm' - possible side-effects?
#2755: FILE: include/drm/drm_gpusvm.h:374:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
+	do { \
+		if (!WARN((gpusvm)->lock_dep_map, \
+			  "GPUSVM range lock should be set only once."))\
+			(gpusvm)->lock_dep_map = &(lock)->dep_map;	\
+	} while (0)

-:2762: WARNING:MACRO_ARG_UNUSED: Argument 'gpusvm' is not used in function-like macro
#2762: FILE: include/drm/drm_gpusvm.h:381:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2762: WARNING:MACRO_ARG_UNUSED: Argument 'lock' is not used in function-like macro
#2762: FILE: include/drm/drm_gpusvm.h:381:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2884: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#2884: FILE: include/drm/drm_gpusvm.h:503:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:2884: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2884: FILE: include/drm/drm_gpusvm.h:503:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))

total: 0 errors, 5 warnings, 11 checks, 2767 lines checked
f5917e7c8425 drm/xe: Select DRM_GPUSVM Kconfig
0afa9a20212b drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR
-:51: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#51: 
 - s/DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR/DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR (Thomas)

total: 0 errors, 1 warnings, 0 checks, 558 lines checked
9c763043a306 drm/xe: Add SVM init / close / fini to faulting VMs
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 170 lines checked
da62fd5a01a1 drm/xe: Add dma_addr res cursor
9d91b5b2fe77 drm/xe: Nuke VM's mapping upon close
a92df6f463b9 drm/xe: Add SVM range invalidation and page fault
21abae035b99 drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
ae5a6c19fdc4 drm/xe: Add (re)bind to SVM page fault handler
bd6e2091236c drm/xe: Add SVM garbage collector
b6333db07e52 drm/xe: Add unbind to SVM garbage collector
6b0da604d7bc drm/xe: Do not allow CPU address mirror VMA unbind if
c6d72ccd1fa3 drm/xe: Enable CPU address mirror uAPI
15f8209cfbc5 drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
cbce65036844 drm/xe: Add migrate layer functions for SVM support
5e794f374b5f drm/xe: Add SVM device memory mirroring
-:40: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#40: FILE: drivers/gpu/drm/xe/Kconfig:77:
+config DRM_XE_DEVMEM_MIRROR
+	bool "Enable device memory mirror"
+	depends on DRM_XE
+	select GET_FREE_REGION
+	default y
+	help
+	  Disable this option only if you want to compile out without device
+	  memory mirror. Will reduce KMD memory footprint when disabled.
+

total: 0 errors, 1 warnings, 0 checks, 156 lines checked
ac6debe8417a drm/xe: Add drm_gpusvm_devmem to xe_bo
08a5fa61f153 drm/xe: Add drm_pagemap ops to SVM
-:66: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#66: FILE: drivers/gpu/drm/xe/xe_svm.c:302:
+static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
+				     struct page *page)

total: 0 errors, 0 warnings, 1 checks, 93 lines checked
d449a89a129b drm/xe: Add GPUSVM device memory copy vfunc functions
f3a21a3d62e0 drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
2fe36e0625a7 drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
e5f7287324b8 drm/xe: Add SVM VRAM migration
99a7d72422cc drm/xe: Basic SVM BO eviction
f6fbc801cf3a drm/xe: Add SVM debug
-:93: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'r__' - possible side-effects?
#93: FILE: drivers/gpu/drm/xe/xe_svm.c:52:
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
+	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
+	       xe_svm_range_size((r__)))

total: 0 errors, 0 warnings, 1 checks, 234 lines checked
1d7b16cf58b7 drm/xe: Add modparam for SVM notifier size
3c00ea3e129a drm/xe: Add always_migrate_to_vram modparam
08d744f113ec drm/doc: gpusvm: Add GPU SVM documentation
-:19: WARNING:REPEATED_WORD: Possible repeated word: 'and'
#19: 
 - Add snippet about possible livelock with concurrent GPU and and CPU

-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 116 lines checked


