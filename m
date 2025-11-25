Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3610BCFD379
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 09:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACE310E39A;
	Tue, 25 Nov 2025 09:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Od7BUFwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A7310E39A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063842; x=1795599842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzadOiyE+Tx5x4FECMe6Zh0+EJO+VxRF2ijqAXBIwQ4=;
 b=Od7BUFwRd4Z+AY1VE2Hz2WZgkKUyjDoZUjRf64RTixqTos4NRkg6wfqU
 yLBSrp34gE+R1lJSzM726zCrLxERMaRR1t3HGARitASFv+gFrNvAjiaQ1
 RNmQpID0kJgjZjTaFhHKDaDtVlFiE7y3jEqybMHxWDt/IeV2DjHO4Z5Ij
 pZNEvla0EJ+3b7T8OalBDstl2rhWFJALfgVzq7Tms/PJI86cPIC5bFbqv
 52G0LGAWpxZtacUlFFzPiSqKg/sAFqyOvXNqs7voq73gZ6Z5CFNvEA7i6
 LbTLXPN9GOX3Qx46rdbvGf3JJ0HKg3Ps5mxm5ehpeMsnbRVGPFCxItmQi w==;
X-CSE-ConnectionGUID: 6vuu31SsSTGBXtTrmUWYCg==
X-CSE-MsgGUID: m5u37h6WSc6TqRz/s+Cg4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69934128"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="69934128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:44:01 -0800
X-CSE-ConnectionGUID: 5g8G7f3RRxWO/VUrhFnFTA==
X-CSE-MsgGUID: SEr9CeVPSj2y23xi+AbZFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192405218"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk..)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:44:00 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 2/3] drm/xe/xe3p_lpg: Enable L2 flush optimization feature
Date: Tue, 25 Nov 2025 15:13:34 +0530
Message-Id: <20251125094335.12028-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125094335.12028-1-tejas.upadhyay@intel.com>
References: <20251125094335.12028-1-tejas.upadhyay@intel.com>
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

When set, the L2 flush optimization feature will control
whether L2 is in Persistent or Transient mode through
monitoring of media activity.

To enable L2 flush optimization include new feature flag
GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
media type is detected.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 3 +++
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d6672cf30d3e..b3bf8d168f0a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -96,6 +96,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (xe_guc_using_main_gamctrl_queues(guc))
 		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
 
+	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
+		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 7d93c2749485..9aff0e454c7f 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -115,6 +115,7 @@ struct guc_update_exec_queue_policy {
 #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
 #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
+#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
 
 #define GUC_CTL_DEBUG			3
 #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
-- 
2.34.1

