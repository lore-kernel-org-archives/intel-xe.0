Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245ACCA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 08:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ACC10E3A4;
	Wed, 27 Aug 2025 08:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBkDziky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C604210E3A4
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756284439; x=1787820439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HAr77ISWxatn2tH2Q7qqlpmPpIicOnYcLzQnMQEnn/c=;
 b=JBkDzikyfrEKGcB9uC4srYo39+EAK/NB9Elg7bcjCU2qeim3ZAdQn9kK
 5RtdK5urmU/fAI6DyuEAcZ0/tWD/47Z3LRSQ49tsW7MLmvRWHodyyp/9g
 uD/ohbz3YUHAcAjHj/rZVOpM7EUG9dqZ9CXkQQZ5IMs5XLFcB8Q4EIxcA
 SPTJX4QCIAmNCmdMOC0oP4NQyQtzZsEyTAybC1xRObpNSm5LQiQDUz5QQ
 oj93g8QAkgbKlBbuIewTI3tSkev1s1OYVmspg9JfP4Er4rycF4iYATO8r
 725XXmclfUkgGCjO3cDFBm2+Zkp2Szzqe0ccJzFmCyC+5n8zextxaSRNg g==;
X-CSE-ConnectionGUID: fjg4j71LQk2YTZVtMS+bbw==
X-CSE-MsgGUID: xBu9w4Q2SXG9LmI866bk0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69124524"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69124524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 01:47:18 -0700
X-CSE-ConnectionGUID: rk4LKhGQRASsyDEPPEwJPw==
X-CSE-MsgGUID: 1rQALBmZRbuRZgx83vknIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169394825"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 01:47:18 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v3 1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt
 a const
Date: Wed, 27 Aug 2025 01:47:10 -0700
Message-ID: <9c3c61fb24e3eeeafbe726d2b51831a0574e9856.1756284177.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Make gt, input parameter to xe_gt_mcr_get_dss_steering(), a
constant. This would allow xe_gt_mcr_get_dss_steering() to
be called from functions that have gt as const to struct xe_gt.

v2: Rebase

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 683ac021a06d..8fb1cae91724 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -362,7 +362,7 @@ static unsigned int dss_per_group(struct xe_gt *gt)
  * @group: pointer to storage for steering group ID
  * @instance: pointer to storage for steering instance ID
  */
-void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
+void xe_gt_mcr_get_dss_steering(const struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
 {
 	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index bc06520befab..283a1c9770e2 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -31,7 +31,8 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 					  u8 *group, u8 *instance);
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
-void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
+void xe_gt_mcr_get_dss_steering(const struct xe_gt *gt,
+				unsigned int dss, u16 *group, u16 *instance);
 u32 xe_gt_mcr_steering_info_to_dss_id(struct xe_gt *gt, u16 group, u16 instance);
 
 /*
-- 
2.48.1

