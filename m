Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547BAD7789C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 17:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AA810EB89;
	Fri, 23 Jan 2026 17:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="da312w+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF7710EB89
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769191163; x=1800727163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nzKSZihFL79X2B5cewaOh0+JSpdNDTyb2jYRPQ3VoVQ=;
 b=da312w+UL5Fg1X7NF8YkQHxeHufwnGKMvrSZNggOvPJGOc8OsdOvymxj
 NMnRMv2PTrSKJr+GLtnCNdHFomMCgX1zgCi7xXWFASPTpEyQLR99Kcwah
 1s4YKlcpN4vGOL8coxK82FGav2irRT/HlgY8oYbjIOknLC9kSywea1nCH
 B3CFDim4C0YPICHyYmd6njZMy5AjpbGovru++BzbWBssOgXa09ZTXTZD/
 9KnYXNdHEHAmZTvYQqDXJhhvS4KuI1ORuCjhLxMK16evQU8+eRu4FG3h0
 pv7UV0X6M12pfsBVW+YUIY4hbzgG1cy53ycWx4Jqt73zO9Sr9tqZDTACT w==;
X-CSE-ConnectionGUID: 0niuF/v9RR+qpwFv1iR1LA==
X-CSE-MsgGUID: SGKkG93wQ6SxI1ACgnqxKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70507038"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70507038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:59:22 -0800
X-CSE-ConnectionGUID: YI1tHpa4Tly3DF9wDmQo5Q==
X-CSE-MsgGUID: Dg+2vjQVTDCgjH2rVwe+3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206199321"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa006.jf.intel.com with ESMTP; 23 Jan 2026 09:59:21 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 1/1] drm/xe/gsc: Add devm cleanup action to xe_gsc_proxy_start
Date: Fri, 23 Jan 2026 12:59:20 -0500
Message-Id: <20260123175920.230494-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Split xe_gsc_proxy_remove into two parts: xe_gsc_proxy_stop for cleanup
operations and xe_gsc_proxy_remove for component removal only.
Add devm managed cleanup action at the end of xe_gsc_proxy_start to
ensure proper cleanup when the device is removed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index 42438b21f235..0b76b29bf2d5 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -435,15 +435,12 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 	return 0;
 }
 
-static void xe_gsc_proxy_remove(void *arg)
+static void xe_gsc_proxy_stop(void *arg)
 {
 	struct xe_gsc *gsc = arg;
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (!gsc->proxy.component_added)
-		return;
-
 	/* disable HECI2 IRQs */
 	scoped_guard(xe_pm_runtime, xe) {
 		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
@@ -455,6 +452,16 @@ static void xe_gsc_proxy_remove(void *arg)
 	}
 
 	xe_gsc_wait_for_worker_completion(gsc);
+}
+
+static void xe_gsc_proxy_remove(void *arg)
+{
+	struct xe_gsc *gsc = arg;
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!gsc->proxy.component_added)
+		return;
 
 	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
 	gsc->proxy.component_added = false;
@@ -510,6 +517,8 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
  */
 int xe_gsc_proxy_start(struct xe_gsc *gsc)
 {
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	/* enable the proxy interrupt in the GSC shim layer */
@@ -528,5 +537,5 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
 		return -EIO;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_stop, gsc);
 }
-- 
2.34.1

