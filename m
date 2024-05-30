Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD3EC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 11:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1557D11B592;
	Thu, 30 May 2024 11:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FViXhqpE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1F2112326
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717070339; x=1748606339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PYlVRU/0uXcMvb72M/rHDfe/e41nr7cZdO4Fupyc4Ec=;
 b=FViXhqpEpEF9MYS1fBX/6FrJpcNPjgt5EHU31HPLzrCHw/FBburfCvgo
 inNNvxbeG78u9xcYV5Bw2jI8SCZ6nzhAJjXJcv5d+SMLhnQ67oM/atxwR
 WIvrWXsPwoqv3KyiVVJA9cbfI5/Z5q9TxMHo+ulFzCRkKS7mZkjyWPpE7
 h1dGSXhiPkvcZMDm/JRpJn0vlfE+WPCTYcKrWkiZ1RAg/LniUZv24Tsr3
 WXpScE9un74ZAjqTrqMgMXACva4fou4jQPTMYJfpKlvS/Pzjo8Pp+sge+
 +E5idDv2Vkdew7VUA9lYKWiLtIy5gDQbKDfByfgRF7kXd2DbLk8YxxUQV Q==;
X-CSE-ConnectionGUID: j4Vd+koFSsCXFVeuAgdiFQ==
X-CSE-MsgGUID: omfBQehwSAaOxvRxFAUcKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13365876"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="13365876"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 04:58:51 -0700
X-CSE-ConnectionGUID: DBn2J1onQZyKazFsu0cjDw==
X-CSE-MsgGUID: i1xDiq0EQAqmLtCF2HZNWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40232982"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 04:58:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2] drm/xe: Split MCR initialization
Date: Thu, 30 May 2024 13:58:14 +0200
Message-Id: <20240530115814.1284-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240529162945.1240-1-michal.wajdeczko@intel.com>
References: <20240529162945.1240-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The initialization order of GT topology, MCR, PAT and GuC HWconfig
as done today by native/PF driver, can't be followed as-is by the
VF driver, since fuse registers used in GT topology discovery will
be obtained by the VF driver from the GuC in HWconfig step.

While native/PF drivers need to program the HW PAT table prior to
loading the GuC, this requires only multicast writes support from
the MCR code, which could be initialized separately from the full
MCR support that requires the GT topology to setup steering data.

Split MCR initialization into two steps to avoid introducing VF
specific code paths. This also fixes duplicated spin_lock inits.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
v2: elaborate on 'basic MCR functionality' (Matt)
---
 drivers/gpu/drm/xe/xe_gt.c     |  6 ++++--
 drivers/gpu/drm/xe/xe_gt_mcr.c | 29 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_mcr.h |  1 +
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9e9da887f4ca..9309ff2bfa69 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -502,8 +502,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	if (err)
 		goto out;
 
-	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
+	xe_gt_mcr_init_early(gt);
 	xe_pat_init(gt);
 
 	err = xe_uc_init(&gt->uc);
@@ -514,6 +513,9 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	if (err)
 		goto out_fw;
 
+	xe_gt_topology_init(gt);
+	xe_gt_mcr_init(gt);
+
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 577bd7043740..386ac3269909 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -375,17 +375,34 @@ static const struct {
 	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
 };
 
-void xe_gt_mcr_init(struct xe_gt *gt)
+/**
+ * xe_gt_mcr_init_early - Early initialization of the MCR support
+ * @gt: GT structure
+ *
+ * Perform early software only initialization of the MCR lock to allow
+ * the synchronization on accessing the STEER_SEMAPHORE register and
+ * use the xe_gt_mcr_multicast_write() function.
+ */
+void xe_gt_mcr_init_early(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
 	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
 	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
 
-	if (IS_SRIOV_VF(xe))
-		return;
-
 	spin_lock_init(&gt->mcr_lock);
+}
+
+/**
+ * xe_gt_mcr_init - Normal initialization of the MCR support
+ * @gt: GT structure
+ *
+ * Perform normal initialization of the MCR for all usages.
+ */
+void xe_gt_mcr_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (IS_SRIOV_VF(xe))
+		return;
 
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index e7d03e001a49..8d119a0d5493 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -12,6 +12,7 @@
 struct drm_printer;
 struct xe_gt;
 
+void xe_gt_mcr_init_early(struct xe_gt *gt);
 void xe_gt_mcr_init(struct xe_gt *gt);
 
 void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
-- 
2.43.0

