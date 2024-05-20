Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7A9C25B77
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 21:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943E110E5DE;
	Mon, 20 May 2024 21:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+Dnv5A2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA9310E5DE
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 21:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716240232; x=1747776232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SUTU0//l1YOTKR2sz3A9xlQk5cOONf903XvFGuYp7s8=;
 b=A+Dnv5A2eTrgjqoZcMVaja+RanYIM5+a495toE0OECvAdeM0ScTuNltX
 J9dptcQl1Po9f5ZkLOLYPzuhu4jPOQs+fZn8K4TiUfzAlUtydxdotPtHo
 pHr4rlpsvdvHJrVUsxRA7gaA4x7ZqpUYAPZlICNIKWsvx9/dyBjGd6RKC
 tB3P7OQCU+GHtslNgQUHUVS+GLP0e5+xXgfcju3N2bE+U4jZkS1cdgEqW
 NWoJ1z5RxC64EH5NgCqjOJ+lo7XXYDxv0hVA2mGDYwBF3/Tf2+aGSVkK8
 KgBGblk5rQ4IH+/aUMPd74SGVnr2uXUtVfw1CvG2EEyKVae3/pGqAJz87 Q==;
X-CSE-ConnectionGUID: MmRwTxi0SLeFLQgGcPngGQ==
X-CSE-MsgGUID: g0Ehc5FMS0W2snHIcN8hSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12573255"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="12573255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:23:52 -0700
X-CSE-ConnectionGUID: xi5Ksy3nTFeZTfwSlKUWjQ==
X-CSE-MsgGUID: kLQme+EKRqK4KtV3v7sr+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="37053928"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:23:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Allow to initialize submission with limited
 set of IDs
Date: Mon, 20 May 2024 23:23:29 +0200
Message-Id: <20240520212330.2436-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240520212330.2436-1-michal.wajdeczko@intel.com>
References: <20240520212330.2436-1-michal.wajdeczko@intel.com>
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

While PF and native drivers may initialize submission code to use
all available GuC contexts IDs, the VF driver may only use limited
number of IDs. Update init function to accept number of context
IDs available for use.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 drivers/gpu/drm/xe/xe_guc_submit.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e52b544ac690..807ad53449e4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -358,7 +358,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc);
+	ret = xe_guc_submit_init(guc, ~0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4efb88e3e056..9a7885a9b4c1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -278,7 +278,7 @@ static void primelockdep(struct xe_guc *guc)
 	fs_reclaim_release(GFP_KERNEL);
 }
 
-int xe_guc_submit_init(struct xe_guc *guc)
+int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -288,7 +288,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	if (err)
 		return err;
 
-	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
+	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 4275b7da9df5..4ad5f4c1b084 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -12,7 +12,7 @@ struct drm_printer;
 struct xe_exec_queue;
 struct xe_guc;
 
-int xe_guc_submit_init(struct xe_guc *guc);
+int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
 
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
-- 
2.43.0

