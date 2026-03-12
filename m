Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A4F105A59D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 13:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD0310E9F0;
	Thu, 12 Mar 2026 13:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzABFczR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C3C10E9F2;
 Thu, 12 Mar 2026 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773321929; x=1804857929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iDYCfgxui0Vcp8E3XYR5CUDGg793MWX6zUY6R3Dw364=;
 b=VzABFczRD7/Rx1LDgzv4W2dctXUfffdfGwQI/gYm67PK38PaMNTcDxmE
 +V+nqkRMtHfZSHMX+LQ0wvzWZU2QjZV8/kNT5gmDz+8/cdHJsImLWMwOO
 l2uwbG+BQxBDZL5Q9HVMHZrzfK8TZ1c2KGSYwvjymuqtvCHq+dMX7D7JH
 WNzXftJGbcbaAVjBYxL0Rq3tZDzJoooCWJNlS0LBc6l1bG+p7rJP79zWU
 weETgcn9ddNoj7ZpNmPJbW7l8enJBPPyeaVjwUhYv5fBkX9dxVxYtY8LM
 NWYopXQU3Fdip15zqiHSDxZHZC1gXhxbfiB7A2cKRatr4ZANunzUGvwX6 A==;
X-CSE-ConnectionGUID: ey/YtaXTRRKwNCzs6cyl2g==
X-CSE-MsgGUID: pSp+BbIFQwKBEqtTlkZ4FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74524947"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74524947"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:25:29 -0700
X-CSE-ConnectionGUID: 6MV7/QrzRGOP3n1Al4Yxkg==
X-CSE-MsgGUID: /rBwFBlnSPm7ljwijOw5Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225794542"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:25:27 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com, suraj.kandpal@intel.com
Subject: [PATCH v3 2/2] drm/i915/dmc: Enable PIPEDMC_ERROR interrupt
Date: Thu, 12 Mar 2026 18:56:54 +0530
Message-ID: <20260312132654.2614433-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312132654.2614433-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260312132654.2614433-1-dibin.moolakadan.subrahmanian@intel.com>
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

Enable PIPEDMC_ERROR interrupt bit for display version 35+.

Bspec: 70296

Changes in v2:
- Move PIPEDMC_ERROR interrupt enable to a separate patch (Ville Syrjala)
Changes in v3:
- Add Bspec reference (Suraj Kandpal)

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 38b284a0db82..e60f1f977070 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -510,7 +510,8 @@ static void pipedmc_clock_gating_wa(struct intel_display *display, bool enable)
 static u32 pipedmc_interrupt_mask(struct intel_display *display)
 {
 	if (DISPLAY_VER(display) >= 35)
-		return PIPEDMC_FLIPQ_PROG_DONE;
+		return PIPEDMC_FLIPQ_PROG_DONE |
+			PIPEDMC_ERROR;
 
 	/*
 	 * FIXME PIPEDMC_ERROR not enabled for now due to LNL pipe B
-- 
2.43.0

