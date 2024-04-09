Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622A9CD1299
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 20:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B5A10E96D;
	Tue,  9 Apr 2024 20:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeG9ZXY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAADB112F1D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712693095; x=1744229095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3VPZCVmTd1d2S4XEJY+ZAKWPcXVYUxr0yBo8esKXfp0=;
 b=DeG9ZXY+cIXoaW7nWKkXHoqZQd6cRIb4q1pcS/fuJJ5CMZHrjtOir3+1
 RoP/SxyoZ/Hj3GbyFkUAn7pi4wc43CPzlzW6X8aK/PtRIeYoyelB7j8Wt
 r6P1z8LwoR7mhaBqhUXqkCC7V2uyBS7BdP6k8tYr+UCphCOchIJOLR/lM
 kL+rxNkG14RYugRCjusX4aiexiwOUT2AFCI1GycYP9dI/NJhEFzdrl8ST
 9C+LGRC/5q5TvP+5TOR2om+dbleQruSz2z/J1hx5SzBBBjgK7aZ03Cp4T
 yI2W7LhIWkgjw9Az0RodpGDqtLiGQOnrE05ixIJ3IseNx3AydnZn9hj8T w==;
X-CSE-ConnectionGUID: Kh9weLlORF6Mahb7+sGQbg==
X-CSE-MsgGUID: KMAxdafiT2ucx30HKuJ1Yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11803754"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11803754"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:53 -0700
X-CSE-ConnectionGUID: tzRbeqkISmWZ3dVyhXQw6Q==
X-CSE-MsgGUID: +JwfRHb3RLWyLG4Sa2g2pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20773725"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 13:04:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
 matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com
Subject: [v2 05/31] drm/xe: Fix op->tile_mask for fault mode
Date: Tue,  9 Apr 2024 16:17:16 -0400
Message-Id: <20240409201742.3042626-6-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240409201742.3042626-1-oak.zeng@intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

op->tile_mask might be a subset of all tiles if in fault mode. Fix
unmaps by setting op->tile_mask the unmapped VMA's tile_present field.

FIXME: This should be squashed into an eariler patch

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c0c6bb163a9e..7ce7dbeb6f0a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2190,6 +2190,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			struct xe_vma *old =
 				gpuva_to_vma(op->base.remap.unmap->va);
 
+			op->tile_mask = old->tile_present;
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
 
@@ -2273,6 +2274,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
+		{
+			struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+			op->tile_mask = vma->tile_present;
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			break;
+		}
 		case DRM_GPUVA_OP_PREFETCH:
 			/* FIXME: Need to skip some prefetch ops */
 			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
-- 
2.26.3

