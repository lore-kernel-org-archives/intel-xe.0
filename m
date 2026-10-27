Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034C606A327
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Auv6vxTT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42FA10E3B5;
	Tue, 27 Oct 2026 05:13:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A948F10E2A4
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 05:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793077989; x=1824613989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6o9sNKOzI4SCns1jSQaxrxaWTtE9J8WXPmF1llhsvfY=;
 b=Auv6vxTTVJ3P60/NT1t93E+tg7ju2xav5JZF3H0aApW+3gy+rVLLFk0A
 1si75a/fvhCfSsNXNda389g78pO3fQ2BxTpWdFnHMYRV4KTyzsr7tAHQo
 lVOmC3SPsFs4Zdy3kU2YDLd6E66q2dXtpT3p1uDwX4ALAEptYHsXIA5q3
 jVQ6bxMV6t0SlTnI/nNPWtiZQZWlLEyiqVsz13aPW0bI7VgUNvKPcm3Fu
 gv5cShYdB0JAejkh3EYPA4Lojk8RlSxbvCZclZrWrrfK+mzVPgzm0Oja8
 TxJaYaswzAFsHr+tUjIKeLmIq8v2YulsSb8is6HhaqqWH3T7B6lkoYE12 w==;
X-CSE-ConnectionGUID: 5N9UMXsLS32D1x2UKVqVOQ==
X-CSE-MsgGUID: o5zkj3DURyGKPblOFcrn5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1857331"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1857331"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 22:13:07 -0700
X-CSE-ConnectionGUID: Romor3nASx2EDHYxOqAnAQ==
X-CSE-MsgGUID: BVnTGbDTTEadLwCl9oP/mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4536710"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 26 Oct 2026 22:13:06 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: tejas.upadhyay@intel.com, Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v6 5/7] drm/xe/guc: add TDL,
 SLICE gfx registers to capture list
Date: Tue, 27 Oct 2026 10:40:22 +0530
Message-ID: <20261027051024.465587-6-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027051024.465587-1-naresh.kumar.g@intel.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add ROW_INSTDONE_TDL_GFX, SS_LSC_HDC_IDLE_TDL_GFX and SLICE_ARB_STATUS
register definitions and include them in the XeHPG extended GuC capture
register list.

v2:(Sashiko)
- Refactored ROW_INSTDONE_TDL_GFX to ROW_INSTDONE_TDL_GFX
- Add SLICE_ARB_STATUS register to xeHP register list
- Refactor commit message

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
 drivers/gpu/drm/xe/xe_guc_capture.c  | 5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index ad8aa6e10e361..f884fc2e38aaf 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -533,6 +533,8 @@
 #define PAGE_FLTRPTQ_HEAD			XE_REG_MCR(0xcf90)
 #define PAGE_FLTRPTQ_TAIL			XE_REG_MCR(0xcf94)
 
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
index 850e428b0f86b..a8a3271991e2a 100644
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

