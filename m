Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB24E8B361
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 21:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B210E266;
	Tue,  3 Feb 2026 21:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyGQxnSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB9D10E266
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 21:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770153186; x=1801689186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4d0/d5HFD82YC34dDUWpGXAwYEoyUDUHJ7ySI2rmbAQ=;
 b=cyGQxnSCEf/StBP4ycch61zNOF348d461JjQBKkUh2w52pgR5oXuf6ZY
 LTqzXKG3MrbbQwm4N0BMhQU7V0oGDeG30Vj5j77fc+nZut/J/oRUgbT2O
 Q2XY70jFCRVrttsKkZ/ONxtLafbRguqZf1RduPuyCav0kkdZvc3JNKW/b
 nAjDBrBT7ec8CHkKC8CajBN7JiXs9ID4KXAbn++32VWQVx3kCqEq6YElu
 sQOgBJ3TRYbq8grNcZzziSlvoZEL9F5L1saSebnezhVYkzRN1XBTY5iPM
 WRxmksHJCT/xb002zbEtlnl1AssaCGfzOMwBeEFDPwt2qV9jiCA2bFKAu g==;
X-CSE-ConnectionGUID: NGrmXXYsQUywJSf4av9zFA==
X-CSE-MsgGUID: ylWVfA8lSx6GyNkJiwKj2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58913896"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="58913896"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:13:06 -0800
X-CSE-ConnectionGUID: widF1wZeQU+o31WUXJlnog==
X-CSE-MsgGUID: 5WWZC0aPT6+4R5/QzcSQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210079740"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.19.151])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 13:13:03 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/4] drm/xe: Move xe_root_tile_mmio() to xe_device.h
Date: Tue,  3 Feb 2026 22:12:36 +0100
Message-ID: <20260203211240.745-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203211240.745-1-michal.wajdeczko@intel.com>
References: <20260203211240.745-1-michal.wajdeczko@intel.com>
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

It seems to be a better place for this helper function, where
we already have other 'root' oriented helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
v1: https://patchwork.freedesktop.org/patch/656884/?series=149807&rev=1
v2: rebased
---
 drivers/gpu/drm/xe/xe_device.h       | 5 +++++
 drivers/gpu/drm/xe/xe_i2c.c          | 2 +-
 drivers/gpu/drm/xe/xe_mmio.h         | 5 -----
 drivers/gpu/drm/xe/xe_nvm.c          | 2 +-
 drivers/gpu/drm/xe/xe_soc_remapper.c | 1 +
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 58d7d8b2fea3..39464650533b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -109,6 +109,11 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 	return xe_device_get_root_tile(xe)->primary_gt;
 }
 
+static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
+{
+	return &xe->tiles[0].mmio;
+}
+
 static inline bool xe_device_uc_enabled(struct xe_device *xe)
 {
 	return !xe->info.force_execlist;
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 1e1fb72e49bf..1deb812fe01d 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -27,7 +27,7 @@
 #include "regs/xe_i2c_regs.h"
 #include "regs/xe_irq_regs.h"
 
-#include "xe_device_types.h"
+#include "xe_device.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index cd355a43af3d..b7e69ed67cbe 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -38,11 +38,6 @@ static inline u32 xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
 	return addr;
 }
 
-static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
-{
-	return &xe->tiles[0].mmio;
-}
-
 #ifdef CONFIG_PCI_IOV
 void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index bc88804de514..1fdfb690ea3d 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -6,7 +6,7 @@
 #include <linux/intel_dg_nvm_aux.h>
 #include <linux/pci.h>
 
-#include "xe_device_types.h"
+#include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
index 1c391d719196..c031336a6d75 100644
--- a/drivers/gpu/drm/xe/xe_soc_remapper.c
+++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
@@ -4,6 +4,7 @@
  */
 
 #include "regs/xe_soc_remapper_regs.h"
+#include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_soc_remapper.h"
 
-- 
2.47.1

