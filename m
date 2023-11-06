Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAB2C4708E
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AA710E2DC;
	Mon,  6 Nov 2023 11:22:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF2810E2D2
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269754; x=1730805754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=msGp1nwSKRAecfS7QwnnBc5oaadDIaV/psJyxTmEQew=;
 b=j5+AULSv5IBuSzS0hvGskKxPIVX4rBs9ryC1iECrlxia2BxSgduZeb6f
 CFHnG5xyMHRDWE8K4dWqwgQik4y7/KfyOKDS/IWr5Noz9DJXhU5lAuaPs
 2P/mkBt8hvcZnZOU2/xV7+QzXXjkYrh7RheM6OYXzprs2Ii8CdecAHQHA
 h1ImS+H1wG5VZMoDMAleHESQ4WpxgV7ArC1Vl3XU8B6ETExRC/oVInSZR
 OCszH1uDh69tX6Mw3Z/Tnw7ZzOU6ITrcX5OeiwAzFZTXv2loJu1nNgFNX
 r+/dgiso9bzwsM8h8F3ieSOmU5nCpv8lgwN23ne0RzaNjgu+6aPMJPE7N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646787"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646787"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411572"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411572"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:20 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:27 +0200
Message-Id: <20231106111845.2333093-8-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 07/25] drm/xe: Export xe_hw_engine's mmio accessors
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

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 5 ++---
 drivers/gpu/drm/xe/xe_hw_engine.h | 5 +++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 59ce9574b1c5..b86632972e7c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -244,8 +244,7 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 	hwe->gt = NULL;
 }
 
-static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
-				   u32 val)
+void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
@@ -255,7 +254,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
 	xe_mmio_write32(hwe->gt, reg, val);
 }
 
-static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
+u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..f83a42b2f0d3 100644
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

