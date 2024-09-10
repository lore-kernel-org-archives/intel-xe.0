Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6B8EE0208
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F2410E958;
	Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWlvHUvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84E210E93F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012048; x=1757548048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QpLoOQBA7KCoYJnC8CzKiVS9mTPBdXGs58LVtUUuEmM=;
 b=UWlvHUvhm7Z1Tvv5RfsF7VYJg0byvZxM6OiXWjFUxY/pn8fBUj9FHvNh
 dUwPVx85KYoj0AitxNFRn1ETsjbCvaZuDk6yajYKKSs4peSi5CsRsmgcd
 bIoxYz2Wgic7P32eMsZA2pmwPKBcb41TMwhMnsj63vXVt3mdG+iMMKuGf
 1pPhAOMXffbb/s8JkDeFnCvgWqjSTMoNcGIlPKCnGTul+gyTKsvJhLXff
 orwRHhobj/VJq0WZdd0eDMoK241GD8RhpCS5mKga9T7BIcipclACd4G45
 Svj5Tgksvp5iSpvmen1rM/FPOoYHEdSau4wvNwMGzWb59KJuwxw15+eQb Q==;
X-CSE-ConnectionGUID: mzw03LGeTBWJEb0QS8PLpg==
X-CSE-MsgGUID: CFwwwPOMRQCqLnsrJW3Esw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144319"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
X-CSE-ConnectionGUID: shXoUFwkQ0eOh0Gx4g9q2w==
X-CSE-MsgGUID: ttrJlanSSCG8VRuSBRxFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989630"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 28/43] drm/xe/gt_throttle: Convert register access to use
 xe_mmio
Date: Tue, 10 Sep 2024 16:47:48 -0700
Message-ID: <20240910234719.3335472-73-matthew.d.roper@intel.com>
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

