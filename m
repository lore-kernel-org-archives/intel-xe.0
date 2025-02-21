Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA0CC021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 19:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19B510E16C;
	Fri, 21 Feb 2025 19:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3CGxh/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFDE10E2EF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 19:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740164466; x=1771700466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v8vWjhK/liRgXZD/5UlkCTkTIIqyrctQMTPOX49Rs8Q=;
 b=b3CGxh/r1eGR7y8ABJ20nZtDsmJ4VOIhqGSD5RawOunKJL3Huc80dm21
 vFOEHyC/JwTYPR3QCDoQzx60Cw8nyIy1vwWDwGI8InarXQbeGzqEm9o5q
 PP7Z1X4zErskOnubVCvetiwSN/0gpXXKso6TKQ5hgF6HYU5s+wOfSkgZ0
 HnnU4vjdy4NhIK6x3eKx/wnU/fm35XWb2Tt2gXzq6F5ug/ObqrwHK5Y2c
 HG/7u6La1SAw3iJPKcDv56Wrr6L3LJCGdaKcYl916OWiS6f9UjiXBX2tx
 jfq9eICk9m0WGaq6IjMsnw7Wt8FfcaQE3F5/A+kEEsVMunu1kXXufG35M A==;
X-CSE-ConnectionGUID: is4j8RKHQiyKjjIIqziStA==
X-CSE-MsgGUID: ZBHUyByYSGOcMyQ+jPRrkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41257656"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="41257656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:01:06 -0800
X-CSE-ConnectionGUID: SilKKJbSTIGZKr+eXGY4ZQ==
X-CSE-MsgGUID: R+xYMxKrRmetJ6SGof7Bzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120549695"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.217])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:01:04 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 4/4] drm/xe/rtp: Remove redundant rule to omit VF
Date: Fri, 21 Feb 2025 20:00:38 +0100
Message-Id: <20250221190038.1734-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250221190038.1734-1-michal.wajdeczko@intel.com>
References: <20250221190038.1734-1-michal.wajdeczko@intel.com>
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

After recent updates to RTP processing which to not enable
rules when running on the VF driver, explicit disabling of
rule using FUNC(xe_rtp_match_not_sriov_vf) is now redundant.

This patch reverts commit 70b8e6e3226f ("drm/xe/vf: Don't
apply Wa_22019338487 for VF") and commit c2e52eb73d99
("drm/xe/rtp: Add match helper to omit SR-IOV VF device")

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c        |  5 -----
 drivers/gpu/drm/xe/xe_rtp.h        | 11 -----------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index b607be981590..ab1901e39c44 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -358,8 +358,3 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 	return dss >= dss_per_gslice;
 }
 
-bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
-			       const struct xe_hw_engine *hwe)
-{
-	return !IS_SRIOV_VF(gt_to_xe(gt));
-}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 7874ea8588db..7a4f018ddcb9 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -484,15 +484,4 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
-/*
- * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
- *
- * @gt: GT structure
- * @hwe: Engine instance
- *
- * Returns: true if device is not VF, false otherwise.
- */
-bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
-			       const struct xe_hw_engine *hwe);
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 228436532282..c7f6ee1a8c74 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -35,7 +35,7 @@
 		GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
-		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
+		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
-- 
2.47.1

