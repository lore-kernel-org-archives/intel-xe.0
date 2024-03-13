Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C20C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 22:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6410F00A;
	Wed, 13 Mar 2024 22:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIik7HX3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2F210EED2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 22:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710367886; x=1741903886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XrkoaIDHWkRE84fG5/Yt7A7TIMU/ic+7yFnyXVsnv7c=;
 b=HIik7HX3LNz3djQMuPlJsr9zbobsChAg4JRw+jcYu2ItTZASvxa+9r+A
 4aSZT5q6TUsFPYx6EbX4dp9nPeu39ZRdczDbVn9zVIs3dZ4GcQJEsZgtu
 5mZcyJVBy6UaFPkX4zMKgp5YT4e3ykd+trBwtlDrGgPjpUVEj6pGdDRYl
 rFH57thlo+fyf/L/bKihPCikowR4iy10t2luJdOkqqSxVhkc6Wx2oEVLN
 Fmxhn8lrSU9FbBYat1cwZg+SkEKSMH2bRYAtF0mtNHnNutaBJgEOgHAb3
 fgUGSW74lSNrC+qd60TOMtmDJbWlnrV3AuDo2kieFQrEVGuxXuSOBSCPZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5027627"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5027627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11964300"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:11:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/4] drm/xe/guc: Move GUC_ID_MAX definition to GuC ABI
 header
Date: Wed, 13 Mar 2024 23:11:09 +0100
Message-Id: <20240313221112.1089-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240313221112.1089-1-michal.wajdeczko@intel.com>
References: <20240313221112.1089-1-michal.wajdeczko@intel.com>
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

This macro represents GuC firmware capability and shall be defined
in the firmware ABI header. Move it to xe_guc_fwif.h file.

Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_fwif.h   | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index c281fdbfd2d6..5474025271e3 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -14,6 +14,8 @@
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
 #define G2H_LEN_DW_TLB_INVALIDATE		3
 
+#define GUC_ID_MAX			65535
+
 #define GUC_CONTEXT_DISABLE		0
 #define GUC_CONTEXT_ENABLE		1
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19efdb2f881f..9f8ce2d1f6a0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -242,7 +242,6 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	mutex_destroy(&guc->submission_state.lock);
 }
 
-#define GUC_ID_MAX		65535
 #define GUC_ID_NUMBER_MLRC	4096
 #define GUC_ID_NUMBER_SLRC	(GUC_ID_MAX - GUC_ID_NUMBER_MLRC)
 #define GUC_ID_START_MLRC	GUC_ID_NUMBER_SLRC
-- 
2.43.0

