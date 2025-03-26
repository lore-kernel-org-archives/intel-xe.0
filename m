Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB16C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 08:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773BB10E558;
	Wed, 26 Mar 2025 08:12:56 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A7B89E9E;
 Wed, 26 Mar 2025 08:12:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_xe-only_patches?=
 =?utf-8?q?_from_the_multi-device_GPUSVM_series_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Mar 2025 08:12:54 -0000
Message-ID: <174297677473.4398.2081944803680359414@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: xe-only patches from the multi-device GPUSVM series (rev6)
URL   : https://patchwork.freedesktop.org/series/146383/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 515c6432293c7cf0739809531150bea062d16031
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Mar 26 09:05:51 2025 +0100

    drm/xe: Make the PT code handle placement per PTE rather than per vma / range
    
    With SVM, ranges forwarded to the PT code for binding can, mostly
    due to races when migrating, point to both VRAM and system / foreign
    device memory. Make the PT code able to handle that by checking,
    for each PTE set up, whether it points to local VRAM or to system
    memory.
    
    v2:
    - Fix system memory GPU atomic access.
    v3:
    - Avoid the UAPI change. It needs more thought.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 drm-intel
864c3d4b9762 drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
-:38: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#38: FILE: drivers/gpu/drm/xe/Kconfig:76:
+config DRM_XE_GPUSVM
+	bool "Enable CPU to GPU address mirroring"
+	depends on DRM_XE
+	depends on !UML
+	depends on DEVICE_PRIVATE
+	default y
+	select DRM_GPUSVM
+	help
+	  Enable this option if you want support for CPU to GPU address
+	  mirroring.
+
+	  If in doubut say "Y".
+

total: 0 errors, 1 warnings, 0 checks, 261 lines checked
747b14f3b43c drm/xe/svm: Fix a potential bo UAF
84fba3253034 drm/xe/bo: Add a bo remove callback
7fb26a83e04f drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable devices
515c6432293c drm/xe: Make the PT code handle placement per PTE rather than per vma / range


