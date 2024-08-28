Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2BCC54749
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 02:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E2010E471;
	Wed, 28 Aug 2024 02:55:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B51010E461;
 Wed, 28 Aug 2024 02:55:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GPU_SVM_and_Xe_?=
 =?utf-8?q?SVM_implementation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 02:55:55 -0000
Message-ID: <172481375517.808519.10216671334338226618@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828024901.2582335-1-matthew.brost@intel.com>
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
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

Series: Introduce GPU SVM and Xe SVM implementation
URL   : https://patchwork.freedesktop.org/series/137870/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0a43e1983467701baae395f1f912d8eb5cb3b119
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Aug 27 19:49:01 2024 -0700

    drm/gpusvm: Ensure all pages migrated upon eviction
    
    Let's make sure we know what we are doing and check to ensure all pages
    are migrated upon eviction.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 drm-intel
69ec1662f608 dma-buf: Split out dma fence array create into alloc and arm functions
-:63: WARNING:REPEATED_WORD: Possible repeated word: 'fence'
#63: FILE: drivers/dma-buf/dma-fence-array.c:170:
+ * preallocated dma fence fence in the path of reclaim or dma fence signaling.

-:71: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#71: FILE: drivers/dma-buf/dma-fence-array.c:174:
+			  u64 context, unsigned seqno,

-:113: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#113: FILE: drivers/dma-buf/dma-fence-array.c:228:
+					       u64 context, unsigned seqno,

-:132: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 0)
#132: FILE: include/linux/dma-fence-array.h:79:
 	for (index = 0, fence = dma_fence_array_first(head); fence;	\
[...]
+struct dma_fence_array *dma_fence_array_alloc(int num_fences);

-:138: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#138: FILE: include/linux/dma-fence-array.h:85:
+			  u64 context, unsigned seqno,

total: 0 errors, 5 warnings, 0 checks, 112 lines checked
b32ee4ad3a3d drm/xe: Invalidate media_gt TLBs in PT code
295019e1310a drm/xe: Retry BO allocation
d39141b7860c mm/migrate: Add migrate_device_vma_range
-:48: WARNING:REPEATED_WORD: Possible repeated word: 'with'
#48: FILE: mm/migrate_device.c:937:
+ * invalidation can race with with VMA start being repurposed, worst case this

-:49: WARNING:TYPO_SPELLING: 'unecessary' may be misspelled - perhaps 'unnecessary'?
#49: FILE: mm/migrate_device.c:938:
+ * would result in an unecessary invalidation.
                       ^^^^^^^^^^

total: 0 errors, 2 warnings, 0 checks, 68 lines checked
5c6446919277 drm/gpusvm: Add support for GPU Shared Virtual Memory
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

-:455: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#455: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:409:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->va.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:455: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#455: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:409:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->va.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:455: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#455: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:409:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (range__->va.start < (end__));				\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:488: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#488: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:442:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:488: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#488: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:442:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:504: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#504: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:458:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:504: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#504: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:458:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:504: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#504: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:458:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (notifier__->interval.start < (end__));			\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:616: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fault_addr__' - possible side-effects?
#616: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:570:
+#define drm_gpusvm_notifier_find(gpusvm__, fault_addr__)	\
+	notifier_iter_first(&(gpusvm__)->root, (fault_addr__),	\
+			    (fault_addr__ + 1))

-:660: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#660: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:614:
+#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)	\
+	notifier_remove((notifier__), &(gpusvm__)->root);	\
+	list_del(&(notifier__)->rb.entry)

-:660: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#660: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:614:
+#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)	\
+	notifier_remove((notifier__), &(gpusvm__)->root);	\
+	list_del(&(notifier__)->rb.entry)

-:786: ERROR:MULTISTATEMENT_MACRO_USE_DO_WHILE: Macros with multiple statements should be enclosed in a do - while loop
#786: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:740:
+#define __drm_gpusvm_range_remove(notifier__, range__)		\
+	range_remove((range__), &(notifier__)->root);		\
+	list_del(&(range__)->rb.entry)

-:786: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#786: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:740:
+#define __drm_gpusvm_range_remove(notifier__, range__)		\
+	range_remove((range__), &(notifier__)->root);		\
+	list_del(&(range__)->rb.entry)

-:1120: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i__' - possible side-effects?
#1120: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1074:
+#define for_each_dma_page(i__, j__, npages__, order__)	\
+	for ((i__) = 0, (j__) = 0; (i__) < (npages__);	\
+	     (j__)++, (i__) += 0x1 << (order__))

-:1120: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'j__' - possible side-effects?
#1120: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1074:
+#define for_each_dma_page(i__, j__, npages__, order__)	\
+	for ((i__) = 0, (j__) = 0; (i__) < (npages__);	\
+	     (j__)++, (i__) += 0x1 << (order__))

-:1267: WARNING:TYPO_SPELLING: 'commiting' may be misspelled - perhaps 'committing'?
#1267: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1221:
+ * called holding gpusvm->notifier_lock and as the last step before commiting a
                                                                     ^^^^^^^^^

-:1628: WARNING:MISORDERED_TYPE: type 'long unsigned int *' should be specified in [[un]signed] [short|int|long|long long] order
#1628: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1582:
+					long unsigned int *migrate_pfn,

-:1628: WARNING:UNNECESSARY_INT: Prefer 'unsigned long *' over 'long unsigned int *' as the int is unnecessary
#1628: FILE: drivers/gpu/drm/xe/drm_gpusvm.c:1582:
+					long unsigned int *migrate_pfn,

-:2615: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#2615: FILE: drivers/gpu/drm/xe/drm_gpusvm.h:389:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (range__->va.start < (end__));		\
+	     (range__) = __drm_gpusvm_range_next(range__))

-:2615: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#2615: FILE: drivers/gpu/drm/xe/drm_gpusvm.h:389:
+#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
+	for ((range__) = (range__) ?:					\
+	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
+	     (range__) && (range__->va.start < (end__));		\
+	     (range__) = __drm_gpusvm_range_next(range__))

total: 2 errors, 4 warnings, 15 checks, 2598 lines checked
4c792b5b6097 drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
-:449: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#449: FILE: drivers/gpu/drm/xe/xe_vm.c:2816:
+		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
+				 is_system_allocator)) ||

total: 0 errors, 0 warnings, 1 checks, 469 lines checked
0240aafda33a drm/xe: Add SVM init / fini to faulting VMs
-:23: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#23: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 108 lines checked
a5a3d7b38838 drm/xe: Add dma_addr res cursor
0d0c1a9c8d54 drm/xe: Add SVM range invalidation
-:143: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#143: FILE: drivers/gpu/drm/xe/xe_svm.c:14:
+static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
+ {

-:144: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#144: FILE: drivers/gpu/drm/xe/xe_svm.c:15:
+ {$

-:349: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#349: FILE: drivers/gpu/drm/xe/xe_svm.c:233:
+	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
+	       goto retry;

-:350: WARNING:TABSTOP: Statements should start on a tabstop
#350: FILE: drivers/gpu/drm/xe/xe_svm.c:234:
+	       goto retry;

total: 1 errors, 3 warnings, 0 checks, 343 lines checked
7e67697bcf92 drm/gpuvm: Add DRM_GPUVA_OP_USER
9cf1590db98f drm/xe: Add (re)bind to SVM page fault handler
14c4590f803b drm/xe: Add SVM garbage collector
-:187: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#187: FILE: drivers/gpu/drm/xe/xe_vm_types.h:150:
+			spinlock_t lock;

total: 0 errors, 0 warnings, 1 checks, 157 lines checked
09f5cb686eb8 drm/xe: Add unbind to SVM garbage collector
-:20: ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20: FILE: drivers/gpu/drm/xe/xe_pt.c:908:
+#define INVALID_VMA	(struct xe_vma*)(0xdeaddeadull)

-:20: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#20: FILE: drivers/gpu/drm/xe/xe_pt.c:908:
+#define INVALID_VMA	(struct xe_vma*)(0xdeaddeadull)

total: 2 errors, 0 warnings, 0 checks, 292 lines checked
7ff1f55df61c drm/xe: Do not allow system allocator VMA unbind if the GPU has bindings
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'the'
#7: 
uAPI is designed with the the use case that only mapping a BO to a

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
8995548d9786 drm/xe: Enable system allocator uAPI
08c7ca1fff12 drm/xe: Add migrate layer functions for SVM support
1e2bf1e50dc7 drm/xe: Add SVM device memory mirroring
-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com'
#11: 
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com

-:103: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#103: FILE: drivers/gpu/drm/xe/xe_svm.c:417:
+		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
+				tile->id, ret);

total: 1 errors, 0 warnings, 1 checks, 123 lines checked
8ce3d1594574 drm/xe: Add GPUSVM copy SRAM / VRAM vfunc functions
54efe69fa8ae drm/xe: Update PT layer to understand ranges in VRAM
88b624083ec7 drm/xe: Add Xe SVM populate_vram_pfn vfunc
-:6: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com'
#6: 
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com

-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:45: ERROR:SPACING: spaces required around that '=' (ctx:WxV)
#45: FILE: drivers/gpu/drm/xe/xe_svm.c:444:
+	int j =0;
 	      ^

-:54: ERROR:SPACING: space required before the open parenthesis '('
#54: FILE: drivers/gpu/drm/xe/xe_svm.c:453:
+		for(i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)

total: 3 errors, 1 warnings, 0 checks, 52 lines checked
e033412ea53d drm/xe: Add Xe SVM vram_release vfunc
45d9b40b5b71 drm/xe: Add BO flags required for SVM
-:45: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#45: FILE: drivers/gpu/drm/xe/xe_bo.c:2305:
+	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
+	    (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC)))

total: 0 errors, 0 warnings, 1 checks, 38 lines checked
0cd6cedd73b1 drm/xe: Add SVM VRAM migration
-:33: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Matthew Brost matthew.brost@intel.com'
#33: 
Signed-off-by: Matthew Brost matthew.brost@intel.com

-:175: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 2 errors, 0 warnings, 0 checks, 128 lines checked
93416a88b507 drm/xe: Basic SVM BO eviction
eb17623048e9 drm/xe: Add SVM debug
-:60: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'r__' - possible side-effects?
#60: FILE: drivers/gpu/drm/xe/xe_svm.c:27:
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=0x%016llx, vram=%d,%d,%d, seqno=%lu, order=%u, start=0x%014llx, end=0x%014llx, size=%llu",	\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (u64)(r__)->base.gpusvm,					\
+	       (r__)->base.vram_allocation ? 1 : 0,			\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq, (r__)->base.order,		\
+	       (r__)->base.va.start, (r__)->base.va.end,		\
+	       (r__)->base.va.end - (r__)->base.va.start)

-:62: WARNING:LONG_LINE: line length of 129 exceeds 100 columns
#62: FILE: drivers/gpu/drm/xe/xe_svm.c:29:
+	       "%s: asid=%u, gpusvm=0x%016llx, vram=%d,%d,%d, seqno=%lu, order=%u, start=0x%014llx, end=0x%014llx, size=%llu",	\

total: 0 errors, 1 warnings, 1 checks, 244 lines checked
1f9f78fbd7e0 drm/xe: Add modparam for SVM notifier size
adabbeef048c drm/xe: Add modparam for SVM prefault
0a43e1983467 drm/gpusvm: Ensure all pages migrated upon eviction


