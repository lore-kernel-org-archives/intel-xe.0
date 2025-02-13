Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72035C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 03:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FA110E272;
	Thu, 13 Feb 2025 03:36:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D382610E272;
 Thu, 13 Feb 2025 03:36:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GPU_SVM_and_Xe_?=
 =?utf-8?q?SVM_implementation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 03:36:34 -0000
Message-ID: <173941779486.1506415.3227744274726495681@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213021112.1228481-1-matthew.brost@intel.com>
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation (rev5)
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
commit 7baa403616b98ee88a9de6377167b1bf78ed2228
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Feb 12 18:11:12 2025 -0800

    drm/doc: gpusvm: Add GPU SVM documentation
    
    Add documentation for agree upon GPU SVM design principles, current
    status, and future plans.
    
    v4:
     - Address Thomas's feedback
    v5:
     - s/Current/Basline (Thomas)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 1be945721fec4f48df1fb728863be1b9a594b571 drm-intel
9a9c6a0ffdaa drm/xe: Retry BO allocation
2f2c79c07987 mm/migrate: Add migrate_device_pfns
e071b5c4161a mm/migrate: Trylock device page in do_swap_page
-:212: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#212: FILE: mm/migrate_device.c:883:
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)

total: 0 errors, 0 warnings, 1 checks, 172 lines checked
345ff0668da7 drm/pagemap: Add DRM pagemap
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 105 lines checked
d067de99cd29 drm/xe/bo: Introduce xe_bo_put_async
73d78f7134d1 drm/gpusvm: Add support for GPU Shared Virtual Memory
-:58: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#58: 
 - s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_page (Thomas)

-:128: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#128: 
new file mode 100644

-:326: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#326: FILE: drivers/gpu/drm/drm_gpusvm.c:194:
+ *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed

-:533: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#533: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:533: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#533: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:533: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#533: FILE: drivers/gpu/drm/drm_gpusvm.c:401:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:580: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#580: FILE: drivers/gpu/drm/drm_gpusvm.c:448:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:580: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#580: FILE: drivers/gpu/drm/drm_gpusvm.c:448:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:596: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#596: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:596: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#596: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:596: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#596: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:1685: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1685: FILE: drivers/gpu/drm/drm_gpusvm.c:1553:
+static void drm_gpusvm_get_devmem_page(struct page *page,
+				     struct drm_gpusvm_zdd *zdd)

-:2740: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gpusvm' - possible side-effects?
#2740: FILE: include/drm/drm_gpusvm.h:372:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
+	do { \
+		if (!WARN((gpusvm)->lock_dep_map, \
+			  "GPUSVM range lock should be set only once."))\
+			(gpusvm)->lock_dep_map = &(lock)->dep_map;	\
+	} while (0)

-:2747: WARNING:MACRO_ARG_UNUSED: Argument 'gpusvm' is not used in function-like macro
#2747: FILE: include/drm/drm_gpusvm.h:379:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2747: WARNING:MACRO_ARG_UNUSED: Argument 'lock' is not used in function-like macro
#2747: FILE: include/drm/drm_gpusvm.h:379:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2869: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#2869: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:2869: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2869: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
+	     (range__) = __drm_gpusvm_range_next(range__))

total: 0 errors, 5 warnings, 12 checks, 2759 lines checked
086ca2f5d086 drm/xe: Select DRM_GPUSVM Kconfig
b556d687d5ba drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR
-:51: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#51: 
 - s/DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR/DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR (Thomas)

total: 0 errors, 1 warnings, 0 checks, 561 lines checked
93bbe1485eba drm/xe: Add SVM init / close / fini to faulting VMs
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 152 lines checked
f3e84e197015 drm/xe: Add dma_addr res cursor
4ad62680bec9 drm/xe: Nuke VM's mapping upon close
2e5f1925a676 drm/xe: Add SVM range invalidation and page fault
1c552ee4dfea drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
4f5a07cf8364 drm/xe: Add (re)bind to SVM page fault handler
3dae7b939a0f drm/xe: Add SVM garbage collector
1d74eb80b92e drm/xe: Add unbind to SVM garbage collector
ee75c4cc532a drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has bindings
e563fe59b995 drm/xe: Enable CPU address mirror uAPI
5ead6f3e267c drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
5c57c5af1156 drm/xe: Add migrate layer functions for SVM support
d4196120fafb drm/xe: Add SVM device memory mirroring
-:36: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#36: FILE: drivers/gpu/drm/xe/Kconfig:77:
+config DRM_XE_DEVMEM_MIRROR
+	bool "Enable device memory mirror"
+	depends on DRM_XE
+	select GET_FREE_REGION
+	default y
+	help
+	  Disable this option only if you want to compile out without device
+	  memory mirror. Will reduce KMD memory footprint when disabled.
+

total: 0 errors, 1 warnings, 0 checks, 144 lines checked
ed57a8340a6e drm/xe: Add drm_gpusvm_devmem to xe_bo
13923f91eec6 drm/xe: Add drm_pagemap ops to SVM
-:66: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#66: FILE: drivers/gpu/drm/xe/xe_svm.c:306:
+static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
+				     struct page *page)

total: 0 errors, 0 warnings, 1 checks, 93 lines checked
33e40c26dfaf drm/xe: Add GPUSVM device memory copy vfunc functions
4ff17cb543de drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
444517801ffa drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
528fe04b758e drm/xe: Add SVM VRAM migration
b9bbdd135139 drm/xe: Basic SVM BO eviction
934f8b7fae10 drm/xe: Add SVM debug
-:89: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'r__' - possible side-effects?
#89: FILE: drivers/gpu/drm/xe/xe_svm.c:52:
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

total: 0 errors, 0 warnings, 1 checks, 223 lines checked
7bc2ea22dd9b drm/xe: Add modparam for SVM notifier size
3361e2b99cb1 drm/xe: Add always_migrate_to_vram modparam
7baa403616b9 drm/doc: gpusvm: Add GPU SVM documentation
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

-:26: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#26: FILE: Documentation/gpu/rfc/gpusvm.rst:1:
+===============

total: 0 errors, 2 warnings, 0 checks, 94 lines checked


