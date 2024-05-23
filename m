Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BFCC25B7A
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 19:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033D510EB7D;
	Thu, 23 May 2024 19:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYgHEXuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4393810EC3E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 19:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716492179; x=1748028179;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TBa9fhDRj+EaCuQnjqbAcJ+fLcgxBGLsqrKBWT2yQfQ=;
 b=OYgHEXuf5hPUFBfnzmmwRk+ph6Xjao8HlzmorZ20pHXoPq8+1cYc4TK5
 l8g9laIbNQaZ3UhO1gF3vPVHNitsPwL2D6KM4d+WrH9oVNJ79OKcZ1c+H
 K0dWhclZVAnBLMRl13QXEnZsUSRYRC+TUJ4r8B9g9aJ/p65vu7VCNxtVh
 xfgwzPKd1YZWbZyH5IM9cn0pJYS/UjhaeZp8a3MEbiLDJadpl6BHwDNMQ
 qOAARsQGmA3HapfADEyVyw7aAt3uMKbz+TJv/JBLJ3JlSce1hf8DUia9F
 VSe/sQYGSyhLNIvLNycTzOSaPC5GTx/JJhvzoWxwkvUKvHBTZJ3HPthkh g==;
X-CSE-ConnectionGUID: qOcXNBiHTT2fgPCIJCYrGw==
X-CSE-MsgGUID: uisreZlPRZmdbnEA2kkDaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13023477"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13023477"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:55 -0700
X-CSE-ConnectionGUID: mFGWfKLXQZmKp6nS0Ecz5Q==
X-CSE-MsgGUID: IXRncN7zQ8WhSxOorcYA6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33848850"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/6] drm/xe/vf: Obtain value of GMDID register from GuC
Date: Thu, 23 May 2024 21:22:37 +0200
Message-Id: <20240523192240.844-4-michal.wajdeczko@intel.com>
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

VFs don't have access to the GMDID register and must obtain it
value using GuC VF ABI KLV query. Add function for doing that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 237486a80fb5..5b8771f831f7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -284,6 +284,35 @@ static int guc_action_query_single_klv64(struct xe_guc *guc, u32 key, u64 *value
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_vf_gmdid - Query GMDID over MMIO.
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: value of GMDID KLV on success or 0 on failure.
+ */
+u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
+{
+	const char *type = xe_gt_is_media_type(gt) ? "media" : "graphics";
+	struct xe_guc *guc = &gt->uc.guc;
+	u32 value;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major > 1 || gt->sriov.vf.guc_version.minor >= 2);
+
+	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_GMD_ID_KEY, &value);
+	if (unlikely(err)) {
+		xe_gt_sriov_err(gt, "Failed to obtain %s GMDID (%pe)\n",
+				type, ERR_PTR(err));
+		return 0;
+	}
+
+	xe_gt_sriov_dbg(gt, "%s GMDID = %#x\n", type, value);
+	return value;
+}
+
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index be69c1025320..0391ed72a570 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 
+u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 
-- 
2.43.0

