Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87137C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DB210F64C;
	Thu,  3 Sep 2026 14:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4c5gOMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A29210F66A
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788445194; x=1819981194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X6o8UMKTKtIbqfjPawmcBOXUO4vvUvGmShcu3ON7I2o=;
 b=D4c5gOMJwdqbQPUqaMN5e9BXn8mWc7WgIvmevm9EOP8vykMW7ginaDZJ
 fewEcYw6LRdlqcj4+rCcwqAHoAjnBZw0pwuc3BMzTxa8SDOxfNuXIibOa
 NkgadbU/5Vhr2S3QaDVO0dOX3vLiU1L2qxEAeY7ISVkcpt8b0x10/YwlA
 R0Izp9swuxU+CBjcuE2wLYKxwu3vGDRmuAoQjhxWCnqlV9BMENg4GmtlY
 pSsO0gzwrBxsYXYuwKTTg+gBUzxCe+uMNtYjFUblFWXi17/yEiUQ9qRo1
 ojB9eIPhj9XtrdUkZRumY0vJNx1lAX0os9ZtO8m0LMLRwUjjukG4MRJdH w==;
X-CSE-ConnectionGUID: MU3OGAshTTW7PNHFv5yVpw==
X-CSE-MsgGUID: LCwJGnCXT+SXvWoB4koJPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92797495"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92797495"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 07:19:54 -0700
X-CSE-ConnectionGUID: 5GBJNGDITbaTmCQuv9djdg==
X-CSE-MsgGUID: 5cjOTZ0fSceSV5hHvomV5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275014737"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2026 07:19:52 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 5/7] drm/xe/guc: add TDL,
 SLICE gfx registers to capture list
Date: Thu,  3 Sep 2026 19:48:32 +0530
Message-ID: <20260903141834.1315675-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
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

Add ROW_INSTDONE_TDL_GFX, SS_LSC_HDC_IDLE_TDL_GFX and SLICE_ARB_STATUS
register definitions and include them in the XeHPG extended GuC capture
register list.

v2:(Sashiko)
- Refactored ROW_INSTDONE_TDL_GFX to ROW_INSTDONE_TDL_GFX
- Add SLICE_ARB_STATUS register to xeHP register list
- Refactor commit message

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
 drivers/gpu/drm/xe/xe_guc_capture.c  | 5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 05542f20c7b5..b3ce7074f7d7 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -504,6 +504,8 @@
 #define PAGE_FLTRPTQ_HEAD_GAMCTRL		XE_REG(0xcf90)
 #define PAGE_FLTRPTQ_TAIL_GAMCTRL		XE_REG(0xcf94)
 
+#define SLICE_ARB_STATUS			XE_REG_MCR(0xd814)
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
@@ -568,6 +570,9 @@
 #define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
 #define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
 
+#define ROW_INSTDONE_TDL_GFX			XE_REG_MCR(0xe580)
+#define SS_LSC_HDC_IDLE_TDL_GFX			XE_REG_MCR(0xe584)
+
 #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 53171cf5e8b6..026e8d628c30 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -376,7 +376,10 @@ static const struct __ext_steer_reg xehpg_extregs[] = {
 	{"SC_INSTDONE",			XEHPG_SC_INSTDONE},
 	{"SC_INSTDONE_EXTRA",		XEHPG_SC_INSTDONE_EXTRA},
 	{"SC_INSTDONE_EXTRA2",		XEHPG_SC_INSTDONE_EXTRA2},
-	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT}
+	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT},
+	{"ROW_INSTDONE_TDL_GFX",	ROW_INSTDONE_TDL_GFX},
+	{"SS_LSC_HDC_IDLE_TDL_GFX",	SS_LSC_HDC_IDLE_TDL_GFX},
+	{"SLICE_ARB_STATUS",		SLICE_ARB_STATUS}
 };
 
 static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
-- 
2.43.0

