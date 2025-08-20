Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC6FCA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 05:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6422010E081;
	Wed, 20 Aug 2025 05:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQ5TeED3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620A610E081
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 05:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755666309; x=1787202309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HAr77ISWxatn2tH2Q7qqlpmPpIicOnYcLzQnMQEnn/c=;
 b=AQ5TeED3NORpNKfkI932/bhQrGOrX6M7yEcjSEO0ZV5tGrgVVw8oncP6
 vSkOGH2FuwbuqlMIMT8+T2JsMBnE31zaof3vZEM0snrhjrrBGqUGv7sYn
 L76T/Ph/c29sW1pd6m2c5ukp2WhhiSI1loF5YiFGmyod2VlcCZxZ7/4KA
 IJfTLNL5301Pln/FREPuqQruM5xUTpYyUWlkxOM3wF5GSMq/0U7w9LYWX
 2BoHAV5o0Dm+Dt12O4R9IRGO5r8qtQ/aAJHJxBhEYrlhtufSDhjtQnGCr
 gzgOEF5oGAW84w2r9jg47Tb0VwxXA6IShPd6DPoB2zC86EbNY+RUTBzEF w==;
X-CSE-ConnectionGUID: Z/PbGRL+TXGeF6wyBERQOg==
X-CSE-MsgGUID: VR7+4YWDSsaGhOWgPZo03Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80516511"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="80516511"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 22:05:09 -0700
X-CSE-ConnectionGUID: zk2LS0NoTV67vux+w9KYRw==
X-CSE-MsgGUID: hPNGWqYuQ8WQmxSOeYdISg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168439589"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 22:05:08 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt
 a const
Date: Tue, 19 Aug 2025 22:04:57 -0700
Message-ID: <f91cf18778cd4cf281fa5fdd26292fb39e5893eb.1755666190.git.harish.chegondi@intel.com>
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

