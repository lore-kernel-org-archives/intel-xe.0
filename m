Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2330CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 18:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630F810E882;
	Wed, 27 Aug 2025 18:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4NOYCRb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A9C10E882
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756318182; x=1787854182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gWY2IpShu5aRgEZNdhCYjrQIueZIyLsnNEEw6QCE+nE=;
 b=B4NOYCRbQrmqFWTcUYWVJb7MWpR0Q1SLuWXtSQWv0hZVX1BzHnKmdCvw
 rGjMoofEk1go1J4opSp1iZDLlrlHjp01IuZz24lmHd+umizT899wD68ax
 /E2QnKVlZMZc1Z84XLfcPqrGreIJ1c0IPxCTdfGy+8Kq8mc24P7W2H2x/
 YdDCo3wnNvgJG+g3MZk6nhGi3tNQHQTSJDAeLu9GQqtqTzHYO5VsUATm4
 eVnQ2MjoXUAy3tm4kQeZW7bPYcEPPk6qM5Ae2Hr1Wc8327Wm3Vj09SaXH
 /P4ed1ZGszidofqhbost2GT4PNwr34gKS1YTXcguWp4w8mQengJqVzZ9u Q==;
X-CSE-ConnectionGUID: J3umy4nNRFKvBlNQ3l2EZw==
X-CSE-MsgGUID: yqU5xvP0RoGJCxHG7Bmxiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58289286"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58289286"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:09:42 -0700
X-CSE-ConnectionGUID: 0be7KGEiStWf15Rf93KUqQ==
X-CSE-MsgGUID: C2WzNJTVS6CsGA+CHIiA/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170070118"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:09:42 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v4 1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt
 a const
Date: Wed, 27 Aug 2025 11:09:34 -0700
Message-ID: <b131c6dec20a07acab020063df7ff22b7050c14c.1756318068.git.harish.chegondi@intel.com>
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

v4: Rebase
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

