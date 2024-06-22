Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06804C27C53
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jun 2024 15:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F14110E287;
	Sat, 22 Jun 2024 15:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7C91Jrm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76F110E287
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Jun 2024 15:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719071495; x=1750607495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/RoVALCj/Q2zRI0cEelp1GDkgi17yGlfFl22es+6sBU=;
 b=H7C91JrmFCZbO2RETR42PSRVOFRlz7SyMWFn+KZCdkmYu0wXAwMxi2ai
 iYdTfqqfs9+vC+hx6h0+NWBuv+pG24r/GYZkBr+AdPIe6shI7Cok++xh2
 gq/4KSr0QzHu/e8p4PZbuUN/kXHyU/gI6Vg58Fw9vpDAZ80ns6EZrYLMP
 +Ub0rIWROUEcdb4oO7C8dMT6ipNfetCZNl5rY3RJiuJ8hJCp4+rPzotZU
 kkJlg+6Iea6Oh2adyYDN0zdfc3+LDOEJCpcJYYB0cdAwpgVGZqSNd2RUZ
 hG6L6WoRLliJgKagsaHDlSP9wqquQD1w3t1LITYWbqQlWFExVsoT24yGf A==;
X-CSE-ConnectionGUID: bgDysDiHQkOR2kjOdQei0A==
X-CSE-MsgGUID: zQdQ8Yo2THK0rrSYlJ7EVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="19976416"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; d="scan'208";a="19976416"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 08:51:35 -0700
X-CSE-ConnectionGUID: NC91BRPlQD6Ovdk6I5nvMg==
X-CSE-MsgGUID: sOnR3B0hSnm370jXTIay+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; d="scan'208";a="43547171"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 08:51:35 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/oa: Fix kernel doc warnings in xe_drm.h
Date: Sat, 22 Jun 2024 08:51:31 -0700
Message-ID: <20240622155131.3671979-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Fix kernel doc warnings in xe_drm.h. Also make sure that private/non-abi
enum definitions are distinct from real enum definitions and don't generate
kernel doc.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 include/uapi/drm/xe_drm.h  | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4168b51cf7b5..fe6e29fb06b7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1692,7 +1692,7 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
 	int err;
 	u32 idx;
 
-	if (XE_IOCTL_DBG(oa->xe, ext_number >= DRM_XE_OA_PROPERTY_MAX))
+	if (XE_IOCTL_DBG(oa->xe, ext_number >= __DRM_XE_OA_PROPERTY_MAX))
 		return -E2BIG;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 93e00be44b2d..4dc90badce67 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1379,8 +1379,11 @@ struct drm_xe_wait_user_fence {
  * enum drm_xe_perf_type - Perf stream types
  */
 enum drm_xe_perf_type {
+	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
 	DRM_XE_PERF_TYPE_OA,
-	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
+
+	/* private: non-ABI */
+	__DRM_XE_PERF_TYPE_MAX,
 };
 
 /**
@@ -1612,8 +1615,8 @@ enum drm_xe_oa_property_id {
 	 */
 	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
 
-	/** @DRM_XE_OA_PROPERTY_MAX: non-ABI */
-	DRM_XE_OA_PROPERTY_MAX
+	/* private: non-ABI */
+	__DRM_XE_OA_PROPERTY_MAX
 };
 
 /**
-- 
2.41.0

