Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E11BC4706C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 11:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C881B10E584;
	Tue, 16 Jan 2024 11:53:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7010E4CF
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705406022; x=1736942022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TgfoTsU9xk6jEHh3X0vaq+XParXaN4Y4uXkyANOuid8=;
 b=P76Fct3YiCL9L8C3NuCcJoGiKMK1RNTEkDeOa1ctQrYY5+Wp3C0T9d47
 LlfHtj1tiiuXXPHjPDEu/ZdGEBy44+I6WF3HdgKfr1eJG00E39+3nuTc1
 g+xrBB0cr1GugQV+0JN3D/s0ymP48azjgJj540b3MZ8XICxVmEGQ5Tg6W
 972TRVhZ7H5RyTxWkVRbouBBtp5wvUlEtJ5y10pB0kHJt/buwhtSx9C2R
 qXDnwqpzE3D7SNjODkP3hPwlRSAq9F85/nFdCHZVA53v9v+kDlJLOXYaL
 6Bmoi27h8GrQbHZEtsyE4W3ak6a33YzRg83rc8syc9oSQmZPp5mwANQAB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="485993103"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="485993103"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 03:53:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="18445879"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa002.fm.intel.com with ESMTP; 16 Jan 2024 03:53:38 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe/xe2: Use XE_CACHE_WB pat index
Date: Tue, 16 Jan 2024 17:35:12 +0530
Message-Id: <20240116120512.1542167-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The pat table entry associated with XE_CACHE_WB is coherent whereas
XE_CACHE_NONE is non coherent. Use the coherent entry XE_CACHE_WB for
buffers not supporting compression. For read/write to flat ccs region
the issue is not related to coherency with cpu. The hardware expects
the pat index associated with GPUVA for indirect access to be
compression enabled hence use XE_CACHE_NONE_COMPRESSION.

Fixes the broken "xe_migrate_test kunit test" on LNL.

v2
- Fix the argument to emit_pte, pass the bool directly. (Thomas)

v3
- Rebase
- Update commit message (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 44725f978f3e..5de8ee4245c3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -481,7 +481,7 @@ static void emit_pte(struct xe_migrate *m,
 	/* Indirect access needs compression enabled uncached PAT index */
 	if (GRAPHICS_VERx100(xe) >= 2000)
 		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
-					  xe->pat.idx[XE_CACHE_NONE];
+					  xe->pat.idx[XE_CACHE_WB];
 	else
 		pat_index = xe->pat.idx[XE_CACHE_WB];
 
@@ -769,14 +769,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
 			xe_res_next(&src_it, src_L0);
 		else
-			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
-				 src);
+			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs,
+				 &src_it, src_L0, src);
 
 		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
 			xe_res_next(&dst_it, src_L0);
 		else
-			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
-				 dst);
+			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
+				 &dst_it, src_L0, dst);
 
 		if (copy_system_ccs)
 			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
@@ -1018,8 +1018,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
 			xe_res_next(&src_it, clear_L0);
 		else
-			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
-				 dst);
+			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
+				 &src_it, clear_L0, dst);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
-- 
2.25.1

