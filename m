Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321DDE6FE54
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBA310EB38;
	Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EH1xK6tB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C1A10EB30
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R0Z0MrXF1pHPAzpY+LanM2PbVz9IgcuwpuvuTV4nVF4=;
 b=EH1xK6tBkeGGSr9c5srni9ybGrCRB6nZuJ8N9RGiRkT8nkhHgtKYlvKb
 3q98ETXQyxZhS8kJMjgkkqQY+pbmlzF0G986e14Zhe96JirKVFhuffP2J
 jstwo7zAmEGc9eKiy1x3YEENtkRTHC/vZaZsiCMlCSW9n/X2gjIh2mu0I
 s6mOGnm0T+r5Hw/4BJ9T+/8BL8N4riJb5hLdL7eqCxBXetu7i7dpRj5et
 neRa4n8A3a3yMUZUlGVBQDgwp8IsGcFWTG5L8hikS8WrInhDYP93rf0WR
 GYviTb2M8imO2vMUts/fVd2OmKm4mUQUWpDZF+dgGLPCBrLUgUj4tbyvR A==;
X-CSE-ConnectionGUID: cJxNBcP/TLWEGEMPPcS9dw==
X-CSE-MsgGUID: 1dR6w0Y+TrOQsmhUSE4MLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855316"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: WgWPcUzaSHmKg9TMoBv8dg==
X-CSE-MsgGUID: QelIn6/MRey2/eTl3EFuPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792695"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 26/43] drm/xe/mocs: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:15 -0700
Message-ID: <20240907000748.2614020-71-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c |  4 ++--
 drivers/gpu/drm/xe/xe_mocs.c       | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 79be73b4a02b..ea932c051cc7 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -55,7 +55,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 			if (regs_are_mcr(gt))
 				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i >> 1));
 			else
-				reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i >> 1));
+				reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i >> 1));
 
 			mocs_dbg(gt, "reg_val=0x%x\n", reg_val);
 		} else {
@@ -94,7 +94,7 @@ static void read_mocs_table(struct xe_gt *gt,
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
 
 		mocs_expected = get_entry_control(info, i);
 		mocs = reg_val;
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 7ff0ac5b799a..8df41cd12d51 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -278,7 +278,7 @@ static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct d
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
 
 		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
 			   j++,
@@ -310,7 +310,7 @@ static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 			if (regs_are_mcr(gt))
 				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 			else
-				reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+				reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
 
 			drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u, %u, %u, %u, %u, %u, %u, %u ] (%#8x)\n",
 				   i,
@@ -383,7 +383,7 @@ static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flags,
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
 
 		drm_printf(p, "LNCFCMOCS[%2d] = [%u, %u, %u] (%#8x)\n",
 			   j++,
@@ -428,7 +428,7 @@ static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
 
 		drm_printf(p, "LNCFCMOCS[%2d] = [ %u ] (%#8x)\n",
 			   j++,
@@ -510,7 +510,7 @@ static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
 
 		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u]  (%#8x)\n",
 			   i,
@@ -553,7 +553,7 @@ static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
 		if (regs_are_mcr(gt))
 			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
 		else
-			reg_val = xe_mmio_read32(gt, XELP_GLOBAL_MOCS(i));
+			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
 
 		drm_printf(p, "GLOB_MOCS[%2d] = [%u, %u, %u]  (%#8x)\n",
 			   i,
@@ -690,7 +690,7 @@ static void __init_mocs_table(struct xe_gt *gt,
 		if (regs_are_mcr(gt))
 			xe_gt_mcr_multicast_write(gt, XEHP_GLOBAL_MOCS(i), mocs);
 		else
-			xe_mmio_write32(gt, XELP_GLOBAL_MOCS(i), mocs);
+			xe_mmio_write32(&gt->mmio, XELP_GLOBAL_MOCS(i), mocs);
 	}
 }
 
@@ -730,7 +730,7 @@ static void init_l3cc_table(struct xe_gt *gt,
 		if (regs_are_mcr(gt))
 			xe_gt_mcr_multicast_write(gt, XEHP_LNCFCMOCS(i), l3cc);
 		else
-			xe_mmio_write32(gt, XELP_LNCFCMOCS(i), l3cc);
+			xe_mmio_write32(&gt->mmio, XELP_LNCFCMOCS(i), l3cc);
 	}
 }
 
-- 
2.45.2

