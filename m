Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894BBC2BB85
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 19:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2A310E065;
	Fri, 21 Jun 2024 19:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VT0u96GB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6C10E064
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718996948; x=1750532948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TBRVfz59V770CKEVunjumrEF/htmzij8vc/NxrAQPI0=;
 b=VT0u96GB3rVcZJZcpt9eBdRBbbWaU5J2wDSSjhh4i6QCT+e2uwOjQM/N
 U9r2uAEKkVQLIyFVFq5cwQZnIU/YJQKTUZXFCeRjY6VSxBd1l2JmJZRx9
 IX5Mq4PkjTWn6HJfkSG3oDLkgtxPA7FqW9K41Qy+1cSVQUkxvBK632qMW
 s4HhhpAz5m2ZXxyt5uK91AmNntf+dltZEUD8Ww+4sPS4VMzhh6mhKIUxM
 1tLp6BK5LtxqYuoDaL9LY2vTmVqvQqMaEYmxXF3lvAJpxBI8L4om6oby5
 cLEGOOsjGqhUmDyeGyvoHeG0U3j7g/nTAiK85Gvi7U5v0RtovGwNlR/7i g==;
X-CSE-ConnectionGUID: 3NoA35wuSxqiTod3JV5Gyw==
X-CSE-MsgGUID: FUseQ+kWQ3+2RZ2erRy7BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16277774"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="16277774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:09:08 -0700
X-CSE-ConnectionGUID: 9AJ18aZvScm2mJPjOJqCzA==
X-CSE-MsgGUID: bHFFUGzSRaiF4sqDjin9Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="43361382"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:09:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Fix 'enum drm_xe_perf_type' kernel doc warnings
Date: Fri, 21 Jun 2024 12:09:03 -0700
Message-ID: <20240621190903.3593781-1-ashutosh.dixit@intel.com>
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

Include kernel doc's for 'enum drm_xe_perf_type' to fix kernel doc
warnings.

Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/uapi/drm/xe_drm.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 93e00be44b2d..d831f277f186 100644
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
+	/** @__DRM_XE_PERF_TYPE_MAX: Non-ABI */
+	__DRM_XE_PERF_TYPE_MAX,
 };
 
 /**
-- 
2.41.0

