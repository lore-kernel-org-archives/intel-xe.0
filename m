Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612AAC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 05:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236C610E7CD;
	Wed,  9 Apr 2025 05:11:45 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A6810E7CD;
 Wed,  9 Apr 2025 05:11:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PREFETCH_and_MADVISE_for_?=
 =?utf-8?q?SVM_ranges_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 05:11:43 -0000
Message-ID: <174417550399.50883.3639372259112742334@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Series: PREFETCH and MADVISE for SVM ranges (rev4)
URL   : https://patchwork.freedesktop.org/series/146290/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 902f9353ae04d49e3d40280650c89f6e6e370bc7
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Apr 7 15:47:19 2025 +0530

    drm/xe/bo: Update atomic_access attribute on madvise
    
    Update the bo_atomic_access based on user-provided input and determine
    the migration to smem during a CPU fault
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch a49a4787e6bc70296204f4a6e1b0fed3759938cd drm-intel
752b206d9c89 drm/xe: Introduce xe_vma_op_prefetch_range struct for prefetch of ranges
f1b78b50c2bf drm/xe: Make xe_svm_alloc_vram public
e4758bf081a4 drm/xe/svm: Helper to add tile masks to svm ranges
c579ef6ed6bc drm/xe/svm: Make to_xe_range a public function
c6f093e3ef5c drm/xe/svm: Make xe_svm_range_* end/start/size public
d82c1cf4e6fd drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take an increment value
-:30: ERROR:SPACING: space required before the open parenthesis '('
#30: FILE: drivers/gpu/drm/xe/xe_vm.c:813:
+	if(!inc_val)

total: 1 errors, 0 warnings, 0 checks, 96 lines checked
71ed634656f9 drm/xe/vm: Add an identifier in xe_vma_ops for svm prefetch
c30151d94235 drm/xe: Rename lookup_vma function to xe_find_vma_by_addr
c24b9641e007 drm/xe/svm: Allow unaligned addresses and ranges for prefetch
e3b2143af8b1 drm/xe/svm: Refactor usage of drm_gpusvm* function in xe_svm
95ac3d7256a7 drm/xe/svm: Add function to determine if range needs VRAM migration
6f39700a50ff drm/gpusvm: Introduce vram_only flag for VRAM allocation
43a08682be30 drm/xe/svm: Incase of atomic access ensure get_pages happens from vram
10bf7eafc345 drm/xe/svm: Implement prefetch support for SVM ranges
3ba4d31e877e drm/xe/vm: Add debug prints for SVM range prefetch
db5c1983c7cf Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
0948b3776e6a drm/xe/uapi: Add madvise interface
-:37: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#37: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)

total: 0 errors, 1 warnings, 0 checks, 121 lines checked
e65270d8836f drm/xe/vm: Add attributes struct as member of vma
770cfb9e0269 drm/xe/vma: Move pat_index to vma attributes
06e95defa28d drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
296eb3eb2e55 drm/gpusvm: Make drm_gpusvm_for_each_* macros public
-:162: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'range__' - possible side-effects?
#162: FILE: include/drm/drm_gpusvm.h:536:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = __drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:162: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#162: FILE: include/drm/drm_gpusvm.h:536:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = __drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:162: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#162: FILE: include/drm/drm_gpusvm.h:536:
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = __drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))

-:209: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#209: FILE: include/drm/drm_gpusvm.h:583:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:209: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#209: FILE: include/drm/drm_gpusvm.h:583:
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'notifier__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:599:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'next__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:599:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

-:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'end__' - possible side-effects?
#225: FILE: include/drm/drm_gpusvm.h:599:
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))

total: 0 errors, 0 warnings, 8 checks, 207 lines checked
2564304ab819 drm/xe/svm: Split system allocator vma incase of madvise call
85953d145284 drm/xe: Implement madvise ioctl for xe
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 345 lines checked
df369fad9581 drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
fff502f987dc drm/xe/svm : Add svm ranges migration policy on atomic access
888d2438a2ab drm/xe/madvise: Update migration policy based on preferred location
da42f612c26d drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
5545b2b6c9dc drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
5edbbef8ec39 drm/xe/svm: Consult madvise preferred location in prefetch
108238268ebf drm/xe/uapi: Add uapi for vma count and mem attributes
-:75: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#75: FILE: drivers/gpu/drm/xe/xe_vm.c:2210:
+		mem_attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;

-:170: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#170: FILE: include/uapi/drm/xe_drm.h:127:
+#define DRM_IOCTL_XE_VM_QUERY_VMAS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS, struct drm_xe_vm_query_num_vmas)

-:171: WARNING:LONG_LINE: line length of 137 exceeds 100 columns
#171: FILE: include/uapi/drm/xe_drm.h:128:
+#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)

total: 0 errors, 3 warnings, 0 checks, 256 lines checked
52c98975e7e8 drm/xe/bo: Add attributes field to xe_bo
902f9353ae04 drm/xe/bo: Update atomic_access attribute on madvise


