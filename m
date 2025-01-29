Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127E4C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 21:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D399B10E89D;
	Wed, 29 Jan 2025 21:05:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731A410E1A1;
 Wed, 29 Jan 2025 21:05:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GPU_SVM_and_Xe_?=
 =?utf-8?q?SVM_implementation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 21:05:41 -0000
Message-ID: <173818474146.2530294.6760029899986532642@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129195212.745731-1-matthew.brost@intel.com>
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation (rev4)
URL   : https://patchwork.freedesktop.org/series/137870/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d59ce4c5e6146012e7481754784ec32faaeb7962
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jan 29 11:52:12 2025 -0800

    drm/doc: gpusvm: Add GPU SVM documentation
    
    Add documentation for agree upon GPU SVM design principles, current
    status, and future plans.
    
    v4:
     - Address Thomas's feedback
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c2a5da40b8b1c5af77dcdabed8516069949fea3b drm-intel
af796207a6d1 drm/xe: Retry BO allocation
caae54c6c9c1 mm/migrate: Add migrate_device_pfns
26dd90839053 mm/migrate: Trylock device page in do_swap_page
-:212: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#212: FILE: mm/migrate_device.c:883:
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)

total: 0 errors, 0 warnings, 1 checks, 172 lines checked
fd428ffae450 drm/pagemap: Add DRM pagemap
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 105 lines checked
cf454c25aa0a drm/xe/bo: Introduce xe_bo_put_async
f118eb745172 drm/gpusvm: Add support for GPU Shared Virtual Memory
-:58: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#58: 
 - s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_page (Thomas)

-:117: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#117: 
new file mode 100644

-:313: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#313: FILE: drivers/gpu/drm/drm_gpusvm.c:192:
+ *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed

-:521: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#521: FILE: drivers/gpu/drm/drm_gpusvm.c:400:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->itree.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:521: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#521: FILE: drivers/gpu/drm/drm_gpusvm.c:400:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->itree.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:521: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#521: FILE: drivers/gpu/drm/drm_gpusvm.c:400:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->itree.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:568: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#568: FILE: drivers/gpu/drm/drm_gpusvm.c:447:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:568: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#568: FILE: drivers/gpu/drm/drm_gpusvm.c:447:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:584: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#584: FILE: drivers/gpu/drm/drm_gpusvm.c:463:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:584: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#584: FILE: drivers/gpu/drm/drm_gpusvm.c:463:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:584: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#584: FILE: drivers/gpu/drm/drm_gpusvm.c:463:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:1673: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1673: FILE: drivers/gpu/drm/drm_gpusvm.c:1552:
+static void drm_gpusvm_get_devmem_page(struct page *page,
+				     struct drm_gpusvm_zdd *zdd)

-:2744: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gpusvm' - possible side-effects?
#2744: FILE: include/drm/drm_gpusvm.h:377:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
+	do { \
+		if (!WARN((gpusvm)->lock_dep_map, \
+			  "GPUSVM range lock should be set only once."))\
+			(gpusvm)->lock_dep_map = &(lock)->dep_map;	\
+	} while (0)

-:2750: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gpusvm' - possible side-effects?
#2750: FILE: include/drm/drm_gpusvm.h:383:
+#define drm_gpusvm_driver_lock_held(gpusvm) \
+	do { \
+		if ((gpusvm)->lock_dep_map)	\
+			lock_is_held((gpusvm)->lock_dep_map);	\
+	} while (0)

-:2756: WARNING:MACRO_ARG_UNUSED: Argument 'gpusvm' is not used in function-like macro
#2756: FILE: include/drm/drm_gpusvm.h:389:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2756: WARNING:MACRO_ARG_UNUSED: Argument 'lock' is not used in function-like macro
#2756: FILE: include/drm/drm_gpusvm.h:389:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2757: WARNING:MACRO_ARG_UNUSED: Argument 'gpusvm' is not used in function-like macro
#2757: FILE: include/drm/drm_gpusvm.h:390:
+#define drm_gpusvm_driver_lock_held(gpusvm) do {} while (0)

-:2806: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#2806: FILE: include/drm/drm_gpusvm.h:439:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (range__->itree.start < (end__));		\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:2806: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2806: FILE: include/drm/drm_gpusvm.h:439:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (range__->itree.start < (end__));		\
+	     (range__) = __drm_gpusvm_range_next(range__))

total: 0 errors, 6 warnings, 13 checks, 2707 lines checked
867ff7f55f19 drm/xe: Select DRM_GPUSVM Kconfig
b7528698c1d1 drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
-:48: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#48: 
 - s/DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR/DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR (Thomas)

total: 0 errors, 1 warnings, 0 checks, 559 lines checked
2b4effb8af92 drm/xe: Add SVM init / close / fini to faulting VMs
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 152 lines checked
85679f41a4d7 drm/xe: Add dma_addr res cursor
3ee3c89f7de2 drm/xe: Nuke VM's mapping upon close
0a36416bcc68 drm/xe: Add SVM range invalidation and page fault handler
6c52491475df drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
8a410879472c drm/xe: Add (re)bind to SVM page fault handler
9159d467ca7b drm/xe: Add SVM garbage collector
fa47e197bbfb drm/xe: Add unbind to SVM garbage collector
be63b22281e8 drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has bindings
66a5e89c24c2 drm/xe: Enable CPU address mirror uAPI
56ff548cb685 drm/xe/uapi: Add DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
6d38043dbe50 drm/xe: Add migrate layer functions for SVM support
c0fecb31f94d drm/xe: Add SVM device memory mirroring
-:30: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#30: FILE: drivers/gpu/drm/xe/Kconfig:77:
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
8ed22c244ce6 drm/xe: Add drm_gpusvm_devmem to xe_bo
89da154cd461 drm/xe: Add drm_pagemap ops to SVM
-:79: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#79: FILE: drivers/gpu/drm/xe/xe_svm.c:479:
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)

-:79: CHECK:SPACING: spaces preferred around that '>>' (ctx:ExO)
#79: FILE: drivers/gpu/drm/xe/xe_svm.c:479:
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
 ^

-:79: CHECK:SPACING: spaces preferred around that '>>' (ctx:OxO)
#79: FILE: drivers/gpu/drm/xe/xe_svm.c:479:
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
   ^

-:79: CHECK:SPACING: spaces preferred around that '>>' (ctx:OxO)
#79: FILE: drivers/gpu/drm/xe/xe_svm.c:479:
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
     ^

-:79: ERROR:SPACING: spaces required around that '>' (ctx:OxW)
#79: FILE: drivers/gpu/drm/xe/xe_svm.c:479:
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
       ^

-:79: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#79: FILE: drivers/gpu/drm/xe/xe_svm.c:479:
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
                          ^

-:79: ERROR:SPACING: spaces required around that ':' (ctx:VxW)
#79: FILE: drivers/gpu/drm/xe/xe_svm.c:479:
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
                             ^

-:79: CHECK:CAMELCASE: Avoid CamelCase: <Add>
#79: FILE: drivers/gpu/drm/xe/xe_svm.c:479:
+>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)

total: 2 errors, 1 warnings, 5 checks, 61 lines checked
ff509aaf7e6e drm/xe: Add GPUSVM device memory copy vfunc functions
f87d64bc23de drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
51d68f584c46 drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
2589abc11a5f drm/xe: Add BO flags required for SVM
d9ff69221361 drm/xe: Add SVM VRAM migration
3b523dde76c5 drm/xe: Basic SVM BO eviction
7b874855210a drm/xe: Add SVM debug
-:89: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'r__' - possible side-effects?
#89: FILE: drivers/gpu/drm/xe/xe_svm.c:37:
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
+	       (r__)->base.itree.start, (r__)->base.itree.last + 1,	\
+	       (r__)->base.itree.last + 1 - (r__)->base.itree.start)

total: 0 errors, 0 warnings, 1 checks, 243 lines checked
9a20ebe3ee35 drm/xe: Add modparam for SVM notifier size
794100d33c1a drm/xe: Add always_migrate_to_vram modparam
d59ce4c5e614 drm/doc: gpusvm: Add GPU SVM documentation
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

-:20: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#20: FILE: Documentation/gpu/rfc/gpusvm.rst:1:
+===============

total: 0 errors, 2 warnings, 0 checks, 94 lines checked


