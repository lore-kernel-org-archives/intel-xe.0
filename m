Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6B0C369A0
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAF510E99B;
	Thu,  3 Apr 2025 10:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kp0rkp19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFBA10E99B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675897; x=1775211897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y66IvRzHqCI0HklHrvrGbpaFWZopmppX+5axgUEVx/4=;
 b=kp0rkp19L098DwznFC2C9Mtyphx5Gn3bJodUAM4yeiAI+z9r0V4QG43u
 HCrqoPeHV5Q+faZKeJbS1J+2/D7Fr8A/9Sx4lpG3XblcyT0i/kRnV+FFJ
 gUMPLAmNOsaq1esuBOjWFcr8xrcOwgcJ3diXMhKPW2qDQJIYVAeUgtFpr
 1ExiEr9rQO4WGjHwh8tSNyCHOwFIZ2yQmZKJP6mIV9WJEpuo3U4u59KQP
 sFc9batAak5H/tMLvygwYND6wG+meZBpxokApfoPyd+ZsoSEcKLyuVoLC
 oU/hf26bT6I5ybiW/T8SjNqMM+XNpUkdYFhtVgRe+3hgqxtxq6GkmwO+d w==;
X-CSE-ConnectionGUID: YxdVM4c0SKCsZxgY1H0k0w==
X-CSE-MsgGUID: DlsAYS9bT7m25tEnI44C2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62475422"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="62475422"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:24:57 -0700
X-CSE-ConnectionGUID: POav3ed7TQmSxf6fAFkMlw==
X-CSE-MsgGUID: g+guheweSW+NSX8Bq+kV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="132166762"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:24:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 3/7] drm/xe/migrate: ignore CCS for kernel objects
Date: Thu,  3 Apr 2025 11:24:44 +0100
Message-ID: <20250403102440.266113-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403102440.266113-9-matthew.auld@intel.com>
References: <20250403102440.266113-9-matthew.auld@intel.com>
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

v2:
 - Drop bogus asserts (CI)

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c1277d599a11..96b244aaf2d6 100644
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
@@ -839,6 +841,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 					      avail_pts, avail_pts);
 
 		if (copy_system_ccs) {
+			xe_assert(xe, type_device);
 			ccs_size = xe_device_ccs_bytes(xe, src_L0);
 			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
 						      &ccs_ofs, &ccs_pt, 0,
@@ -849,7 +852,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_migrate_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
+			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
@@ -878,7 +881,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		if (!copy_only_ccs)
 			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
 
-		if (xe_migrate_needs_ccs_emit(xe))
+		if (needs_ccs_emit)
 			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
 							  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
 							  dst_L0_ofs,
-- 
2.49.0

