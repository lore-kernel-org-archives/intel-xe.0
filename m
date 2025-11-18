Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85799CEE348
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF3310E511;
	Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlUEp1r6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB68210E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z1T29bgMLl8F80Wk0H4LTwYYrZIqBwJCIczBRiX8tgo=;
 b=PlUEp1r6Pgt+C1d1KPgICEOWNzPDbTE93U/qEjProUtkzpTrM+nzMior
 mcEZ/CWJTv1jyVQKXmTjrQ3j+6mecdbhHIyh/HLtRc9SG0sUH+QwQdteJ
 c1R9Zdpo5ZShyIMAs2OtsNPYHYJhnWq6g53YPJH0IBTwCiXvVbHbtwcCm
 mXNmN5jK9rJJ0obKVBHqvhLsdvm2TZ4v34lUURWGF2KDT3mm60gVtAQHf
 fvC+2WGqMRsvpJXDFWgJdKRLhjdF25PxZiXCR6uiZADPhAyu61WGn+vk4
 EcDKPiJAeAiJzR0bT0Gq8CgY2Nynoyghrm5oimLFm5hwYDxC8e4rcJQno w==;
X-CSE-ConnectionGUID: 3tKhsSicTlWQI3fu8KdmpA==
X-CSE-MsgGUID: OoawQzRhTnGOcxuSBcMpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544782"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
X-CSE-ConnectionGUID: wdMufYFCR/6ix0vJ/PE4Qw==
X-CSE-MsgGUID: ztc9yWbYQeeU59l0K7H8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952252"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 18/27] drm/xe/query: Use scope-based forcewake
Date: Tue, 18 Nov 2025 08:43:57 -0800
Message-ID: <20251118164338.3572146-47-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

