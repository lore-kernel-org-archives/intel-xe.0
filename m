Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC40CAC586
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 12:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD52210E50B;
	Mon,  8 Sep 2025 12:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTOSAlb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814B210E50B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 12:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334646; x=1788870646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pvHXCxRgetiP999W5qSmAKLMBV4LkohoDJE/sCG4CV4=;
 b=DTOSAlb7yPzCdZMUDm6LQHMTvU9FydLhKaV8ON0m/Jepu7AZ3ZeqIixr
 Cg2pguJPdZoVBJF89nHG428fgn0652D7NzzSX101s5P7KSwV1z4jyNMvd
 r+wL8Y7rJfG0Fs2fqRkj8ewTZwxfJPpXtLH+/VLwupRhYN1CX77JSfbJt
 jGgzgc7meNoSh+AvCSSLnXZfEsm6ar78Sj9vb8fpX7/rX7P43EMlSnujz
 UU9k2XtLIl6EMd5DX9SzMqcD+dp4oP7uPQnMj+AENCZn/vUdXrZc4rpAj
 JF502MkkUchxNhXdBeNLHY8WPqtiePoF5UeifkUX+IzE6Px6yBy/8uZHx w==;
X-CSE-ConnectionGUID: mBm2IXqmQ3aQQb05qPVS+w==
X-CSE-MsgGUID: kJHw8JdBSJOLtp5RtmORNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59526307"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59526307"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:45 -0700
X-CSE-ConnectionGUID: e6FsbXn4RNK5C4y66IVXeg==
X-CSE-MsgGUID: 5DIThssuRPKvGVdOWtubXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172656433"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 5/7] drm/xe/bo: Add xe_bo_has_valid_ccs_bb helper
Date: Mon,  8 Sep 2025 14:30:22 +0200
Message-ID: <20250908123025.747-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908123025.747-1-michal.wajdeczko@intel.com>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h                 | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  2 +-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 --------
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index cfb1ec266a6d..c7ee9c7605e5 100644
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

