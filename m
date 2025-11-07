Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFA0CCFA1E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C7E10EB94;
	Fri,  7 Nov 2025 18:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwEFqi6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F49C10EB7F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DSjf4DAeQ9JHCTJUMOP3MwDbp0X/FUS1N8aHAY9+4M0=;
 b=QwEFqi6ArTKBnpXiTXbz1A3mn2bni0AzVH8Xx+61m4SSAiDiAwhtcgyw
 gGxDk7wy2qtXTqm5wiYM5L6I0oGa24oq+SIxZZD+mjFC6/WhhvOesMysy
 i2IzZBdvt+mBX+9wvsrUKhaE2Z8g1j3YyikslZt1hPgRt7f8mLHzWX9J7
 VaVD/aNw6gl/3XcXg+2yVpDpdLjxByPgtxHLW/73kNNExGU7Aq/HOT7V5
 0pUyVOInZGAnQPuvKZB/bgv2DEcEC5koi2kWMp6mDB0CDmJboC/zExMRd
 30L/JzJbmDao6OP1a0zKc30+1eM7pcoj878agc8O9rmXpMBmz8uQ/0lP1 Q==;
X-CSE-ConnectionGUID: NIvOGGeURdyh6SNBOcB70g==
X-CSE-MsgGUID: VenzbgDPRpWaMLIPfOFWmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733158"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733158"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
X-CSE-ConnectionGUID: Q9f4qBoIRtmlyd422wbwCw==
X-CSE-MsgGUID: 6ysoNgF2RYydI9TLPaOtzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271224"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 24/33] drm/xe/query: Use scope-based forcewake
Date: Fri,  7 Nov 2025 10:13:40 -0800
Message-ID: <20251107181315.631642-59-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Use scope-based forcewake handling for consistency with other parts of
the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 6d84651c76cd..d11578f77c77 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -122,7 +122,6 @@ query_engine_cycles(struct xe_device *xe,
 	__ktime_func_t cpu_clock;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
-	struct xe_force_wake_ref fw_ref;
 
 	if (IS_SRIOV_VF(xe))
 		return -EOPNOTSUPP;
@@ -158,17 +157,14 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))  {
-		xe_force_wake_put(fw_ref);
-		return -EIO;
+	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL) {
+		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+			return -EIO;
+
+		hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
+				   &resp.cpu_delta, cpu_clock);
 	}
 
-	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
-			   &resp.cpu_delta, cpu_clock);
-
-	xe_force_wake_put(fw_ref);
-
 	if (GRAPHICS_VER(xe) >= 20)
 		resp.width = 64;
 	else
-- 
2.51.1

