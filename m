Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F23C71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6731B10E204;
	Fri, 13 Jun 2025 12:43:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F5010E204;
 Fri, 13 Jun 2025 12:43:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MADVISE_FOR_XE_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 12:43:58 -0000
Message-ID: <174981863833.76863.14412718946937096044@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

Series: MADVISE FOR XE (rev2)
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
commit 645ba9f69158cd54e0cca870f0e54bc822e6d101
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Jun 13 18:25:58 2025 +0530

    drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
    
    If a VMA within the madvise input range already has the same memory
    attribute as the one requested by the user, skip PTE zapping for that
    VMA to avoid unnecessary invalidation.
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch cce8a9af1c6cf1776511aa69e5f4b5bef7bf5938 drm-intel
78cfd38c34de Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
e57e1197d03a drm/xe/uapi: Add madvise interface
-:48: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#48: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)

total: 0 errors, 1 warnings, 0 checks, 142 lines checked
4e22da734cb1 drm/xe/vm: Add attributes struct as member of vma
6824c9a242a9 drm/xe/vma: Move pat_index to vma attributes
7bf4fe6148b0 drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
23955e9c0ba7 drm/gpusvm: Make drm_gpusvm_for_each_* macros public
-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:548:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:548:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:548:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:258: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#258: FILE: include/drm/drm_gpusvm.h:581:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:258: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#258: FILE: include/drm/drm_gpusvm.h:581:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:274: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#274: FILE: include/drm/drm_gpusvm.h:597:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:274: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#274: FILE: include/drm/drm_gpusvm.h:597:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:274: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#274: FILE: include/drm/drm_gpusvm.h:597:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

total: 0 errors, 0 warnings, 8 checks, 248 lines checked
249e967cc319 drm/xe/svm: Split system allocator vma incase of madvise call
d3bb724faa8a drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
feea7cfe0212 drm/xe: Implement madvise ioctl for xe
-:62: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#62: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 318 lines checked
6684d9bd5cf3 drm/xe/vm: Add an identifier for madvise in xe_vma_ops
647ce81cb00e drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
ea257524b2d8 drm/xe/svm : Add svm ranges migration policy on atomic access
18404a06671a drm/xe/madvise: Update migration policy based on preferred location
6255d76a51e7 drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
0b0bf05a1c25 drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
3738b9650d45 drm/xe/svm: Consult madvise preferred location in prefetch
7dd0ae94dd47 drm/xe/bo: Add attributes field to xe_bo
027e9c3085c7 drm/xe/bo: Update atomic_access attribute on madvise
2aa570b0f530 drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
-:75: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#75: FILE: drivers/gpu/drm/xe/xe_vm.c:2202:
+		attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;

-:176: WARNING:LONG_LINE: line length of 137 exceeds 100 columns
#176: FILE: include/uapi/drm/xe_drm.h:125:
+#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)

total: 0 errors, 2 warnings, 0 checks, 264 lines checked
645ba9f69158 drm/xe/madvise: Skip vma invalidation if mem attr are unchanged


