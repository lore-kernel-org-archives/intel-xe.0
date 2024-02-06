Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A85C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 15:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162B6112C73;
	Tue,  6 Feb 2024 15:07:01 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9110D112C70;
 Tue,  6 Feb 2024 15:06:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_support_VM_shar?=
 =?utf-8?q?ing_between_apps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Moti Haimovski" <mhaimovski@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Feb 2024 15:06:59 -0000
Message-ID: <170723201959.1055288.14394744339692425488@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206141820.264977-1-mhaimovski@habana.ai>
In-Reply-To: <20240206141820.264977-1-mhaimovski@habana.ai>
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
URL   : https://patchwork.freedesktop.org/series/129582/
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
commit c2ffa07ca70c35a26bc68404435b06d81c5a54ad
Author: Bharat Jauhari <bjauhari@habana.ai>
Date:   Tue Feb 6 16:18:20 2024 +0200

    drm/xe: support to export VM as fd
    
    In some situations, drivers and applications need to share a VM.
    Currently a VM is exposed to the user as an integer. This integer
    has no meaning outside the context/application created it.
    This commit adds support to export VM ID as an FD which can be shared.
    User is allowed to export a VM only once. Consecutive calls to export
    the same VM will return with an error.
    
    Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
+ /mt/dim checkpatch 8a42fafc783505db4f1d6a70005a5f103069c9d9 drm-intel
69b4dff66 drm/xe: add ref count to xe_file
-:50: CHECK:LINE_SPACING: Please don't use multiple blank lines
#50: FILE: drivers/gpu/drm/xe/xe_device.c:90:
 
+

total: 0 errors, 0 warnings, 1 checks, 105 lines checked
c2ffa07ca drm/xe: support to export VM as fd
-:89: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*vm_file)...) over kzalloc(sizeof(struct xe_vm_file)...)
#89: FILE: drivers/gpu/drm/xe/xe_vm.c:3303:
+	vm_file = kzalloc(sizeof(struct xe_vm_file), GFP_KERNEL);

-:179: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#179: FILE: drivers/gpu/drm/xe/xe_vm.h:184:
+int xe_vm_export_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file);

-:191: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'vm' - possible side-effects?
#191: FILE: drivers/gpu/drm/xe/xe_vm_types.h:122:
+#define xe_vm_scale_in_use(vm) ((vm)->scale_info.exported_vm || (vm)->scale_info.registered_vm)

-:260: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#260: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_VM_EXPORT			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_EXPORT, struct drm_xe_vm_export)

total: 0 errors, 1 warnings, 3 checks, 248 lines checked


