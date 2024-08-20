Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F4EC5472F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 02:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC46510E49A;
	Tue, 20 Aug 2024 02:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRcdgKh6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FF910E361
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 02:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724119905; x=1755655905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dD+2+8m25w6VMWRiaZnP+Yh2MKDGik+mfRWyA/Rv2/Y=;
 b=cRcdgKh6ETTJYDzNjy2ILciK2iaHfT6ESpgmOa8LGE40ZWDeqfwiHbZ8
 8MTsl7wwYDynvl0coqEp5yXJZR876uUhH2RUWPu9ZszbQy9lxNTRp+lOJ
 ygad1nh8akvb2fbUxri4YAe+sSYOAOyfdqcUxb2N4iEH9hqLLAChFUn/H
 AxLyUT8waoymH30Eu6WlbiJiFBA9oalQP6vePU4rhDPCsj1YyiFFzl9pq
 YanLEq/NY6jveCBHRFMOKBa7Xkqqe2LafoTbQrIoJt3aaSu+UG74U6rkM
 8taB1LGsq9PkI9D/XkZCaC4n5bYChP1Ru+NSYEEnSk4kx24xOcLUtX3qB A==;
X-CSE-ConnectionGUID: CAMq69pkQR6AKTHWVAMDdw==
X-CSE-MsgGUID: 2xEg+VOKRBaVeK1ElOxY2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33780416"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33780416"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 19:11:44 -0700
X-CSE-ConnectionGUID: TomoIxZvSr+x1H5FOhKpBw==
X-CSE-MsgGUID: MFJzhUB/QWK7CY/+DO5TjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="61126122"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 19 Aug 2024 19:11:45 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v16 6/7] drm/xe/guc: Add dss conversion from group/instance ID
Date: Mon, 19 Aug 2024 19:11:41 -0700
Message-Id: <20240820021142.436536-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820021142.436536-1-zhanjun.dong@intel.com>
References: <20240820021142.436536-1-zhanjun.dong@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt_mcr.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 7d7bd0be6233..eff9468ca371 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -352,6 +352,17 @@ void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group,
 	*instance = dss % gt->steering_dss_per_grp;
 }
 
+/**
+ * xe_gt_mcr_steering_id_to_dss - Get DSS ID from group/instance steering
+ * @gt: GT structure
+ * @group: steering group ID
+ * @instance: steering instance ID
+ */
+u32 xe_gt_mcr_steering_id_to_dss(struct xe_gt *gt, u16 group, u16 instance)
+{
+	return group * dss_per_group(gt) + instance;
+}
+
 static void init_steering_dss(struct xe_gt *gt)
 {
 	gt->steering_dss_per_grp = dss_per_group(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 8d119a0d5493..3c84b20b10c9 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -28,6 +28,7 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
+u32 xe_gt_mcr_steering_id_to_dss(struct xe_gt *gt, u16 group, u16 instance);
 
 /*
  * Loop over each DSS and determine the group and instance IDs that
-- 
2.34.1

