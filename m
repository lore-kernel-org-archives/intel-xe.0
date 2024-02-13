Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA4BC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 20:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC3210E678;
	Tue, 13 Feb 2024 20:46:21 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B4C10E661;
 Tue, 13 Feb 2024 20:46:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_support_VM_shar?=
 =?utf-8?q?ing_between_apps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Moti Haimovski" <mhaimovski@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 20:46:20 -0000
Message-ID: <170785718045.1218995.7399989786686725719@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213203829.871802-1-mhaimovski@habana.ai>
In-Reply-To: <20240213203829.871802-1-mhaimovski@habana.ai>
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

Series: drm/xe: support VM sharing between apps
URL   : https://patchwork.freedesktop.org/series/129853/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a2b0dcd1531253edf5b72db5956f401e7e5b8573
Author: Bharat Jauhari <bjauhari@habana.ai>
Date:   Tue Feb 13 22:38:29 2024 +0200

    drm/xe: support sharing VM info between XE drivers
    
    This commit adds support to export a user-created VM as a FD
    to be shared between XE drivers running on the same device.
    
    There can be devices which offer multiple hardware features each
    requiring its own driver. In such case, there is always only one
    primary driver which registers itself with the device. All other
    drivers work as auxiliary drivers to the primary driver.
    Based on software use case of the application there can be a
    requirement to share virtual memory information between these drivers.
    In current  design virtual memory is exposed as an integer, this number
    is tightly coupled with the application context. In this integer form,
    VM information cannot be shared with other auxiliary drivers by the
    application.
    Taking inspiration from dma-buf framework, adding a new interface to
    export the VM id as an FD. This FD is unique across the host and
    encapsulates VM related configurations. Using this FD each application
    can opaquely share VM info with other aux drivers.
    This feature doesn't allow inter application sharing of VM information,
    its purpose is to allow application for sharing its VM with another
    driver contexts.
    
    Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
+ /mt/dim checkpatch 43ab7b073fa4840f29521c57cab1f4eb161d4223 drm-intel
a2b0dcd15 drm/xe: support sharing VM info between XE drivers
-:99: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*vm_file)...) over kzalloc(sizeof(struct xe_vm_file)...)
#99: FILE: drivers/gpu/drm/xe/xe_vm.c:3280:
+	vm_file = kzalloc(sizeof(struct xe_vm_file), GFP_KERNEL);

-:179: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#179: FILE: drivers/gpu/drm/xe/xe_vm.h:184:
+int xe_vm_export_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file);

-:191: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'vm' - possible side-effects?
#191: FILE: drivers/gpu/drm/xe/xe_vm_types.h:119:
+#define xe_vm_scale_in_use(vm) ((vm)->scale_info.exported_vm || (vm)->scale_info.registered_vm)

-:256: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#256: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_VM_EXPORT			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_EXPORT, struct drm_xe_vm_export)

total: 0 errors, 1 warnings, 3 checks, 230 lines checked


