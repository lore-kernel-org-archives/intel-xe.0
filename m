Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD96C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 17:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C0410E1A1;
	Fri, 21 Mar 2025 17:12:42 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D135C10E19A;
 Fri, 21 Mar 2025 17:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_xe-only_patches?=
 =?utf-8?q?_from_the_multi-device_GPUSVM_series_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 17:12:41 -0000
Message-ID: <174257716185.65615.4136257667208071176@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: xe-only patches from the multi-device GPUSVM series (rev3)
URL   : https://patchwork.freedesktop.org/series/146383/
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
commit 1bd5e9b28228a2e4c13520bedce4a7edc7bc06c4
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Mar 21 17:34:16 2025 +0100

    drm/xe/uapi, drm/xe: Make the PT code handle placement per PTE rather than per vma / range
    
    With SVM, ranges forwarded to the PT code for binding can, mostly
    due to races when migrating, point to both VRAM and system / foreign
    device memory. Make the PT code able to handle that by checking,
    for each PTE set up, whether it points to local VRAM or to system
    memory.
    
    The UAPI is changed implicitly in that before this patch,
    global atomics required a bo with VRAM/System placements. With
    this patch that is changed to requiring LR mode, and
    if the required placement is not available upon GPU atomic access
    pagefault, an error will be generated and the VM banned.
    
    v2:
    - Fix system memory GPU atomic access.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 74f632d1bd3b90ed79883361ca25f1225c0aee58 drm-intel
76b1412c169c drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
-:35: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#35: FILE: drivers/gpu/drm/xe/Kconfig:77:
+config DRM_XE_GPUSVM
+	bool "Enable CPU to GPU address mirroring"
+	depends on DRM_XE
+	depends on !UML
+	default y
+	select DEVICE_PRIVATE
+	help
+	  Enable this option if you want support for CPU to GPU address
+	  mirroring.
+
+	  If in doubut say "Y".
+

total: 0 errors, 1 warnings, 0 checks, 260 lines checked
ee0152523962 drm/xe/svm: Fix a potential bo UAF
66969780dfab drm/xe/bo: Add a bo remove callback
-:187: CHECK:SPACING: No space is necessary after a cast
#187: FILE: drivers/gpu/drm/xe/xe_bo_evict.c:200:
+	(void) xe_bo_apply_to_pinned(xe, &xe->pinned.external,

-:193: CHECK:SPACING: No space is necessary after a cast
#193: FILE: drivers/gpu/drm/xe/xe_bo_evict.c:206:
+	(void) xe_bo_apply_to_pinned(xe, &xe->pinned.kernel_bo_present,

-:197: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#197: FILE: drivers/gpu/drm/xe/xe_bo_evict.c:210:
+
+}

-:199: CHECK:LINE_SPACING: Please don't use multiple blank lines
#199: FILE: drivers/gpu/drm/xe/xe_bo_evict.c:212:
+
+

total: 0 errors, 0 warnings, 4 checks, 228 lines checked
b02a337a61f7 drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable devices
1bd5e9b28228 drm/xe/uapi, drm/xe: Make the PT code handle placement per PTE rather than per vma / range


