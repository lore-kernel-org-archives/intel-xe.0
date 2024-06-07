Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116D1C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 15:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCFE10ECB7;
	Fri,  7 Jun 2024 15:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAlIPvAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82C410ECB7
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774330; x=1749310330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MhS1vt+s+A3h+AnpagN2t5a131KFv6H9Z7Y6W2gqv6M=;
 b=YAlIPvAE7wy9JN0vsakWZA2T74L/4aH5wg1IMi3pycJRCiUtF16B2XVI
 wwmaIszBbJ1iPrVZbZiDdHqC/oNPHHcW5khERReuvQfVob8cYgwyGUhBo
 LoN3r5N6EzPAMb7A3dNM+2KHJDyS0PEI2vJMfMhGvoeJJxk+qNVwWqBnz
 IlBZi3+93imkQiC0M9l19amnwz/AbfNaTANkuTuCKRlP+LZL87CmAU4tz
 GJbG5XKxNX7AS6WEOTor0XMV3mm+sKBhsAsNYfrxPDX5K0DHCMEF5PQgz
 aphHgjuBSK4KCL589xyoytnNu1KswHexXzsVVY0U3jX/lyXJ0hdVnIqdF w==;
X-CSE-ConnectionGUID: mWdNwbOeRje4Cg3/jNqQnA==
X-CSE-MsgGUID: yzXLMxGKTtOTp+0jZf2ncw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25602438"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25602438"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:32:10 -0700
X-CSE-ConnectionGUID: 1F7TXq4xR9WjweDZgkuVMQ==
X-CSE-MsgGUID: hsjr8kcVSQiwouQJpyg2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38347668"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:32:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/pf: Assert LMEM provisioning is done only on DGFX
Date: Fri,  7 Jun 2024 17:31:55 +0200
Message-Id: <20240607153155.1592-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

The Local Memory (aka VRAM) is only available on DGFX platforms.
We shouldn't attempt to provision VFs with LMEM or attempt to
update the LMTT on non-DGFX platforms. Add missing asserts that
would enforce that and fix release code that could crash on iGFX
due to uninitialized LMTT.

Fixes: c063cce7df3a ("drm/xe/pf: Update the LMTT when freeing VF GT config")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f49fc2917f93..694671497f6e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1290,6 +1290,9 @@ static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	struct xe_tile *tile;
 	unsigned int tid;
 
+	xe_assert(xe, IS_DGFX(xe));
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
 	for_each_tile(tile, xe, tid) {
 		lmtt = &tile->sriov.pf.lmtt;
 		xe_lmtt_drop_pages(lmtt, vfid);
@@ -1308,6 +1311,9 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	unsigned int tid;
 	int err;
 
+	xe_assert(xe, IS_DGFX(xe));
+	xe_assert(xe, IS_SRIOV_PF(xe));
+
 	total = 0;
 	for_each_tile(tile, xe, tid)
 		total += pf_get_vf_config_lmem(tile->primary_gt, vfid);
@@ -1353,6 +1359,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 
 static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
+	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
@@ -1371,6 +1378,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	int err;
 
 	xe_gt_assert(gt, vfid);
+	xe_gt_assert(gt, IS_DGFX(xe));
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 
 	size = round_up(size, pf_get_lmem_alignment(gt));
@@ -1838,11 +1846,14 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
 static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
+	struct xe_device *xe = gt_to_xe(gt);
 
 	if (!xe_gt_is_media_type(gt)) {
 		pf_release_vf_config_ggtt(gt, config);
-		pf_release_vf_config_lmem(gt, config);
-		pf_update_vf_lmtt(gt_to_xe(gt), vfid);
+		if (IS_DGFX(xe)) {
+			pf_release_vf_config_lmem(gt, config);
+			pf_update_vf_lmtt(xe, vfid);
+		}
 	}
 	pf_release_config_ctxs(gt, config);
 	pf_release_config_dbs(gt, config);
-- 
2.43.0

