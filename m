Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408E9C54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 21:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF1F10E41C;
	Tue, 27 Aug 2024 21:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2P3zhlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F2610E0E0
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724795250; x=1756331250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZM6ChXbeaff7TC5Gye0zLrsgmHVfgaUtW0k3J0CZ+/U=;
 b=c2P3zhlMXzyriJAGZtsdnDSG/0GNPJDsam1Sj2/2bDte8OlzgaPlWBUc
 IlW9JEmDOYOtTzctrEK9YVpynLO1OxreY8Nq0Acgc+C/B38PHVY723tS5
 5SEwF5/4odYYdiixv55YleHiCVLr/5AdEWFnF/Z1sfRSfH6PLb7mQI+DS
 +ZeiTyOhSzt3i+rtlWyUfyMy1E02S9Wo4bz2lVFWKE5t8NShwitN+0abo
 uGOSqSsiTaTj+WsOr5OMhSFYPA1VwtY5gT0NLY975S32IerHjsqhYqddw
 PUWP36r95oIiQ+vGxhcFIfuERK/3UAUHw6ej+SW9lCgWuPD6USm3fZWqG g==;
X-CSE-ConnectionGUID: lE5HGxaLRPa2Dp0C5UbhQw==
X-CSE-MsgGUID: QF/C/4KFSSmn2N1PO2lEzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48683913"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="48683913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 14:47:29 -0700
X-CSE-ConnectionGUID: f3kmOGGYTSy1xoF6uLAuPA==
X-CSE-MsgGUID: l9hfi5QwQUu6mtzVVs0dtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62733192"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2024 14:47:28 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v17 6/7] drm/xe/guc: Add dss conversion from group/instance ID
Date: Tue, 27 Aug 2024 14:47:25 -0700
Message-Id: <20240827214726.1183935-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827214726.1183935-1-zhanjun.dong@intel.com>
References: <20240827214726.1183935-1-zhanjun.dong@intel.com>
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

Add dss conversion from group/instance ID.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_mcr.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7d7bd0be6233..5deef7ee7925 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -352,6 +352,19 @@ void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group,
 	*instance = dss % gt->steering_dss_per_grp;
 }
 
+/**
+ * xe_gt_mcr_steering_info_to_dss_id - Get DSS ID from group/instance steering
+ * @gt: GT structure
+ * @group: steering group ID
+ * @instance: steering instance ID
+ *
+ * Return: the coverted DSS id.
+ */
+u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance)
+{
+	return group * dss_per_group(gt) + instance;
+}
+
 static void init_steering_dss(struct xe_gt *gt)
 {
 	gt->steering_dss_per_grp = dss_per_group(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 8d119a0d5493..c0cd36021c24 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -28,6 +28,7 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
+u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance);
 
 /*
  * Loop over each DSS and determine the group and instance IDs that
-- 
2.34.1

