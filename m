Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18350C61CE7
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 23:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D46710E6A2;
	Tue,  3 Jun 2025 23:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMp+wJI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081F710E694
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 23:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748994884; x=1780530884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=boEcqw3AhBpMu171ArqcbPs1gSurj6InCLKlexUcyjU=;
 b=CMp+wJI/sgSSeQFXZe0FoaGBorbs4zjVnsHNo1iXwgzMbtOZJJaYp3ju
 ZqYw22MPDT+WGKhOqeezg8V0EDbLiOxm0WU6Voh7U/B3z7rTDW7bTShEM
 Xpx7RrMDtls2TOFuFjGU30aDSteTNddt+DR7aK+DZXeGp/BFUk0sFJKcU
 Q91Z63F+RifQ2+RIT7oar8pn67ImTPvraburjjfnrps8d0TtKC3EEtAsU
 HqhzvPnDJ6QH/ORuKmlkKkhHhVAB5FD8+dZWHjt2YZnJxytc/hJhvkl6O
 TyJLgt+uUBWeHfyLyAzX6U0dteSlrmbZmsSc0ENB7LUK8DHteVHo7JrvK A==;
X-CSE-ConnectionGUID: K7E5OiA5Qxqucc7udZw//A==
X-CSE-MsgGUID: qoq4fRlZSMyHVrGcEZVUJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50970537"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="50970537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:54:43 -0700
X-CSE-ConnectionGUID: y9/xXbYKQHu8rFqCvf3blw==
X-CSE-MsgGUID: cj2gFp9SRK2La5iEuvT4wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="168176358"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:54:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 2/4] drm/xe/vf: Boostrap all GTs immediately after MMIO init
Date: Tue,  3 Jun 2025 16:54:35 -0700
Message-ID: <20250603235432.720833-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
References: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
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

Currently we perform the bootstrap for the primary GT early on during
device init, while the media GT bootstrap happens when we try and fetch
the hwconfig table. For consistency, move the bootstrap of the media GT
happen at the same time as the primary GT, so that all the subsequent
code can rely on both GTs being in the same state.

v2: Also drop config query from min_guc_load since we now do it
    early (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 ++++++-----
 drivers/gpu/drm/xe/xe_guc.c    |  8 --------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..7e87344943cd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -798,18 +798,19 @@ int xe_device_probe(struct xe_device *xe)
 		 * be performed.
 		 */
 		xe_gt_mmio_init(gt);
-	}
 
-	for_each_tile(tile, xe, id) {
 		if (IS_SRIOV_VF(xe)) {
-			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
-			err = xe_gt_sriov_vf_bootstrap(tile->primary_gt);
+			xe_guc_comm_init_early(&gt->uc.guc);
+			err = xe_gt_sriov_vf_bootstrap(gt);
 			if (err)
 				return err;
-			err = xe_gt_sriov_vf_query_config(tile->primary_gt);
+			err = xe_gt_sriov_vf_query_config(gt);
 			if (err)
 				return err;
 		}
+	}
+
+	for_each_tile(tile, xe, id) {
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 52453845d1bd..209e5d53c290 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1102,14 +1102,6 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
-	ret = xe_gt_sriov_vf_bootstrap(gt);
-	if (ret)
-		return ret;
-
-	ret = xe_gt_sriov_vf_query_config(gt);
-	if (ret)
-		return ret;
-
 	ret = xe_guc_hwconfig_init(guc);
 	if (ret)
 		return ret;
-- 
2.43.0

