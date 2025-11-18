Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C538CED243
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 12:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2403B10E49E;
	Tue, 18 Nov 2025 12:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qu1J5jq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4F10E49D
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763470067; x=1795006067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bw8JBbuh92RGsZOZm2io4k2n2vvhrVZER790k7hd2FM=;
 b=Qu1J5jq3Nbv77tWDv8MqcLlBi4lVz64WuFMLJlzR1N9g2FFgfB5jQ4Fd
 d4gArMEsNE5hKRmvT5l/SCPlyLNdNpUJ2GJwodiBzPt7R+5ceTmpYPVK0
 3rupAXASl5N0zKjf4NcyBrBjYuSlakZAcnljm2rN+TjHBzxFA88IR6qVP
 gdiB86lKICy/xcQmtS8U2eVtnhktw1b+W0N/iV+T7XIsj9pth6YhzWmZq
 zMlBjbYeEvQaLLDEHdx/Jz9KLML+HFZmzwFgYZ9N09/oDZtI/lggAVcue
 GCd57T5lb8oBt5RPaw/SXqugE0943HmdRA1jnUD/mTL8sKcFjNPbKxeF5 A==;
X-CSE-ConnectionGUID: 6LiBx6+jRs60SI320JFf6w==
X-CSE-MsgGUID: RBclU/q8S+isw8ZWuowmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65194249"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65194249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 04:47:46 -0800
X-CSE-ConnectionGUID: o5DKtRDVS6qTcgh977TsmQ==
X-CSE-MsgGUID: yRLcDKGfQ2OCg/IVUXOESg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190034356"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 04:47:45 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v3 1/2] drm/xe/vf: Split GGTT info query and fixup into
 separate helpers
Date: Tue, 18 Nov 2025 12:47:40 +0000
Message-ID: <20251118124741.3504754-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118124741.3504754-1-satyanarayana.k.v.p@intel.com>
References: <20251118124741.3504754-1-satyanarayana.k.v.p@intel.com>
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

The current vf_get_ggtt_info() function handles both querying GGTT
information and applying fixups. Refactor this into two distinct
functions: one for querying and another for performing fixups.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V2 -> V3:
- New commit

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 45 ++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4c73a077d314..be7986537aad 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -438,41 +438,50 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 	return value;
 }
 
-static int vf_get_ggtt_info(struct xe_gt *gt)
+static int vf_query_ggtt_info(struct xe_gt *gt, u64 *start, u64 *size, s64 *shift)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	struct xe_guc *guc = &gt->uc.guc;
-	u64 start, size, ggtt_size;
-	s64 shift;
+	u64 ggtt_size;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	guard(mutex)(&ggtt->lock);
-
-	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
+	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, start);
 	if (unlikely(err))
 		return err;
 
-	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
+	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, size);
 	if (unlikely(err))
 		return err;
 
-	if (!size)
+	if (!*size)
 		return -ENODATA;
 
 	ggtt_size = xe_tile_sriov_vf_ggtt(tile);
-	if (ggtt_size && ggtt_size != size) {
+	if (ggtt_size && ggtt_size != *size) {
 		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
-				size / SZ_1K, ggtt_size / SZ_1K);
+				*size / SZ_1K, ggtt_size / SZ_1K);
 		return -EREMCHG;
 	}
 
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
-				start, start + size - 1, size / SZ_1K);
+				*start, *start + *size - 1, *size / SZ_1K);
+
+	*shift = *start - (s64)xe_tile_sriov_vf_ggtt_base(tile);
+
+	return 0;
+}
+
+static int vf_fixup_ggtt_nodes(struct xe_gt *gt, u64 start, u64 size, s64 shift)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	guard(mutex)(&ggtt->lock);
 
-	shift = start - (s64)xe_tile_sriov_vf_ggtt_base(tile);
 	xe_tile_sriov_vf_ggtt_base_store(tile, start);
 	xe_tile_sriov_vf_ggtt_store(tile, size);
 
@@ -577,9 +586,17 @@ static void vf_cache_gmdid(struct xe_gt *gt)
 int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	u64 start, size;
+	s64 shift;
 	int err;
 
-	err = vf_get_ggtt_info(gt);
+	err = vf_query_ggtt_info(gt, &start, &size, &shift);
+	if (unlikely(err)) {
+		xe_gt_sriov_err(gt, "Error in querying ggtt info (%d)\n", err);
+		return err;
+	}
+
+	err = vf_fixup_ggtt_nodes(gt, start, size, shift);
 	if (unlikely(err))
 		return err;
 
-- 
2.51.0

