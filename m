Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB52C28B28
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F4110EAFC;
	Fri,  7 Mar 2025 18:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNz6hxGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2DB10EC1D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741372165; x=1772908165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FDAzq7gqyL9X1kiG1DvSraN+ryAcSLASsolkb0m8gPM=;
 b=RNz6hxGtuI9fNH+6y5k3P33beFLFTj1K7699IQ93f9av+hNl1gNtwe4i
 umrRG7Og9ojhgzCSgL6jZHKB7SU8lEkulkKfgRVthU6PYMx7F/9Ckoa0v
 26/Sbr1V9od3dT77qkNwFpnME8AOmqKQuREs3K8EGoZPbn8nW6axjwLJM
 eGc+C9Szj4slpi5wUV+HjT8p/xFbIxR5hykdZvnf2t3Ti0YtgK2K+05U8
 9+k3AJzbmRabpYy1uHs/m0YG2w7uRQb3Epp/rwXTw/LPHKTmC5hi9Jc/p
 g6ehztdo7Gv0Yb16XCdU/fCxgxH36KlWmLl0eegd2zoBSslZAyo2tIIXC A==;
X-CSE-ConnectionGUID: 2voFlGiBRLWUnpxU2Zqk6Q==
X-CSE-MsgGUID: /hT3jhk+ShiWYAWtyf5x7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52639835"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52639835"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:25 -0800
X-CSE-ConnectionGUID: mtKEUAyuSYeBLn39mvlOJA==
X-CSE-MsgGUID: /wJ3mAePRBie2PY7znpVmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124625660"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.99])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:25 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 4/8] drm/xe/migrate: ignore CCS for kernel objects
Date: Fri,  7 Mar 2025 18:29:01 +0000
Message-ID: <20250307182856.304850-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For kernel BOs we don't clear the CCS state on creation, therefore we
should be careful to ignore it when copying pages. In a future patch we
opt for using the copy path here for kernel BOs, so this now needs to be
considered.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index df4282c71bf0..dbd4bff75783 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -779,10 +779,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
 	bool src_is_vram = mem_type_is_vram(src->mem_type);
 	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
+	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
+	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
-	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
+	bool use_comp_pat = type_device && xe_device_has_flat_ccs(xe) &&
 		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
@@ -792,6 +794,12 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	if (src_bo != dst_bo && XE_WARN_ON(src_bo->size != dst_bo->size))
 		return ERR_PTR(-EINVAL);
 
+	if (src_bo != dst_bo && XE_WARN_ON(src_bo->ttm.type != dst_bo->ttm.type))
+		return ERR_PTR(-EINVAL);
+
+	if (XE_WARN_ON(type_device && copy_only_ccs))
+		return ERR_PTR(-EINVAL);
+
 	if (!src_is_vram)
 		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
 	else
@@ -839,6 +847,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 					      avail_pts, avail_pts);
 
 		if (copy_system_ccs) {
+			xe_assert(xe, type_device);
 			ccs_size = xe_device_ccs_bytes(xe, src_L0);
 			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
 						      &ccs_ofs, &ccs_pt, 0,
@@ -849,7 +858,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_migrate_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
+			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
@@ -878,7 +887,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		if (!copy_only_ccs)
 			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
 
-		if (xe_migrate_needs_ccs_emit(xe))
+		if (needs_ccs_emit)
 			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
 							  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
 							  dst_L0_ofs,
-- 
2.48.1

