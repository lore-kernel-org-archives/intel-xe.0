Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA37C5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 07:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896F410E1ED;
	Wed, 28 May 2025 07:45:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA7310E1EA;
 Wed, 28 May 2025 07:45:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MADVISE_FOR_XE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 07:45:29 -0000
Message-ID: <174841832912.27115.9064086576507530964@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

Series: MADVISE FOR XE
URL   : https://patchwork.freedesktop.org/series/149550/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0fe86083d80c63fd88eb12ffeee86c52dd26488c
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue May 27 22:10:03 2025 +0530

    drm/xe/bo: Update atomic_access attribute on madvise
    
    Update the bo_atomic_access based on user-provided input and determine
    the migration to smem during a CPU fault
    
    v2 (Matthew Brost)
    - Avoid cpu unmapping if bo is already in smem
    - check atomics on smem too for ioctl
    - Add comments
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 07b6736f75df3e60d5e20eda53ecb97f6d9a66c0 drm-intel
c5126839808a Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
5d7b706d58b4 drm/xe/uapi: Add madvise interface
-:37: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#37: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)

total: 0 errors, 1 warnings, 0 checks, 121 lines checked
b74db14d5768 drm/xe/vm: Add attributes struct as member of vma
bfa2976f7f30 drm/xe/vma: Move pat_index to vma attributes
3adf1b095f5b drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
0a83d3180595 drm/gpusvm: Make drm_gpusvm_for_each_* macros public
-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#224: FILE: include/drm/drm_gpusvm.h:548:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#224: FILE: include/drm/drm_gpusvm.h:548:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#224: FILE: include/drm/drm_gpusvm.h:548:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:257: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#257: FILE: include/drm/drm_gpusvm.h:581:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:257: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#257: FILE: include/drm/drm_gpusvm.h:581:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:273: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#273: FILE: include/drm/drm_gpusvm.h:597:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:273: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#273: FILE: include/drm/drm_gpusvm.h:597:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:273: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#273: FILE: include/drm/drm_gpusvm.h:597:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

total: 0 errors, 0 warnings, 8 checks, 248 lines checked
778c6afb7f87 drm/xe/vm: Add a helper xe_vm_range_tilemask_tlb_invalidation()
d7fa7153beaa drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
abb369db431d drm/xe/svm: Split system allocator vma incase of madvise call
d7389470784e drm/xe: Implement madvise ioctl for xe
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 300 lines checked
3dbf973d244a drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
134ce88c281e drm/xe/svm : Add svm ranges migration policy on atomic access
1756d0569cb0 drm/xe/madvise: Update migration policy based on preferred location
53352aa9120e drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
8e77979add7a drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
bf144addb682 drm/xe/svm: Consult madvise preferred location in prefetch
db06e061d259 drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
-:71: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#71: FILE: drivers/gpu/drm/xe/xe_vm.c:2193:
+		mem_attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;

-:170: WARNING:LONG_LINE: line length of 137 exceeds 100 columns
#170: FILE: include/uapi/drm/xe_drm.h:125:
+#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)

total: 0 errors, 2 warnings, 0 checks, 214 lines checked
012c225dca26 drm/xe/bo: Add attributes field to xe_bo
0fe86083d80c drm/xe/bo: Update atomic_access attribute on madvise


