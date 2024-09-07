Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802AFEB64CC
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6D610EB45;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQot6H2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4573610EB35
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ms1R9mLQVPwYxFu5kR2zgHgHlh5OkRbu2zfWePPPJmY=;
 b=XQot6H2W9rCuf8EMyQ3jcepwuJ9/otQ/RoCb+VOcr99iqMhME46kIqC8
 qaZJM9WeN29T+rbnm59yKQVEHTgLYgYRlnpr/nmnJNlcV6gQ1+842s913
 ZYvKhfp92PbSFtBwF6g4MSxBFIKJbEBq0zEigtcXZEfXJNADk4C3mgO7Q
 pJiZU86AFSpLf4H5JoTqYLX92YKa91hA77K29g+AJXLGvmx19405HveLZ
 S7DtZZrjVTqJpMffjzmkz3+m6gRDYF9Rp3g68hFAZXnrz+k4fGJwlHCK8
 r7SQdTL/mtcCeu4MEepqxXGT9yXlT2OFrFBklTM6PRPOptaL6tx/hs+rf w==;
X-CSE-ConnectionGUID: z3sacIofT3me9okkD/9usA==
X-CSE-MsgGUID: 5D8E+yvxTJ6wl1rHnTdIJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855323"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855323"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: MNgPID8KR2KPXZ2049EZ5A==
X-CSE-MsgGUID: FTmZiCYEQrSe2bdsmunG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792719"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 33/43] drm/xe/execlist: Convert register access to use
 xe_mmio
Date: Fri,  6 Sep 2024 17:08:22 -0700
Message-ID: <20240907000748.2614020-78-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_execlist.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 6a59165b9569..f3b71fe7a96d 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -44,6 +44,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 			u32 ctx_id)
 {
 	struct xe_gt *gt = hwe->gt;
+	struct xe_mmio *mmio = &gt->mmio;
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 lrc_desc;
 
@@ -58,7 +59,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	}
 
 	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		xe_mmio_write32(hwe->gt, RCU_MODE,
+		xe_mmio_write32(mmio, RCU_MODE,
 				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
 
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
@@ -76,17 +77,17 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	 */
 	wmb();
 
-	xe_mmio_write32(gt, RING_HWS_PGA(hwe->mmio_base),
+	xe_mmio_write32(mmio, RING_HWS_PGA(hwe->mmio_base),
 			xe_bo_ggtt_addr(hwe->hwsp));
-	xe_mmio_read32(gt, RING_HWS_PGA(hwe->mmio_base));
-	xe_mmio_write32(gt, RING_MODE(hwe->mmio_base),
+	xe_mmio_read32(mmio, RING_HWS_PGA(hwe->mmio_base));
+	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base),
 			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
 
-	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
+	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
 			lower_32_bits(lrc_desc));
-	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base),
+	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base),
 			upper_32_bits(lrc_desc));
-	xe_mmio_write32(gt, RING_EXECLIST_CONTROL(hwe->mmio_base),
+	xe_mmio_write32(mmio, RING_EXECLIST_CONTROL(hwe->mmio_base),
 			EL_CTRL_LOAD);
 }
 
@@ -168,8 +169,8 @@ static u64 read_execlist_status(struct xe_hw_engine *hwe)
 	struct xe_gt *gt = hwe->gt;
 	u32 hi, lo;
 
-	lo = xe_mmio_read32(gt, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
-	hi = xe_mmio_read32(gt, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
+	lo = xe_mmio_read32(&gt->mmio, RING_EXECLIST_STATUS_LO(hwe->mmio_base));
+	hi = xe_mmio_read32(&gt->mmio, RING_EXECLIST_STATUS_HI(hwe->mmio_base));
 
 	return lo | (u64)hi << 32;
 }
-- 
2.45.2

