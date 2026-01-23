Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E0D778BD
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 22:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CABF10E038;
	Fri, 23 Jan 2026 22:13:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240E810E038;
 Fri, 23 Jan 2026 22:13:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_new_dma-map_IOVA_allo?=
 =?utf-8?q?c=2C_link=2C_and_sync_API_in_GPU_SVM_and_DRM_pagemap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 22:13:29 -0000
Message-ID: <176920640914.189692.13813172955112169958@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123215907.1643088-1-matthew.brost@intel.com>
In-Reply-To: <20260123215907.1643088-1-matthew.brost@intel.com>
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

Series: Use new dma-map IOVA alloc, link, and sync API in GPU SVM and DRM pagemap (rev2)
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
commit cc6f00405301c3a32b4585dd3b60d2e7c146e633
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jan 23 13:59:07 2026 -0800

    drm/pagemap: Use new dma-map IOVA alloc, link, and sync API for DRM pagemap
    
    The dma-map IOVA alloc, link, and sync APIs perform significantly better
    than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
    This difference is especially noticeable when mapping a 2MB region in
    4KB pages.
    
    Use the IOVA alloc, link, and sync APIs for DRM pagemap, which create DMA
    mappings between the CPU and GPU for copying data.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a0ea91e77badad299c63216a93999551ea2a02f0 drm-intel
26e937287585 drm/pagemap: Add helper to access zone_device_data
3a9a94d8ffc9 drm/gpusvm: Use new dma-map IOVA alloc, link, and sync API in GPU SVM
cc6f00405301 drm/pagemap: Use new dma-map IOVA alloc, link, and sync API for DRM pagemap
-:112: WARNING:DEEP_INDENTATION: Too many leading tabs - consider code refactoring
#112: FILE: drivers/gpu/drm/drm_pagemap.c:304:
+						if (err)

total: 0 errors, 1 warnings, 0 checks, 279 lines checked


