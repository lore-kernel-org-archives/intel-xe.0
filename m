Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C59FCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 23:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD6E10E716;
	Tue,  7 Oct 2025 23:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/nHJLFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599C710E716
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 23:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759878314; x=1791414314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z/asjauNE5dRjTCBN2QSA3ID9CvBWrGs3HKlkuGIvXM=;
 b=l/nHJLFogD/WBFaVfeQbB5V64V0IPpjdzzUa2KHWoxPUuTGLPU25pgFb
 6Ud9G/o2NFS5wN6sehAi6xvWO6NzGBpGTrY7sMYAQb4fk6Pi3vj6a1AsA
 Daj/Hij0dD8HH1NmSi5z53EKPOjhyXa/0Oxn6+SqwNzWQ1cmqwpBrr/5H
 FjPeYfepxau/1g7WOxKpHlT1PtEPHbIFmTsAdpkM3pdxY/MZ6ir834Jmf
 0tsUCDNqOae6S9lDWUEYym5Dv71+WF+3UcgC5ziWOq2/iSLH2pnAO5WgW
 f8RjgLdOOR6mk78+orf8b3UV1OKpSv4zyPceA2TdeclzzMYwGq0unX5M+ w==;
X-CSE-ConnectionGUID: rQZcOaSZRxuHbkFRemIPbg==
X-CSE-MsgGUID: bQkCDQISTTGEhZch78lw8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="65717381"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="65717381"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 16:05:14 -0700
X-CSE-ConnectionGUID: IYQtzDyUQYGapppNz1bsTA==
X-CSE-MsgGUID: WB5c98acSi+fbNTdSOhbNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="184561757"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa004.jf.intel.com with ESMTP; 07 Oct 2025 16:05:12 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Enable media sampler power gating
Date: Tue,  7 Oct 2025 16:02:08 -0700
Message-Id: <20251007230208.1567234-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Where applicable, enable media sampler power gating. Also, add
it to the powergate_info debugfs.

Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_idle.c      | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 06cb6b02ec64..4fa644694cfa 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -342,6 +342,7 @@
 #define POWERGATE_ENABLE			XE_REG(0xa210)
 #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
 #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
+#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
 #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
 #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
@@ -352,6 +353,7 @@
 #define FORCEWAKE_RENDER			XE_REG(0xa278)
 
 #define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
+#define   MEDIA_SAMPLERS_AWAKE_STATUS		REG_BIT(6)
 #define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
 #define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
 #define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index f8950a52d0a4..e903fa79e0c7 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -124,6 +124,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	if (xe_gt_is_main_type(gt))
 		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
 
+	if (MEDIA_VER(xe) >= 11 && MEDIA_VER(xe) < 13)
+		gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;
+
 	if (xe->info.platform != XE_DG1) {
 		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 			if ((gt->info.engine_mask & BIT(i)))
@@ -246,6 +249,15 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
 					   str_up_down(pg_status & media_slices[n].status_bit));
 	}
+
+	if (MEDIA_VER(xe) >= 11 && MEDIA_VER(xe) < 13) {
+		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
+			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
+
+		drm_printf(p, "Media Samplers Power Gate Status: %s\n",
+			   str_up_down(pg_status & MEDIA_SAMPLERS_AWAKE_STATUS));
+	}
+
 	return 0;
 }
 
-- 
2.38.1

