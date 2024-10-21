Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDFED3C93E
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 05:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E19C10E0A1;
	Mon, 21 Oct 2024 05:52:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A5510E0A1;
 Mon, 21 Oct 2024 05:52:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sriov=3A_Don=27t_m?=
 =?utf-8?q?igrate_dmabuf_BO_to_System_RAM_while_running_in_VM_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Oct 2024 05:52:21 -0000
Message-ID: <172948994153.1303073.5010673866856396206@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
In-Reply-To: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM while running in VM (rev2)
URL   : https://patchwork.freedesktop.org/series/139920/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4346ea59037d66745c16357b2d8da2e479c3c631
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Sun Oct 20 22:21:33 2024 -0700

    drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs
    
    If a BO's is_devmem_external flag is set, it means that it is an
    imported dmabuf BO that has a backing store in VRAM. Therefore, we
    need to add XE_PPGTT_PTE_DM to the PTE flags as part of vm_bind.
    
    v2:
    - Use a cursor to iterate over the entries in the dma_addr array
      instead of relying on SG iterator (Matt)
    
    Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
+ /mt/dim checkpatch f6a9ad8c848019c9c85d4adff59359427f794f8a drm-intel
bd31abae4502 PCI/P2PDMA: Don't enforce ACS check for functions of same device
b4556b1dbfc9 drm/xe/dmabuf: Don't migrate BO to System RAM while running in VF mode
ba8212b14cd8 drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
d9b92a507fd8 drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with VFs
-:88: CHECK:LINE_SPACING: Please don't use multiple blank lines
#88: FILE: drivers/gpu/drm/xe/xe_bo.c:571:
+
+

-:109: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#109: FILE: drivers/gpu/drm/xe/xe_bo.c:592:
+		bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
+						DRM_INTERCONNECT_DRIVER,

-:211: WARNING:BRACES: braces {} are not necessary for single statement blocks
#211: FILE: drivers/gpu/drm/xe/xe_bo.c:1183:
+		if (bo->is_devmem_external) {
+			kfree(bo->dma_addr);
+		}

total: 0 errors, 1 warnings, 2 checks, 192 lines checked
4346ea59037d drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs
-:41: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#41: FILE: drivers/gpu/drm/xe/xe_pt.c:683:
+			xe_res_first_dma(bo->dma_addr, xe_vma_bo_offset(vma),
+					xe_vma_size(vma), &curs);

total: 0 errors, 0 warnings, 1 checks, 22 lines checked


