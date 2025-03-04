Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C7CC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 18:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBF010E686;
	Tue,  4 Mar 2025 18:17:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAE410E6A4;
 Tue,  4 Mar 2025 18:17:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fvm=3A_Impleme?=
 =?utf-8?q?nt_xe=5Fvm=5Fget=5Fproperty=5Fioctl_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 18:17:38 -0000
Message-ID: <174111225890.709723.5959757235255821319@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250304170854.67195-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev6)
URL   : https://patchwork.freedesktop.org/series/145529/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0e065e7fc7a503d5e87f2d2781c5e1fc719d16dd
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9261c6d248d9fcaf65c1b48060be4a24c9f465ca
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Tue Mar 4 17:08:54 2025 +0000

    drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
    
    Add support for userspace to request a list of observed failed
    pagefaults from a specified VM.
    
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
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    CC: Jainxun Zhang <jianxun.zhang@intel.com>
    CC: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch ff2d693d88726e29a1d87291105135c31c21fa26 drm-intel
3dfc1aa4d2c3 drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
63f0e32901e1 drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
ee5c9c676ee9 drm/xe/xe_vm: Add per VM pagefault info
ee33da9aef8f drm/xe/uapi: Define drm_xe_vm_get_property
-:34: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#34: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
857b7422146a drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
9261c6d248d9 drm/xe/xe_vm: Implement xe_vm_get_property_ioctl


