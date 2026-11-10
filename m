Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE3606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CoVf4tv6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4083410F146;
	Tue, 10 Nov 2026 18:47:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F4510F0E4;
 Tue, 10 Nov 2026 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794336421; x=1825872421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzQy76ISap8pTamGcp78u8HhnUEUVDEz4WNPU55WFr4=;
 b=CoVf4tv6jpIVNJo11Ory4HgVeQp++YI6O2q8gnfHkFLZOm5aPkJRJBUv
 kuSyNAj62G4yj5OYgsvBnrL41t9mRotcXMcUNYjL+uPAQK+ybBuN9rfjW
 2BKqXXgVN9Oi2fTM1dTkCFDYCYEpZ0qK8v7MtZRkuukLvTDtSJqlCy8wU
 u9/HkMYR+EsDOrqTrPif+v4TJbVDsCxW60MIDXfh2ZCMGV1QGnC8xOIZp
 JADtlWsnqGTxQa7PRL6zF/G4pCtZG/ENV419awxWPfUnugXsmj6EK9xyJ
 h/Kir64RfYWqJLF5DmGlzygLmUdAFGWvp9vM7TOL2+8mEWDtXPAcDAcG+ w==;
X-CSE-ConnectionGUID: KmdZl84QQBiTYiUAzAZG7A==
X-CSE-MsgGUID: iJ8u0jc3SLaVEqVGFa0T0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2975344"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2975344"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:47:01 -0800
X-CSE-ConnectionGUID: asCigTylTBWNQngJmWSCzQ==
X-CSE-MsgGUID: ysZCbVGBSqCWwimu5ZqWqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; d="scan'208";a="10007700"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:46:59 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 08/10] drm/i915: Nuke HAS_FPGA_DBG_UNCLAIMED()/.has_fpga_dbg
Date: Tue, 10 Nov 2026 20:46:19 +0200
Message-ID: <20261110184622.1721-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
References: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

HAS_FPGA_DBG_UNCLAIMED() and the underlying .has_fpga_dbg device
flag is now unused. Nuke it all.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 8 --------
 drivers/gpu/drm/i915/display/intel_display_device.h | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 69046d0cd5e9..055396f85e4a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -571,7 +571,6 @@ static const struct platform_desc hsw_desc = {
 	.info = &(const struct intel_display_device_info) {
 		.has_ddi = 1,
 		.has_dp_mst = 1,
-		.has_fpga_dbg = 1,
 		.has_hotplug = 1,
 		.has_psr = 1,
 		.has_psr_hw_tracking = 1,
@@ -624,7 +623,6 @@ static const struct platform_desc bdw_desc = {
 	.info = &(const struct intel_display_device_info) {
 		.has_ddi = 1,
 		.has_dp_mst = 1,
-		.has_fpga_dbg = 1,
 		.has_hotplug = 1,
 		.has_psr = 1,
 		.has_psr_hw_tracking = 1,
@@ -665,7 +663,6 @@ static const struct intel_display_device_info skl_display = {
 	.dbuf.slice_mask = BIT(DBUF_S1),
 	.has_ddi = 1,
 	.has_dp_mst = 1,
-	.has_fpga_dbg = 1,
 	.has_hotplug = 1,
 	.has_ipc = 1,
 	.has_psr = 1,
@@ -815,7 +812,6 @@ static const struct platform_desc cml_desc = {
 	.dbuf.slice_mask = BIT(DBUF_S1), \
 	.has_dp_mst = 1, \
 	.has_ddi = 1, \
-	.has_fpga_dbg = 1, \
 	.has_hotplug = 1, \
 	.has_ipc = 1, \
 	.has_psr = 1, \
@@ -874,7 +870,6 @@ static const struct platform_desc glk_desc = {
 	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2), \
 	.has_ddi = 1, \
 	.has_dp_mst = 1, \
-	.has_fpga_dbg = 1, \
 	.has_hotplug = 1, \
 	.has_ipc = 1, \
 	.has_psr = 1, \
@@ -965,7 +960,6 @@ static const struct platform_desc ehl_desc = {
 	.has_ddi = 1, \
 	.has_dp_mst = 1, \
 	.has_dsb = 1, \
-	.has_fpga_dbg = 1, \
 	.has_hotplug = 1, \
 	.has_ipc = 1, \
 	.has_psr = 1, \
@@ -1133,7 +1127,6 @@ static const struct platform_desc adl_s_desc = {
 	.has_ddi = 1,								\
 	.has_dp_mst = 1,							\
 	.has_dsb = 1,								\
-	.has_fpga_dbg = 1,							\
 	.has_hotplug = 1,							\
 	.has_ipc = 1,								\
 	.has_psr = 1,								\
@@ -1313,7 +1306,6 @@ static const struct platform_desc dg2_desc = {
 	.has_ddi = 1,								\
 	.has_dp_mst = 1,							\
 	.has_dsb = 1,								\
-	.has_fpga_dbg = 1,							\
 	.has_hotplug = 1,							\
 	.has_ipc = 1,								\
 	.has_psr = 1,								\
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 7121e7cd9512..4f82520ef960 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -134,7 +134,6 @@ struct intel_display_platforms {
 	func(has_ddi); \
 	func(has_dp_mst); \
 	func(has_dsb); \
-	func(has_fpga_dbg); \
 	func(has_gmch); \
 	func(has_hotplug); \
 	func(has_hti); \
@@ -177,7 +176,6 @@ struct intel_display_platforms {
 #define HAS_FBC(__display)		(DISPLAY_RUNTIME_INFO(__display)->fbc_mask != 0)
 #define HAS_FBC_DIRTY_RECT(__display)	(DISPLAY_VER(__display) >= 30)
 #define HAS_FBC_SYS_CACHE(__display)	(DISPLAY_VER(__display) >= 35 && !(__display)->platform.dgfx)
-#define HAS_FPGA_DBG_UNCLAIMED(__display)	(DISPLAY_INFO(__display)->has_fpga_dbg)
 #define HAS_FW_BLC(__display)		(DISPLAY_VER(__display) >= 3)
 #define HAS_GMBUS_BURST_READ(__display)	(DISPLAY_VER(__display) >= 10 || (__display)->platform.kabylake)
 #define HAS_GMBUS_IRQ(__display)	(DISPLAY_VER(__display) >= 4)
-- 
2.56.0

