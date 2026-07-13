Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF81CC43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 00:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A25B10E512;
	Mon, 13 Jul 2026 00:46:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C2B10E511;
 Mon, 13 Jul 2026 00:46:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=5Fads=3A_alloc?=
 =?utf-8?q?ate_UM_queues_in_a_separate_UC_BO_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jul 2026 00:46:04 -0000
Message-ID: <178390356409.180334.3826071139925080371@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713004048.1245794-1-jia.yao@intel.com>
In-Reply-To: <20260713004048.1245794-1-jia.yao@intel.com>
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

Series: drm/xe/guc_ads: allocate UM queues in a separate UC BO (rev2)
URL   : https://patchwork.freedesktop.org/series/169535/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 79f4841661626576aa32e5f390fef69e96e519b6
Author: Jia Yao <jia.yao@intel.com>
Date:   Mon Jul 13 00:40:48 2026 +0000

    drm/xe/guc_ads: allocate UM queues in a separate UC BO
    
    On integrated graphics, the GPU updates the HWQ tail pointer
    (non-posted, strongly ordered) before the fault descriptor data reaches
    DRAM (posted WB through L3, weakly ordered).  GuC reads the ring after
    seeing the tail update but before the L3 write is flushed, resulting in
    an all-zero descriptor being forwarded to the driver as a spurious page
    fault.  In the worst case this triggers a P2I timeout on an unrelated
    context.
    
    On discrete graphics, xe_bo_main_addr() returns a CPU DMA IOVA for
    SYSTEM BOs.  On platforms with limited DRAM (e.g. BMG with 4 GB) the
    IOVA can alias a PCI MMIO reserved window, so GPU writes to the fault
    ring go nowhere and GuC reads all-zeros.
    
    Additionally, xe_guc_ads_populate() zeroes the entire ADS blob on every
    GT reset, destroying any fault descriptor written between GDRST and GuC
    restart.
    
    Fix all three by allocating the UM queues in a separate BO
    (ads->um_queue_bo):
    
    - UC mapping (XE_BO_FLAG_NEEDS_UC) makes GPU writes bypass L3 and land
      in DRAM before the tail-pointer update reaches GuC.  On dGFX, PCIe
      writes are already strongly ordered, so UC is a harmless no-op.
    
    - VRAM placement on dGFX (XE_BO_FLAG_VRAM_IF_DGFX) gives a well-defined
      DPA, sidestepping the IOVA aliasing issue.
    
    - A separate BO is never touched by xe_guc_ads_populate()'s memset.
    
    v2: also fix dGFX (VRAM placement + UC flag); remove now-dead
        guc_ads_um_queues_size/offset helpers
    
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Jia Yao <jia.yao@intel.com>
+ /mt/dim checkpatch 67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf drm-intel
79f484166162 drm/xe/guc_ads: allocate UM queues in a separate UC BO
-:108: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#108: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:460:
+		bo = xe_managed_bo_create_pin_map(xe, tile,
+					  GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX,

total: 0 errors, 0 warnings, 1 checks, 124 lines checked


