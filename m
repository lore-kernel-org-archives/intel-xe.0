Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137DED20693
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 03:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C459B10E654;
	Wed, 16 Oct 2024 03:31:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB4E10E654;
 Wed, 16 Oct 2024 03:31:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GPU_SVM_and_Xe_?=
 =?utf-8?q?SVM_implementation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 03:31:14 -0000
Message-ID: <172904947451.1271331.14989685948722297750@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016032518.539495-1-matthew.brost@intel.com>
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation (rev2)
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
commit 6dfbb739d4447b459c1134fbb59b1687bd4ff475
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Oct 15 20:25:18 2024 -0700

    drm/doc: gpusvm: Add GPU SVM documentation
    
    Add documentation for agree upon GPU SVM design principles, current
    status, and future plans.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 01c7b2c084e5c84313f382734c10945b9aa49823 drm-intel
90fa5ebc748c drm/xe: Retry BO allocation
1464915f18bd mm/migrate: Add migrate_device_prepopulated_range
af485f4c9894 mm/migrate: Trylock device page in do_swap_page
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: 'Suggessted-by:' - perhaps 'Suggested-by:'?
#25: 
Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>

-:209: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#209: FILE: mm/migrate_device.c:880:
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)

total: 0 errors, 1 warnings, 1 checks, 176 lines checked
fa631d64bed5 drm/pagemap: Add DRM pagemap
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 103 lines checked
477527327fc5 drm/gpusvm: Add support for GPU Shared Virtual Memory
-:70: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#70: 
new file mode 100644

-:265: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#265: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:191:
+ *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	// CPU mappings changed

-:490: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#490: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:416:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->va.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:490: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#490: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:416:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->va.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:490: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#490: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:416:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->va.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:523: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#523: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:449:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:523: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#523: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:449:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:539: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#539: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:465:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:539: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#539: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:465:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:539: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#539: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:465:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:650: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fault_addr__' - possible side-effects?
#650: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:576:
+#define drm_gpusvm_notifier_find(gpusvm__, fault_addr__)	\
+	notifier_iter_first(&(gpusvm__)->root, (fault_addr__),	\
+			    (fault_addr__ + 1))

-:694: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#694: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:620:
+#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)	\
+	notifier_remove((notifier__), &(gpusvm__)->root);	\
+	list_del(&(notifier__)->rb.entry)

-:694: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#694: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:620:
+#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)	\
+	notifier_remove((notifier__), &(gpusvm__)->root);	\
+	list_del(&(notifier__)->rb.entry)

-:820: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#820: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:746:
+#define __drm_gpusvm_range_remove(notifier__, range__)		\
+	range_remove((range__), &(notifier__)->root);		\
+	list_del(&(range__)->rb.entry)

-:820: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#820: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:746:
+#define __drm_gpusvm_range_remove(notifier__, range__)		\
+	range_remove((range__), &(notifier__)->root);		\
+	list_del(&(range__)->rb.entry)

-:1275: WARNING:TYPO_SPELLING: 'commiting' may be misspelled - perhaps 'committing'?
#1275: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1201:
+ * called holding gpusvm->notifier_lock and as the last step before commiting a
                                                                     ^^^^^^^^^

-:1575: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1575: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1501:
+static void drm_gpusvm_get_devmem_page(struct page *page,
+				     struct drm_gpusvm_zdd *zdd)

-:1598: WARNING:MISORDERED_TYPE: type 'long unsigned int *' should be specified in [[un]signed] [short|int|long|long long] order
#1598: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1524:
+					long unsigned int *migrate_pfn,

-:1598: WARNING:UNNECESSARY_INT: Prefer 'unsigned long *' over 'long unsigned int *' as the int is unnecessary
#1598: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1524:
+					long unsigned int *migrate_pfn,

-:2207: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2207: FILE: drivers/gpu/drm/xe/drm_gpusvm.h:53:
+	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem *devmem_allocation,
+				 unsigned long npages, unsigned long *pfn);

-:2553: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#2553: FILE: drivers/gpu/drm/xe/drm_gpusvm.h:399:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (range__->va.start < (end__));		\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:2553: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2553: FILE: drivers/gpu/drm/xe/drm_gpusvm.h:399:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (range__->va.start < (end__));		\
+	     (range__) = __drm_gpusvm_range_next(range__))

total: 2 errors, 5 warnings, 15 checks, 2530 lines checked
58219bdbb278 drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
-:449: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#449: FILE: drivers/gpu/drm/xe/xe_vm.c:2812:
+		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
+				 is_system_allocator)) ||

total: 0 errors, 0 warnings, 1 checks, 469 lines checked
a07dbc648129 drm/xe: Add SVM init / close / fini to faulting VMs
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 123 lines checked
4791a7d3ffc2 drm/xe: Add dma_addr res cursor
928636181157 drm/xe: Add SVM range invalidation
-:365: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#365: FILE: drivers/gpu/drm/xe/xe_svm.c:243:
+	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
+	       goto retry;

-:366: WARNING:TABSTOP: Statements should start on a tabstop
#366: FILE: drivers/gpu/drm/xe/xe_svm.c:244:
+	       goto retry;

total: 0 errors, 2 warnings, 0 checks, 357 lines checked
83ae34ad1461 drm/gpuvm: Add DRM_GPUVA_OP_USER
34d89d6a47c3 drm/xe: Add (re)bind to SVM page fault handler
f27373534f7f drm/xe: Add SVM garbage collector
-:190: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#190: FILE: drivers/gpu/drm/xe/xe_vm_types.h:150:
+			spinlock_t lock;

total: 0 errors, 0 warnings, 1 checks, 157 lines checked
9c5ad681986a drm/xe: Add unbind to SVM garbage collector
-:20: ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20: FILE: drivers/gpu/drm/xe/xe_pt.c:928:
+#define INVALID_VMA	(struct xe_vma*)(0xdeaddeadull)

-:20: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#20: FILE: drivers/gpu/drm/xe/xe_pt.c:928:
+#define INVALID_VMA	(struct xe_vma*)(0xdeaddeadull)

total: 2 errors, 0 warnings, 0 checks, 292 lines checked
5f9e1765c48c drm/xe: Do not allow system allocator VMA unbind if the GPU has bindings
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#7: 
uAPI is designed with the the use case that only mapping a BO to a

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
29044345fb1d drm/xe: Enable system allocator uAPI
8dc37a6cd1c2 drm/xe: Add migrate layer functions for SVM support
3808560a54c6 drm/xe: Add SVM device memory mirroring
-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com'
#11: 
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com

-:103: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#103: FILE: drivers/gpu/drm/xe/xe_svm.c:429:
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);

total: 1 errors, 0 warnings, 1 checks, 123 lines checked
f64edb9e67d1 drm/xe: Add drm_gpusvm_devmem to xe_bo
32fd9fc8bcdd drm/xe: Add GPUSVM devic memory copy vfunc functions
2ae09f28b907 drm/xe: Add drm_pagemap ops to SVM
8962941818f0 drm/xe: Add Xe SVM populate_devmem_pfn vfunc
-:53: ERROR:SPACING: spaces required around that '=' (ctx:WxV)
#53: FILE: drivers/gpu/drm/xe/xe_svm.c:439:
+	int j =0;
 	      ^

-:62: ERROR:SPACING: space required before the open parenthesis '('
#62: FILE: drivers/gpu/drm/xe/xe_svm.c:448:
+		for(i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)

total: 2 errors, 0 warnings, 0 checks, 54 lines checked
59083f4910ee drm/xe: Add Xe SVM devmem_release vfunc
7eb3ce55282c drm/xe: Add BO flags required for SVM
-:65: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#65: FILE: drivers/gpu/drm/xe/xe_bo.c:2339:
+	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
+	    (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC)))

total: 0 errors, 0 warnings, 1 checks, 53 lines checked
766a658cae7b drm/xe: Add SVM VRAM migration
-:36: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matthew Brost matthew.brost@intel.com'
#36: 
Signed-off-by: Matthew Brost matthew.brost@intel.com

-:167: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 8)
#167: FILE: drivers/gpu/drm/xe/xe_svm.c:657:
 	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
+	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	/* Corner where CPU mappings have change */

-:169: WARNING:LONG_LINE_COMMENT: line length of 115 exceeds 100 columns
#169: FILE: drivers/gpu/drm/xe/xe_svm.c:658:
+	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	/* Corner where CPU mappings have change */

-:200: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 2 errors, 2 warnings, 0 checks, 149 lines checked
44266a05dc8e drm/xe: Basic SVM BO eviction
b0f98930e66a drm/xe: Add SVM debug
-:77: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'r__' - possible side-effects?
#77: FILE: drivers/gpu/drm/xe/xe_svm.c:39:
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=0x%016llx, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014llx, end=0x%014llx, size=%llu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (u64)(r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
+	       (r__)->base.va.start, (r__)->base.va.end,		\
+	       (r__)->base.va.end - (r__)->base.va.start)

total: 0 errors, 0 warnings, 1 checks, 258 lines checked
2194b7e15026 drm/xe: Add modparam for SVM notifier size
664726daef4f drm/xe: Add always_migrate_to_vram modparam
6dfbb739d444 drm/doc: gpusvm: Add GPU SVM documentation
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

-:17: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#17: FILE: Documentation/gpu/rfc/gpusvm.rst:1:
+===============

total: 0 errors, 2 warnings, 0 checks, 80 lines checked


