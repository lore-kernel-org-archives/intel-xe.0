Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80956C3ABBD
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 12:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406EF10E3D8;
	Mon,  5 May 2025 12:20:10 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A881110E3E0
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 12:20:07 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 08/10] drm/xe: Remove pte_encode_bo callback
Date: Mon,  5 May 2025 14:19:21 +0200
Message-ID: <20250505121924.921544-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505121924.921544-1-dev@lankhorst.se>
References: <20250505121924.921544-1-dev@lankhorst.se>
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

The users inside display have been converted to use thepte_encode_flags
callback, we can now remove the pte_encode_bo cb.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 14 --------------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 59097c7a494b2..20d49a96c2407 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -75,11 +75,6 @@ static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 	return pte;
 }
 
-static u64 xelp_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
-{
-	return xelp_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
-}
-
 static u64 xelpg_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	struct xe_device *xe = xe_bo_device(bo);
@@ -98,12 +93,6 @@ static u64 xelpg_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 	return pte;
 }
 
-static u64 xelpg_ggtt_encode_bo(struct xe_bo *bo, u64 bo_offset,
-				u16 pat_index)
-{
-	return xelpg_ggtt_pte_flags(bo, pat_index) | xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
-}
-
 static unsigned int probe_gsm_size(struct pci_dev *pdev)
 {
 	u16 gmch_ctl, ggms;
@@ -218,19 +207,16 @@ static void primelockdep(struct xe_ggtt *ggtt)
 }
 
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
-	.pte_encode_bo = xelp_ggtt_encode_bo,
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
-	.pte_encode_bo = xelpg_ggtt_encode_bo,
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
-	.pte_encode_bo = xelpg_ggtt_encode_bo,
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 06b1a602dd8d1..c5e999d58ff2a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -74,9 +74,6 @@ struct xe_ggtt_node {
  * Which can vary from platform to platform.
  */
 struct xe_ggtt_pt_ops {
-	/** @pte_encode_bo: Encode PTE flags for a given BO */
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
-
 	/** @pte_encode_flags: Encode PTE flags for a given BO */
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
-- 
2.45.2

