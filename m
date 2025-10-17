Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9B0CCD1A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C179010EAE7;
	Fri, 17 Oct 2025 02:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c61Hop3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1439010E0F6
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668037; x=1792204037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47N/Fdy9caXcUjK56hRdFoXUm5N98Dz9l8m3SsfZBaw=;
 b=c61Hop3zY23Jp/VeNSUPvcu1RgKAYZcG9/jgE6pZl1wFRia2ZxxAR6Rp
 5cILC3gMxaYI5LcnT39EY3cU/vilGtNsRlojMY4y+BG+tW8UwuHmOcCqn
 dcJ3qSGAR2v+P/VIH9ruILnylQSRS7Ht6DVaLk0ri524VBHu7KvcQWjbK
 kK6k8XEAPEdz9/S4h/ArzfUG6VmZn48/0HlzWgryVoCBggU6w79025eZi
 dT4B0ndUtSP+ECtqnAoRSbJO/vXp5FjENzEzDwoUs+tMvL7fyvo3gHaSG
 HQW1GZ7APd8cZ0EI/kpZxJdrHMTZ54czNWecAJSrJ525HYKUBnbXDv3i7 A==;
X-CSE-ConnectionGUID: 6a6+jpl3SDexSy1yWlG43g==
X-CSE-MsgGUID: w0sVom62QRuR15HQ4mBV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739206"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739206"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:16 -0700
X-CSE-ConnectionGUID: 9H5Do+U6Rie14UlxkjPBMQ==
X-CSE-MsgGUID: s8IlsytQSN+5Dau7eGB/NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089165"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 03/24] drm/xe: Drop CTC_MODE register read
Date: Thu, 16 Oct 2025 19:26:22 -0700
Message-ID: <20251016-xe3p-v3-3-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

The warning was added for a condition that never triggered even for
platforms prior to Xe2. It's not supported in Xe2 and in Xe3p the
register is removed from the main GT. Just drop the entire function as
it doesn't bring any benefit.

Bspec: 62395
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
[ Drop the entire check for CTC_MODE ]
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ----
 drivers/gpu/drm/xe/xe_gt_clock.c     | 19 -------------------
 2 files changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 51f2a03847f9d..21c15441c4537 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -346,10 +346,6 @@
 #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
 #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
 
-#define CTC_MODE				XE_REG(0xa26c)
-#define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
-#define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
-
 #define FORCEWAKE_RENDER			XE_REG(0xa278)
 
 #define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 4f011d1573c65..00f5972c14dc5 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -55,30 +55,11 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
 	}
 }
 
-static void check_ctc_mode(struct xe_gt *gt)
-{
-	/*
-	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
-	 * platforms.  In theory it could be a valid setting for pre-Xe2
-	 * platforms, but there's no documentation on how to properly handle
-	 * this case.  Reading TIMESTAMP_OVERRIDE, as the driver attempted in
-	 * the past has been confirmed as incorrect by the hardware architects.
-	 *
-	 * For now just warn if we ever encounter hardware in the wild that
-	 * has this setting and move on as if it hadn't been set.
-	 */
-	if (xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC)
-		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
-}
-
 int xe_gt_clock_init(struct xe_gt *gt)
 {
 	u32 freq;
 	u32 c0;
 
-	if (!IS_SRIOV_VF(gt_to_xe(gt)))
-		check_ctc_mode(gt);
-
 	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 	read_crystal_clock(gt, c0, &freq, &gt->info.timestamp_base);
 

-- 
2.51.0

