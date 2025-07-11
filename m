Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B90FC83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 19:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0060410EAB9;
	Fri, 11 Jul 2025 19:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9O2aW/5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D334210EAB6
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752262414; x=1783798414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S88ZlnujRdLxfmjeNYFZXdrOzcMvB1DlMW0Txyy4yTM=;
 b=D9O2aW/5LBE2PKTe4oeZ3vnivqRF7DikQ0JSpcj0bCExS/Pl3l0KBuGr
 lj4gYT8Fu8RVrqZXrgAZHjtKR2tmci/Upwy+Y7Me5eK00roE9NkDfnAHs
 4cg4VobFyMRWWmioanpe8mpeos4ccEJedwnLwwFUGDB1rP/fk+cvUOCpU
 g6xmG8pyEqw+SJb6fVsP+AB2PJyclQBztxkZTTjpadq8xZLQ/g0cRKmzO
 jXs88dlgKa0l/x8wSuBOwC+qxuf+NQuXgAQTSlRLXinaV+t0/6tPvRIWv
 3dm32SKsZgzKogYJddYGk9AdL2U7iytPsTNwdBYoQr97X6IW6IJv6KjMm Q==;
X-CSE-ConnectionGUID: 011D9oAzT1+RAYPycLyeug==
X-CSE-MsgGUID: hMC+gFwmR7WRiXvLhSsnGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54651041"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54651041"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:34 -0700
X-CSE-ConnectionGUID: VfVxazOxSkaZJ2LUXLaXsw==
X-CSE-MsgGUID: 6ceb3tnvQx6LT2zne6BZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160462013"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 12:33:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 3/6] drm/xe/pf: Move GGTT config KLVs encoding to helper
Date: Fri, 11 Jul 2025 21:33:13 +0200
Message-Id: <20250711193316.1920-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250711193316.1920-1-michal.wajdeczko@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
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

In upcoming patch we will want to encode GGTT config KLVs based
on raw numbers, without relying on the allocated GGTT node.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 35 ++++++++++++++--------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e84fd44c6598..55afc5b06371 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -237,24 +237,33 @@ static struct xe_gt_sriov_config *pf_pick_vf_config(struct xe_gt *gt, unsigned i
 	return &gt->sriov.pf.vfs[vfid].config;
 }
 
+/* Return: number of configuration dwords written */
+static u32 encode_ggtt(u32 *cfg, u64 start, u64 size, bool details)
+{
+	u32 n = 0;
+
+	if (details) {
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
+		cfg[n++] = lower_32_bits(start);
+		cfg[n++] = upper_32_bits(start);
+	}
+
+	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
+	cfg[n++] = lower_32_bits(size);
+	cfg[n++] = upper_32_bits(size);
+
+	return n;
+}
+
 /* Return: number of configuration dwords written */
 static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
 {
-	u32 n = 0;
+	struct xe_ggtt_node *node = config->ggtt_region;
 
-	if (xe_ggtt_node_allocated(config->ggtt_region)) {
-		if (details) {
-			cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
-			cfg[n++] = lower_32_bits(config->ggtt_region->base.start);
-			cfg[n++] = upper_32_bits(config->ggtt_region->base.start);
-		}
+	if (!xe_ggtt_node_allocated(node))
+		return 0;
 
-		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
-		cfg[n++] = lower_32_bits(config->ggtt_region->base.size);
-		cfg[n++] = upper_32_bits(config->ggtt_region->base.size);
-	}
-
-	return n;
+	return encode_ggtt(cfg, node->base.start, node->base.size, details);
 }
 
 /* Return: number of configuration dwords written */
-- 
2.47.1

