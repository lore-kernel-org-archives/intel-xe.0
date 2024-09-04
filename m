Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902FFCD4846
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323A610E651;
	Wed,  4 Sep 2024 00:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1oFrmIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E4310E63B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409277; x=1756945277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rDmIh1GK2TZxHzp1acFxaVVjgI3Che/X95WSABx3q94=;
 b=j1oFrmIbW7Oj1ZLFup8Fz0Xin+wN7sy1YtOBeVzTKc7F4qWQAKWGNwBX
 RYL+LnpgA6eU4kToUyKlzcV8FASoFB0Gi+6JvKzTiopbPo1pz9VaT2rut
 lvFidaIBWtxNSL2wBybVLc0ZsZSuhrXnEaD5BdIyx93LhZaVHTTUlevSB
 QuHclO7pSEEcZY63wgPCt5CMuI1OJk3Y1EfJqhrVT4Ha3F3XD83XbnUBK
 Bn2EyZLuOfsHGSV7JlwdkP3gp87Erv3hvYyJaRzdnpqr8gaAD10q+8ZTl
 yWwZ+vVWuSAqYvDYqK8YtBlAgK/ZjG2GBmZIhIoTF5bS1P+qXm1IzXtfA w==;
X-CSE-ConnectionGUID: J1w6qearS+KwLzlFk4JD2Q==
X-CSE-MsgGUID: gbtSOZmuTeCOf7ztf42J+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904816"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
X-CSE-ConnectionGUID: mctzEky3QUKChi+LMnK2dQ==
X-CSE-MsgGUID: IT02qDG6T7epyEXK/Or2+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944288"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 28/43] drm/xe/gt_throttle: Convert register access to use
 xe_mmio
Date: Tue,  3 Sep 2024 17:21:29 -0700
Message-ID: <20240904002100.2023834-73-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 25963e33a383..03b225364101 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -41,9 +41,9 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 
 	xe_pm_runtime_get(gt_to_xe(gt));
 	if (xe_gt_is_media_type(gt))
-		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
+		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
 	else
-		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
+		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return reg;
-- 
2.45.2

