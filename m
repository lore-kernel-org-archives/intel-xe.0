Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73118C9EC95
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 14:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C9010E3EA;
	Mon, 12 Jan 2026 14:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="nt/x8N83";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6F310E3E6
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768227687;
 bh=URnl3PfEHc8HrYGTWJdnpBi2cDyhe6K6cIfxSgOR3F0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nt/x8N83HiObQJ9PPAsx4WvAtfl2xFoFHAKur3f9c3sU6bU55taRkXwCQm4bONNiR
 9iQZ3MY5m05Thvam5RRkug/goVVfaLnClOiyI+5PpM8uoEF2WRhthcaBD9SjdsVs5x
 zS2iOunOIyYUhhnsnByo2spMZ2+Nrb3cCvaDbhjyJJeos19n02nkPYs9z+LX7tZE/I
 I8CZ2q1aePLk7lOtJZ2C//YT6mB9bctA+OXzPdk8NqbHetpjtEHZiPRiKuShxuh/+z
 vJ6+XfdOAVoL1z8L9nM4uqUQ6mJkmBtLWcs99dXaAIXfSHODPDsoaEoq/aZN71A7/3
 cRn+HnRHJeI4Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW-v4 06/12] drm/xe: Improve xe_gt_sriov_pf_config
 GGTT handling
Date: Mon, 12 Jan 2026 15:21:15 +0100
Message-ID: <20260112142121.1153027-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112142121.1153027-1-dev@lankhorst.se>
References: <20260112142121.1153027-1-dev@lankhorst.se>
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

Do not directly dereference xe_ggtt_node, and add
a function to retrieve the allocated GGTT size.

Reviewed-by: Matthew.brost@intel.com
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 15 ++++++++-------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f72fd3a79a376..3f30f22600ad9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1196,3 +1196,14 @@ u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
 {
 	return node->base.start;
 }
+
+/**
+ * xe_ggtt_node_size - Get @node allocation size.
+ * @node: &xe_ggtt_node
+ *
+ * Get the allocated node's size.
+ */
+u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
+{
+	return node->base.size;
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 76336a6296c45..70d5e07ac4b66 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -62,5 +62,6 @@ u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_ind
 u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
 
 u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node);
+u64 xe_ggtt_node_size(const struct xe_ggtt_node *node);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index bed6580d8d090..9f2525f3cb379 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -284,7 +284,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 	if (!xe_ggtt_node_allocated(node))
 		return 0;
 
-	return encode_ggtt(cfg, node->base.start, node->base.size, details);
+	return encode_ggtt(cfg, xe_ggtt_node_addr(node), xe_ggtt_node_size(node), details);
 }
 
 static u32 encode_config_sched(struct xe_gt *gt, u32 *cfg, u32 n,
@@ -545,9 +545,9 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
-				vfid, node->base.start, node->base.start + node->base.size - 1);
+				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
 
-	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
+	err = pf_distribute_config_ggtt(gt->tile, vfid, xe_ggtt_node_addr(node), size);
 	if (unlikely(err))
 		goto err;
 
@@ -564,7 +564,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 	struct xe_ggtt_node *node = config->ggtt_region;
 
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
-	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
+	return xe_ggtt_node_allocated(node) ? xe_ggtt_node_size(node) : 0;
 }
 
 /**
@@ -3040,11 +3040,12 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 		if (!xe_ggtt_node_allocated(config->ggtt_region))
 			continue;
 
-		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
+		string_get_size(xe_ggtt_node_size(config->ggtt_region), 1, STRING_UNITS_2,
 				buf, sizeof(buf));
 		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
-			   n, config->ggtt_region->base.start,
-			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
+			   n, xe_ggtt_node_addr(config->ggtt_region),
+			   xe_ggtt_node_addr(config->ggtt_region) +
+			   xe_ggtt_node_size(config->ggtt_region) - 1,
 			   buf);
 	}
 
-- 
2.51.0

