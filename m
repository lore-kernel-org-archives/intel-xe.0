Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD6ECDB475
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29A10E4D4;
	Mon, 22 Jun 2026 06:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTc1ZcBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBCB10E4D4
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111588; x=1813647588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F4VoEO2gDjCG1cxBu+qKmhl5hJCpUcuNMH3vDj7z1wg=;
 b=OTc1ZcBmlOf4B50C6Qt01DNmKLgAS1VT8Yh5ESZkqK4vxEBTAuH/RK86
 lzX5K3ZaB307znlzec8UpY0NN6/dbdW5Ud2TFS57Jdml02OmbnoLk/4us
 FjMiWTaKXLSKaq7bvgG5vs0xVIudHUJhk+q33++7tLCDdkANRoKwKYeYU
 vju/oFDKq9WoStg159mlAID5xGi41jrlZA28iGNbjnjEonD1pqgrfYPIJ
 FV9eIUHcD8i/u8MwJvZzi6sKoUtfWXl5lmrWOgnXm5ANu31cYfZJFlROL
 KONHCCJNUoLK3Snum0RbA3EtMhwbIfQJS3kzSIH6AUILEzz4PywjVJxgz A==;
X-CSE-ConnectionGUID: +3OamYNtSFaGma+ZQ9goIQ==
X-CSE-MsgGUID: f0P6EReYROCj5OHxNyNgtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928756"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928756"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:48 -0700
X-CSE-ConnectionGUID: ALTbqcl3Tae/u5KNDmAJJg==
X-CSE-MsgGUID: NZtEukneR6+O0Pq9LGOjbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068156"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:42 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 7/9] drm/xe/vm: validate large-page user BO bind alignment
Date: Mon, 22 Jun 2026 12:30:29 +0530
Message-ID: <20260622070031.2445502-8-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

Extend VM bind validation to cover BOs that request 2M or 1G page-size
mapping.

When a BO carries XE_BO_FLAG_NEEDS_2M or XE_BO_FLAG_NEEDS_1G, require
the BO object offset, VM address, and bind range to be aligned to the
corresponding page size. Reject unaligned binds with -EINVAL.

Also allow the 64K, 2M, and 1G PTE flags in the supported VMA flag mask
so these page-size selections can propagate through the VM bind path.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 50ca29a79533..535e3f8a4afc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -721,7 +721,10 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask,
 	XE_VMA_DUMPABLE |		    \
 	XE_VMA_SYSTEM_ALLOCATOR |           \
 	DRM_GPUVA_SPARSE |		    \
-	XE_VMA_MADV_AUTORESET)
+	XE_VMA_MADV_AUTORESET |		    \
+	XE_VMA_PTE_64K |		    \
+	XE_VMA_PTE_2M  |		    \
+	XE_VMA_PTE_1G)
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
@@ -3835,6 +3838,22 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		}
 	}
 
+	if (bo->flags & XE_BO_FLAG_NEEDS_2M) {
+		if (XE_IOCTL_DBG(xe, obj_offset & (SZ_2M - 1)) ||
+		    XE_IOCTL_DBG(xe, addr & (SZ_2M - 1)) ||
+		    XE_IOCTL_DBG(xe, range & (SZ_2M - 1))) {
+			return -EINVAL;
+		}
+	}
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_1G) {
+		if (XE_IOCTL_DBG(xe, obj_offset & (SZ_1G - 1)) ||
+		    XE_IOCTL_DBG(xe, addr & (SZ_1G - 1)) ||
+		    XE_IOCTL_DBG(xe, range & (SZ_1G - 1))) {
+			return -EINVAL;
+		}
+	}
+
 	coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
 	if (bo->cpu_caching) {
 		if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
-- 
2.43.0

