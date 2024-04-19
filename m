Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A79C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 20:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09B3112097;
	Fri, 19 Apr 2024 20:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZT+/1Iqz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21BA112097
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713557747; x=1745093747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZfMuj29tYue89tOCvg0+nKSpI88VmRNOwmIwd3Yi+1s=;
 b=ZT+/1IqzmLdJB8ST9P5n9Iazbr/1teR91D2UWQB/zdh6CD16uX87lyqQ
 WjEKwqNC1D97z9ey8YSdBQXsGj/e1TS/KGhx5namwRom5T4Wz6mHyLu6M
 fZANPE5O0fe2sEzrEIb7Gutg7Xnd4ob7qvLMBwjb9Nc5ZPeGr76LZYQrg
 JLbtnIWMaQxCeCSOGojdi3j/lCx1YoKxJofc+ItQC76CV1oBBkfZYUyYi
 X1KZwXlm95GA/RncLUzv+pW/5U1kt7bkiyXC/CPusxGAdtBp9575biBJ2
 OLZbIwwjP2XYBF3rCjvcHc8UngjyDcO2Ap9azmQ1tRiGB1ZYoeHLL05JI Q==;
X-CSE-ConnectionGUID: kYnD+0CmTUGeJ2247CJj3Q==
X-CSE-MsgGUID: 9DSZTSg1TLyIUp2/vvwwyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20599177"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20599177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 13:15:47 -0700
X-CSE-ConnectionGUID: J2DLXnccTI+/GX7SxLfSOA==
X-CSE-MsgGUID: ZJPEIbiwQUG7kQv5y6+6tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23940603"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 19 Apr 2024 13:15:46 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/2] drm/xe/bmg: Apply Wa_22019338487 for BMG
Date: Fri, 19 Apr 2024 13:13:44 -0700
Message-Id: <20240419201344.2467569-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
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

Extend this WA to BMG GT as well. In this case media GT is
not affected.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 7f82b6c2ad3c..280a0db01203 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -41,6 +41,7 @@
 #define GT_FREQUENCY_SCALER	3
 
 #define LNL_MERT_FREQ_CAP	800
+#define BMG_MERT_FREQ_CAP	2133
 
 /**
  * DOC: GuC Power Conservation (PC)
@@ -680,7 +681,8 @@ bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
+	if ((MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt)) ||
+	    (GRAPHICS_VERx100(xe) == 2001 &&  gt->info.type == XE_GT_TYPE_MAIN))
 		return true;
 
 	return false;
@@ -690,6 +692,8 @@ u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
 {
 	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
 		return LNL_MERT_FREQ_CAP;
+	else if (GRAPHICS_VERx100(pc_to_xe(pc)) == 2001)
+		return BMG_MERT_FREQ_CAP;
 	else
 		return 0;
 }
-- 
2.38.1

