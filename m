Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FC7C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB55D10E6D6;
	Wed, 28 May 2025 23:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XF+avZwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C1610E0F9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748475763; x=1780011763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zNev2mh2CKJ5wbCA4xVfTPf1Zr5MJDcuVOR7PZirYfE=;
 b=XF+avZwpurLjHaegT8kptQJdySifJ1na2HF6WoUH9xZBLWIqONWnrNDN
 Vcho9VLZZg4ZUGWDUrj8NlmyN0WDmYmTm1pszELsModPExKoRsWuzX5lY
 vnOwzxG3AwHJKBtBgCypMXSIaTrUpjsHjJi16gRx/FgiD80CAAE1y4uNX
 LC7kw2KCdjajXQdLPZag41j91F5TODhqIK/vUbwGaPhbVI/B3LLv13Rw+
 GsX4amkESu3b/Gfx1x7zl3H5C/OEAfCwfUvJMggHd5xJk5A1FEp3vPSBM
 v/eFUwBPmsUamAsLgqH7zyFiR9k6guljcKbj2NjMne1OdMHC9gJbsL6NT w==;
X-CSE-ConnectionGUID: OBDJL73WT9mzP7dYLKP+Kg==
X-CSE-MsgGUID: YfzKCSk9QJOtsEYfPUqjfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50674860"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50674860"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:43 -0700
X-CSE-ConnectionGUID: /j3Mu7jkQRaNfK7ljuQmQA==
X-CSE-MsgGUID: NeE27llVRViZfzkLcHlJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148245531"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/4] drm/xe/vf: Boostrap all GTs immediately after MMIO init
Date: Wed, 28 May 2025 16:42:32 -0700
Message-ID: <20250528234229.4185039-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
References: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 ++++++-----
 drivers/gpu/drm/xe/xe_guc.c    |  4 ----
 2 files changed, 6 insertions(+), 9 deletions(-)

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
index 350434a8b953..065550964e68 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1102,10 +1102,6 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	int ret;
 
-	ret = xe_gt_sriov_vf_bootstrap(gt);
-	if (ret)
-		return ret;
-
 	ret = xe_gt_sriov_vf_query_config(gt);
 	if (ret)
 		return ret;
-- 
2.43.0

