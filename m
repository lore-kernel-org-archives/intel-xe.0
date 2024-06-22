Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF80C27C53
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jun 2024 15:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DEC10E287;
	Sat, 22 Jun 2024 15:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNwbRbwN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9830610E287
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Jun 2024 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719071965; x=1750607965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yrphl4/GVF/c1FnVcX5BuSCTwyYbzy/kGSdHPyd0F6o=;
 b=FNwbRbwNgx5swtueCDhWY6Z725Xt2ogil/nwfkzYzNlh9QODvgReHbd4
 vnw+NFZpCQ8JwPDVqQzGarqTE9o8oI1peFal0LDKlVTzae1fkTkX3tnoZ
 vzgW9cmvx2WAbgY5DJBYpdrXkl/dP0HeBW0chV/wmvhe1rmS3/zu90L8V
 O03491G+tGgRTkO3L4TTzBjxCEafUvaDQUq8tTZSLKshKfTcltlEbnoOK
 L+253JE0RvNszkGDLwLHfmkBT+yoy+FfG1FiAjO2l09uqGpLD+2rgQSaC
 dU5FSVDTzFQZIKd8EaUDgUaOohvP2IeKImGhi8vUh0LRdRp+Osl6r5MTZ Q==;
X-CSE-ConnectionGUID: /HzdmLZtReeeLwY8PcRPUQ==
X-CSE-MsgGUID: L9mscbRrQZ2TmTmzLhLlTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="26777502"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; d="scan'208";a="26777502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 08:59:25 -0700
X-CSE-ConnectionGUID: 10XvB2iYQj+1EsCcFV4MNQ==
X-CSE-MsgGUID: kL/4xPZzTjyAbzxo51pRWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; d="scan'208";a="73614190"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 08:59:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2] drm/xe/oa: Fix kernel doc warnings in xe_drm.h
Date: Sat, 22 Jun 2024 08:59:18 -0700
Message-ID: <20240622155918.3675409-1-ashutosh.dixit@intel.com>
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

v2: Remove __DRM_XE_PERF_TYPE_MAX since it is unused (Michal)

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 include/uapi/drm/xe_drm.h  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index 93e00be44b2d..6bc543db3e9d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1379,8 +1379,8 @@ struct drm_xe_wait_user_fence {
  * enum drm_xe_perf_type - Perf stream types
  */
 enum drm_xe_perf_type {
+	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
 	DRM_XE_PERF_TYPE_OA,
-	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
 };
 
 /**
@@ -1612,8 +1612,8 @@ enum drm_xe_oa_property_id {
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

