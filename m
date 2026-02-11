Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B056ECD6EE
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 23:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE5F10E66B;
	Wed, 11 Feb 2026 23:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6G5Hagg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2828410E66D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 23:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770852862; x=1802388862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KLkqeZqhJTIwqUTdrvH5wCtKWM6VQ9+70o/yb64CoFo=;
 b=V6G5HaggB9YcyiEZ41NCbjmflUVVaD+wpluGcRUJo/9NhVWMHrCCF+OZ
 KqWLHzBdl4R3Y2qB0/l2asdi3kCexlq7w29QonOyYNE8PyJTeZkIgWSab
 5fsnDe5yeCGhLt372QUCJPeQ9Zcj4+sfPhW7tbqGcKUgxddhqwWGupiga
 2RLRxwxPLgMpB9LmTG0z2CRB2GeqSVllRD6JKBWTjzYySZvdLg0k/mECb
 cMd+c/mmHfQjpCWDSNBP0n+DtaFuFI/iKW5D9AHmEtbKdY0GOuFn8UvGU
 TmkD7ZzrAv3jhNPgvU1WBq+MYzr2ZCqY/+DKsURCM6qJUY3Qt2a7V27Er g==;
X-CSE-ConnectionGUID: 4ahF4aSxSfyvES8nMcUM5g==
X-CSE-MsgGUID: 1Zk3mrErQJycAWOg7lnrJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="59585374"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="59585374"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:34:22 -0800
X-CSE-ConnectionGUID: /98w11kIReq8ZR9X7D5QSg==
X-CSE-MsgGUID: gDXjgsDQRrSIhK0p4oT4rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216931330"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:34:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 4/4] drm/xe/reg_sr: Allow register_save_restore_check
 debugfs to verify LRC values
Date: Wed, 11 Feb 2026 15:34:16 -0800
Message-ID: <20260211233411.614951-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211233411.614951-6-matthew.d.roper@intel.com>
References: <20260211233411.614951-6-matthew.d.roper@intel.com>
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

reg_sr programming that applies to an engines LRC cannot be verified by
a simple CPU-based register readout because the reg_sr's values may not
be in effect if no context is executing on the hardware at the time we
check.  Instead, we should verify correct reg_sr application by
searching for the register in the default_lrc.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++--
 drivers/gpu/drm/xe/xe_reg_sr.c     | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_reg_sr.h     |  4 ++++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index aa43427a9f4b..f45306308cd6 100644
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
index 75aa4426b3ec..27a9447a672b 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -21,6 +21,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_hw_engine_types.h"
+#include "xe_lrc.h"
 #include "xe_mmio.h"
 #include "xe_rtp_types.h"
 
@@ -242,3 +243,31 @@ void xe_reg_sr_readback_check(struct xe_reg_sr *sr,
 				   offset, mask, entry->set_bits, val & mask);
 	}
 }
+
+/**
+ * xe_reg_sr_lrc_check() - Check LRC for registers referenced in save/restore
+ *     entries and check whether the programming is in place.
+ * @sr: Save/restore entries
+ * @gt: GT to read register from
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
index cd133a09aa9b..1ec6e8ecf278 100644
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

