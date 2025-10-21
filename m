Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BB2CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDA910E5DC;
	Tue, 21 Oct 2025 12:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="FOWhAD6H";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1D610E5DB
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761049110;
 bh=Q6t+8EmDHJplyof9uNB3klO/f9e7qavfBGCqO0CGmGU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FOWhAD6Hn71OzCyD7/dVvNql5cDzXuiyDiHcAlsfTfj3d9gBvJInXXYw3SAfLMpFm
 cdulr45FUD+IZNu/mlTiXnJOO7Nh2hK6I1HxYaFBlbTIpKrXYrliEjBwGO04DcqW0V
 WP0EmkVeQNtPBDdqN+l+bYpVIij8f3ZX/XgBNyd/J6NDM9IhO4fWY5L8g5uVBf1Zzc
 kVsC8uuP+VuBZ1oeVjOKSOdXm6ltpSweaPoUyJxsYnuoz0m6BhvVzcrsivDY2zncnZ
 vb6ZKp8OXcK8s/JEFld154tKGYqbpjH6uX9wsZkiHjERv5qryKsj0n3dtpQBu6WFwr
 gTT0TWPQbYwgA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
	Matthew.brost@intel.com
Subject: [PATCH 6/7] drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
Date: Tue, 21 Oct 2025 14:18:20 +0200
Message-ID: <20251021121814.2193153-15-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021121814.2193153-9-dev@lankhorst.se>
References: <20251021121814.2193153-9-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: <Matthew.brost@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 15 ++++++++-------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 05515037e2d6a..81038d94b497d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1090,3 +1090,14 @@ u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
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
index 4a8ef1b824156..b69f05a6adbf8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -59,5 +59,6 @@ u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_ind
 u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
 
 u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node);
+u64 xe_ggtt_node_size(const struct xe_ggtt_node *node);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f96f96425c2ec..19d1013d0c4c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -264,7 +264,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 	if (!xe_ggtt_node_allocated(node))
 		return 0;
 
-	return encode_ggtt(cfg, node->base.start, node->base.size, details);
+	return encode_ggtt(cfg, xe_ggtt_node_addr(node), xe_ggtt_node_size(node), details);
 }
 
 /* Return: number of configuration dwords written */
@@ -495,9 +495,9 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
-				vfid, node->base.start, node->base.start + node->base.size - 1);
+				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
 
-	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
+	err = pf_distribute_config_ggtt(gt->tile, vfid, xe_ggtt_node_addr(node), size);
 	if (unlikely(err))
 		goto err;
 
@@ -514,7 +514,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 	struct xe_ggtt_node *node = config->ggtt_region;
 
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
-	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
+	return xe_ggtt_node_allocated(node) ? xe_ggtt_node_size(node) : 0;
 }
 
 /**
@@ -2517,11 +2517,12 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
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

