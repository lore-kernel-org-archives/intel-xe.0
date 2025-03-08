Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04492C282DE
	for <intel-xe@archiver.kernel.org>; Sat,  8 Mar 2025 00:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97C610E1D6;
	Sat,  8 Mar 2025 00:29:29 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1A710E1D6;
 Sat,  8 Mar 2025 00:29:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fvm=3A_Impleme?=
 =?utf-8?q?nt_xe=5Fvm=5Fget=5Ffaults=5Fioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 08 Mar 2025 00:29:28 -0000
Message-ID: <174139376897.4949.9822499534143072149@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307224125.111430-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250307224125.111430-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
URL   : https://patchwork.freedesktop.org/series/146024/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e93c0d3615f5e9d7b349a7929f92f5b810c233e8
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Mar 7 22:41:24 2025 +0000

    drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
    
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
    
    v5:
    - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    CC: Jainxun Zhang <jianxun.zhang@intel.com>
    CC: Shuicheng Lin <shuicheng.lin@intel.com>
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
ede153f60fd5 drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
6e6d015e392d drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
eb7c78c1085b drm/xe/xe_vm: Add per VM pagefault info
2b85cb89536f drm/xe/uapi: Define drm_xe_vm_get_faults
-:34: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#34: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_VM_GET_FAULTS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_FAULTS, struct drm_xe_vm_get_faults)

total: 0 errors, 1 warnings, 0 checks, 73 lines checked
1f44dac49b52 drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
e93c0d3615f5 drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl


