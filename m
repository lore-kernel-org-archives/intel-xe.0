Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C15BCFA460
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 19:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5C210E21E;
	Wed, 23 Oct 2024 19:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpGb+dVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2D710E21E
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 19:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729711402; x=1761247402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pDKri2emUcdGUAKrGDXYpc/By3kvhGWXPM/EoGWU1jU=;
 b=bpGb+dVtA11dyBNhNB95bazq6kEkCIIkfV1kC3YSEvE+eYHvay7NSwVb
 i3CS8MAtK0uA1F5AnQY3OgHJjBeRTf5GJmvNWLeq4FBqvBrPc8tJPc1aG
 3/xQk/5ETfEyHui4t3LraBnEoE/dtpLOJcj15hzvGpNQ6q+ASLdPcStxw
 3JBjijFXuMZiR4zIlccZWi6Q/jTkSAy3g+aoSbZtyVCmkZrTc1zA2R0Go
 J7DGy2gM3p0pd9ScD8JMROwjmBdFhmPxHWsR2RRFQrkAr1xxTIJuoRe2F
 HnJPG6/f09zEWVp0gJzYW/zqvK7MTc9u8EZ8MaY5PIwAuXHdeXsxFqIiO A==;
X-CSE-ConnectionGUID: n7avwTBzSVSjvaR9FR4KdQ==
X-CSE-MsgGUID: maOvW7NpTeucqmy/i+SeRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29217830"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="29217830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 12:23:22 -0700
X-CSE-ConnectionGUID: UXEUMWc8S5ysKqJfmHxQ6Q==
X-CSE-MsgGUID: VqU6+ZZlScGO9DWJos3qZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="85146731"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 12:23:22 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add register
 order check
Date: Wed, 23 Oct 2024 12:23:07 -0700
Message-Id: <20241023192307.746525-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fix missing initial value for last_value.
For GuC capture register definition, it is required to define 64bit
register in a pair of 2 consecutive 32bit register entries, low first,
then hi. Add code to check this order.

Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 8b6cb786a2aa..d7ff7dd60a1d 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -102,6 +102,7 @@ struct __guc_capture_parsed_output {
  *                   A 64 bit register define requires 2 consecutive entries,
  *                   with low dword first and hi dword the second.
  *     2. Register name: null for incompleted define
+ *     3. Incorrect order will trigger XE_WARN.
  */
 #define COMMON_XELP_BASE_GLOBAL \
 	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	"FORCEWAKE_GT"}
@@ -1678,10 +1679,10 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 	struct xe_devcoredump *devcoredump = &xe->devcoredump;
 	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
 	struct gcap_reg_list_info *reginfo = NULL;
-	u32 last_value, i;
-	bool is_ext;
+	u32 i, last_value = 0;
+	bool is_ext, low32_ready = false;
 
-	if (!list || list->num_regs == 0)
+	if (!list || !list->list || list->num_regs == 0)
 		return;
 	XE_WARN_ON(!devcore_snapshot->matched_node);
 
@@ -1706,11 +1707,27 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 		value = reg->value;
 		if (reg_desc->data_type == REG_64BIT_LOW_DW) {
 			last_value = value;
+
+			/*
+			 * A 64 bit register define requires 2 consecutive
+			 * entries in register list, with low dword first
+			 * and hi dword the second, like:
+			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
+			 *  { XXX_REG_HI(0), REG_64BIT_HI_DW,  0, 0, "XXX_REG"},
+			 *
+			 * Incorrect order will trigger XE_WARN.
+			 */
+			XE_WARN_ON(low32_ready); /* Possible double low here */
+			low32_ready = true;
 			/* Low 32 bit dword saved, continue for high 32 bit */
 			continue;
 		} else if (reg_desc->data_type == REG_64BIT_HI_DW) {
 			u64 value_qw = ((u64)value << 32) | last_value;
 
+			/* Incorrect 64bit register order. Possible missing low */
+			XE_WARN_ON(!low32_ready);
+			low32_ready = false;
+
 			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
 			continue;
 		}
@@ -1727,6 +1744,9 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
 		}
 	}
+
+	/* Incorrect 64bit register order. Possible missing high */
+	XE_WARN_ON(low32_ready);
 }
 
 /**
-- 
2.34.1

