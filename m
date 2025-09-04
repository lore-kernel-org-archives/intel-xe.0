Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB016CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD85210EAC6;
	Thu,  4 Sep 2025 19:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSEjLyQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2F610EAC6
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757014177; x=1788550177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4TkZNklJ7XyjFk0DczuKFSqtnPIXdFQaKvTnEWHB5SE=;
 b=eSEjLyQ+wAGBAZ1a1r36e0ot6il18yE7O36A2Yw/Co3v/RWBqFXB15f0
 xduf57Z7prt/PCT6gjurypUZLYiv19WpDKMl9u66kjjFY8Dw88OaBSd3m
 bouTf2NJArTvbEIQJW4tPR87dnrWz0KY7nlmihZKOmeDCleXndWjcGxUV
 MZ4M0wcYsFDbNULq5BLKNXDZCtdEZzRsK1Li2o/XXZ9mVgvZk+HsvvnQW
 fawqqpJ34oI3mkLZnXFOviH27Cv5mn8W2y1u71ackwGd1ydaBF1xQHxfM
 1Ow1hMDq5rUhSsfBUaNwGYZytObJkowZBCgEeciAxwwtsbb7sJ/vNEClM Q==;
X-CSE-ConnectionGUID: wdscdCM8SWqFBzmRfTfpPw==
X-CSE-MsgGUID: QR4xRzQLRr+fcn0+WASSKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70793978"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="70793978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:36 -0700
X-CSE-ConnectionGUID: s7lNSWsfQruyse7rHjU2nQ==
X-CSE-MsgGUID: pfH+XC1aRrCyFGBT0BSTuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="209153150"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 5/5] drm/xe/bo: Add xe_bo_has_valid_ccs_bb helper
Date: Thu,  4 Sep 2025 21:29:17 +0200
Message-ID: <20250904192918.7346-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904192918.7346-1-michal.wajdeczko@intel.com>
References: <20250904192918.7346-1-michal.wajdeczko@intel.com>
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

This will allow as to drop ugly IS_VF_CCS_BB_VALID macro.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h                 | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 --------
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8cce413b5235..5e666fc2d00b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -315,6 +315,21 @@ static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 	return PAGE_ALIGN(xe_bo_size(bo));
 }
 
+/**
+ * xe_bo_has_valid_ccs_bb - Check if CCS's BBs were setup for the BO.
+ * @bo: the &xe_bo to check
+ *
+ * The CCS's BBs should only be setup by the driver VF, but it is safe
+ * to call this function also by non-VF driver.
+ *
+ * Return: true iff the CCS's BBs are setup, false otherwise.
+ */
+static inline bool xe_bo_has_valid_ccs_bb(struct xe_bo *bo)
+{
+	return bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] &&
+	       bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX];
+}
+
 static inline bool xe_bo_has_pages(struct xe_bo *bo)
 {
 	if ((bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm)) ||
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 30aea958a337..eb8436e44ca4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -363,7 +363,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 
 	xe_assert(xe, IS_VF_CCS_READY(xe));
 
-	if (!IS_VF_CCS_BB_VALID(xe, bo))
+	if (!xe_bo_has_valid_ccs_bb(bo))
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
index 79092e386c4a..4d3c10907135 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -15,14 +15,6 @@ enum xe_sriov_vf_ccs_rw_ctxs {
 	XE_SRIOV_VF_CCS_CTX_COUNT
 };
 
-#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
-		struct xe_device *___xe = (xe); \
-		struct xe_bo *___bo = (bo); \
-		IS_SRIOV_VF(___xe) && \
-		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
-		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
-		})
-
 struct xe_migrate;
 struct xe_sa_manager;
 
-- 
2.47.1

