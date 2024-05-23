Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8589FC25B7A
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 19:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D0D10EC3E;
	Thu, 23 May 2024 19:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FY9/U3I+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AFA10EDB2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 19:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716492179; x=1748028179;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5FuYVVuXO8SCqh+Hs80NhEofGaX+2yNHqSlRBiYiZTw=;
 b=FY9/U3I+9VDav0nSHeMDt6vAC8xEv/tMvuIONN9Q0mFe6A6q6GbWeRKM
 kUyvXfV0HVN1qyktY6gf5vSYtJInfCSH4HZYJ2vCtKfNhg55Of2twvyWI
 +URXOHQfVF24FlXyF2hdcI9e9yGUBCWp0Kp1IcEoFwQL9P9K54npPrCNh
 Z5btC/vMkhxtzGYDhkj7ifclxQGrYX/USiPlhjVrGd2iG5cnwzDFhLeKJ
 v8SiJGm+GiDz8wtbnia8arGwY3dDjLiW7LSZe2B0+a6NvNhRR2mvAWXwu
 c50vXBTWC+xMCR+YapKfSBSOTIZ0RdV6w3E0PJ3IMuVeCqdHvkevgQvy4 w==;
X-CSE-ConnectionGUID: 2LBKZDPeT/KkihrjVfaICw==
X-CSE-MsgGUID: /IIt1f5pQT6j4add902wmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13023483"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13023483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:57 -0700
X-CSE-ConnectionGUID: 4JZ4rZgSTVCEp2T58w/I4A==
X-CSE-MsgGUID: TU4dIkwiRh2qFBBiDbJQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33848863"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/xe/vf: Cache value of the GMDID register
Date: Thu, 23 May 2024 21:22:39 +0200
Message-Id: <20240523192240.844-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240523192240.844-1-michal.wajdeczko@intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
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

Read and cache value of the GMDID register as part of the config
query that VF driver is doing over MMIO.

While the VF driver likely already obtained the value of the GMDID
register once during the early driver probe, we couldn't cache it
then as the GT structures were not ready yet.

Cache it now, in case the driver needs it later when the GuC MMIO
communication, required to query GMDID from GuC, could be no longer
desired as it will be replaced by the CTB communication.

While around, assert that we will query GMDID only when applicable.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 5b8771f831f7..347ab7060588 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -284,6 +284,11 @@ static int guc_action_query_single_klv64(struct xe_guc *guc, u32 key, u64 *value
 	return 0;
 }
 
+static bool has_gmdid(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) >= 1270;
+}
+
 /**
  * xe_gt_sriov_vf_gmdid - Query GMDID over MMIO.
  * @gt: the &xe_gt
@@ -300,6 +305,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, !GRAPHICS_VERx100(gt_to_xe(gt)) || has_gmdid(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major > 1 || gt->sriov.vf.guc_version.minor >= 2);
 
 	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_GMD_ID_KEY, &value);
@@ -409,6 +415,14 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 	return config->num_ctxs ? 0 : -ENODATA;
 }
 
+static void vf_cache_gmdid(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, has_gmdid(gt_to_xe(gt)));
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
+}
+
 /**
  * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
  * @gt: the &xe_gt
@@ -436,6 +450,9 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	if (has_gmdid(xe))
+		vf_cache_gmdid(gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 519492f4b7d0..a57f13b5afcd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -52,6 +52,8 @@ struct xe_gt_sriov_vf_selfconfig {
  * struct xe_gt_sriov_vf_runtime - VF runtime data.
  */
 struct xe_gt_sriov_vf_runtime {
+	/** @gmdid: cached value of the GDMID register. */
+	u32 gmdid;
 	/** @regs_size: size of runtime register array. */
 	u32 regs_size;
 	/** @num_regs: number of runtime registers in the array. */
-- 
2.43.0

