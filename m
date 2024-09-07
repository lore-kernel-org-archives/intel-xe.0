Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE274E6FE50
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DC010EB33;
	Sat,  7 Sep 2024 00:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkMff0kH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B372810EB2A
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9h2qwSgYd4KXRq7eYXTDYQzGCBIRGQuIvUFlxK7b5c=;
 b=EkMff0kHFFqG9NTmOnbUgCS6J0aevdc7J5ROE7tsonmad93NnGaHCLG1
 yN0gH4pzMPz5emY7zK8QtVTCTe9QgZQ/43yx2bJ1iVsBVUxd+izhAGgvM
 hQvA7/rosGHfbn5R6cMb0dD3E/iRKTjMn1jFyUn6ye1GOGfD53jeM0NH4
 zX7d3PF9pEtDdnezClZTkgDooy5oQlR5EJi4kt4f6+B0MFTIm7cLgr1KR
 9m4kcVAl6O3u5N/BEPZDpB/Ibz9cC+FRiKaWlX814e2z+ED7Op/euwXgG
 XHC1h+SAH535lbEjqRzyLNC7JL3z9z/GxhsOISg5fBkt2P+72cOUW87FS g==;
X-CSE-ConnectionGUID: 3+B2n3t0SYmSAjDztBHgNg==
X-CSE-MsgGUID: IUW6qhVQT2q24XhXzyvfVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855332"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855332"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: LkkRP94ITwGPvEo+8cZ0Kg==
X-CSE-MsgGUID: cFK5xJI0T+Wgx3d/jVmhoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792745"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 42/43] drm/xe/ccs_mode: Convert register access to use
 xe_mmio
Date: Fri,  6 Sep 2024 17:08:31 -0700
Message-ID: <20240907000748.2614020-87-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

