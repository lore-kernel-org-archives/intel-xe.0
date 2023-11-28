Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AAFC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 20:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547A410E333;
	Tue, 28 Nov 2023 20:32:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF72710E32A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701203538; x=1732739538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BILevkCWUsp0/c4zuJxgPr0zgZvHlqzUXb+TOKDJbqQ=;
 b=dEk+2ld5riIBKJh0rK/A9QbzHYWRzubDR/JoaekUW/gN2nHwEo5xyVhf
 E5YAiBGNcgZxMx2KxYCorVr6vVSRSFK/byCvFqZK1zLtUh0ffOGOj7Zdc
 G1crZNkqQpysXV/IBvRiJicJKxyQAGSEBZZva/XPVmZDkOd1PsSOqWWhS
 UOgdgf9wrUFrXlz1V6Cujs48p+PprPTyWdnBTROmXhEIzcLzNZFuAskoq
 2W33/1Z4QhJ9cpLft7468Ccacu3NUnpdQaV1iFos6Hes6c6RY5ftutHat
 rWuwK4ZT+1CL4SbeI3XLp+5zGBwxGr8ehINd0Lhp7Wq+hUHn5Il1PnT40 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424168799"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="424168799"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:32:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="17038416"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:32:16 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 21:32:03 +0100
Message-Id: <20231128203203.1147-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231128203203.1147-1-michal.wajdeczko@intel.com>
References: <20231128203203.1147-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe/guc: Include only required GuC ABI
 headers
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On i915 we were adding new GuC ABI headers directly to guc_fwif.h
file since we were replacing old definitions from that file.

On xe driver we could do more and better by including ABI headers
only in files that need those definitions.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/741
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c        | 1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 1 +
 drivers/gpu/drm/xe/xe_guc.c                 | 2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 2 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h            | 6 ------
 drivers/gpu/drm/xe/xe_guc_hwconfig.c        | 1 +
 drivers/gpu/drm/xe/xe_guc_pc.c              | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c          | 2 ++
 8 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 03c1ab0ab0ca..a33f4a37bf2d 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -12,6 +12,7 @@
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 
+#include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index a28f31c05b1b..7eef23a00d77 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -5,6 +5,7 @@
 
 #include "xe_gt_tlb_invalidation.h"
 
+#include "abi/guc_actions_abi.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 08142d8ee052..e6f680efb29e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -7,6 +7,8 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_actions_abi.h"
+#include "abi/guc_errors_abi.h"
 #include "generated/xe_wa_oob.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c44e75074695..6295d916e39f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -11,6 +11,8 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_actions_abi.h"
+#include "abi/guc_klvs_abi.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 4216a6d9e478..4dd5a88a7826 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -8,13 +8,7 @@
 
 #include <linux/bits.h>
 
-#include "abi/guc_actions_abi.h"
-#include "abi/guc_actions_slpc_abi.h"
-#include "abi/guc_communication_ctb_abi.h"
-#include "abi/guc_communication_mmio_abi.h"
-#include "abi/guc_errors_abi.h"
 #include "abi/guc_klvs_abi.h"
-#include "abi/guc_messages_abi.h"
 
 #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 57d325ec8ce3..98bb9bb30705 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e9dd6c3d750b..2919c6aea403 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -9,6 +9,8 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_actions_abi.h"
+#include "abi/guc_actions_slpc_abi.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 97e87c701af5..46b132ee1d3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -13,6 +13,8 @@
 
 #include <drm/drm_managed.h>
 
+#include "abi/guc_actions_abi.h"
+#include "abi/guc_klvs_abi.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
 #include "xe_devcoredump.h"
-- 
2.25.1

