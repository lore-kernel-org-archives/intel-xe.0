Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36771C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 09:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16B310E8E5;
	Fri,  2 May 2025 09:35:31 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1B610E8E5
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 09:35:24 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 2/4] drm/xe: Silence migrate debug message.
Date: Fri,  2 May 2025 11:35:11 +0200
Message-ID: <20250502093514.510621-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502093514.510621-1-dev@lankhorst.se>
References: <20250502093514.510621-1-dev@lankhorst.se>
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

It doesn't explain much, and is a debugging leftover.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a81..673a5d165482e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -773,7 +773,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	u64 src_L0_ofs, dst_L0_ofs;
 	u32 src_L0_pt, dst_L0_pt;
 	u64 src_L0, dst_L0;
-	int pass = 0;
 	int err;
 	bool src_is_pltt = src->mem_type == XE_PL_TT;
 	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
@@ -824,9 +823,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		src_L0 = xe_migrate_res_sizes(m, &src_it);
 		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
 
-		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
-			pass++, src_L0, dst_L0);
-
 		src_L0 = min(src_L0, dst_L0);
 
 		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
-- 
2.45.2

