Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B37C19776
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 00:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A96F10E17D;
	Thu, 27 Feb 2025 00:12:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E1810E17D;
 Thu, 27 Feb 2025 00:12:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fvm=3A_Impleme?=
 =?utf-8?q?nt_xe=5Fvm=5Fget=5Fproperty=5Fioctl?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 00:12:05 -0000
Message-ID: <174061512528.2508468.4070430160739165223@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226225557.133076-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250226225557.133076-1-jonathan.cavitt@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/145529/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ef956f5e0e0f3defc038158f3b241d55e5f9e28d
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Wed Feb 26 22:55:56 2025 +0000

    drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
    
    Add support for userspace to get various properties from a specified VM.
    The currently supported properties are:
    
    - The number of engine resets the VM has observed
    - The number of exec queue bans the VM has observed, up to the last 50
      relevant ones, and how many of those were caused by faults.
    
    The latter request also includes information on the exec queue bans,
    such as the ID of the banned exec queue, whether the ban was caused by a
    pagefault or not, and the address and address type of the associated
    fault (if one exists).
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8541a64154cd8b9c07977dedc1d22883f43279a0 drm-intel
35a2651335bb drm/xe/xe_gt_pagefault: Migrate lookup_vma to xe_vm.h
-:84: CHECK:LINE_SPACING: Please don't use multiple blank lines
#84: FILE: drivers/gpu/drm/xe/xe_vm.h:274:
+
+

total: 0 errors, 0 warnings, 1 checks, 67 lines checked
c27a745e0810 drm/xe/xe_exec_queue: Add ID param to exec queue struct
9716297e102a drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
9839144569cf drm/xe/xe_vm: Add per VM pagefault info
ce0efa900b91 drm/xe/xe_vm: Add per VM reset stats
ef956f5e0e0f drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
-:188: WARNING:LONG_LINE: line length of 129 exceeds 100 columns
#188: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)

total: 0 errors, 1 warnings, 0 checks, 225 lines checked


