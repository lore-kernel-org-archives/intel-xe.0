Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19944D185C0
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 10:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C49510E6ED;
	Thu,  8 Jan 2026 10:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="bobkwJT9";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F5210E32C
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767868457;
 bh=Gwb3y3P8DPqsA/WwZKZeEL60+HubBxa4PWo6SSGk9aY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bobkwJT9d44ajyeaFeVxk1DpsQ2VqD7IN0POxmueBBndaq9x+M89SFUT2SCXEx7xl
 jViHDxoSz894vXeVRGpJPLVCeAH/nL2SAMWgsmxdgSbzx+QQTfNxdVp74vwdHrSbW8
 sn31h7ZGGm8Ev8SdA+We5VM/+2hfdrHX2LG3rS25h0LuwNN23PHdSobF50R6EL/QDE
 ZFpgtT7tE5x9oQ+8rTi2LMIpc+8T+raZigyovTkuFHdNh3eYPpEphBmGGBjf3AfCaW
 VmIinpQIrKqu429EoJhg4g2ksTo0A+CBcWj4D5uUsNmaLKI9UP+SDGqaqO2dHL0UFD
 y7isv8tw1sWMQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW 06/12] drm/xe: Improve xe_gt_sriov_pf_config
 GGTT handling
Date: Thu,  8 Jan 2026 11:34:09 +0100
Message-ID: <20260108103412.637731-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108103412.637731-1-dev@lankhorst.se>
References: <20260108103412.637731-1-dev@lankhorst.se>
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
index 7f45bcd0c56b0..e396f33e2c5c9 100644
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

