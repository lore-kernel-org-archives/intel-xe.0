Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C6CCCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973B210E7D5;
	Wed,  5 Nov 2025 23:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Te2IxPpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3459C10E7D1
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762386481; x=1793922481;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6x6zJ39nhL/FzuH/+127VI7bhDuJvr4b98CdtdL3azg=;
 b=Te2IxPpLw+pTvF12EEhQUbKOqJPtiKsqvaYbUNZ/uPNOspH7/3vGZSfD
 kL/pXMuABoGzlZ+W6mLA1LcxFYk1aJf2ts3hFqijFsfxv91awAVVlLeXr
 78xQNobV3BF/XQWmq27E5IT2R6MeHW2kAgz3aFw8uzFOSiUZM7Uz4wB2W
 QEbQJ+NblJnuFWiuUDI/DEcYM1IMQ4a+4yGOgnqLZ2dYgMTWolYSaUS67
 xO/rd/0D+REr3yqjQ+CLe15zdFXX4s+Gdb2tl+z1EFUOGHstY53HvGkg2
 gRQmkx5VohT5EOEU1tRAjET7VlosLfn1jMItBV03nkiEw+8j8T0Lxui2I w==;
X-CSE-ConnectionGUID: 06Sxa7jBQc6pHr7CKY0oSA==
X-CSE-MsgGUID: bO5g3JQxQ7Gw/xT2XWYotg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="89980379"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="89980379"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
X-CSE-ConnectionGUID: 1awBgxlpSYu+4eIgoxR6pg==
X-CSE-MsgGUID: UBCuOD1VSs+To2+LUGxEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="188319630"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:48:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	badal.nilawar@intel.com
Subject: [PATCH 3/4] drm/xe/remapper: Add system controller index for remapper
Date: Wed,  5 Nov 2025 15:47:57 -0800
Message-ID: <20251105234753.603647-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
References: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
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

Add configuration helpers in SoC remapper to enable access to system
controller MMIO registers.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_remapper_regs.h |  1 +
 drivers/gpu/drm/xe/xe_remapper.c           | 20 ++++++++++++++------
 drivers/gpu/drm/xe/xe_remapper.h           |  1 +
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_remapper_regs.h
index 96bfc445555e..4b83e91dcde4 100644
--- a/drivers/gpu/drm/xe/regs/xe_remapper_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_remapper_regs.h
@@ -9,5 +9,6 @@
 
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_TELEM_BITS		REG_GENMASK(31, 24)
+#define   SG_REMAP_SYSCTRL_BITS		REG_GENMASK(23, 16)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_remapper.c b/drivers/gpu/drm/xe/xe_remapper.c
index fc67efcf6709..b910cef7b8c6 100644
--- a/drivers/gpu/drm/xe/xe_remapper.c
+++ b/drivers/gpu/drm/xe/xe_remapper.c
@@ -9,18 +9,26 @@
 #include "xe_mmio.h"
 #include "xe_remapper.h"
 
-void xe_remapper_set_telem_region(struct xe_device *xe, u32 index)
+static void xe_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
+				   u32 mask, u32 val)
 {
 	unsigned long flags;
 
 	spin_lock_irqsave(&xe->remapper.lock, flags);
+	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
+	spin_unlock_irqrestore(&xe->remapper.lock, flags);
+}
 
-	xe_mmio_rmw32(xe_root_tile_mmio(xe),
-		      SG_REMAP_INDEX1,
-		      SG_REMAP_TELEM_BITS,
-		      REG_FIELD_PREP(SG_REMAP_TELEM_BITS, index));
+void xe_remapper_set_telem_region(struct xe_device *xe, u32 index)
+{
+	xe_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_TELEM_BITS,
+			       REG_FIELD_PREP(SG_REMAP_TELEM_BITS, index));
+}
 
-	spin_unlock_irqrestore(&xe->remapper.lock, flags);
+void xe_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
+{
+	xe_remapper_set_region(xe, SG_REMAP_INDEX1, SG_REMAP_SYSCTRL_BITS,
+			       REG_FIELD_PREP(SG_REMAP_SYSCTRL_BITS, index));
 }
 
 void xe_remapper_init(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_remapper.h b/drivers/gpu/drm/xe/xe_remapper.h
index 4deb8ad3c69c..728447ea5786 100644
--- a/drivers/gpu/drm/xe/xe_remapper.h
+++ b/drivers/gpu/drm/xe/xe_remapper.h
@@ -12,5 +12,6 @@
 
 void xe_remapper_init(struct xe_device *xe);
 void xe_remapper_set_telem_region(struct xe_device *xe, u32 index);
+void xe_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
 
 #endif
-- 
2.43.0

