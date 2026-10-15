Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B5FCCA462
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 23:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461DE10E08E;
	Thu, 15 Oct 2026 23:34:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA92510E08E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 23:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792107242; x=1823643242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tUTisxh5+gNfcEczItYtyIH52T2uZ+UC1E+0LhaD0As=;
 b=lRMuibAYeueGdPNKz7slAwhWIrtRx3YDEZi19pxwQGPXYkGDo+4ixWmD
 DJDjop/DVFDAdiDYoUkMgHZUlKtsV8OWpYxfYZzHeb0HRLVVKaY5NMO35
 yfRvK6DB2lFzBGSLQBLcpnkUismGRGUNKhLtOpfea/1L5Q20XeEBimtYs
 j2lhTw/p6+eWB4GsCDnWy7Sk0NpbmUwK0GoxKP8df2UWxcG+xY/hyZ4fR
 zaBg+d2FFsib2XkYGobYBZSNcTrJTN6GEQCUM1ACxlZQLtutbQoK0v75I
 /9uz9+lkUy6xHfcGQxC/oDoE+DPo9sawyTCo1ww3QBYLBm1YcSYuAa4dS g==;
X-CSE-ConnectionGUID: qDTGllJwRPy5YS7kOOjwKA==
X-CSE-MsgGUID: fSM04HqcTUeOSbA+LMnIbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="891367"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="891367"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 16:33:57 -0700
X-CSE-ConnectionGUID: q8l8uF+lTq2g1/HY6mBjPw==
X-CSE-MsgGUID: wncZitHRRZaGFp5bIQHDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1814613"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 16:33:57 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 3/3] drm/xe: Memset g2g buffer on resume
Date: Thu, 15 Oct 2026 09:54:55 -0700
Message-ID: <20261015165451.154495-8-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
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

KMD creates this buffer for use by GuC, it is also responsible for zeroing
it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
so we cannot trust its contents after a suspend cycle. This commit adds
xe_gt_resume_early() function for handling this and the C6 disable
during resume.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c |  4 ++--
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 775c826b68b4..02f5d48b1a65 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1069,6 +1069,24 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 	return ret;
 }
 
+/**
+ * xe_gt_resume_early() - Early init for GT resume
+ * @gt: the GT object
+ *
+ * Handles GT related init before GT restart after a suspend cycle.
+ */
+void xe_gt_resume_early(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc *guc = &gt->uc.guc;
+
+	xe_gt_idle_disable_c6(gt);
+
+	/* clear the g2g buffer which is marked as NORESTORE during alloc */
+	if (guc->g2g.bo && guc->g2g.owned)
+		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
+}
+
 int xe_gt_resume(struct xe_gt *gt)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 92d934d50244..9b69f36ebc7a 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
+void xe_gt_resume_early(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 int xe_gt_runtime_resume(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 1f5097875bcd..89d64aa6577d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
 		return err;
 
 	for_each_gt(gt, xe, id)
-		xe_gt_idle_disable_c6(gt);
+		xe_gt_resume_early(gt);
 
 	xe_display_pm_resume_early(xe);
 
@@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 
 		for_each_gt(gt, xe, id)
-			xe_gt_idle_disable_c6(gt);
+			xe_gt_resume_early(gt);
 
 		xe_display_pm_resume_early(xe);
 
-- 
2.53.0

