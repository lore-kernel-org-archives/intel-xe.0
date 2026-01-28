Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F20D35663
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 00:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8C510E152;
	Wed, 28 Jan 2026 00:59:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F74910E152;
 Wed, 28 Jan 2026 00:59:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_new_dma-map_IOVA_allo?=
 =?utf-8?q?c=2C_link=2C_and_sync_API_in_GPU_SVM_and_DRM_pagemap_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 00:59:48 -0000
Message-ID: <176956198852.198158.8488722080645936124@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260128004841.2436896-1-matthew.brost@intel.com>
In-Reply-To: <20260128004841.2436896-1-matthew.brost@intel.com>
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

Series: Use new dma-map IOVA alloc, link, and sync API in GPU SVM and DRM pagemap (rev3)
URL   : https://patchwork.freedesktop.org/series/160587/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 951a5e4ecfd4bd905384749bef890c1a90a86ef2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jan 27 16:48:41 2026 -0800

    drm/gpusvm: Use device-to-device IOVA alloc, link, and sync API in GPU SVM
    
    The device-to-device IOVA alloc, link, and sync APIs perform
    significantly better than individual map/unmap operations, as they
    avoid costly synchronization. This improvement is especially noticeable
    when mapping a 2MB region using 4KB pages. In addition, IOVAs may be
    required for future high-speed fabric connections between devices.
    
    Use the IOVA alloc, link, and sync APIs for GPU SVM, which create DMA
    mappings between the devices.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ba05f22d6945596fac691e952c98f566696c24ad drm-intel
977253684cdb drm/pagemap: Add helper to access zone_device_data
f8d9efc0ad6c drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM
5a68fb6133c9 drm/pagemap: Split drm_pagemap_migrate_map_pages into device / system
3e123ad5d8b1 drm/pagemap: Use dma-map IOVA alloc, link, and sync API for DRM pagemap
c45f7281a626 drm/pagemap: Reduce number of IOVA link calls
05b4cbbbc73c drm/pagemap: Add IOVA interface to DRM pagemap
0378474e6b37 drm/xe: Stub out DRM pagemap IOVA alloc implementation
49a9e02cf14e drm/pagemap: Use device-to-device IOVA alloc, link, and sync API for DRM pagemap
-:163: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#163: FILE: drivers/gpu/drm/drm_pagemap.c:518:
+				return;
+			} else {

total: 0 errors, 1 warnings, 0 checks, 187 lines checked
749a995da317 drm/xe: Drop BO dma-resv lock during SVM migrate-to-device
0934edfc22b9 drm/xe: Implement DRM pagemap IOVA vfuncs
-:57: ERROR:INITIALISED_STATIC: do not initialise statics to false
#57: FILE: drivers/gpu/drm/xe/xe_svm.c:1698:
+	static bool locking_proved = false;

-:83: ERROR:INITIALISED_STATIC: do not initialise statics to false
#83: FILE: drivers/gpu/drm/xe/xe_svm.c:1724:
+	static bool locking_proved = false;

total: 2 errors, 0 warnings, 0 checks, 136 lines checked
951a5e4ecfd4 drm/gpusvm: Use device-to-device IOVA alloc, link, and sync API in GPU SVM


