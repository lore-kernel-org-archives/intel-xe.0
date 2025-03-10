Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB63C28B2E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0031510E416;
	Mon, 10 Mar 2025 12:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4g5jGCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2557510E41F
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 12:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609186; x=1773145186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Oku4YbBrlpfaBrdCJA1qiTv+ZkRi68aKunahJBK4ys=;
 b=K4g5jGCTpUgLJkX6wg/lVoXwx2ASWzpopfIuC4kSSt8mkimFbf/lus6f
 zM1P40C1gNDG8AmjHq/r2ay3K2AjDX9nfgqFBXRqP7G8t7Rt9OWSg2RDn
 CvsYkxceS4GmELhkJ7Wp/9dtIcucZFY5BUmVbfEC2o+89z3iZKnuW/Usx
 nc3oT7E7MUWsfQQESNizkRCdFRxXqKirQsZSAqbNjaDT8CfPQSPdKgtJO
 a9xHVeE6v6p4ZTy1oczNSCne/l45ftfXBiCUCP1/VanCSja65xTZZX6nI
 R/XWUu/L8Rs4CHC5HBoGf7bTj6l9vuKrKaBZFxdSBFDUIrJtSjynwbdJg w==;
X-CSE-ConnectionGUID: ZEAbIIgNRVWH6UaeMCpSpQ==
X-CSE-MsgGUID: 7osge7n/Sg+ywYzocDkQDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="65056425"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65056425"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:19:46 -0700
X-CSE-ConnectionGUID: /+bbEosKRZyENNPU1F75dQ==
X-CSE-MsgGUID: 2AEWVbivRE+PQ/r58MUkUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="143179089"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2025 05:19:44 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 06/12] drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to take
 an increment value
Date: Mon, 10 Mar 2025 18:13:35 +0530
Message-Id: <20250310124341.1819568-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
References: <20250310124341.1819568-1-himal.prasad.ghimiray@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 22a26aff3a6e..8c74b5f467ea 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -806,13 +806,13 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 		kfree(vops->pt_update_ops[i].ops);
 }
 
-static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
+static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, u8 inc_val)
 {
 	int i;
 
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
 		if (BIT(i) & tile_mask)
-			++vops->pt_update_ops[i].num_ops;
+			vops->pt_update_ops[i].num_ops += inc_val;
 }
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
@@ -842,7 +842,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 	xe_vm_populate_rebind(op, vma, tile_mask);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
 
 	return 0;
 }
@@ -977,7 +977,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
 
 	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
+	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
 
 	return 0;
 }
@@ -1062,7 +1062,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
 
 	xe_vm_populate_range_unbind(op, range);
 	list_add_tail(&op->link, &vops->list);
-	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
+	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
 
 	return 0;
 }
@@ -2478,7 +2478,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
 			    !op->map.is_cpu_addr_mirror)
 				xe_vma_ops_incr_pt_update_ops(vops,
-							      op->tile_mask);
+							      op->tile_mask, 1);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP:
@@ -2539,7 +2539,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
 				} else {
-					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 				}
 			}
 
@@ -2568,11 +2568,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
 				} else {
-					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 				}
 			}
 			if (!skip)
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
@@ -2584,7 +2584,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return -EBUSY;
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 			break;
 		case DRM_GPUVA_OP_PREFETCH:
 			vma = gpuva_to_vma(op->base.prefetch.va);
@@ -2596,7 +2596,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			}
 
 			if (!xe_vma_is_cpu_addr_mirror(vma))
-				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
-- 
2.34.1

