Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B901BCA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 18:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04D10E02B;
	Thu, 21 Aug 2025 18:14:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A03F10E02B;
 Thu, 21 Aug 2025 18:14:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_MADVISE_FOR_XE_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Aug 2025 18:14:44 -0000
Message-ID: <175580008462.258357.10152032361927757469@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250821173104.3030148-1-himal.prasad.ghimiray@intel.com>
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

Series: MADVISE FOR XE (rev9)
URL   : https://patchwork.freedesktop.org/series/149550/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 53be44d848f99dc597351eeb0a47e1d19e555b2b
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Aug 21 23:01:04 2025 +0530

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
+ /mt/dim checkpatch 4b2900a02c5ee617301245b4b2e3e96f340a242a drm-intel
03c54a131267 drm/xe/uapi: Add madvise interface
-:51: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#51: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
db9f49b8e765 drm/xe/vm: Add attributes struct as member of vma
36cce03fff80 drm/xe/vma: Move pat_index to vma attributes
97979ab791b2 drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as parameter
728505f4e55f drm/xe/svm: Split system allocator vma incase of madvise call
1c362b7d59bc drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
ff87e93e9a19 drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
6cdb611f4c74 drm/xe: Implement madvise ioctl for xe
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 330 lines checked
c4c70ff9ef3d drm/xe/svm: Add svm ranges migration policy on atomic access
8681888f3ccd drm/xe/madvise: Update migration policy based on preferred location
7b9ee7d091b5 drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT memory attribute
0f659e3bcad2 drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
894bd16d4bd3 drm/xe/svm: Consult madvise preferred location in prefetch
a2d7ba606d90 drm/xe/bo: Add attributes field to xe_bo
e50dd8ec59ae drm/xe/bo: Update atomic_access attribute on madvise
74506aefd3c2 drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
befbec361541 drm/xe/vm: Add helper to check for default VMA memory attributes
7876e3c508d1 drm/xe: Reset VMA attributes to default in SVM garbage collector
854849cf887f drm/xe: Enable madvise ioctl for xe
53be44d848f9 drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
-:210: WARNING:LONG_LINE: line length of 147 exceeds 100 columns
#210: FILE: include/uapi/drm/xe_drm.h:125:
+#define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)

total: 0 errors, 1 warnings, 0 checks, 288 lines checked


