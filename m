Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C62E9A04D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4044210E63E;
	Wed, 18 Feb 2026 22:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdO130NE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CECD10E323
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771452590; x=1802988590;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=TxA6cfyiQHjoem3v0ctAoMuHPAvtBk+23Xw1LsdZ9UI=;
 b=hdO130NEiorYGvPf9BzufhXzczLtrPU3nu6QU/ozWEhSu6mlfmHqILpY
 isSu+F52FpXkpsLz78y79kQyH5CU8tJ//c3ca788xbDQgFK2jm3keYiVB
 7sX4O0tY90LSYpcAdp9RqSG5W2nbJV/k2JJ1wFjHdVK+8oSdjC+Q5REw1
 OwvmojSHLJg2Zq5QtXkMQh/WPmYZMeiaX8qtvPu96lm/nrtYFHbuJsZyQ
 vXs8tluo8/caeUDqkWcRBj0lPlnJppM/ylPCUE8V0GAkHZWlRUJGmurVI
 LI0qb95KR1o4BT1YbTsb4PNEQ+TPdjJcaofnNQsepZD6D1rveBGtZncnL g==;
X-CSE-ConnectionGUID: R7OO0+oSQrej4Ov05nj+qg==
X-CSE-MsgGUID: UN+2x6n2Q3i2TfFHTbtukw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76399069"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76399069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
X-CSE-ConnectionGUID: PERcrao1QtKzuLB2m1AIWQ==
X-CSE-MsgGUID: N2exgfwzSm2xas1OqXTcLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214329418"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 18 Feb 2026 14:09:15 -0800
Subject: [PATCH v4 4/4] drm/xe/reg_sr: Allow register_save_restore_check
 debugfs to verify LRC values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-sr_verify-v4-4-35d6deeb3421@intel.com>
References: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
In-Reply-To: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3554;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=TxA6cfyiQHjoem3v0ctAoMuHPAvtBk+23Xw1LsdZ9UI=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpljishgWHKCGagHxzek92uofZmFN135anCwMzf
 xi+yYp3iuWJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZY4rAAKCRBNeSQFyHKQ
 BIkkD/sFhS+Zl43IMUrcrdTtQGj0h9d42gL52tjxgMLvpaVM0vviCYrsiGff/xzDhsSDtseZP3Q
 SUp4B8e3XDoZA8MzlLdc00mHadGXLFrXbO42fuqpd8D1g8O/GDvmeZIRgazFWUtRH8bv+iOjPbA
 VE2lXFjPFrWw4l80QsbdhNbmJLQDJw5P7qlqoOR6XFQ9gaR3F+azMiN3ehIUMmhuzdfqHXnibjQ
 dDIStvxOKV07gp28NW150GVoOk4Dr0Bh87En/Ysk1UnDAo9vEdr9JaY0o9RzeDyhjPx4SS6lZhi
 auvzMVeVLZ2bCWAFxUNxprv2UXHkXm+FNUCdUPc8LhKk+4UUEg/+HrFO29Jxqh7OaTkF8FUWjxp
 cAqOdSR9LiSonrns847mfCAPxHODg2vO4CiHYJOrMYZcsfrEkPT/XIUzIz5w99IKaNrFZYSKxDd
 7aOVDeiQime9vBc+pqP9eqFLqr5sNwLkDLUdNbtsDTZEGrnE1Og2BNVlQrmDRBC4ukhrVe7Dvou
 JMsNsgIQIsDAV3vX3lSZdsVb6zN0e8wntpogu1WynQmd0AYl5UFEOlqn36nk6vEHJGhFakSb32E
 8/8CPgO7IxEB0NBD2OYCqyMyt6f4GOEXkBFiUuOc/xamBEmILAjVbsoc262Iw2+ucHqigT0eg2G
 D4c5C2EIjqjc3Vw==
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

reg_sr programming that applies to an engines LRC cannot be verified by
a simple CPU-based register readout because the reg_sr's values may not
be in effect if no context is executing on the hardware at the time we
check.  Instead, we should verify correct reg_sr application by
searching for the register in the default_lrc.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++--
 drivers/gpu/drm/xe/xe_reg_sr.c     | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.h     |  4 ++++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index aa43427a9f4b824b8ad41d02f634c07c76d989b2..f45306308cd66c87b261edaa8de532f6cc56499d 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -173,8 +173,8 @@ static int register_save_restore_check(struct xe_gt *gt, struct drm_printer *p)
 	xe_reg_sr_readback_check(&gt->reg_sr, gt, p);
 	for_each_hw_engine(hwe, gt, id)
 		xe_reg_sr_readback_check(&hwe->reg_sr, gt, p);
-
-	/* TODO: Check hwe->reg_lrc against contents of default_lrc. */
+	for_each_hw_engine(hwe, gt, id)
+		xe_reg_sr_lrc_check(&hwe->reg_lrc, gt, hwe, p);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 75aa4426b3ec6026bc13095df3c3f9cb0a794b97..83a668f2a0d5f16ea3f0b93eafb6b8e66abe3fe8 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -21,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
+#include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_rtp_types.h"
 
@@ -242,3 +243,32 @@ void xe_reg_sr_readback_check(struct xe_reg_sr *sr,
 				   offset, mask, entry->set_bits, val & mask);
 	}
 }
+
+/**
+ * xe_reg_sr_lrc_check() - Check LRC for registers referenced in save/restore
+ *     entries and check whether the programming is in place.
+ * @sr: Save/restore entries
+ * @gt: GT to read register from
+ * @hwe: Hardware engine type to check LRC for
+ * @p: DRM printer to report discrepancies on
+ */
+void xe_reg_sr_lrc_check(struct xe_reg_sr *sr,
+			 struct xe_gt *gt,
+			 struct xe_hw_engine *hwe,
+			 struct drm_printer *p)
+{
+	struct xe_reg_sr_entry *entry;
+	unsigned long offset;
+
+	xa_for_each(&sr->xa, offset, entry) {
+		u32 val;
+		int ret = xe_lrc_lookup_default_reg_value(gt, hwe->class, offset, &val);
+		u32 mask = entry->clr_bits | entry->set_bits;
+
+		if (ret == -ENOENT)
+			drm_printf(p, "%#8lx :: not found in LRC for %s\n", offset, hwe->name);
+		else if ((val & mask) != entry->set_bits)
+			drm_printf(p, "%#8lx & %#10x :: expected %#10x got %#10x\n",
+				   offset, mask, entry->set_bits, val & mask);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index cd133a09aa9b3f046dbd913aa9711250e771ee1a..1ec6e8ecf2784a3a832f30b7005f116ab7a368db 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -22,6 +22,10 @@ void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
 void xe_reg_sr_readback_check(struct xe_reg_sr *sr,
 			      struct xe_gt *gt,
 			      struct drm_printer *p);
+void xe_reg_sr_lrc_check(struct xe_reg_sr *sr,
+			 struct xe_gt *gt,
+			 struct xe_hw_engine *hwe,
+			 struct drm_printer *p);
 
 int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
 		  struct xe_gt *gt);

-- 
2.53.0

