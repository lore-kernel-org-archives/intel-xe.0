Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30646CA9EDE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D892510F19F;
	Mon, 12 Oct 2026 14:55:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0AE10F19B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791816897; x=1823352897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1qcE31WfrIyMLwMG5i2dMJltzsYIjkWurt1qRxifOKk=;
 b=hLHgG8oQfmas9oKIF7qiIY6OUI2Xo4Z1l/D+K7+5jRDOwqOxv3V9JoxQ
 paPtN2y9iymZOhjC6QZXTbqkLD72k+2R+6XeBx1M3zrduUpO+hfNarFlv
 Tl2QH5ZWdxomIrZUAGQaSQuDgcDv8TCp29I9w2FzZraPjYVmoktRYY4Jj
 J5gmta6b5i4XP5kshHTb+aGrwQwVImttGmH0FykTdQ33HuATMiHEabfkp
 nK/W0exUdOHcdEJI8MQQYDPjHCi3oiG8CG9RUbD0TJDlbcIlHVvNZAkv0
 yt10NV0Sk3174Q+GeD5Tgs+corF5sw4yHHDPY717gbkf/vCDKW9AerTVc A==;
X-CSE-ConnectionGUID: M3uGER+eSPeHWCzFya9AEg==
X-CSE-MsgGUID: 81OUQ/XgTnGuytoGBS45Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="513561"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="513561"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:54:56 -0700
X-CSE-ConnectionGUID: OKUb1/gsS+G/VHaKH3k0gA==
X-CSE-MsgGUID: Nh4Z3d/JTIyCwqKr9834TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2675269"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa013.fm.intel.com with ESMTP; 12 Oct 2026 07:54:56 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v4 5/7] drm/xe/guc: add TDL,
 SLICE gfx registers to capture list
Date: Mon, 12 Oct 2026 20:22:35 +0530
Message-ID: <20261012145237.3788198-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
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
index e9eb0bd04af1..2e4cb4957479 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -533,6 +533,8 @@
 #define PAGE_FLTRPTQ_HEAD_GAMCTRL		XE_REG(0xcf90)
 #define PAGE_FLTRPTQ_TAIL_GAMCTRL		XE_REG(0xcf94)
 
+#define SLICE_ARB_STATUS			XE_REG_MCR(0xd814)
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
@@ -597,6 +599,9 @@
 #define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
 #define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
 
+#define ROW_INSTDONE_TDL_GFX			XE_REG_MCR(0xe580)
+#define SS_LSC_HDC_IDLE_TDL_GFX			XE_REG_MCR(0xe584)
+
 #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 3e99aef53b46..6a20eab0f820 100644
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

