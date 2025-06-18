Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EED4C7115A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 20:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FE210E93D;
	Wed, 18 Jun 2025 20:23:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ED910E93D;
 Wed, 18 Jun 2025 20:23:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gpusvm=2C_drm/pagemap?=
 =?utf-8?q?=2C_drm/xe=3A_Restructure_migration_in_preparation_for_multi-devi?=
 =?utf-8?q?ce_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Jun 2025 20:23:05 -0000
Message-ID: <175027818568.93364.6205908384440502445@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250618201617.54100-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250618201617.54100-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/gpusvm, drm/pagemap, drm/xe: Restructure migration in preparation for multi-device (rev5)
URL   : https://patchwork.freedesktop.org/series/147902/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 47f485f7827b9eff824ed5c5921c6ab32a0b0827
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 18 22:16:17 2025 +0200

    drm/xe: Implement and use the drm_pagemap populate_mm op
    
    Add runtime PM since we might call populate_mm on a foreign device.
    
    v3:
    - Fix a kerneldoc failure (Matt Brost)
    - Revert the bo type change from device to kernel (Matt Brost)
    v4:
    - Add an assert in xe_svm_alloc_vram (Matt Brost)
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b5956fc71790f85e9c9113adf1d9c7332c995f13 drm-intel
e2ff4538be94 drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
-:950: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#950: 
new file mode 100644

-:1759: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#1759: FILE: drivers/gpu/drm/xe/Kconfig:90:
+config DRM_XE_PAGEMAP
+	bool "Enable device memory pool for SVM"
 	depends on DRM_XE_GPUSVM
 	select GET_FREE_REGION
 	default y
 	help
+	  Disable this option only if you don't want to expose local device
+	  Disable this option only if you don't want to expose local device
+	  Disable this option only if you don't want to expose local device
+	  memory for SVM. Will reduce KMD memory footprint when disabled.
+
+	  If in doubut say "Y".
 
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"

total: 0 errors, 2 warnings, 0 checks, 2062 lines checked
2124abba8420 drm/pagemap: Add a populate_mm op
47f485f7827b drm/xe: Implement and use the drm_pagemap populate_mm op


