Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39902C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 11:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C361610E0D3;
	Tue,  2 Jan 2024 11:04:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9610210E0D3
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704193466; x=1735729466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8zaOgQquXm9askfaP4BWRPF5p//yHz69kL4J59iIuAU=;
 b=Whk2eWnBHKeOEp0TiJAFpXxMzXIsGmJlDJdUZTUOERnBnvFXsobuTiZ1
 0o2fO9MViGPIDpeL6yCJ3R87QLHB80xFuaN8haHDSc8UjEOGAR7N2gH9e
 C0kkd8Iz7AOTbLt+pDKneUaZ8OeknvRLKwzifQl3OKHKdKKQCen3cXo3J
 hH5gHwldPwGVgBasxomXHkAszv8ENkvEdDKmGE4DBNIwAFKPBvXLgThkV
 DKndV7D6YiUi2aACtMk/pKaaoYAXbGsi5Sb75CEB+7mDFPHZ4L83FM+2u
 q1TLztVhHdVrt7rkRoRi+xfmeiV1px8wP4/WEOWWVEQ6ywK4gy5IYoXGf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="377024460"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="377024460"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 03:04:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="28039162"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 02 Jan 2024 03:04:24 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe/xe2: Use XE_CACHE_WB pat index
Date: Tue,  2 Jan 2024 16:45:40 +0530
Message-Id: <20240102111540.833612-1-himal.prasad.ghimiray@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use XE_CACHE_WB pat index by default on xe2 platforms and use
XE_CACHE_NONE_COMPRESSION pat index only if buffer supports
compression and indirect access of flat ccs.

Fixes the broken "xe_migrate_test kunit test" on LNL.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index adf1dab5eba2..cb66636bfa6f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -439,7 +439,7 @@ static void emit_pte(struct xe_migrate *m,
 	/* Indirect access needs compression enabled uncached PAT index */
 	if (GRAPHICS_VERx100(xe) >= 2000)
 		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
-					  xe->pat.idx[XE_CACHE_NONE];
+					  xe->pat.idx[XE_CACHE_WB];
 	else
 		pat_index = xe->pat.idx[XE_CACHE_WB];
 
@@ -729,14 +729,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		}
 
 		if (!src_is_vram)
-			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
-				 src_bo);
+			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs ? true : false,
+				 &src_it, src_L0, src_bo);
 		else
 			xe_res_next(&src_it, src_L0);
 
 		if (!dst_is_vram)
-			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
-				 dst_bo);
+			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs ? true : false,
+				 &dst_it, src_L0, dst_bo);
 		else
 			xe_res_next(&dst_it, src_L0);
 
@@ -978,8 +978,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		size -= clear_L0;
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
-			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
-				 bo);
+			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs ? true : false,
+				 &src_it, clear_L0, bo);
 		} else {
 			xe_res_next(&src_it, clear_L0);
 		}
-- 
2.25.1

