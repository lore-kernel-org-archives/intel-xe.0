Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A443CAC58E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 07:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B752310E2BE;
	Mon, 15 Sep 2025 07:32:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB7710E2BE;
 Mon, 15 Sep 2025 07:32:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sriov=3A_Don=27t_m?=
 =?utf-8?q?igrate_dmabuf_BO_to_System_RAM_if_P2P_check_succeeds?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Sep 2025 07:32:30 -0000
Message-ID: <175792155043.333077.3503644538364341818@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
In-Reply-To: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
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

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM if P2P check succeeds
URL   : https://patchwork.freedesktop.org/series/154504/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4c414ec01c1b2f14058d337599aca3a1c1cc4f42
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Mon Sep 15 00:21:09 2025 -0700

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
+ /mt/dim checkpatch 36a8f6b405f4a0def4462366cd17992897e1362b drm-intel
11860c6601a3 PCI/P2PDMA: Don't enforce ACS check for device functions of Intel GPUs
d9df4f3dba24 drm/xe/dmabuf: Don't migrate BO to System RAM if P2P check succeeds
744393c72b10 drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
e23f55318bba drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with VFs
-:90: CHECK:LINE_SPACING: Please don't use multiple blank lines
#90: FILE: drivers/gpu/drm/xe/xe_bo.c:706:
+
+

-:111: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#111: FILE: drivers/gpu/drm/xe/xe_bo.c:727:
+		bo->dma_data.dma_addr[i] = drm_pagemap_addr_encode(addr,
+						DRM_INTERCONNECT_DRIVER,

total: 0 errors, 0 warnings, 2 checks, 195 lines checked
4c414ec01c1b drm/xe/pt: Add an additional check for dmabuf BOs while doing bind


