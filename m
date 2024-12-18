Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91640E77183
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 04:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DD510E65B;
	Wed, 18 Dec 2024 04:08:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A109410E65B;
 Wed, 18 Dec 2024 04:08:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GPU_SVM_and_Xe_?=
 =?utf-8?q?SVM_implementation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 04:08:40 -0000
Message-ID: <173449492065.4105555.3054039739649053591@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217233348.3519726-1-matthew.brost@intel.com>
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation (rev3)
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
commit 631a11cb5d11f3ea9a8b9129fcd507d13c012b55
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Dec 17 15:33:48 2024 -0800

    drm/xe: Add always_migrate_to_vram modparam
    
    Used to show we can bounce memory multiple times which will happen once
    a real migration policy is implemented. Can be removed once migration
    policy is implemented.
    
    v3:
     - Pull some changes into the previous patch (Thomas)
     - Spell out power of 2 (Thomas)
     - Better commit message (Thomas)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 69607bbcaccc29ae254d974a5e547d873e7c0ac0 drm-intel
8d81d4e9325b drm/xe: Retry BO allocation
213054c066a8 mm/migrate: Add migrate_device_pfns
be63b3df8327 mm/migrate: Trylock device page in do_swap_page
-:212: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#212: FILE: mm/migrate_device.c:883:
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)

total: 0 errors, 0 warnings, 1 checks, 172 lines checked
d19b1014cd49 drm/pagemap: Add DRM pagemap
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 103 lines checked
e16e8523ac82 drm/gpusvm: Add support for GPU Shared Virtual Memory
-:58: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#58: 
 - s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_page (Thomas)

-:106: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#106: 
new file mode 100644

-:302: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#302: FILE: drivers/gpu/drm/drm_gpusvm.c:192:
+ *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed

-:527: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#527: FILE: drivers/gpu/drm/drm_gpusvm.c:417:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->itree.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:527: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#527: FILE: drivers/gpu/drm/drm_gpusvm.c:417:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->itree.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:527: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#527: FILE: drivers/gpu/drm/drm_gpusvm.c:417:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->itree.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:574: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#574: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:574: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#574: FILE: drivers/gpu/drm/drm_gpusvm.c:464:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:590: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#590: FILE: drivers/gpu/drm/drm_gpusvm.c:480:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:590: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#590: FILE: drivers/gpu/drm/drm_gpusvm.c:480:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:590: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#590: FILE: drivers/gpu/drm/drm_gpusvm.c:480:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->itree.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:1666: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1666: FILE: drivers/gpu/drm/drm_gpusvm.c:1556:
+static void drm_gpusvm_get_devmem_page(struct page *page,
+				     struct drm_gpusvm_zdd *zdd)

-:2713: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gpusvm' - possible side-effects?
#2713: FILE: include/drm/drm_gpusvm.h:377:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) \
+	do { \
+		if (!WARN((gpusvm)->lock_dep_map, \
+			  "GPUSVM range lock should be set only once."))\
+			(gpusvm)->lock_dep_map = &(lock)->dep_map;	\
+	} while (0)

-:2719: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gpusvm' - possible side-effects?
#2719: FILE: include/drm/drm_gpusvm.h:383:
+#define drm_gpusvm_driver_lock_held(gpusvm) \
+	do { \
+		if ((gpusvm)->lock_dep_map)	\
+			lock_is_held((gpusvm)->lock_dep_map);	\
+	} while (0)

-:2725: WARNING:MACRO_ARG_UNUSED: Argument 'gpusvm' is not used in function-like macro
#2725: FILE: include/drm/drm_gpusvm.h:389:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2725: WARNING:MACRO_ARG_UNUSED: Argument 'lock' is not used in function-like macro
#2725: FILE: include/drm/drm_gpusvm.h:389:
+#define drm_gpusvm_driver_set_lock(gpusvm, lock) do {} while (0)

-:2726: WARNING:MACRO_ARG_UNUSED: Argument 'gpusvm' is not used in function-like macro
#2726: FILE: include/drm/drm_gpusvm.h:390:
+#define drm_gpusvm_driver_lock_held(gpusvm) do {} while (0)

-:2775: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#2775: FILE: include/drm/drm_gpusvm.h:439:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (range__->itree.start < (end__));		\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:2775: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2775: FILE: include/drm/drm_gpusvm.h:439:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (range__->itree.start < (end__));		\
+	     (range__) = __drm_gpusvm_range_next(range__))

total: 0 errors, 6 warnings, 13 checks, 2686 lines checked
de6d65928e70 drm/xe: Select DRM_GPUSVM Kconfig
3f7c7cf5672c drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR flag
-:48: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#48: 
 - s/DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR/DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR (Thomas)

-:503: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#503: FILE: drivers/gpu/drm/xe/xe_vm.c:2828:
+		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
+				 is_cpu_addr_mirror)) ||

total: 0 errors, 1 warnings, 1 checks, 559 lines checked
b3765a07ecd6 drm/xe: Add SVM init / close / fini to faulting VMs
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 152 lines checked
83b085e62f12 drm/xe: Add dma_addr res cursor
d1a713d05f4a drm/xe: Nuke VM's mapping upon close
5a576b0fc97c drm/xe: Add SVM range invalidation and page fault handler
-:444: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'vm' may be better as '(vm)' to avoid precedence issues
#444: FILE: drivers/gpu/drm/xe/xe_svm.h:44:
+#define xe_svm_assert_in_notifier(vm) \
+	lockdep_assert_held_write(&vm->svm.gpusvm.notifier_lock)

total: 0 errors, 0 warnings, 1 checks, 414 lines checked
fa60830fdd44 drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
7eb37f7e2bb0 drm/xe: Add (re)bind to SVM page fault handler
2173bac33e8f drm/xe: Add SVM garbage collector
273c0ce75c6d drm/xe: Add unbind to SVM garbage collector
758c590ea9a9 drm/xe: Do not allow CPU address mirror VMA unbind if the GPU has bindings
2a6468453c4a drm/xe: Enable CPU address mirror uAPI
a0247119f7a9 drm/xe: Add migrate layer functions for SVM support
bc6859d4b8b9 drm/xe: Add SVM device memory mirroring
-:26: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#26: FILE: drivers/gpu/drm/xe/Kconfig:63:
+config CONFIG_XE_DEVMEM_MIRROR
+	bool "Enable device memory mirror"
+	depends on DRM_XE
+	select CONFIG_GET_FREE_REGION
+	default y
+	help
+	  Disable this option only if you want to compile out without device
+	  memory mirror. Will reduce KMD memory footprint when disabled.
+

-:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#126: FILE: drivers/gpu/drm/xe/xe_svm.c:488:
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);

total: 0 errors, 1 warnings, 1 checks, 144 lines checked
410317a6f4d1 drm/xe: Add drm_gpusvm_devmem to xe_bo
2e11e0a73b4c drm/xe: Add drm_pagemap ops to SVM
-:32: CHECK:LINE_SPACING: Please don't use multiple blank lines
#32: FILE: drivers/gpu/drm/xe/xe_device_types.h:16:
 
+

total: 0 errors, 0 warnings, 1 checks, 63 lines checked
eac9baf0d856 drm/xe: Add GPUSVM device memory copy vfunc functions
03b28bc36cf7 drm/xe: Add Xe SVM populate_devmem_pfn GPU SVM vfunc
96aeeebec17f drm/xe: Add Xe SVM devmem_release GPU SVM vfunc
6ced5f3a86b9 drm/xe: Add BO flags required for SVM
-:62: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#62: FILE: drivers/gpu/drm/xe/xe_bo.c:2473:
+	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
+	    (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR)))

total: 0 errors, 0 warnings, 1 checks, 44 lines checked
b8be9d03aa5d drm/xe: Add SVM VRAM migration
fca5c34367c4 drm/xe: Basic SVM BO eviction
ebbd217308b0 drm/xe: Add SVM debug
-:86: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'r__' - possible side-effects?
#86: FILE: drivers/gpu/drm/xe/xe_svm.c:37:
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=0x%016llx, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (u64)(r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
+	       (r__)->base.itree.start, (r__)->base.itree.last + 1,	\
+	       (r__)->base.itree.last + 1 - (r__)->base.itree.start)

total: 0 errors, 0 warnings, 1 checks, 248 lines checked
617d19fda52a drm/xe: Add modparam for SVM notifier size
631a11cb5d11 drm/xe: Add always_migrate_to_vram modparam


