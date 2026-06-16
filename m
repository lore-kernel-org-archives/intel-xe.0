Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF25BCD98F6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872D610EB4C;
	Tue, 16 Jun 2026 12:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0g2H2Lv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AF710EB4D;
 Tue, 16 Jun 2026 12:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613963; x=1813149963;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SgZQA1kWXTj2s7LWxQLMXB9WUJLQG8Xyv4Ix7KRY+r4=;
 b=j0g2H2LvIFthDqaycmPuIAfa2YS9zNG1SnvLT2avGlrT8zBn09prRIFx
 EqlGs31JVERevhhLZ3790oTZ82KqJb4Z6mqHmlnNJY8poTPNeZjog4VVh
 j0zNWNqIybqIU1sIlDRPxYvDZszaUAGeqnGaBJB4GCWEIlyL8rXiVyRrA
 mWmw91oI2OkJT8wHDefDfCkbL4+G/AeCqCgSlPPRwLZWOh+3a/HKN0ApW
 xJd0dhJDu0pEnKQ+TTrzzTnwLBztQDE69DAsABWJsqyprSWq37k5YzWC9
 flnX2hZ/xT8mm0l3c/vm0TXI4oe70woet3lkIGh+iZTN4zP871Onmn+Bx w==;
X-CSE-ConnectionGUID: wS7X2lYbTHqcYKGc/pKvYA==
X-CSE-MsgGUID: KCouJa3gSj2j+zKqYSOpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513294"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513294"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:46:03 -0700
X-CSE-ConnectionGUID: hv+8OTPwQRSOG+3ar6x0Pg==
X-CSE-MsgGUID: MLos0EqYSkKS90Kern5TVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876401"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:46:02 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 36/39] drm/i915/display: Add DC3CO count and residency in dmc
 debugfs
Date: Tue, 16 Jun 2026 18:14:12 +0530
Message-ID: <20260616124416.2442161-37-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

Expose DC3CO count and residency for xe3lp platforms via debugfs.

Changes in v4:
- Keep dc5_reg register initialization to avoid any
  invalid access (sashiko)

Changes in v5:
- Change XE3P_DMC_DC3CO_COUNT address to lower case (Manna Animesh).

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c      | 9 ++++++++-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a133785c815b..5ffe2b1c3c51 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1650,7 +1650,14 @@ static int intel_dmc_debugfs_status_show(struct seq_file *m, void *unused)
 		   DMC_VERSION_MINOR(dmc->version));
 
 	if (DISPLAY_VER(display) >= 12) {
-		if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
+		if (DISPLAY_VER(display) >= 35) {
+			dc5_reg = DG1_DMC_DEBUG_DC5_COUNT;
+			seq_printf(m, "DC3CO count: %d\n",
+				   intel_de_read(display, XE3P_DMC_DC3CO_COUNT));
+
+			seq_printf(m, "DC3CO residency: %d\n",
+				   intel_de_read(display, DC_STATE_DC3CO_RESIDENCY));
+		} else if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
 			dc5_reg = DG1_DMC_DEBUG_DC5_COUNT;
 		} else {
 			dc5_reg = TGL_DMC_DEBUG_DC5_COUNT;
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index 38e342b45af0..6b7978fb8986 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -531,6 +531,8 @@ enum pipedmc_event_id {
 #define TGL_DMC_DEBUG3		_MMIO(0x101090)
 #define DG1_DMC_DEBUG3		_MMIO(0x13415c)
 
+#define XE3P_DMC_DC3CO_COUNT	_MMIO(0x8f05c)
+
 #define DMC_WAKELOCK_CFG	_MMIO(0x8F1B0)
 #define  DMC_WAKELOCK_CFG_ENABLE REG_BIT(31)
 #define DMC_WAKELOCK1_CTL	_MMIO(0x8F140)
-- 
2.43.0

