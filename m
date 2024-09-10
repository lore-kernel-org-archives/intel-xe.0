Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF44EE020B
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DC410E961;
	Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAYdVAoz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E3710E93F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012050; x=1757548050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rAeNHYfWa5PAxFLl6C5iA3cb8gqAknLztES86Ryw17Q=;
 b=HAYdVAoz7eCwD3K7HneEZeq6+CinpbmxyrjPhTpfjA88/1HsN2pClT0M
 cPDkWDBo/L+ku/WSYp+rd9N4KZOeowLihLd5NLQgBkFFBWxekyN+j0NiI
 pBhSc14RMPPyn0fcVy+1N6DXzqSvLHUkZ7TDnKQKaAlXKbQxMOpeQubYM
 s7zQ3Qh0wHwMT69+KR85SpwhrDjuTGKjJeawDyrPSHUcN3NZ4xoswkG5S
 2BKg/+45L7GA14rX11061bwU5CNV64Cuj/NI0BRYBj2CVDUptdGkwjxNk
 vSOakszQ7S6e5kLlKl8KI93VyIsJrizoFt80/2gihwFWrq1r75IHw8H5+ A==;
X-CSE-ConnectionGUID: QJf7+Vl2ST+iuGRDyAjzwA==
X-CSE-MsgGUID: nhlkkLbhTSCf5l+WT9+Q7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144336"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144336"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
X-CSE-ConnectionGUID: lYOaEDxhQQSv1S3V+BFA0g==
X-CSE-MsgGUID: dbiY/d9IT/GYq3pqpyGiFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989677"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 42/43] drm/xe/ccs_mode: Convert register access to use
 xe_mmio
Date: Tue, 10 Sep 2024 16:48:02 -0700
Message-ID: <20240910234719.3335472-87-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index d2e4dc3aaf61..9360ac4de489 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -68,7 +68,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 		}
 	}
 
-	xe_mmio_write32(gt, CCS_MODE, mode);
+	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
 
 	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
 		  mode, config, num_engines, num_slices);
-- 
2.45.2

