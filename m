Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2175C369BA
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 18:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D5E10E299;
	Wed, 16 Apr 2025 18:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Po5peDdL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAEA10E299
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 18:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744828957; x=1776364957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8sE/vJMrlmO3/lYy/QsWlnYwXqh5S2HJsom+pDTpZN0=;
 b=Po5peDdLFapsQaoNqnQEL64gy+hAGdsMUa8wcoUF9L6vB/bfuO9g/IJX
 C/vTjrioOriKZ/NB9MIHgce+Rr15QV87FoCN3hu/kmJaLSCiiGG8cHEbx
 7eUVeGwTwrrr7JekZqcV1xPfA/BeHT3Eyzc6ybkOk63dT+UrEw+MFKFS/
 tRtMay8NJJxBar6kF0U0BT9UgphvvGnnNcl93kuCw5+dylRrRe6W991Ng
 s3/pGKui8jB+JDZzwsgCm8wb0tCGGTB3WTlYiFQ4kln/VkF9iP24+Rrb/
 J9jcycTDMOBIZZYjRramgH0Tv2TShKH9U/PRUf9KbyaF0L8B137J7Fzrt A==;
X-CSE-ConnectionGUID: te0VRROESbGv1PzV4gfa1Q==
X-CSE-MsgGUID: 74odkxX7TNa6AXrkPe7j8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="56572809"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="56572809"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:42:37 -0700
X-CSE-ConnectionGUID: PfwbBnutTU+G0jP1JVRX9A==
X-CSE-MsgGUID: rslGq4PHQnS0t+mb9Vq7oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135549038"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:42:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Take PM ref SVM copy to SRAM
Date: Wed, 16 Apr 2025 11:43:54 -0700
Message-Id: <20250416184354.419272-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It is possible, however unlikely, for the CPU to access memory which is
in the GPU triggering a fault without a PM reference. Ensure a PM ref is
held when doing a SVM copy to SRAM.

Fixes the below splat found in local testing:
[ 1269.500163] ------------[ cut here ]------------
[ 1269.500167] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
[ 1269.500184] WARNING: CPU: 8 PID: 38648 at drivers/gpu/drm/xe/xe_pm.c:664 xe_pm_runtime_get_noresume+0x86/0xb0 [xe]
[ 1269.500226] Modules linked in: xe drm_gpusvm drm_gpuvm drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy drm_kms_helper snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scodec_component snd_hda_intel snd_intel_dspcfg snd_hda_codec x86_pkg_temp_thermal snd_hwdep coretemp snd_hda_core i2c_i801 i2c_mux snd_pcm wmi_bmof i2c_smbus mei_pxp mei_hdcp video wmi mei_me mei fuse igb e1000e i2c_algo_bit ptp ghash_clmulni_intel pps_core intel_lpss_pci
[ 1269.500257] CPU: 8 UID: 0 PID: 38648 Comm: xe_exec_system_ Tainted: G        W           6.15.0-rc2-xe+ #158 PREEMPT(undef)
[ 1269.500260] Tainted: [W]=WARN
[ 1269.500261] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.3492.A00.2211291114 11/29/2022
[ 1269.500262] RIP: 0010:xe_pm_runtime_get_noresume+0x86/0xb0 [xe]
[ 1269.500293] Code: ee 31 c0 48 85 db 48 0f 44 f8 4c 8b 67 50 4d 85 e4 74 2e e8 6c 0b 9a e1 4c 89 e2 48 c7 c7 80 d5 4e a0 48 89 c6 e8 aa 51 11 e1 <0f> 0b eb c1 48 8b 47 08 f0 ff 80 f8 02 00 00 5b 41 5c c3 cc cc cc
[ 1269.500294] RSP: 0000:ffffc9000ed439c0 EFLAGS: 00010282
[ 1269.500297] RAX: 0000000000000000 RBX: ffff888113568000 RCX: 0000000000000000
[ 1269.500298] RDX: 0000000000000002 RSI: 0000000000000001 RDI: 00000000ffffffff
[ 1269.500299] RBP: ffff888111bdf600 R08: ffff88888d5fffe8 R09: 00000000fffdffff
[ 1269.500300] R10: ffff88888c800000 R11: ffff88888d300000 R12: ffff888103b3dd10
[ 1269.500301] R13: ffffc9000ed43a70 R14: ffff88813e5a52c0 R15: ffff88813e5a52c0
[ 1269.500302] FS:  00007f1e596a3940(0000) GS:ffff88890ac15000(0000) knlGS:0000000000000000
[ 1269.500304] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1269.500305] CR2: 0000563cf48c3ee8 CR3: 000000031055e001 CR4: 0000000000f70ef0
[ 1269.500306] PKRU: 55555554
[ 1269.500307] Call Trace:
[ 1269.500308]  <TASK>
[ 1269.500310]  xe_sched_job_create+0x159/0x330 [xe]
[ 1269.500342]  xe_bb_create_migration_job+0x7c/0x510 [xe]
[ 1269.500359]  ? rcu_is_watching+0x11/0x50
[ 1269.500363]  ? __kmalloc_cache_noprof+0x255/0x330
[ 1269.500366]  ? xelp_pte_encode_addr+0x34/0x1d0 [xe]
[ 1269.500394]  xe_migrate_vram+0x2c5/0x620 [xe]
[ 1269.500558]  ? __iommu_dma_map+0x99/0x170
[ 1269.500569]  xe_svm_copy+0x486/0x620 [xe]
[ 1269.500613]  drm_gpusvm_migrate_to_ram+0x290/0x330 [drm_gpusvm]
[ 1269.500624]  do_swap_page+0xff7/0x2440
[ 1269.500633]  ? __pfx_default_wake_function+0x10/0x10
[ 1269.500640]  ? rcu_is_watching+0x11/0x50
[ 1269.500646]  __handle_mm_fault+0x617/0x950
[ 1269.500658]  handle_mm_fault+0xbf/0x250
[ 1269.500664]  do_user_addr_fault+0x177/0x6a0
[ 1269.500672]  exc_page_fault+0x63/0x1c0
[ 1269.500678]  asm_exc_page_fault+0x26/0x30
[ 1269.500681] RIP: 0033:0x7f1e5b8b1b0f
[ 1269.500684] Code: 15 00 49 8d 0c 1a 49 39 d4 49 89 4c 24 60 0f 95 c2 48 29 d8 0f b6 d2 48 83 c8 01 48 c1 e2 02 48 09 da 48 83 ca 01 49 89 52 08 <48> 89 41 08 49 8d 4a 10 eb af 48 8d 0d 78 ea 12 00 ba 64 10 00 00
[ 1269.500687] RSP: 002b:00007fff7ccb74c0 EFLAGS: 00010206
[ 1269.500690] RAX: 0000000000521121 RBX: 0000000000001010 RCX: 0000563cf48c3ee0
[ 1269.500692] RDX: 0000000000001011 RSI: ffffffffffffff20 RDI: 0000000000000000
[ 1269.500695] RBP: 00007fff7ccb7540 R08: 0000000000000000 R09: 0000000000000001
[ 1269.500697] R10: 0000563cf48c2ed0 R11: 0000000000000206 R12: 00007f1e5ba11ac0
[ 1269.500699] R13: 0000000000001000 R14: 0000000000000000 R15: 00007f1e5ba11b20
[ 1269.500708]  </TASK>
[ 1269.500710] irq event stamp: 176580299
[ 1269.500712] hardirqs last  enabled at (176580305): [<ffffffff813447f6>] __up_console_sem+0x66/0x70
[ 1269.500716] hardirqs last disabled at (176580310): [<ffffffff813447db>] __up_console_sem+0x4b/0x70
[ 1269.500719] softirqs last  enabled at (176580168): [<ffffffff812a637e>] __irq_exit_rcu+0xbe/0x110
[ 1269.500723] softirqs last disabled at (176579351): [<ffffffff812a637e>] __irq_exit_rcu+0xbe/0x110
[ 1269.500726] ---[ end trace 0000000000000000 ]---

Fixes: c5b3eb5a906c ("drm/xe: Add GPUSVM device memory copy vfunc functions")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 92aebb6b0902..44960d47874e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -8,6 +8,7 @@
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_module.h"
+#include "xe_pm.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_ttm_vram_mgr.h"
@@ -378,7 +379,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		       unsigned long npages, const enum xe_svm_copy_dir dir)
 {
 	struct xe_vram_region *vr = NULL;
-	struct xe_tile *tile;
+	struct xe_tile *tile = NULL;
 	struct dma_fence *fence = NULL;
 	unsigned long i;
 #define XE_VRAM_ADDR_INVALID	~0x0ull
@@ -412,6 +413,8 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
 			tile = vr_to_tile(vr);
+			if (dir == XE_SVM_COPY_TO_SRAM)
+				xe_pm_runtime_get(tile->xe);
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -510,6 +513,8 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 		dma_fence_wait(fence, false);
 		dma_fence_put(fence);
 	}
+	if (tile && dir == XE_SVM_COPY_TO_SRAM)
+		xe_pm_runtime_put(tile->xe);
 
 	return err;
 #undef XE_MIGRATE_CHUNK_SIZE
-- 
2.34.1

