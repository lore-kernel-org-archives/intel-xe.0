Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BC1CEACDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E9110EB2A;
	Fri, 14 Nov 2025 21:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZA416Od5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEFC10EB30
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z1T29bgMLl8F80Wk0H4LTwYYrZIqBwJCIczBRiX8tgo=;
 b=ZA416Od5NwXRx6DGx9BEbk/IY3Xfak1D7xYQaMJeJpOnE3TVpM80mp2c
 kBVwUFQapd6YJ62DvrmbuhnxiS4yRaQOuR+U++/WGuURSXT3hvNEeNSvN
 zAyNAsQlhbiV+ABFlbe1vG2FWlwNYNnw3DUid4TRnDP1ADXpwSdSD3d2l
 rIdx+v6hnDcOQc80tDi+HHWFNF6cFV1SPbHU9FKaGrylKKjMNyp8ftZTe
 0Wmf7Si5x5uGXO4jZDpYRC/gGUJtNipXk1lEdkyxjNR9nOAZvKEJVy4oW
 ZdPP2YVJrqMZfy8UGO7oS/3qyBHyw54nGsd9U4efBiKZo0HD9SadYthbc w==;
X-CSE-ConnectionGUID: zN5NPlIBQDmUBhrN9xjWug==
X-CSE-MsgGUID: A2zT6kZQQHS5QPkJOVbtNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648321"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648321"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: 7nYaVBuAQM2BxZZFqvY+dg==
X-CSE-MsgGUID: Tvqn53YmQWCIB62e46l8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308327"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 18/27] drm/xe/query: Use scope-based forcewake
Date: Fri, 14 Nov 2025 13:43:54 -0800
Message-ID: <20251114214335.2388972-47-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
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

