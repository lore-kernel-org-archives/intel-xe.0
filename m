Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424F3CEE344
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D7B10E50A;
	Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIa3JHJv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1180610E4FB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rG6EfWrFCORqJlPbzpOgMudI5J0dTFKciFK63shWWyQ=;
 b=gIa3JHJvpBUryF/Rx+f1yg9UmWfCKe/AdSxfD1BhbG1tKRao0NAs49/T
 UPcfFrCfNewpHnSjgcKSD/+1yDDznoGoT0M6jcFa374TDTtAaShNxMVEp
 sHetzmLx8mNacsoVP86dbdzs3iDg3t4vcX/6ervjqTp8VH81smSZ3PcnZ
 auGn0yhpfvfUnlOxYFdH9uS5zG6x01vyj+YQZn3L8ONJh9Wi2pUbgDY0L
 j2VeSl2m5OhY+7Bnkxe/96+6j8mBOyCeGaFF24KWNQJIO56MeC7k+6C0o
 s07HunA+cB4rG7AUxxn8UPnQoBiqxTHCtQan7sKeqOvQAg9SYogB3+L4h g==;
X-CSE-ConnectionGUID: KWNGr8o8T3G7FEtprvaUNA==
X-CSE-MsgGUID: nuZFSrM3T7mgVIWKIjT1QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544784"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544784"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
X-CSE-ConnectionGUID: Iok068o4SQWjPBHdXWKENA==
X-CSE-MsgGUID: Eb0IOnovSoOLeFx2HBWhsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952258"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 20/27] drm/xe/vram: Use scope-based forcewake
Date: Tue, 18 Nov 2025 08:43:59 -0800
Message-ID: <20251118164338.3572146-49-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
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

