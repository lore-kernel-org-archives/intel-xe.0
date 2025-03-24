Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A1DC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 17:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4947D10E4A8;
	Mon, 24 Mar 2025 17:01:04 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D14F10E4A8;
 Mon, 24 Mar 2025 17:01:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_xe-only_patches?=
 =?utf-8?q?_from_the_multi-device_GPUSVM_series_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 17:01:03 -0000
Message-ID: <174283566311.74478.7244731687746084394@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: xe-only patches from the multi-device GPUSVM series (rev5)
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
commit ca9d9dda4cc67b209d0b48f688a05f8d9af8fa14
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Mar 24 17:55:00 2025 +0100

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
    Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2
+ /mt/dim checkpatch 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c drm-intel
58f45a4a5a74 drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
- Fixes for compilation errors on 32-bit. This changes the Kconfig logic a bit.

-:37: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#37: FILE: drivers/gpu/drm/xe/Kconfig:76:
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

total: 0 errors, 2 warnings, 0 checks, 261 lines checked
3721282317e6 drm/xe/svm: Fix a potential bo UAF
e668daf9063f drm/xe/bo: Add a bo remove callback
de4769af7ae1 drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable devices
ca9d9dda4cc6 drm/xe: Make the PT code handle placement per PTE rather than per vma / range


