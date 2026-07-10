Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F433C44508
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A5310F879;
	Fri, 10 Jul 2026 11:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="BY1y1gCg";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E311510F880;
 Fri, 10 Jul 2026 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682102;
 bh=OcFshoIkPzH0mgdcTjRttCE28g6NnNuPqpJlWjhaggg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BY1y1gCglvszjfoNU9oiHkvku1L41UJEI0a7A7WW7BAmLWcoUB0lZZFGyj4mMOVLw
 h6tQDJWUOdfVTHeiroXjLPB/tS/lh2+U/nhBcB2nAqFBJA06I0nMEYxL+d+hvQsO0P
 kZp3ep5htOeLBQt5i9e5pdqty/aNc1tmBfzdSrnsHBcusdVgME6Yu6ZqBw32EOMpYu
 VaYEDlIuLkn8uA65gnkTBHu8UQ4m1LR2/N/tulGqh/KWFpd11L+h90sYCPvW0SE4G+
 Goc8l3FZTpKOl4Gdf6t8HxTvvM8qMwLQC09TkuyVc+Nb1CxLFdW0OLviOGyXj/RCJJ
 /omkmbBXXyVTQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 08/11] drm/xe: Check the PTE local memory bit for initial
 FB in stolen
Date: Fri, 10 Jul 2026 13:15:35 +0200
Message-ID: <20260710111539.1274555-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710111539.1274555-1-dev@lankhorst.se>
References: <20260710111539.1274555-1-dev@lankhorst.se>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Do the PTE local memory bit check also for the case when
the initial FB lives in stolen. We have two cases to worry about
here: MTL+ with LMEMBAR, and pre-MTL with stolen being just
(slightly special) physical memory.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patch.msgid.link/20260511214122.8468-11-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 1e1962c955890..0f86b73036d03 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -27,9 +27,14 @@ static bool is_pte_local(u64 pte)
 	return pte & XE_GGTT_PTE_DM;
 }
 
+static bool has_lmembar(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) >= 1270;
+}
+
 static bool need_pte_local(struct xe_device *xe)
 {
-	return IS_DGFX(xe);
+	return IS_DGFX(xe) || has_lmembar(xe);
 }
 
 static struct xe_bo *
@@ -80,6 +85,7 @@ initial_plane_bo(struct xe_device *xe,
 			    &phys_base);
 	} else {
 		struct ttm_resource_manager *stolen;
+		u64 pte;
 
 		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
 		if (!stolen) {
@@ -87,6 +93,13 @@ initial_plane_bo(struct xe_device *xe,
 			return NULL;
 		}
 
+		pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
+
+		if (is_pte_local(pte) != need_pte_local(xe)) {
+			drm_err(&xe->drm, "Initial plane PTE has bad local memory bit\n");
+			return NULL;
+		}
+
 		phys_base = base;
 		flags |= XE_BO_FLAG_STOLEN;
 
-- 
2.53.0

