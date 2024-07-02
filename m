Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4D4C30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 18:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E85F10E67A;
	Tue,  2 Jul 2024 18:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNGPsbtj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D452010E67A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719945440; x=1751481440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5jBqNERi1+ZTIN+hIhhBqtKqjU+QBkepN91rVnjA+dI=;
 b=PNGPsbtj+Vjwd1hG+QyUpBwIA5C6mR//l4Cr8slW4o46yKrT8NvRjIJZ
 mB234N0RuDlj8BSTkLbQ8iliZupcZdlrvd8yWurvFr82KwCh2+WmN8R6n
 qFUSw0HdJK84K82O1ntoYl2I9WpERC7xBOyesde2ec0O+kGpogEKsco+A
 6KkPBiEx94zxrA4DUheXG7flbtLe278dahmXNy1aQ6JPNfxAmlzbhb6hQ
 DyRGtvzJbYxp2+TGnR1HAwRCZSEDlOiV4P89DGRCE59FDmtwbgkY9ZmsX
 CowFmVOftRl0fjL1LRTAeFjw8+Xn+kXeWWbr2bsquYznoTcSYLC1u3X2o w==;
X-CSE-ConnectionGUID: H4wC3o8dTvmA/XB5rB18eg==
X-CSE-MsgGUID: QnAe8RRdSfWYbU18jN6Qvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27756729"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="27756729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:37:20 -0700
X-CSE-ConnectionGUID: c8nXjwvoQeOdUhTlB765ig==
X-CSE-MsgGUID: ntwrkygvRFCoBHAXD8O1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="50604338"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:37:19 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe: Kill regs/xe_sriov_regs.h
Date: Tue,  2 Jul 2024 20:37:03 +0200
Message-Id: <20240702183704.1022-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240702183704.1022-1-michal.wajdeczko@intel.com>
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is no real benefit to maintain a separate file. The register
definitions related to SR-IOV can be placed in existing headers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h    |  6 ++++++
 drivers/gpu/drm/xe/regs/xe_regs.h       |  6 ++++++
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h | 23 -----------------------
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c     |  2 +-
 drivers/gpu/drm/xe/xe_lmtt.c            |  2 +-
 drivers/gpu/drm/xe/xe_sriov.c           |  2 +-
 6 files changed, 15 insertions(+), 26 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d44564bad009..141d0e0faa21 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -88,6 +88,8 @@
 #define VE1_AUX_INV				XE_REG(0x42b8)
 #define   AUX_INV				REG_BIT(0)
 
+#define XE2_LMEM_CFG				XE_REG(0x48b0)
+
 #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
@@ -395,6 +397,10 @@
 #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
 #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
 
+#define LMEM_CFG				XE_REG(0xcf58)
+#define   LMEM_EN				REG_BIT(31)
+#define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 23ecba38ed41..55bf47c99016 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -30,6 +30,9 @@
 #define GU_DEBUG				XE_REG(0x101018)
 #define   DRIVERFLR_STATUS			REG_BIT(31)
 
+#define VIRTUAL_CTRL_REG			XE_REG(0x10108c)
+#define   GUEST_GTT_UPDATE_EN			REG_BIT(8)
+
 #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
 #define   TILE_COUNT				REG_GENMASK(15, 8)
 
@@ -66,6 +69,9 @@
 #define   DISPLAY_IRQ				REG_BIT(16)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
 
+#define VF_CAP_REG				XE_REG(0x1901f8, XE_REG_OPTION_VF)
+#define   VF_CAP				REG_BIT(0)
+
 #define PVC_RP_STATE_CAP			XE_REG(0x281014)
 
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
deleted file mode 100644
index 017b4ddd1ecf..000000000000
--- a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _REGS_XE_SRIOV_REGS_H_
-#define _REGS_XE_SRIOV_REGS_H_
-
-#include "regs/xe_reg_defs.h"
-
-#define XE2_LMEM_CFG			XE_REG(0x48b0)
-
-#define LMEM_CFG			XE_REG(0xcf58)
-#define   LMEM_EN			REG_BIT(31)
-#define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
-
-#define VIRTUAL_CTRL_REG		XE_REG(0x10108c)
-#define   GUEST_GTT_UPDATE_EN		REG_BIT(8)
-
-#define VF_CAP_REG			XE_REG(0x1901f8, XE_REG_OPTION_VF)
-#define   VF_CAP			REG_BIT(0)
-
-#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 9dbba9ab7a9a..ef239440963c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -5,7 +5,7 @@
 
 #include <drm/drm_managed.h>
 
-#include "regs/xe_sriov_regs.h"
+#include "regs/xe_regs.h"
 
 #include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 418661a88918..c5fdb36b6d33 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -7,7 +7,7 @@
 
 #include <drm/drm_managed.h>
 
-#include "regs/xe_sriov_regs.h"
+#include "regs/xe_gt_regs.h"
 
 #include "xe_assert.h"
 #include "xe_bo.h"
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index a274a5fb1401..5a1d65e4f19f 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -5,7 +5,7 @@
 
 #include <drm/drm_managed.h>
 
-#include "regs/xe_sriov_regs.h"
+#include "regs/xe_regs.h"
 
 #include "xe_assert.h"
 #include "xe_device.h"
-- 
2.43.0

