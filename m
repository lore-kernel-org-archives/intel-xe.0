Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111D5105A59D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 13:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB56E10E9FD;
	Thu, 12 Mar 2026 13:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZDvUEPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B0010E9FA;
 Thu, 12 Mar 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773322094; x=1804858094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iDYCfgxui0Vcp8E3XYR5CUDGg793MWX6zUY6R3Dw364=;
 b=mZDvUEPRfFYFL18VuSyZECZPRjoWWUibzZPZ+RrFiqoSDodH1BWaeeab
 gxDdgwo7XOV5bEqpjm/xkym10nDVTEINGS62hbPNPcMm0tFWs5PfcYduH
 64WxSXpIHnCsL2TGIeyFuJzkObHaj+UlN2KqFoKfGVv7ZPVt+v9mFUJ5X
 4ajrfcqjwbI3XmrCsCpb0GyErkCAE380Ygq0qIo10mHJEEUOYrzHoNSdJ
 HcJAIhmlJVdK3uPisdmu8qce+PJ/7MWhcGfjQgYZmvs/Qz8Nu6KNwS+k6
 rpPqer38m3FwClF2XTzXpEEVz5luk6Lr9vZaihnXzaSLZjDbu1ywHTjgx Q==;
X-CSE-ConnectionGUID: DMfruh6BT1Kv7Z/BG1UY8Q==
X-CSE-MsgGUID: Dba8qla7R2aOpASvVH5UMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61988242"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="61988242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:28:13 -0700
X-CSE-ConnectionGUID: 8Jm2VBQMTyaSG9oqJWpVWg==
X-CSE-MsgGUID: geV7fLhzQGuVgFKo9QTKsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220881979"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:28:12 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com, suraj.kandpal@intel.com
Subject: [PATCH v3 2/2] drm/i915/dmc: Enable PIPEDMC_ERROR interrupt
Date: Thu, 12 Mar 2026 18:59:41 +0530
Message-ID: <20260312132941.2614478-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312132941.2614478-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260312132941.2614478-1-dibin.moolakadan.subrahmanian@intel.com>
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

