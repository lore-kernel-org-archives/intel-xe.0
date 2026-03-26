Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA0F10A88D4
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B86110EB32;
	Thu, 26 Mar 2026 17:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzpAp8IP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E2910EB09;
 Thu, 26 Mar 2026 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545347; x=1806081347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=amNWHUT/CcvPrI/zW+e2XMzZsPkD4CCOu1jj3CSkCbk=;
 b=MzpAp8IP0Yi6Ct47WKSiHUo2zXVYAsP97ziuhlTA+ozJpXEp0foSpS+9
 OXbxo9TKrzSGJEwVufkTDR52YmR/IJAsDKp7FiBq46hgk/zYyCyk8atMU
 Of609MrW7HhRjRxwk/NsZZwsk0rQUrim5wZjraUu/KtLo7tX0s9aSuQS8
 9u1C6OhUNHaTqo2EGfUumIM3ETulmiEt/cD3YrP6TOxjhgFS3fjmUgGiY
 1AqzbkowGZZssXvP/8PjUHz0ztrs/zKuOf1drpof2pyR+lSa0be/sf5cb
 lxGJqQV8fZQapdQb9/+KY8eMU2x1MuW4Izcioo7jTF99evkLnIa83qfNQ A==;
X-CSE-ConnectionGUID: 8rHhkKgwSxaFxXvl7jzCzA==
X-CSE-MsgGUID: WPyhCuHITP++opulMLvMHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630609"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630609"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:47 -0700
X-CSE-ConnectionGUID: Q9FSWBvRSJO6cRvmZUZJuQ==
X-CSE-MsgGUID: q2ZrAq0bSw6ReYbwSs0hew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975661"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:45 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 17/19] drm/i915/display: Remove DC3CO DMC debugfs
Date: Thu, 26 Mar 2026 22:45:55 +0530
Message-ID: <20260326171557.2065632-18-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
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

DC3CO is not enabled on TGL and DG1. Remove the debugfs entry for
DC3CO counts. A new debugfs entry for Xe3LP will be added in a
subsequent patch.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 74d18806d01f..f0ebdab089ca 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1645,19 +1645,13 @@ static int intel_dmc_debugfs_status_show(struct seq_file *m, void *unused)
 		   DMC_VERSION_MINOR(dmc->version));
 
 	if (DISPLAY_VER(display) >= 12) {
-		i915_reg_t dc3co_reg;
-
 		if (display->platform.dgfx || DISPLAY_VER(display) >= 14) {
-			dc3co_reg = DG1_DMC_DEBUG3;
 			dc5_reg = DG1_DMC_DEBUG_DC5_COUNT;
 		} else {
-			dc3co_reg = TGL_DMC_DEBUG3;
 			dc5_reg = TGL_DMC_DEBUG_DC5_COUNT;
 			dc6_reg = TGL_DMC_DEBUG_DC6_COUNT;
 		}
 
-		seq_printf(m, "DC3CO count: %d\n",
-			   intel_de_read(display, dc3co_reg));
 	} else {
 		dc5_reg = display->platform.broxton ? BXT_DMC_DC3_DC5_COUNT :
 			SKL_DMC_DC3_DC5_COUNT;
-- 
2.43.0

