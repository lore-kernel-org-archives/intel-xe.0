Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07418C41513
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AAF810FD6D;
	Mon,  6 May 2024 13:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JflLrXBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CB210F07D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002713; x=1746538713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DE+sdG2zzoNftpwgFkp1nZKE3sT4FDxe7lB3OXEbBuM=;
 b=JflLrXBx9GtBuhK4dHom26BMz+laS5x9AOBspxYSxzOSmIHFeZdiQ+Ys
 Duh24FEjKKL9DWHlbJBk0PLTVXabrfSlSDedCg5tCQYKX9oJBqrSW8nLd
 /ePQiZF7gt2Uw9haZZOG7q8hEhBhe/pMLv7fPXlv/vK1WpO/6e0aCyL9r
 oM5Tk6nj7+tg6gR5LIUs7kLrIpaF9e76Q5fnbk8RGVo4S41VetXBIstVw
 W/0Qq2mT9gUNKqhL+Z3X7M+KfHDmh1IaqIpMO1ZkzxU3V1E6p2LceZV6P
 L6B3ic7XpnM7ITrdfX/f8EHHmYlwK8jRc1C55fZiu2WmUZyTyYxl3sZ6P w==;
X-CSE-ConnectionGUID: VFLNzWXZQMKBwt/W/nSovw==
X-CSE-MsgGUID: ZTXBD9WdQ9yZhOcd+Ug6Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903420"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:33 -0700
X-CSE-ConnectionGUID: V1GZymmpTa+GFsPsCsjv5Q==
X-CSE-MsgGUID: 4LD7YVNhRnCucTjfvebimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28131681"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/8] drm/xe/guc: Add support for threshold KLVs in to_string()
 helper
Date: Mon,  6 May 2024 15:38:09 +0200
Message-Id: <20240506133814.2571-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

Use MAKE_XE_GUC_KLV_THRESHOLDS_SET to generate missing conversion
of threshold KLV keys to string.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index ceca949932a0..cf7c5fed407d 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -8,6 +8,7 @@
 
 #include "abi/guc_klvs_abi.h"
 #include "xe_guc_klv_helpers.h"
+#include "xe_guc_klv_thresholds_set.h"
 
 #define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
 
@@ -48,6 +49,14 @@ const char *xe_guc_klv_key_to_string(u16 key)
 		return "begin_db_id";
 	case GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY:
 		return "begin_ctx_id";
+
+	/* VF CFG threshold keys */
+#define define_threshold_key_to_string_case(TAG, NAME, ...)	\
+	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):		\
+		return #NAME;
+	MAKE_XE_GUC_KLV_THRESHOLDS_SET(define_threshold_key_to_string_case)
+#undef define_threshold_key_to_string_case
+
 	default:
 		return "(unknown)";
 	}
-- 
2.43.0

