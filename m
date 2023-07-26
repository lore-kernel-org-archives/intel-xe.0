Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA7DC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 15:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9BF10E490;
	Wed, 26 Jul 2023 15:40:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9F110E490
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690386030; x=1721922030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B4yCAn9f69Q/7LNrtW4blMpr/g7oaQrmT7LFYzgOhRg=;
 b=WSM7jMlnOMVq4ycUAXMcTVCJ4Q+GQ8pHLbuMcOoAvgtrgPdGVm0iaGe7
 MJ03RNFzltxVRqmNkO4QKmMm+SCrJjFvNbEl9Hha/Rd5xGZOqbFJML2fJ
 ezblXJflNoulq5mkyGBvK3UnomTxiGhLROjrVIN/tPnNf1rorUYsrDanJ
 eko87738SSy149mHVF4Z92pHYc5Am+nyK3Kvm4hBWdBhEDsWajBGE3Xyq
 8iSsNhMSvnA3m3DplPX3VtSBNWlFI7R5BtIJsmbJ3EZjRqwugRMpuSOaf
 sAVXTD8d7c0PJ6CDQrmZJCS2pSUr812RNzfC7sT3Uq2+UjYvIh8GIfvUd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371664384"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="371664384"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 08:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676754115"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="676754115"
Received: from ssedlma-mobl3.ger.corp.intel.com (HELO efacde51ae96.intel.com)
 ([10.252.59.41])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 08:40:29 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 15:40:10 +0000
Message-Id: <20230726154010.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove unused xe_gt_WARN* macros
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Those specific macros are not used, removing them to prevent using
another flavor of WARN().

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 5991bcadd47e..95aa7173fbb2 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -16,9 +16,6 @@
 #define xe_gt_err(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
 
-#define xe_gt_warn(_gt, _fmt, ...) \
-	xe_gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
-
 #define xe_gt_notice(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
 
@@ -31,16 +28,4 @@
 #define xe_gt_err_ratelimited(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
 
-#define xe_gt_WARN(_gt, _condition, _fmt, ...) \
-	drm_WARN(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
-
-#define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
-	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
-
-#define xe_gt_WARN_ON(_gt, _condition) \
-	xe_gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
-
-#define xe_gt_WARN_ON_ONCE(_gt, _condition) \
-	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
-
 #endif
-- 
2.34.1

