Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B718C98304
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 23:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A77210E335;
	Wed, 23 Sep 2026 23:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHE35O9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533F010E335
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 23:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790205024; x=1821741024;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=AEcJT7k+ACXbdGNq4HULWYCSdWgcfwGW0ozC9iVzEHg=;
 b=XHE35O9rUyUzS3BgNLKzHmzTpVMHW8VtFQEkebUCzCrnhkny6cZkVYG1
 HoNYR0RNji/ad83yvDvee+rMuKMyHku92i1RbxTKLxL8V7LjycqIfqpUM
 Judla71dYqBoc7X69vKdwpCt3id5lCe0TKMRDiZ8lOuukb2XktPJVo5Fm
 b1h18BfX6PJQr6gfCpuxxP2Y3I3dJkwq6lu56OGivl3XGeizllgf8bGKJ
 ZAivdz2U99ggtN5OFa7bBjA7CE2jmIVLp13ag2QqFx05J2Xt0r1oyXkgQ
 8nXQ8mzkeJjD/l74xu//7Iwzn060/K1trWipaj9ZwPC510YFOw7xLLA4e A==;
X-CSE-ConnectionGUID: wpc6Cf7oR4iJoiIIR2jWOA==
X-CSE-MsgGUID: nDdhbc2/T0+5OVpMo1E4cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89863945"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="89863945"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 16:10:24 -0700
X-CSE-ConnectionGUID: 5DY3PAn9QxqjHEbg+HFKJA==
X-CSE-MsgGUID: 3Gb5dHBcR3GTCVLjgHKJbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="272408429"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 16:10:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 23 Sep 2026 16:10:09 -0700
Subject: [PATCH] drm/xe: Drop old Xe GT ID macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-drop_old_gt_defines-v1-1-8f0811238582@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TkijqL4SIbK71UJoaEQg/T3pO
 AwzGRJH4QRTlSHyLUmCL6DrCnB3fmMlVBhMY/pmNK2iGE4bDrLbZYlX8ZwUIq5u6HSPeoBSnrG
 I57/Oy/t+bjkkI2UAAAA=
X-Change-ID: 20260923-drop_old_gt_defines-cccfa8516c18
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=AEcJT7k+ACXbdGNq4HULWYCSdWgcfwGW0ozC9iVzEHg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqtFxf1tV2d1Nuqf5d+4zpXTM6Xl1lPISeO9LgS
 VG0TG878n6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCarRcXwAKCRBNeSQFyHKQ
 BNueD/0XiczqqF4fu5TD/WGl3+Bv2ZtbvcJxFawl+jusKanzascAQS4MQdb+d82oGHruNGLgoT0
 OZmtHeGSTV7/66GL64CMsFceUkMljo/o0O0TQLNmflnc6RH4O5o1+/spdhnpwMk/lym5sv0P+Pc
 mFOzY/TgjXTEv3lCBATh5erWn0OTfl2oHLIzvpQ8hNuDd4eNBAF0MqMJVi7XLoQ/wrTPhKdJ493
 N4s8Vg7ziHPLocpbLHKDFXQ7NnlwN5aGnacggzt6J4W0hwrVeq5ZtY9hQa6UPPksmmJQappJ8Jn
 b02LyIgM33u5a26d67RiIPpvvuzoihTWnRaIhOFHkc6wf+2x4vCNsCA/WOjKqtAF2DHQO1/KhrH
 fENsV+GcdZQgVEq5QEEeg2cfp/uEYErS6dqfHs3PCwiRj22W1D3jXTKv7L2wwNFg7Wy2hq4qtt4
 KmBmLrAWFZ8MAYQ00/vDt25zr1EsD2EJi6NbIsg93vIpsDym8DZCE7fgRN0fnXzSnYZmTc+WYZ9
 L1iyZKhegQLeiTRkR2BuoeR89VtAy8Oc2CA6wbcCR/HUXf2qG11AQR26NT7K+vjzGEto57k9Ieg
 uqoRissEMmSwm8gLC0z+nR45GUtJGCOojkn2+B6JvzKRTz6jmix6RzItJkBlGab29re83ypjafe
 nsb/sghL5765NiA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

XE_GT0 and XE_GT1 are old macros that were used for hardcoding specific
GTs during early development of the driver; neither should be anymore
since the driver shouldn't be making assumptions about what ID numbers
correspond to specific types of IDs.

 * XE_GT0 was only being used in the GuC init code to skip reading the
   hwconfig table on more than one GT.  Comparing the GT against
   xe_root_mmio_gt(xe) is a more direct way to ensure this happens on
   just a single GT per device (and should work even if the ID numbers
   wind up changing in the future).

 * XE_GT1 was only being used to set XE_MAX_TILES_PER_DEVICE which makes
   no sense at all; even though the highest tile count we have on any
   device today (2 on PVC) happens to match the number of GTs that we
   can potentially have inside a tile (2: primary+media on non-PVC
   platforms), these counts are unrelated and should not be tied
   together like this.

Cleanup the places where these were used and drop the two defines so
that they don't get mis-used anywhere else going forward.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 4 +---
 drivers/gpu/drm/xe/xe_guc_hwconfig.c | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bb4234f00453..3e1d3a143def 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -89,9 +89,7 @@ enum xe_page_size_alloc_ctrl_mode {
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
 
-#define XE_GT0		0
-#define XE_GT1		1
-#define XE_MAX_TILES_PER_DEVICE	(XE_GT1 + 1)
+#define XE_MAX_TILES_PER_DEVICE 2
 
 /*
  * Highest GT/tile count for any platform.  Used only for memory allocation
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index b300901dbb8e..dc667a71b438 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -65,7 +65,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 	/*
 	 * All hwconfig the same across GTs so only GT0 needs to be configured
 	 */
-	if (gt->info.id != XE_GT0)
+	if (gt != xe_root_mmio_gt(xe))
 		return 0;
 
 	/* ADL_P, DG2+ supports hwconfig table */

---
base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04
change-id: 20260923-drop_old_gt_defines-cccfa8516c18

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

