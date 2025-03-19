Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AA0C35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 10:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634F810E073;
	Wed, 19 Mar 2025 10:50:25 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D5C10E073;
 Wed, 19 Mar 2025 10:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_xe-only_patches?=
 =?utf-8?q?_from_the_multi-device_GPUSVM_series_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 10:50:23 -0000
Message-ID: <174238142336.53294.4600037969872106889@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: xe-only patches from the multi-device GPUSVM series (rev2)
URL   : https://patchwork.freedesktop.org/series/146383/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fed6aa447fa4747181a9249d0af27c13691df259
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Mar 17 11:41:32 2025 +0100

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
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
869f4523fed0 drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
-:34: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#34: FILE: drivers/gpu/drm/xe/Kconfig:77:
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
5e2edb53d36d drm/xe/svm: Fix a potential bo UAF
d29924df4c52 drm/xe/bo: Add a bo remove callback
f0e7c92d558b drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable devices
fed6aa447fa4 drm/xe/uapi, drm/xe: Make the PT code handle placement per PTE rather than per vma / range


