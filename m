Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE696CCD183
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 01:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE0910E253;
	Fri, 10 Oct 2025 01:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTGZcVOh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F1810E253
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 01:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760058770; x=1791594770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s7DvB2zbVoGXQArWXNXdATTl2M7ae6Fm0c8Nt8uS4p0=;
 b=kTGZcVOhJYtrlTWsO4lHUQFFvP3KUG7xon7VNC1oRvJ58nyee/GbYnd1
 cCNkmY8WbZa6+zJVbDVAIgVChWubx8DauiStirSknYyBKts0flCncJi3C
 mEoOI9DKXjBQCj+YGXu7/znkbiRbNKNxGOEvCsginxvyVLA6MCaOCxfE6
 +FsSaQS/Gzp3BTXs2RvEn+qQdJZpIH8/txreNyoN24vqSlxulXQNWXPGT
 2pt0N8YWzErXsw/rVaojYsgMilBNc1UeTcVaz4+WxlRgpuoGkBRjKvswj
 oVHx7z0w031JVfwQaHuT0OKFz6WShxH09ZzafQ+a2nMIJ9zUFVBcrxx5o A==;
X-CSE-ConnectionGUID: khl43+H0QNeQLrJfeU+1yw==
X-CSE-MsgGUID: BZIq/byMTfCs9wtY/FVGDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79721876"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="79721876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 18:12:50 -0700
X-CSE-ConnectionGUID: YcnV9g0xQUe6HfFYOJz3WQ==
X-CSE-MsgGUID: fEapvjSlSA2It5zslZOTKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180446798"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa009.jf.intel.com with ESMTP; 09 Oct 2025 18:12:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v5] drm/xe: Enable media sampler power gating
Date: Thu,  9 Oct 2025 18:10:47 -0700
Message-Id: <20251010011047.2047584-1-vinay.belgaumkar@intel.com>
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

v2: Remove the sampler powergate status since it is cleared quickly anyway.
v3: Use vcs mask (Rodrigo) and fix the version check for media
v4: Remove extra spaces
v5: Media samplers are independent of vcs mask,
    use Media version 1255 (Matt Roper)

Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_gt_idle.c      | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 06cb6b02ec64..51f2a03847f9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -342,6 +342,7 @@
 #define POWERGATE_ENABLE			XE_REG(0xa210)
 #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
 #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
+#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
 #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
 #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index f8950a52d0a4..bdc9d9877ec4 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -124,6 +124,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 	if (xe_gt_is_main_type(gt))
 		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
 
+	if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1255)
+		gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;
+
 	if (xe->info.platform != XE_DG1) {
 		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 			if ((gt->info.engine_mask & BIT(i)))
@@ -246,6 +249,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
 					   str_up_down(pg_status & media_slices[n].status_bit));
 	}
+
+	if (MEDIA_VERx100(xe) >= 1100 && MEDIA_VERx100(xe) < 1255)
+		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
+			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
+
 	return 0;
 }
 
-- 
2.38.1

