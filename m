Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0037C52CDC
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454ED10E9A7;
	Fri, 26 Jul 2024 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxLgUVF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94DF10E9A3
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003451; x=1753539451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gujz2VoCsc9MvB3d1TZpJjrrJLHzIXKjzWX+ilCWNFI=;
 b=FxLgUVF9RnqrFFuk4/Jm66MJPO50p15mM8yOypklEMC5dQF1Y+9mOOmC
 l1wIO5G6z3/xMcWDS+LpasCVugNNer5YyUcSpDvaKArggurq6I0mA80mS
 t1ccgEj/f57gZytIY5NR6GPR5zPOp+KTi1r+Z5th2q1fZCNxnvXiTeA/k
 bqg9LJzKr4gtaiezGebaxI9q+Ns2cr+UY8Kmlu9SeOdH4xpC/wYmR5jv6
 8/cbWkwao/tXDjUDgFDs/zhLPD4433P/VEBXTWCyCdj64x3YC61jXRH+p
 8i7nxohA3wGy/fcuEEZSLM7rH+GjOvRGR6rsy+EsLUW+wqPYYmgCBQgcB g==;
X-CSE-ConnectionGUID: Hr7ZL91rQ0+vdcG0ICfChw==
X-CSE-MsgGUID: e+4vUYVhQHSY5Mx9RvILjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598741"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598741"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:16 -0700
X-CSE-ConnectionGUID: F8rWZBafQYOAscUeg3TuUw==
X-CSE-MsgGUID: 17azuePlRAOZae9SzxdDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861339"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:14 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 01/21] drm/xe: Export xe_hw_engine's mmio accessors
Date: Fri, 26 Jul 2024 17:07:58 +0300
Message-Id: <20240726140818.54304-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Declare hw engine's mmio accessors in header file.
This is in preparation to use these from eudebug code.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 5 ++---
 drivers/gpu/drm/xe/xe_hw_engine.h | 5 +++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 07ed9fd28f19..b8c0cfbf8b49 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -274,8 +274,7 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 	hwe->gt = NULL;
 }
 
-static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
-				   u32 val)
+void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
@@ -285,7 +284,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
 	xe_mmio_write32(hwe->gt, reg, val);
 }
 
-static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
+u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 900c8c991430..08c3a9df7154 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -62,6 +62,11 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
+
+void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
+
+u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
+
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 {
 	return hwe->name;
-- 
2.34.1

