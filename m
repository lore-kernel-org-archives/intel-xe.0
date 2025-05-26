Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7BAC54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 17:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FD510E301;
	Mon, 26 May 2025 17:46:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AED10E301;
 Mon, 26 May 2025 17:46:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fvm=3A_Impleme?=
 =?utf-8?q?nt_xe=5Fvm=5Fget=5Fproperty=5Fioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 17:46:03 -0000
Message-ID: <174828156340.20963.6075194186990221611@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250507155727.130444-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250507155727.130444-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
URL   : https://patchwork.freedesktop.org/series/148712/
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
commit d488033c8c0a4ae6c75fd2dfbf6ed75472dd7229
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Wed May 7 15:57:26 2025 +0000

    drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
    
    Add support for userspace to request a list of observed faults
    from a specified VM.
    
    v2:
    - Only allow querying of failed pagefaults (Matt Brost)
    
    v3:
    - Remove unnecessary size parameter from helper function, as it
      is a property of the arguments. (jcavitt)
    - Remove unnecessary copy_from_user (Jainxun)
    - Set address_precision to 1 (Jainxun)
    - Report max size instead of dynamic size for memory allocation
      purposes.  Total memory usage is reported separately.
    
    v4:
    - Return int from xe_vm_get_property_size (Shuicheng)
    - Fix memory leak (Shuicheng)
    - Remove unnecessary size variable (jcavitt)
    
    v5:
    - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
    - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
    
    v6:
    - Repair and move fill_faults break condition (Dan Carpenter)
    - Free vm after use (jcavitt)
    - Combine assertions (jcavitt)
    - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
    - Remove return mask from fill_faults, as return is already -EFAULT or 0
      (jcavitt)
    
    v7:
    - Revert back to using xe_vm_get_property_ioctl
    - Apply better copy_to_user logic (jcavitt)
    
    v8:
    - Fix and clean up error value handling in ioctl (jcavitt)
    - Reapply return mask for fill_faults (jcavitt)
    
    v9:
    - Future-proof size logic for zero-size properties (jcavitt)
    - Add access and fault types (Jianxun)
    - Remove address type (Jianxun)
    
    v10:
    - Remove unnecessary switch case logic (Raag)
    - Compress size get, size validation, and property fill functions into a
      single helper function (jcavitt)
    - Assert valid size (jcavitt)
    
    v11:
    - Remove unnecessary else condition
    - Correct backwards helper function size logic (jcavitt)
    
    v12:
    - Use size_t instead of int (Raag)
    
    v13:
    - Remove engine class and instance (Ivan)
    
    v14:
    - Map access type, fault type, and fault level to user macros (Matt
      Brost, Ivan)
    
    v15:
    - Remove unnecessary size assertion (jcavitt)
    
    v16:
    - Nit fixes (Matt Brost)
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Acked-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Jainxun Zhang <jianxun.zhang@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Raag Jadav <raag.jadav@intel.com>
    Cc: Ivan Briano <ivan.briano@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
61cd52653602 drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
b20cd8c2ac8d drm/xe/xe_gt_pagefault: Move pagefault struct to header
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 223 lines checked
6516fa858ce1 drm/xe/uapi: Define drm_xe_vm_get_property
-:57: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#57: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)

total: 0 errors, 1 warnings, 0 checks, 110 lines checked
08523d356030 drm/xe/xe_vm: Add per VM fault info
-:173: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#173: FILE: drivers/gpu/drm/xe/xe_vm.c:823:
+	if (!e) {
+		drm_warn(&vm->xe->drm,

total: 0 errors, 1 warnings, 0 checks, 225 lines checked
d488033c8c0a drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
-:201: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#201: FILE: drivers/gpu/drm/xe/xe_vm.c:3918:
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1] ||
+			     args->reserved[2]))

total: 0 errors, 0 warnings, 1 checks, 130 lines checked


