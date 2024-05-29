Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280B5C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 16:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0410110E253;
	Wed, 29 May 2024 16:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4Oic9wm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD9C10E253
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717000199; x=1748536199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=29zR/y7abGmVUNGE4wYUL/rm5AAQ6r8s85etoH9awnk=;
 b=U4Oic9wmAwXsFyT2xOHQ1bdDojanbLH1lK2ythWtmAWD4dPwFHe0M3ve
 rKCDEoCU/xIsUFJk+lsv+/jIGOY1aXjpoST91tTxOhz7TcpOFl/oaxdn9
 YHBxpUu/9b0KgowTW1dTQ6FvfothWAjQuXyqXfxY2TeLiLjsSauPHTIBp
 pieDuNsicJu1FtkdiZRR/N4guLvNcoTzDgFOF0cO25hLSmF8jfa8kKXpd
 0wHYqeCUnSPP1Qh/gF4Emftm/McVq0h8caenDGpv4J7o8GOSz3GnVfFeG
 8SwebvNdWbW5PGVxHXcCNpA0dDjiedawi26my6OTHpS7K15DJLmN2JFBL A==;
X-CSE-ConnectionGUID: QQPDjnuNQi+6pVdgWvXZ8w==
X-CSE-MsgGUID: GMi5mXb0TGOD0F6AS7a/xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13191522"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13191522"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:29:59 -0700
X-CSE-ConnectionGUID: ifHEteyDStCvIC+VYIj2eg==
X-CSE-MsgGUID: lQyjbE0iR/e9E44SPOWhMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="36109008"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:29:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] drm/xe: Split MCR initialization
Date: Wed, 29 May 2024 18:29:45 +0200
Message-Id: <20240529162945.1240-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We can't follow the same initialization order of GT topology, MCR,
PAT and GuC HWconfig, as done today on native/PF driver, on the VF
driver, since fuse registers used in GT topology discovery will be
obtained by the VF driver from the GuC.

While we need to program the HW PAT table prior to loading the GuC,
this requires only basic functionality of the MCR code, which could
be done separately from the full MCR initialization that may need
the GT topology.

Split MCR initialization into two steps to avoid introducing VF
specific code paths. This also fixes duplicated spin_lock inits.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
---
This is alternate solution than proposed in [1] that VF needs.

[1] https://patchwork.freedesktop.org/series/134157/
---
 drivers/gpu/drm/xe/xe_gt.c     |  6 ++++--
 drivers/gpu/drm/xe/xe_gt_mcr.c | 29 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_mcr.h |  1 +
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 34c1896807e9..7c87edc06ffc 100644
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

