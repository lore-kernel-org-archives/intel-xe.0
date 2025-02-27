Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066B1C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 21:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEFE10EB8D;
	Thu, 27 Feb 2025 21:01:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693E410EB8D;
 Thu, 27 Feb 2025 21:01:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fvm=3A_Impleme?=
 =?utf-8?q?nt_xe=5Fvm=5Fget=5Fproperty=5Fioctl_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 21:01:49 -0000
Message-ID: <174069010942.2865833.4126425016377563235@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227191457.84035-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250227191457.84035-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev2)
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
commit c8b00f1c27ee4cfece6e9586a471129f4f1afa88
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Thu Feb 27 19:14:57 2025 +0000

    drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
    
    Add support for userspace to get various properties from a specified VM.
    The currently supported properties are:
    
    - The number of engine resets the VM has observed
    - The number of exec queue bans the VM has observed, up to the last 50
      relevant ones, in total.
    - The number of exec queue bans the VM has observed, up to the last 50
      relevant ones, that were caused by faults.
    
    The latter two requests also include information on the exec queue bans
    themselves, such as the ID of the banned exec queue and, when relevant,
    the faulting address, address type, and address precision.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 6badede10d92c242241bd7bf59a5488b5eba5aa7 drm-intel
efc01e20f6c6 drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
d8ba0f875c82 drm/xe/xe_exec_queue: Add ID param to exec queue struct
b6a74de29944 drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
7028f11f2ae7 drm/xe/xe_vm: Add per VM pagefault info
1b2b12d7adb2 drm/xe/xe_vm: Add per VM reset stats
80352f548a2b drm/xe/uapi: Define drm_xe_vm_get_property
-:34: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#34: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
e241d5ce32af drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
c8b00f1c27ee drm/xe/xe_vm: Implement xe_vm_get_property_ioctl


