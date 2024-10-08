Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB04CED274
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 07:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D325610E485;
	Tue,  8 Oct 2024 07:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAPZghC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A832B10E484
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 07:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728373003; x=1759909003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G4jlBEogZ8ks2SL2B+op3+4d0576UBBVfOiYbw0Jl/M=;
 b=KAPZghC1At27a/vlzWyZ8XCZwLNkrXc2GUg+tXLMMtiGtvojRzIzEvj+
 cBKD6HLhH7YLiGpE5SOzGjNxWamR/VaBdMgIr1X4gl9b1tUoW+vQMc/4s
 F4gGLLeXb4CrIvbIRkFDdkHiz3FRoJy415/IL9rxO+XxZIhTY+/6dx0s6
 RU3ni8TnG5qPQsKLRI6qcJ5qvGg+OquC3VxalAsWwUe6XvuyM02PAxftU
 OcQZWhhuJrfF5noPmy19Wf8x6tDapi6vwWtqWlc+Mc+TWgEEnxLSKbMP1
 CGa86e681W669AHd07bUfD/GUT80L1euWTqKgbedzmQRlnFx187yx+JM2 A==;
X-CSE-ConnectionGUID: qUkJvmv8QiunX0OBXWRvHw==
X-CSE-MsgGUID: EQd+wVqTT7+/csjX6xrmrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38938140"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="38938140"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:36:43 -0700
X-CSE-ConnectionGUID: sBY2brk8R1mcRpCdSSTUnw==
X-CSE-MsgGUID: HtI0mbkrSf2UMm2Xojyj8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="75601223"
Received: from unknown (HELO bvivekan-DESK.iind.intel.com) ([10.190.238.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:36:41 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Set mask bits for CCS_MODE register
Date: Tue,  8 Oct 2024 13:06:27 +0530
Message-Id: <20241008073628.377433-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
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

CCS_MODE register requires setting mask bits from Xe2+ platforms. Set
the mask bits unconditionally, as those bits are unused for older
platforms.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 9dd70934ca15..e136b663af98 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -562,7 +562,7 @@
  *   [4-6]     RSVD
  *   [7]       Disabled
  */
-#define CCS_MODE				XE_REG(0x14804)
+#define CCS_MODE				XE_REG(0x14804, XE_REG_OPTION_MASKED)
 #define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
 #define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
 #define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 9360ac4de489..246190b3e2bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -68,6 +68,12 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 		}
 	}
 
+	/*
+	 * Mask bits need to be set for the register. Though only Xe2+
+	 * platforms require setting of mask bits, it won't harm for older
+	 * platforms as these bits are unused there.
+	 */
+	mode |= CCS_MODE_CSLICE_0_3_MASK << 16;
 	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
 
 	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
-- 
2.34.1

