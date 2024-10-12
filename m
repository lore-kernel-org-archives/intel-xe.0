Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA6CD2446A
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 03:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A2310E03B;
	Sat, 12 Oct 2024 03:16:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8087E10E03B;
 Sat, 12 Oct 2024 03:16:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sriov=3A_Don=27t_m?=
 =?utf-8?q?igrate_dmabuf_BO_to_System_RAM_while_running_in_VM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivek Kasireddy" <vivek.kasireddy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 12 Oct 2024 03:16:18 -0000
Message-ID: <172870297852.1243041.1625785733694086428@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
In-Reply-To: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
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

Series: drm/xe/sriov: Don't migrate dmabuf BO to System RAM while running in VM
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
commit 384317b76f70225d6fa7229b2ee6fda9a51f8e2d
Author: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date:   Fri Oct 11 19:40:27 2024 -0700

    drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs
    
    If a BO's is_devmem_external flag is set, it means that it is an
    imported dmabuf BO that has a backing store in VRAM. Therefore, we
    need to add XE_PPGTT_PTE_DM to the PTE flags as part of vm_bind.
    
    Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
+ /mt/dim checkpatch 8dcf653f89accb0339e9dbbd84227a4527b2441d drm-intel
ef19cb2d8e8e PCI/P2PDMA: Don't enforce ACS check for functions of same device
-:69: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'd' - possible side-effects?
#69: FILE: include/linux/pci.h:1186:
+#define dev_is_vf(d) ((dev_is_pci(d) ? to_pci_dev(d)->is_virtfn : false))

total: 0 errors, 0 warnings, 1 checks, 37 lines checked
538dff1c9659 drm/xe/dmabuf: Don't migrate BO to System RAM while running in VF mode
e3417069d8d0 drm/xe/pf: Add a helper function to get a VF's starting address in LMEM
c2e3ec55ce0b drm/xe/bo: Create a new sg for dmabuf BOs that are associated with a VF
-:77: CHECK:LINE_SPACING: Please don't use multiple blank lines
#77: FILE: drivers/gpu/drm/xe/xe_bo.c:570:
+
+

total: 0 errors, 0 warnings, 1 checks, 166 lines checked
384317b76f70 drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs


