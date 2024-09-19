Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC8CF395D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 17:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BBB10E735;
	Thu, 19 Sep 2024 17:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGaSuXwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0259710E6E9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 17:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726766148; x=1758302148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=THrae6pEJrl6FdpEg+3oMYtIsf4UYgOCXnS/DzHoGF8=;
 b=MGaSuXwM/D73HOJ3CF0lMDnJJ9KCa8ikhaofiushAXGltHr+WD3sAbv3
 k58/lqDlDPODUWBj3N6hlNR+jCWWyQsKqo0Df1GrzhDrX/XJOw0o15Vbk
 osqiS8Qx+jngi1njNzspmJiLt7hxWMaDP60LGGRR/Juijqngbwekk2vJ6
 a/5ImC0aUmihEwNkIRJJTl9woMuN7XQgVy4UzFQyNyCcmU1TuThJoIZzI
 OAU2ktkyLaI45VB9VRSURAqBvyHqsRHQ/nn45UaaSPeNLQ20TwScWqQ8k
 oioUDtf8xxMtiMjQt0A3kYOnBP93rmAlHVY4hF0CX55JojdoJX8drvQ9S A==;
X-CSE-ConnectionGUID: 4rwhFN5cSD2N075VL1k6Kg==
X-CSE-MsgGUID: WzKOkI2RQ5+gQ/TU1GW51g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29534497"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="29534497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:48 -0700
X-CSE-ConnectionGUID: OdBo0WqISd2bQv0G4AlYoA==
X-CSE-MsgGUID: 8NCP98sNQcCbEnt23KqmPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="107481138"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/5] drm/xe/pf: Allow to encode subset of VF configuration KLVs
Date: Thu, 19 Sep 2024 19:15:26 +0200
Message-Id: <20240919171528.1451-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240919171528.1451-1-michal.wajdeczko@intel.com>
References: <20240919171528.1451-1-michal.wajdeczko@intel.com>
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

We want to reuse format of the GuC KLVs while saving and restoring
VF configuration by the PF driver, but some of those KLVs (like
doorbell begin index or GGTT starting offset) are not strictly
needed to correctly restore VF configuration. Modify functions to
omit encoding of some of the KLVs with GuC only details.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 32 +++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 27a593b1d52a..28e2b26c2d88 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -229,14 +229,16 @@ static struct xe_gt_sriov_config *pf_pick_vf_config(struct xe_gt *gt, unsigned i
 }
 
 /* Return: number of configuration dwords written */
-static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
+static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
 {
 	u32 n = 0;
 
 	if (xe_ggtt_node_allocated(config->ggtt_region)) {
-		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
-		cfg[n++] = lower_32_bits(config->ggtt_region->base.start);
-		cfg[n++] = upper_32_bits(config->ggtt_region->base.start);
+		if (details) {
+			cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
+			cfg[n++] = lower_32_bits(config->ggtt_region->base.start);
+			cfg[n++] = upper_32_bits(config->ggtt_region->base.start);
+		}
 
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
 		cfg[n++] = lower_32_bits(config->ggtt_region->base.size);
@@ -247,20 +249,24 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 }
 
 /* Return: number of configuration dwords written */
-static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config)
+static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
 {
 	u32 n = 0;
 
-	n += encode_config_ggtt(cfg, config);
+	n += encode_config_ggtt(cfg, config, details);
 
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_BEGIN_CONTEXT_ID);
-	cfg[n++] = config->begin_ctx;
+	if (details) {
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_BEGIN_CONTEXT_ID);
+		cfg[n++] = config->begin_ctx;
+	}
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_NUM_CONTEXTS);
 	cfg[n++] = config->num_ctxs;
 
-	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_BEGIN_DOORBELL_ID);
-	cfg[n++] = config->begin_db;
+	if (details) {
+		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_BEGIN_DOORBELL_ID);
+		cfg[n++] = config->begin_db;
+	}
 
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_NUM_DOORBELLS);
 	cfg[n++] = config->num_dbs;
@@ -301,7 +307,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 	if (!cfg)
 		return -ENOMEM;
 
-	num_dwords = encode_config(cfg, config);
+	num_dwords = encode_config(cfg, config, true);
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
 
 	if (xe_gt_is_media_type(gt)) {
@@ -309,10 +315,10 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
 		struct xe_gt_sriov_config *other = pf_pick_vf_config(primary, vfid);
 
 		/* media-GT will never include a GGTT config */
-		xe_gt_assert(gt, !encode_config_ggtt(cfg + num_dwords, config));
+		xe_gt_assert(gt, !encode_config_ggtt(cfg + num_dwords, config, true));
 
 		/* the GGTT config must be taken from the primary-GT instead */
-		num_dwords += encode_config_ggtt(cfg + num_dwords, other);
+		num_dwords += encode_config_ggtt(cfg + num_dwords, other, true);
 	}
 	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
 
-- 
2.43.0

