Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B1DCCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A4010E039;
	Mon, 10 Nov 2025 23:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIzL8PT4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ECF710E039
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762819041; x=1794355041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9RKP35SUhXwtPkF2ikLKvaXj/GlOcWftw6hgqEai4vY=;
 b=iIzL8PT4ixd+8IqgGwPIKGIqiQyQ8+vpztYaUkXXVyPEs3drOu2JvBa3
 f281ApvXuJCvShE5+N7tF6R8wCFPQHkHhoZhA95bT+jHsMB3LAm95bFTa
 dAZsGPnRdVrHfYxJcd1fVY3j8HgFCMTsBZtV+PaSXEXZj6LHOvXRGNRN5
 h47rjVRJZ3nJbs2MCqZh8UktEog2rlhv9U7yko0uFt3Ek756WtKArWyJU
 ER0DCH6PIci6zNEbSnQVsfTKvLIkU/KJRlbwAK0I3AwmzSigP3UjBVRid
 jLSB3kG2TfXRYbQQSOT0nEeZ8T2FhinRL046bJvO2Wz67xSBVHbmS2ssF w==;
X-CSE-ConnectionGUID: O0ZbCoxpSy6tFbSPFDfjpA==
X-CSE-MsgGUID: 2EaVDAHoSA6Wd0a632zurw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75561990"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="75561990"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:57:20 -0800
X-CSE-ConnectionGUID: sQ+rDMeETW6CnJtnRqE92Q==
X-CSE-MsgGUID: u/kfW+V8QqezXvR7PIb7sA==
X-ExtLoop1: 1
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:57:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2.1 23/30] drm/xe/vram: Use scope-based forcewake
Date: Mon, 10 Nov 2025 15:57:16 -0800
Message-ID: <20251110235715.1489543-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-55-matthew.d.roper@intel.com>
References: <20251110232017.1475869-55-matthew.d.roper@intel.com>
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

Switch VRAM code to use scope-based forcewake for consistency with other
parts of the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
v2.1:
 - Rebased again to resolve conflict with latest drm-tip

 drivers/gpu/drm/xe/xe_vram.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 0e10da790cc5..0a645e76e5fa 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -186,12 +186,11 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
 static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	u64 offset;
 	u32 reg;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
 	if (GRAPHICS_VER(xe) >= 20) {
@@ -223,7 +222,6 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
 		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	*poffset = offset;
 
 	return 0;
-- 
2.51.1

