Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF21CA0FF1
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 13:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C5710E6A4;
	Fri, 30 Aug 2024 13:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4Mdnnrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C807010E6A4
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 13:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725024074; x=1756560074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FbpME/DaR9w9t74hP0DUW2leeMrPzUnt2sQtyUsnSA8=;
 b=W4Mdnnrvg6a38RSpQS9f5cmUGetcc1hIHi08qfcTIz7b7Pl0Fe3ZTOlF
 dkoLNzn+H5QMjt7YGiKS0iUBRlYkynwpIZwNDvYTdJmoXR3kCk2wvybZs
 ZXQX/GEXnWSF300K21wEtXxOkAhVrkr9wbd2eWLFdVY0SKamvB1PBBwPw
 58jEO9zMH9Bx2++cl5yW1K/ohjYiGNY5RcYDmSzTqjQ2HDEKGFQgOtlGO
 ZDHjjD4TLE2qybJVFFP8rn8ZLSTPuKWDPPkhJkOOqWjGD0ohfGtUe0Kum
 3yURx+88I0KfEAfRzziYH2AI5lMYfa5t8EVT6X+kf7+W5txjZe0caFIo6 Q==;
X-CSE-ConnectionGUID: Z9FcVILWSFu/+4GSau3qyw==
X-CSE-MsgGUID: AUBCdCODRg+Om9SK/t8I4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41144577"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="41144577"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 06:21:14 -0700
X-CSE-ConnectionGUID: DJfswK+cS7ONIROgOOeL1Q==
X-CSE-MsgGUID: 81b3nbKBSyCUbM65Mo3Njg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="63724354"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 06:21:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe/pf: Reset thresholds when releasing a VF config
Date: Fri, 30 Aug 2024 15:21:00 +0200
Message-Id: <20240830132100.1704-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240830132100.1704-1-michal.wajdeczko@intel.com>
References: <20240830132100.1704-1-michal.wajdeczko@intel.com>
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

As part of the VF config release, we should reset all parameters,
including thresholds, to always start with the clean VF config.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 151eb69ab4ae..a95e546b7744 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1842,6 +1842,18 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
 	return value;
 }
 
+static void pf_reset_config_thresholds(struct xe_gt *gt, struct xe_gt_sriov_config *config)
+{
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+#define reset_threshold_config(TAG, ...) ({				\
+	config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)] = 0;	\
+});
+
+	MAKE_XE_GUC_KLV_THRESHOLDS_SET(reset_threshold_config);
+#undef reset_threshold_config
+}
+
 static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
@@ -1857,6 +1869,7 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 	pf_release_config_ctxs(gt, config);
 	pf_release_config_dbs(gt, config);
 	pf_reset_config_sched(gt, config);
+	pf_reset_config_thresholds(gt, config);
 }
 
 /**
-- 
2.43.0

