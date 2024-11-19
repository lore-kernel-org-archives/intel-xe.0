Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B06BD62069
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 10:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A45A10E610;
	Tue, 19 Nov 2024 10:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7l7z4do";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59B210E60F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 10:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732011576; x=1763547576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=35/vheLfDr1V5b6BmLbEmARslNjSFKo1YaZIlJ/oRHo=;
 b=G7l7z4dowavnSCKWIDDf2cXUv4h2+2zcCMRZ74yDNXjyqk/4/T2Z4pt0
 kBtf81mAvpkEvWDPWgkmR+N0E2kJsmIZsSA4Qxa3ND3lL1f40wa8G9yJe
 syFdr5skgK51Q0vFB6StN1QQFOE4LnFwSSSArwEutPbtf/BMlGyIBEqiJ
 b3HmJAT+cLIKor6PBUm6rqxJ5UxQXtWBRIW0Re0wxuOcXvN1OHcomITfJ
 nBH4BEQXO0LD9+HKon6bWTZLXGOVqdQSyNPEwlMJhdMpko0hwoigNEiVa
 YoQLPjWiBauAIrNVVSvTQdpCrHMF7jvpF5o9601Lp7pRGGB5EV/TB6nM6 w==;
X-CSE-ConnectionGUID: Hsnmrki7TvGtau/yiSJdUw==
X-CSE-MsgGUID: 0hGYs/2QT/KWJGKJ/mLLMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42633571"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="42633571"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:19:36 -0800
X-CSE-ConnectionGUID: P6XojThyREyBH34Gfr38Cw==
X-CSE-MsgGUID: zpik0zVTT9O6sCEOQXHY6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94584086"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:19:35 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vram: fix lpfn check
Date: Tue, 19 Nov 2024 10:19:27 +0000
Message-ID: <20241119101926.190203-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Technically we should check the lfpn value and not the place->lpfn, for
the case where the allocation itself could be as large as the entire
region and not be range based, which might result in incorrectly doing a
power-of-two roundup. The allocator itself will already ensure it's
contiguous underneath for such an allocation. This shouldn't fix any
current usecase, but never the less came up from some internal testing.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 1d39a8c53b3a..c95728c45ea4 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -109,7 +109,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_unlock;
 	}
 
-	if (place->fpfn + (size >> PAGE_SHIFT) != place->lpfn &&
+	if (place->fpfn + (size >> PAGE_SHIFT) != lpfn &&
 	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
 		size = roundup_pow_of_two(size);
 		min_page_size = size;
-- 
2.47.0

