Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAACCA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 12:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB4510E164;
	Thu, 14 Aug 2025 12:16:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E18610E15D;
 Thu, 14 Aug 2025 12:16:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MADVISE_FOR_XE_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Aug 2025 12:16:27 -0000
Message-ID: <175517378711.236499.13176311890947526015@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
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

Series: MADVISE FOR XE (rev7)
URL   : https://patchwork.freedesktop.org/series/149550/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6f9293a391ff3c575bc021f454be5d0a0c076f57
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 775344e277c4e260e4ce767f2e2d6a13d7b5d3a6
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Aug 14 16:29:50 2025 +0530

    drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
    
    Introduce the DRM_IOCTL_XE_VM_QUERY_MEMORY_RANGE_ATTRS ioctl to allow
    userspace to query memory attributes of VMAs within a user specified
    virtual address range.
    
    Userspace first calls the ioctl with num_mem_ranges = 0,
    sizeof_mem_ranges_attr = 0 and vector_of_vma_mem_attr = NULL to retrieve
    the number of memory ranges (vmas) and size of each memory range attribute.
    Then, it allocates a buffer of that size and calls the ioctl again to fill
    the buffer with memory range attributes.
    
    This two-step interface allows userspace to first query the required
    buffer size, then retrieve detailed attributes efficiently.
    
    v2 (Matthew Brost)
    - Use same ioctl to overload functionality
    
    v3
    - Add kernel-doc
    
    v4
    - Make uapi future proof by passing struct size (Matthew Brost)
    - make lock interruptible (Matthew Brost)
    - set reserved bits to zero (Matthew Brost)
    - s/__copy_to_user/copy_to_user (Matthew Brost)
    - Avod using VMA term in uapi (Thomas)
    - xe_vm_put(vm) is missing (Shuicheng)
    
    v5
    - Nits
    - Fix kernel-doc
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7f1ecbbddf3bf50bf5338e86514bf77c32eb4edb drm-intel
e368975cb6c7 drm/gpuvm: Pass map arguments through a struct
2f6d993299f0 drm/gpuvm: Kill drm_gpuva_init()
61c6905e1292 drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
73df4157d7b6 drm/xe/uapi: Add madvise interface
-:51: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#51: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
3a7cc423b17f drm/xe/vm: Add attributes struct as member of vma
807084a1e409 drm/xe/vma: Move pat_index to vma attributes
75441e88204e drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
8252f2ac2e5b drm/gpusvm: Make drm_gpusvm_for_each_* macros public
-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:452:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:452:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:452:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:258: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#258: FILE: include/drm/drm_gpusvm.h:485:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:258: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#258: FILE: include/drm/drm_gpusvm.h:485:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:274: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#274: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:274: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#274: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:274: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#274: FILE: include/drm/drm_gpusvm.h:501:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

total: 0 errors, 0 warnings, 8 checks, 248 lines checked
b5c214c9e09d drm/xe/svm: Split system allocator vma incase of madvise call
ac204891ef23 drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
d8a3f218d8ee drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
b7b7f9cd3f9b drm/xe: Implement madvise ioctl for xe
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 330 lines checked
089e09768bad drm/xe/svm: Add svm ranges migration policy on atomic access
11af52b70487 drm/xe/madvise: Update migration policy based on preferred location
66352771e16f drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT memory attribute
4b0e8633c614 drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
6e70c08e9b3e drm/xe/svm: Consult madvise preferred location in prefetch
903a62ebaad8 drm/xe/bo: Add attributes field to xe_bo
5186b82c21c4 drm/xe/bo: Update atomic_access attribute on madvise
be29fcc18871 drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
6adffcd7b38b drm/xe/vm: Add helper to check for default VMA memory attributes
2dc209520c89 drm/xe: Reset VMA attributes to default in SVM garbage collector
4cb0401c4f5d drm/xe: Enable madvise ioctl for xe
775344e277c4 drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
-:210: WARNING:LONG_LINE: line length of 147 exceeds 100 columns
#210: FILE: include/uapi/drm/xe_drm.h:125:
+#define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)

total: 0 errors, 1 warnings, 0 checks, 287 lines checked


