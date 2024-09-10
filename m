Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D64FEE0204
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3169F10E957;
	Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YE2N+fAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4566310E93B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012048; x=1757548048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EYMLZJyKF2L3xQyJ67195cVyeeM3P6NwBztDo093rJ4=;
 b=YE2N+fAbz4ifWhYYIQiiIEjdC84qY6z2jBFS2gVvTzoeZd+tdXMK8W46
 7pVVPJeWsm6nc/sIhs1eX0F2iBbL+o1mqXNeelB8MUcwrLDXZVlf7HRnP
 kuRcK76FfUNq7OB5/kjJT2WDLNK8TNhYekaoFJrUEzT3ybNOh5WbH1yzt
 A25LWIDELD7hT736F66In/knSBvALvoFOqklYt7daSup4RFQX5L191j+b
 P+S9VjpuirBo2r68oB8qvFWWhXY+fn7jbJN261henwGst7GOpxmcCUiNy
 E2vmWgtRhesazyQW85UR5tSks/5J8484pfiiAuUg6pM0lec2Ra00Waf/P w==;
X-CSE-ConnectionGUID: Rl+SCNtLTtyXljsnpGNd9Q==
X-CSE-MsgGUID: WMB+mbw7QLiiCmJD4tvNTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144315"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144315"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
X-CSE-ConnectionGUID: Ya5zZS2bStGITNvCKdDNZQ==
X-CSE-MsgGUID: G/glpRxnQNe9f6vEM/bdZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989617"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 24/43] drm/xe/query: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:44 -0700
Message-ID: <20240910234719.3335472-69-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 28d9bb3b825d..5246a4a2740e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -91,16 +91,17 @@ __read_timestamps(struct xe_gt *gt,
 		  u64 *cpu_delta,
 		  __ktime_func_t cpu_clock)
 {
+	struct xe_mmio *mmio = &gt->mmio;
 	u32 upper, lower, old_upper, loop = 0;
 
-	upper = xe_mmio_read32(gt, upper_reg);
+	upper = xe_mmio_read32(mmio, upper_reg);
 	do {
 		*cpu_delta = local_clock();
 		*cpu_ts = cpu_clock();
-		lower = xe_mmio_read32(gt, lower_reg);
+		lower = xe_mmio_read32(mmio, lower_reg);
 		*cpu_delta = local_clock() - *cpu_delta;
 		old_upper = upper;
-		upper = xe_mmio_read32(gt, upper_reg);
+		upper = xe_mmio_read32(mmio, upper_reg);
 	} while (upper != old_upper && loop++ < 2);
 
 	*engine_ts = (u64)upper << 32 | lower;
-- 
2.45.2

