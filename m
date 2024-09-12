Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C9DEEE266
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 21:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D326C10EC16;
	Thu, 12 Sep 2024 21:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGV8LqeF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDA210EC42
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726178176; x=1757714176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n7jIlC+OhgQvZq7HVNqYSm7JZh2nFbCwi49PKeJtluw=;
 b=oGV8LqeFYvsSeUVn0CEABjN4EUZ+9ZQstdBmXUe9f3R6Dcri4pFfTGsL
 BGKPl0RvEF15kaVlH8JmbQE+iD4BL5vhCkoNOMb5etl4pzzpxrvevJKeU
 rYLbDSTNDYpD50+sea2W7nMMM53GxyVNQpdDFi0Ky1JqSIC3lUKD5uMAc
 Vqk/I5wgkBCOeT5qe6GD/K0diUN8GQ6B+OR+0Yk4eX7RrHf9yLHQhTI27
 l3r1SOIy6+keW0t0XXwrwx+ji14RMpaLbm+4NAZla4Nrci+y2WvSGStDW
 6nBUkZDQJoK+fdzmeRUEj71aK1CuYs6/+QqaZ9XG+MD4DUQxvGjMpRg2x Q==;
X-CSE-ConnectionGUID: TF3MRBuVQx+xred04OuA3g==
X-CSE-MsgGUID: gxDq/J5+QhyzRjfAK81e6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36410920"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="36410920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:56:16 -0700
X-CSE-ConnectionGUID: MVLJIaHaTZmig2iHS68lbA==
X-CSE-MsgGUID: erwxhJBYS5OgFFn8P7GF7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67780765"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 14:56:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH 2/2] drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime
 regs
Date: Thu, 12 Sep 2024 14:56:01 -0700
Message-ID: <20240912215559.4070443-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240912215559.4070443-3-matthew.d.roper@intel.com>
References: <20240912215559.4070443-3-matthew.d.roper@intel.com>
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

TIMESTAMP_OVERRIDE is never used to initialize the GT clock frequency on
Xe2 platforms (and the register itself no longer exists on LNL) so drop
it from the list of runtime registers.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 924e75b94aec..a5bd577227d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -173,7 +173,6 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
 	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
 	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
-	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
 };
 
 static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
-- 
2.45.2

