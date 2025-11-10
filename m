Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A8BCD13DF
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822BD10E4AC;
	Mon, 10 Nov 2025 23:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boQzfJAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14C110E49F
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dcwJk/QSKGZp8Z7kG8truArIf5OE0QCg1i0tq8jEtCo=;
 b=boQzfJACBlp/jzQjpWx+fz1PPMyys0WDALpBs6vMkZ7Tae/syFiGIAI6
 PCuroiPdrc4VLYgKwsaraJP1W4sOygpFEUl5rnWKVj8PVw1eex1yaRRPW
 4uR7VuUZm0HHdolSdO+4bscsV+07qmTSU8QIkNORa5NJhw+RyGeZaseju
 lU3Q7CH6lPtQQeTCwYDoys0BZmFNmKpX2mVKjnX5fihux5BYLhcZSIEQK
 7dlkDmqzb/ftgiPNMgxcPw/ZdTcSF+rUPLKMrW9BjpoWQB6t+bN7BSJxS
 YxH4Ole6FCzYXxwc9x/EaB7TGIs3M4kkmSWMf73pvbxTN/0URN6zpBFQJ Q==;
X-CSE-ConnectionGUID: woce/vTZQu2xrZhIZTmVow==
X-CSE-MsgGUID: A1yebaCQSMStYOze37V0LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486458"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486458"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:33 -0800
X-CSE-ConnectionGUID: QjuZL1jOT3WgkteddyWvDg==
X-CSE-MsgGUID: UQzM6l6vTG+ksg4A1Hma6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189244010"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 21/30] drm/xe/query: Use scope-based forcewake
Date: Mon, 10 Nov 2025 15:20:39 -0800
Message-ID: <20251110232017.1475869-53-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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
index 1c0915e2cc16..a7bf1fd6dd6a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -122,7 +122,6 @@ query_engine_cycles(struct xe_device *xe,
 	__ktime_func_t cpu_clock;
 	struct xe_hw_engine *hwe;
 	struct xe_gt *gt;
-	unsigned int fw_ref;
 
 	if (IS_SRIOV_VF(xe))
 		return -EOPNOTSUPP;
@@ -158,17 +157,14 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))  {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-		return -EIO;
+	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL) {
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
+			return -EIO;
+
+		hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
+				   &resp.cpu_delta, cpu_clock);
 	}
 
-	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
-			   &resp.cpu_delta, cpu_clock);
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	if (GRAPHICS_VER(xe) >= 20)
 		resp.width = 64;
 	else
-- 
2.51.1

