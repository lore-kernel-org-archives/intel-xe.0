Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6570C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 18:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4139310E792;
	Wed, 13 Aug 2025 18:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWuCf2d/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719C810E785
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 18:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755110330; x=1786646330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ij0VKJlV/gmuUz1ws1tof7xGaPIpzY/F3blvV5cDRIU=;
 b=PWuCf2d/ImgdW7XTIsMxoIVWaoodVOWl7dfNc8DxKqbEYgie9tK+4Eg8
 gPQRoaeRZOWVJWpa9+BmcEt6KTuf3ZNs4IKYxV/1PfpFGEi0xJIpaZ27E
 Jc3yn6gR1iM1rYME6NtLvFlbwdqqgWJfTO3zmIXSKb593N1dllpOFJKl0
 HTA8E7pQiy+6jwLfDMbOU4D6jDpZO00Eb1hvmwmnksrfyxQVOxOot9nOB
 AC7ki3gY9HIgbT095dHkBWeWzTeeViVREtWtj/C5adFze4O6Pkl9IE/A1
 U52nElCelbe8POQdZgBsM5EUk+u+8LBPWV4omnzS5/eJwSF5fdzKj2Px9 A==;
X-CSE-ConnectionGUID: TfPubSL5SlW036BLWB+fBA==
X-CSE-MsgGUID: oJsZcxy3TpGkB+dejXomBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74869825"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="74869825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 11:38:49 -0700
X-CSE-ConnectionGUID: gGCRXQv7R9iogYX7LOO/Pw==
X-CSE-MsgGUID: 8E84B1CXSc2qzQzeYYdoJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="170752055"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 11:38:48 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt a
 const
Date: Wed, 13 Aug 2025 11:38:42 -0700
Message-ID: <306e119c48afa00957bfa16b326bbe6882d10779.1755110252.git.harish.chegondi@intel.com>
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

Cc: Matt Atwood <matthew.s.atwood@intel.com>
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

