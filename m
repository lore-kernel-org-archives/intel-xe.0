Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8ECCEACE7
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20E510EB44;
	Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+RvtzPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8703F10EB2D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rG6EfWrFCORqJlPbzpOgMudI5J0dTFKciFK63shWWyQ=;
 b=Z+RvtzPwS3cm53IpzzN/Lz8G4P4mxplj/IzkPbhGu9zHiCXo45tQsJ0f
 Mn2oiP86JJC9SVWwbfHWVl0XgI5YA5DfAXSrxwEp2iO8Cu5S46ZArkaCJ
 Vbc2QiFdbHfXrb4a1DrWTM9Cb/4/aiW6kP6Qb4lDLOpmfAWzDq7w3D4ga
 oLk7aD5Per7dNjSsabBarshCwsgZfmGOdfrH+gyZk5nhEAMFx7O6/KO0i
 uFYTh0l9JzawT15m3msHVPUcgmP89PiTofqKhrdZaLtOTKgX8B4UErX0z
 9glmge8kmxk6dq5X7pQ/67OgE6XO1aQW5cyjxhaj5O3tSG26CobhG9Rmf A==;
X-CSE-ConnectionGUID: JiLeve7gRNOANA8tkyiB+A==
X-CSE-MsgGUID: pNpWZQjEQOOa4Ge5oTj0yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648324"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648324"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:50 -0800
X-CSE-ConnectionGUID: hAeNN2DWRwaBFtfTJVKwlQ==
X-CSE-MsgGUID: cjbbODYQStaJWffjrBeM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308333"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 20/27] drm/xe/vram: Use scope-based forcewake
Date: Fri, 14 Nov 2025 13:43:56 -0800
Message-ID: <20251114214335.2388972-49-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

