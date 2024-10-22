Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7094ED2C55C
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 14:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C16110E697;
	Tue, 22 Oct 2024 14:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cl/1EwRl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A78810E697
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729606255; x=1761142255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dySVijzgsUaFavnSW4zd15FkyKwIbwtlzBNMcrS+odg=;
 b=cl/1EwRliRWrkuIIZIgQoZ0U8FiO9N+cvu/gSO+bbt9JuoQnT1gy0tWt
 4dOmL/CByHf0TyYlu4P25Hof3iwy96jtejmAJPH4puACefSSvmNyNWY0k
 RYOtvHhcv0yJ4n4UXFMQA9LkliqTxnsjpg7rQq0u3/sk1HlsAWXaHGfOQ
 CFS6hdgp7bi4uxQY8DhaxzGQP9BnJfivXi6M/PjYgmPknptvazvLMzwkt
 YOM+Kv2aUFCFkKiywzJUyopKjrumOlgGD+vCkea6vV3RnOxjb+6eMiVgz
 X59APKiQYoHJ3Jlp1eFwoAGvsUHqAgg6nayxL8x/dK0S6Nxz4wvGkt94r Q==;
X-CSE-ConnectionGUID: f6wsFgchQkCF1kMpNGyJ7A==
X-CSE-MsgGUID: gDzxtBe3S/SkixhU/eCAzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39761496"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="39761496"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 07:10:55 -0700
X-CSE-ConnectionGUID: E4/gmAhWQlKHvlTpYMV3hQ==
X-CSE-MsgGUID: XWCCFPtlTxqpfVucKi8NnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="83862483"
Received: from dut4086lnl.fm.intel.com ([10.105.8.197])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 07:10:55 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 umesh.nerlige.ramappa@intel.com, john.c.harrison@intel.com
Subject: [PATCH v2] drm/xe/xe_guc_ads: save/restore OA registers
Date: Tue, 22 Oct 2024 14:10:54 +0000
Message-ID: <20241022141054.5311-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Several OA registers and allowlist registers were missing from the
save/restore list for GuC and could be lost during an engine reset.  Add
them to the list.

v2:
- Fix commit message (Umesh)
- Add missing closes (Ashutosh)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2249
Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 4e746ae98888..a196c4fb90fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -15,6 +15,7 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "regs/xe_oa_regs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
@@ -740,6 +741,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		guc_mmio_regset_write_one(ads, regset_map, e->reg, count++);
 	}
 
+	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
+		guc_mmio_regset_write_one(ads, regset_map,
+					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
+					  count++);
+
 	/* Wa_1607983814 */
 	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
 		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
@@ -748,6 +754,14 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL0, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL1, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL2, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL3, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL4, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL5, count++);
+	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL6, count++);
+
 	return count;
 }
 
-- 
2.43.0

