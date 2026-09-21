Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78239C982DA
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A26F10E2EE;
	Mon, 21 Sep 2026 05:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZgKNJzA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B3410E2BA;
 Mon, 21 Sep 2026 05:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969048; x=1821505048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCuBY5u7jwcg0bvj98jg9sq085cIlH03NIDDOnOt8AE=;
 b=kZgKNJzAtKLGEYYNJn7jg4EjwIkOhTP3aK0yQBpnjR+kQx/iW3nOr7L8
 7QZXAg47Z5xSK2I54hLgekN7wYWuUHF472ATn1Y/vqUI7coTsPLLNujzH
 L7x7uPvuOr7qhQ8nrPV4ev/HyAR09RHYw73NKcaaR5OXBPxpwYdQCOvbv
 wM6d+iC6bTOa60z3BhwYyL91XWlrEgEL3HlDftoKDb31ga5ZAvkpzM7wc
 N/2W/bngR+UsK7PZ4MFAJRz0o8f0HUD8WKueUrzrP2kaYC/B2WnqojWg5
 JY/N3neE7LRVOr2hCk9Mqh3wiatn5kCxuHY4snwtIuvZQndJiXDI8keNt g==;
X-CSE-ConnectionGUID: REykk+zTTqqJntT/VqMiKw==
X-CSE-MsgGUID: KeNPSp7cTUGwOaWDFRTMlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966631"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966631"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:28 -0700
X-CSE-ConnectionGUID: m1+qfL5jSNK6HifLJEJouA==
X-CSE-MsgGUID: GLsRfoKjTVyp3zYRGiDlAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444504"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:27 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 8/8] drm/i915/psr: log DPCD access errors
Date: Mon, 21 Sep 2026 11:07:10 +0530
Message-Id: <20260921053710.1586776-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921053710.1586776-1-suraj.kandpal@intel.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
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

Now that the DPCD accessors return a proper error code, include it in
the error messages using %pe and ERR_PTR(), instead of just stating
that the access failed.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f1d48b69a18f..00d0146b2600 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -478,7 +478,8 @@ static u8 intel_dp_get_sink_sync_latency(struct intel_dp *intel_dp)
 		val &= DP_MAX_RESYNC_FRAME_COUNT_MASK;
 	else
 		drm_dbg_kms(display->drm,
-			    "Unable to get sink synchronization latency, assuming 8 frames\n");
+			    "Unable to get sink synchronization latency, assuming 8 frames (%pe)\n",
+			    ERR_PTR(ret));
 	return val;
 }
 
@@ -504,7 +505,8 @@ static void _psr_compute_su_granularity(struct intel_dp *intel_dp,
 	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_PSR2_SU_X_GRANULARITY, &w, sizeof(w));
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "Unable to read selective update x granularity\n");
+			    "Unable to read selective update x granularity (%pe)\n",
+			    ERR_PTR(ret));
 	/*
 	 * Spec says that if the value read is 0 the default granularity should
 	 * be used instead.
@@ -515,7 +517,8 @@ static void _psr_compute_su_granularity(struct intel_dp *intel_dp,
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_PSR2_SU_Y_GRANULARITY, &y);
 	if (ret < 0) {
 		drm_dbg_kms(display->drm,
-			    "Unable to read selective update y granularity\n");
+			    "Unable to read selective update y granularity (%pe)\n",
+			    ERR_PTR(ret));
 		y = 4;
 	}
 	if (y == 0)
@@ -3835,7 +3838,7 @@ static void psr_capability_changed_check(struct intel_dp *intel_dp)
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_PSR_ESI, &val);
 	if (ret < 0) {
-		drm_err(display->drm, "Error reading DP_PSR_ESI\n");
+		drm_err(display->drm, "Error reading DP_PSR_ESI (%pe)\n", ERR_PTR(ret));
 		return;
 	}
 
-- 
2.34.1

