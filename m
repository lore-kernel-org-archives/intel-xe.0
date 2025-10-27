Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E221CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 05:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34AB10E0F6;
	Mon, 27 Oct 2025 05:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5AMlUNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3944710E0F6
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 05:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544681; x=1793080681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fjrqf2WTj8eT6tX3TnCxHYBZ05EH1REKTCuRGYmTm44=;
 b=T5AMlUNgrNdiCwt2j+nkz/JSDBXllQJniPvn/rs2srzTxxtDPdmilf27
 6O+gpt1ctjSufHmMF3AodomRsaE38gl5VlQIqlFduK/fAVPGCkjciSndI
 n+9OIEiOX51cSo1XL0DIAsrIDEtDWYHmr2xBIKajQghbiuz2zF2DN0kvW
 NcY3x51x+WqmUUZmcAmrbDMfQ9bE8mqgujhJzFlBiYaIIWG1VPPQF5j4a
 oC4zK4blQ3ZKuzqz6R90Yu6ReNFMj43nIsoyo8L4WTujqipaMmFbejjyW
 U7vZhf2Uc5npUZeQYqS8gCQoUcpa6DjDXUDKPBXyYhQHyWtAdRz1vZaNt A==;
X-CSE-ConnectionGUID: ZQLcuqjpRumisNNKg42txQ==
X-CSE-MsgGUID: ikbOLELuSeykBM49m/qE6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73905949"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73905949"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:00 -0700
X-CSE-ConnectionGUID: jtUF5b8JRqmf+1eFleNa7g==
X-CSE-MsgGUID: 5facPmvdRh2QWlg/WejGAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185308459"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/8] drm/xe/gt_throttle: Always read and mask
Date: Sun, 26 Oct 2025 22:57:15 -0700
Message-ID: <20251026-gt-throttle-cri-v2-3-41f8288a71a7@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

Use a single function to read and mask the value the callers will be
interested in. This reduces the risk of a caller using a plain call to
xe_gt_throttle_get_limit_reasons() without applying any mask, which can
return unexpected bits for future platforms.

Select which reg and mask it's going to be used according to the
platform and gt type and always use that one function.

There was an odd xe_gt_dbg() when reading the status, which is not done
for any other throttle/* sysfs file, so just make the status be as
special as everybody else.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index c69710f2dbeb5..f743444f641a8 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -8,7 +8,6 @@
 #include <regs/xe_gt_regs.h>
 #include "xe_device.h"
 #include "xe_gt.h"
-#include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle.h"
 #include "xe_mmio.h"
@@ -57,32 +56,25 @@ dev_to_gt(struct device *dev)
 
 u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
-	u32 reg;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_reg reg;
+	u32 val, mask;
 
-	xe_pm_runtime_get(gt_to_xe(gt));
 	if (xe_gt_is_media_type(gt))
-		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
+		reg = MTL_MEDIA_PERF_LIMIT_REASONS;
 	else
-		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
-	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return reg;
-}
-
-static u32 read_status(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	u32 status, mask;
+		reg = GT0_PERF_LIMIT_REASONS;
 
 	if (xe->info.platform == XE_CRESCENTISLAND)
 		mask = CRI_PERF_LIMIT_REASONS_MASK;
 	else
 		mask = GT0_PERF_LIMIT_REASONS_MASK;
 
-	status = xe_gt_throttle_get_limit_reasons(gt) & mask;
-	xe_gt_dbg(gt, "throttle reasons: 0x%08x\n", status);
+	xe_pm_runtime_get(xe);
+	val = xe_mmio_read32(&gt->mmio, reg) & mask;
+	xe_pm_runtime_put(xe);
 
-	return status;
+	return val;
 }
 
 static bool is_throttled_by(struct xe_gt *gt, u32 mask)
@@ -96,7 +88,7 @@ static ssize_t status_show(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_gt *gt = dev_to_gt(dev);
 
-	return sysfs_emit(buff, "%u\n", !!read_status(gt));
+	return sysfs_emit(buff, "%u\n", is_throttled_by(gt, U32_MAX));
 }
 static struct kobj_attribute attr_status = __ATTR_RO(status);
 

-- 
2.51.0

