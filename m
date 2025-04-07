Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDE4C3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06FF10E3ED;
	Mon,  7 Apr 2025 09:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTnAtb8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDFC10E3ED
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019574; x=1775555574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OMM8f9+jAAlo2hKUrUeIkDyK2iYTXBwwn9jLRlMGxTU=;
 b=jTnAtb8R+xtvP3I3kfjkLqd6+WS0kBqvgoGMJ6PGUlqmhFMrVn0FHAh6
 BuVPguiysWBp+j8aNuzShFCkrxelP2GFMYMXmD3y4uvQsTzDy+09iZ+oG
 qEv1Q9iC12RRBDEwHQ7TSL4wLBorzT+d4fD5DUqB9s/Lhq8Xuhg+u8z1y
 ua8Y0QSa4CgoO2TOdtmHMr209OyA3TCzMgyHFdR7FRc/HW2bWx+nX3XoB
 SKvbQTbd3ZaSht+t9v9ovmoXcg38te89Yis0XRVZJnfjUGGgXOb7tCbqd
 ROGZyr/JiGm9lb7zLBHgBatPp/FOTPQ8YuEX6/graOiDZuQTNUi1D9o8C w==;
X-CSE-ConnectionGUID: cQB26xR+St6dahCaLEjlPg==
X-CSE-MsgGUID: yOn7nmdoSomjLTxCSYqh2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029379"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:52:54 -0700
X-CSE-ConnectionGUID: 764iy82PSTiUygU+3EdZ4g==
X-CSE-MsgGUID: gltF2x2aSNWPQS59NLiP9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778591"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:52:52 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 06/32] drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to
 take an increment value
Date: Mon,  7 Apr 2025 15:46:53 +0530
Message-Id: <20250407101719.3350996-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

Prefetch for SVM ranges can have more than one operation to increment,
hence modify the function to accept an increment value as input.

v2:
  - Call xe_vma_ops_incr_pt_update_ops only once for REMAP (Matthew Brost)
  - Add check for 0 ops

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0c69ef6b5ec5..4d215c55a778 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -806,13 +806,16 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 		kfree(vops->pt_update_ops[i].ops);
 }
 
-static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
+static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, u8 inc_val)
 {
 	int i;
 
+	if(!inc_val)
+		return;
+
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
 		if (BIT(i) & tile_mask)
-			++vops->pt_update_ops[i].num_ops;
+			vops->pt_update_ops[i].num_ops += inc_val;
 }
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
@@ -842,7 +845,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 	xe_vm_populate_rebind(op, vma, tile_mask);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
 
 	return 0;
 }
@@ -977,7 +980,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
 
 	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
 
 	return 0;
 }
@@ -1062,7 +1065,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
 
 	xe_vm_populate_range_unbind(op, range);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
+	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
 
 	return 0;
 }
@@ -2493,7 +2496,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			     !op->map.is_cpu_addr_mirror) ||
 			    op->map.invalidate_on_bind)
 				xe_vma_ops_incr_pt_update_ops(vops,
-							      op->tile_mask);
+							      op->tile_mask, 1);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP:
@@ -2502,6 +2505,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				gpuva_to_vma(op->base.remap.unmap->va);
 			bool skip = xe_vma_is_cpu_addr_mirror(old);
 			u64 start = xe_vma_start(old), end = xe_vma_end(old);
+			u8 num_remap_ops = 0;
 
 			if (op->base.remap.prev)
 				start = op->base.remap.prev->va.addr +
@@ -2554,7 +2558,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
 				} else {
-					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+					num_remap_ops++;
 				}
 			}
 
@@ -2583,11 +2587,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
 				} else {
-					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+					num_remap_ops++;
 				}
 			}
 			if (!skip)
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				num_remap_ops++;
+
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, num_remap_ops);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
@@ -2599,7 +2605,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return -EBUSY;
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 			break;
 		case DRM_GPUVA_OP_PREFETCH:
 			vma = gpuva_to_vma(op->base.prefetch.va);
@@ -2611,7 +2617,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			}
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
-- 
2.34.1

