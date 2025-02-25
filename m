Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E09C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 04:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F87D10E108;
	Tue, 25 Feb 2025 04:51:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B12710E108;
 Tue, 25 Feb 2025 04:51:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GPU_SVM_and_Xe_?=
 =?utf-8?q?SVM_implementation_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 04:51:06 -0000
Message-ID: <174045906603.1840650.13867373461910098466@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225044311.3178695-1-matthew.brost@intel.com>
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation (rev6)
URL   : https://patchwork.freedesktop.org/series/137870/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0e7f90d7152dbc4a24b2d8476d85df394bc7c1c8
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Feb 24 20:43:11 2025 -0800

    drm/doc: gpusvm: Add GPU SVM documentation
    
    Add documentation for agree upon GPU SVM design principles, current
    status, and future plans.
    
    v4:
     - Address Thomas's feedback
    v5:
     - s/Current/Basline (Thomas)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 9f112b86fd27ff7de2ce09718596cfefd71ee41f drm-intel
7ea6649294a4 drm/xe: Retry BO allocation
38217e1e6b26 mm/migrate: Add migrate_device_pfns
039060507d98 mm/migrate: Trylock device page in do_swap_page
-:210: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#210: FILE: mm/migrate_device.c:878:
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)

total: 0 errors, 0 warnings, 1 checks, 168 lines checked
8ffb33d40dde drm/pagemap: Add DRM pagemap
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 105 lines checked
5661b1244b01 drm/xe/bo: Introduce xe_bo_put_async
-:22: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Gwan-gyeong Mun <gwan-gyeong.mun@intel.com'
#22: 
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com

total: 1 errors, 0 warnings, 0 checks, 85 lines checked
cc6b1ca85031 drm/gpusvm: Add support for GPU Shared Virtual Memory
-:58: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#58: 
 - s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_page (Thomas)

-:133: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#133: 
new file mode 100644

-:331: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#331: FILE: drivers/gpu/drm/drm_gpusvm.c:194:
+ *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed

-:538: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#538: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:538: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#538: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:538: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#538: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:585: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#585: FILE: drivers/gpu/drm/drm_gpusvm.c:448:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:585: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#585: FILE: drivers/gpu/drm/drm_gpusvm.c:448:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:601: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#601: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:601: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#601: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:601: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#601: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:2751: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gpusvm' - possible side-effects?
#2751: FILE: include/drm/drm_gpusvm.h:372:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
+	do { \
+		if (!WARN((gpusvm)->lock_dep_map, \
+			  "GPUSVM range lock should be set only once."))\
+			(gpusvm)->lock_dep_map = &(lock)->dep_map;	\
+	} while (0)

-:2758: WARNING:MACRO_ARG_UNUSED: Argument 'gpusvm' is not used in function-like macro
#2758: FILE: include/drm/drm_gpusvm.h:379:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2758: WARNING:MACRO_ARG_UNUSED: Argument 'lock' is not used in function-like macro
#2758: FILE: include/drm/drm_gpusvm.h:379:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2880: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#2880: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:2880: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2880: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))

total: 0 errors, 5 warnings, 11 checks, 2765 lines checked
8af37c0b4a5c drm/xe: Select DRM_GPUSVM Kconfig
e1443237d9cc drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR
-:51: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#51: 
 - s/DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR/DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR (Thomas)

total: 0 errors, 1 warnings, 0 checks, 561 lines checked
ab2c34422684 drm/xe: Add SVM init / close / fini to faulting VMs
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 170 lines checked
719fbc4985cc drm/xe: Add dma_addr res cursor
d3897b3400e7 drm/xe: Nuke VM's mapping upon close
299bcc7a4efc drm/xe: Add SVM range invalidation and page fault
06892c29e457 drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
09e0b103b339 drm/xe: Add (re)bind to SVM page fault handler
f128b664f49a drm/xe: Add SVM garbage collector
a4ad905e2849 drm/xe: Add unbind to SVM garbage collector
b767eba920d7 drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has bindings
85608dd6a07e drm/xe: Enable CPU address mirror uAPI
d646e7cf798c drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
f2106d445574 drm/xe: Add migrate layer functions for SVM support
2f4e68ab6dce drm/xe: Add SVM device memory mirroring
5713fda14f09 drm/xe: Add drm_gpusvm_devmem to xe_bo
2bb8b7bfcfca drm/xe: Add drm_pagemap ops to SVM
-:66: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#66: FILE: drivers/gpu/drm/xe/xe_svm.c:302:
+static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
+				     struct page *page)

total: 0 errors, 0 warnings, 1 checks, 93 lines checked
119926a26f03 drm/xe: Add GPUSVM device memory copy vfunc functions
054709cd8b69 drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
f7afe4d78197 drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
f3b587033771 drm/xe: Add SVM VRAM migration
9a688b9bf82f drm/xe: Basic SVM BO eviction
afb6d6ac36b9 drm/xe: Add SVM debug
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
5b4e95a8bab7 drm/xe: Add modparam for SVM notifier size
e50c68ccf460 drm/xe: Add always_migrate_to_vram modparam
0e7f90d7152d drm/doc: gpusvm: Add GPU SVM documentation
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

-:26: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#26: FILE: Documentation/gpu/rfc/gpusvm.rst:1:
+===============

total: 0 errors, 2 warnings, 0 checks, 94 lines checked


