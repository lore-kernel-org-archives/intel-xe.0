Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA08EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 00:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6A310E044;
	Thu, 15 Jun 2023 00:25:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD6F10E044
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 00:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686788743; x=1718324743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fHT8yXdwY8tdi61TR1lrlm5RjcFaE/7uYXwToekFM3U=;
 b=cLx42UF6dUipcSch1KurKx2LtxkqIOUDZrbJGmGuMMpqzb+56dS+moHW
 VW5zMJIiOX5rnPOhwyljw49m39tUOVVymxkQj9LDxziPuCRkaNLKLX5iK
 wFy1CNGi7mzcLlL07bXbfPimb2mJaPbOJjHgUG5/5kYM7O/ozwZoJgSF2
 7yu3ruH+pDinnKqgeS+a/1Esc9fKnWREfAhS6ydvdzrsxzIuvVy2c8K5k
 6MFmwF9X4+41bUCcdxOC15rCDBP6y1as+jmAkNnxIq7O7FAzEVqFfeYsw
 QZbfLSaOSbB7uFkG73J/L1TgxWN20F87AEI/zUOqBKcIwEfp9rGoXDnaM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="339119173"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="339119173"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 17:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="715417860"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="715417860"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 17:25:42 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jun 2023 17:25:21 -0700
Message-Id: <20230615002521.2587250-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: limit GGTT size to GUC_GGTT_TOP
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

The GuC can't access addresses above GUC_GGTT_TOP, so any GuC-accessible
objects can't be mapped above that offset. Instead of checking each
object to see if GuC may access it or not before mapping it, we just
limit the GGTT size to GUC_GGTT_TOP. This wastes a bit of address space
(about ~18 MBs, which is in addition to what already removed at the bottom
of the GGTT), but it is a good tradeoff to keep the code simple.

The in-code comment has also been updated to explain the limitation.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index bae9f66a33cb..7588fbc2f278 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -24,6 +24,9 @@
 #define MTL_GGTT_PTE_PAT0	BIT_ULL(52)
 #define MTL_GGTT_PTE_PAT1	BIT_ULL(53)
 
+/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
+#define GUC_GGTT_TOP	0xFEE00000
+
 u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
 {
 	struct xe_device *xe = xe_bo_device(bo);
@@ -111,12 +114,18 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 	/*
 	 * 8B per entry, each points to a 4KB page.
 	 *
-	 * The GuC owns the WOPCM space, thus we can't allocate GGTT address in
-	 * this area. Even though we likely configure the WOPCM to less than the
-	 * maximum value, to simplify the driver load (no need to fetch HuC +
-	 * GuC firmwares and determine there sizes before initializing the GGTT)
-	 * just start the GGTT allocation above the max WOPCM size. This might
-	 * waste space in the GGTT (WOPCM is 2MB on modern platforms) but we can
+	 * The GuC address space is limited on both ends of the GGTT, because
+	 * the GuC shim HW redirects accesses to those addresses to other HW
+	 * areas instead of going through the GGTT. On the bottom end, the GuC
+	 * can't access offsets below the WOPCM size, while on the top side the
+	 * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
+	 * checking each object to see if they are accessed by GuC or not, we
+	 * just exclude those areas from the allocator. Additionally, to
+	 * simplify the driver load, we use the maximum WOPCM size in this logic
+	 * instead of the programmed one, so we don't need to wait until the
+	 * actual size to be programmed is determined (which requires FW fetch)
+	 * before initializing the GGTT. These simplifications might waste space
+	 * in the GGTT (about 20-25 MBs depending on the platform) but we can
 	 * live with this.
 	 *
 	 * Another benifit of this is the GuC bootrom can't access anything
@@ -125,6 +134,9 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 	 * Starting the GGTT allocations above the WOPCM max give us the correct
 	 * placement for free.
 	 */
+	if (ggtt->size > GUC_GGTT_TOP)
+		ggtt->size = GUC_GGTT_TOP;
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
-- 
2.40.0

