Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69201CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 17:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E1C10E879;
	Wed,  8 Oct 2025 17:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+E42f13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EAC10E879
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759944215; x=1791480215;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b2C0dy2Cy2Q9+IoBGGMM0XHkCbjB+EbdB+S9sFaxghY=;
 b=k+E42f13pFaUSSdILGH6nyaX63v1ig54MQ3o9u9PYSetfsHzM+Oa5V88
 kWmYOfY2e+PdVnmgp/bSMr5pO6DPHyxD1J0WGIXn97POfkKM0aRuIOAU7
 mLldSn4NCoExDzk1yyC65FmoC7VCyER3foGE1/rX4ag5VN9B/VvH2kRGx
 oo+MzqirSskE+p9LKmPt6zGx+QyhamLq9t+MdpGe1wKqa5kf4tHj9TYOe
 SFHW1HfByVbM4cJmxJlGFtTHkKLiHKKbrmkuNZrKJQDnn/xGKPxB1D/si
 8Naka7u5gX4oi9HNJ8l84TZfnENManhecjthlWvQC4pWsTCZSAGsbpcqH w==;
X-CSE-ConnectionGUID: sG62zasBQDyS1CO3wuGOqw==
X-CSE-MsgGUID: tGow4i4KQtaBHpTPhNvKXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="65997373"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="65997373"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:23:35 -0700
X-CSE-ConnectionGUID: l5rMOW6mSza27U743FSxHA==
X-CSE-MsgGUID: UnbmoK5ISqSvsnXK/vsdQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180423341"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa006.fm.intel.com with ESMTP; 08 Oct 2025 10:23:34 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe: Enable media sampler power gating
Date: Wed,  8 Oct 2025 10:21:19 -0700
Message-Id: <20251008172119.1630380-1-vinay.belgaumkar@intel.com>
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

Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
index f8950a52d0a4..b5f89d15276a 100644
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
@@ -246,6 +249,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
 					   str_up_down(pg_status & media_slices[n].status_bit));
 	}
+
+	if (MEDIA_VER(xe) >= 11 && MEDIA_VER(xe) < 13)
+		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
+			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
+
 	return 0;
 }
 
-- 
2.38.1

