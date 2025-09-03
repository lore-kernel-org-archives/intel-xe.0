Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA31CA1010
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 23:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D310B10E216;
	Wed,  3 Sep 2025 23:18:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9CD10E216;
 Wed,  3 Sep 2025 23:18:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sriov=3A_Don=27t_m?=
 =?utf-8?q?igrate_dmabuf_BO_to_System_RAM_while_running_in_VM_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Sep 2025 23:18:33 -0000
Message-ID: <175694151345.300637.17964199792199643680@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
In-Reply-To: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
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

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM while running in VM (rev3)
URL   : https://patchwork.freedesktop.org/series/139920/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fcb84ef66abffd76d5a03553078583a747d7861f
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Wed Sep 3 15:30:58 2025 -0700

    drm/xe/pt: Add an additional check for dmabuf BOs while doing bind
    
    If a BO's is_devmem_external flag is set, it means that it is an
    imported dmabuf BO that has a backing store in VRAM. Therefore, in
    this case, need to iterate over its dma_addr array.
    
    v2:
    - Use a cursor to iterate over the entries in the dma_addr array
      instead of relying on SG iterator (Matt)
    
    v3:
    - Since XE_PPGTT_PTE_DM is added to the PTE flags in all cases,
      remove the bo->is_devmem_external check added in v2
    
    Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
+ /mt/dim checkpatch 2b95afd5f659a01a6fc8195358e62077846b97e7 drm-intel
a98795efc9f3 PCI/P2PDMA: Don't enforce ACS check for device functions of Intel GPUs
86e6b580ecb6 drm/xe/dmabuf: Don't migrate BO to System RAM while running in VF mode
03e53ad1f121 drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
5d0b0e4e61ec drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with VFs
-:86: CHECK:LINE_SPACING: Please don't use multiple blank lines
#86: FILE: drivers/gpu/drm/xe/xe_bo.c:704:
+
+

-:106: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#106: FILE: drivers/gpu/drm/xe/xe_bo.c:724:
+		bo->dma_addr[i] = drm_pagemap_addr_encode(addr,
+						DRM_INTERCONNECT_DRIVER,

-:184: WARNING:BRACES: braces {} are not necessary for single statement blocks
#184: FILE: drivers/gpu/drm/xe/xe_bo.c:1636:
+		if (bo->is_devmem_external) {
+			kfree(bo->dma_addr);
+		}

total: 0 errors, 1 warnings, 2 checks, 163 lines checked
fcb84ef66abf drm/xe/pt: Add an additional check for dmabuf BOs while doing bind


