Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC4BCA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 23:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D1A10E040;
	Tue,  2 Sep 2025 23:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kb6irL6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBF510E040
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 23:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756856527; x=1788392527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rWhNzMO2zK9bq+YqzQqYBx7MIEXioQZ4TTFMZsueYZ4=;
 b=Kb6irL6vo2JUTawnb425vt+4B2lKunrE134lrl8UbSd5hjTdQaTHInNG
 q+N1wVGRY0dSNF5HjnauuHzCvPHhneQn66xOFp9VStrSADKIQDMIlkq5e
 gLNmZcSKrWGrp3Hgtal3tWxPTG1+Oe2ZXrPlN89HVgt/UVprGSv+JUpUh
 /jYnSftCuEC6buNk1Rf739lW3OJJLec+DN687s+FXbfVhG5bKnPiToqb+
 fVYAz7nw7HtjMhh2qsm5ae+vlRO7bMLDrYU7fC4opZdxlOboRiMVChPeo
 hCRmAMGvctwKny8p6g9y7HkQdBif7IKmbm2+HtGfLGOAELZzcAS18d6wC A==;
X-CSE-ConnectionGUID: 4856+PAiQgmUxpSw/QAGxQ==
X-CSE-MsgGUID: N4ZvYXLhTXWO9MtXRTTLqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70536482"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70536482"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 16:42:06 -0700
X-CSE-ConnectionGUID: cWKGPCHCSH+fAiI8g2lxng==
X-CSE-MsgGUID: vEf0nHQAQZCqlF4X2D9B2w==
X-ExtLoop1: 1
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 16:42:06 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 1/2] drm/xe/mcr: Make xe_gt_mcr_get_dss_steering() input gt
 a const
Date: Tue,  2 Sep 2025 16:41:59 -0700
Message-ID: <9dc621a90880f62ac8e2951afea7952277f7eb0e.1756855529.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.51.0
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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
2.51.0

