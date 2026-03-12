Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D2BFED2EB
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E016010E9B1;
	Thu, 12 Mar 2026 08:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfIBLOJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A365210E9A9;
 Thu, 12 Mar 2026 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302828; x=1804838828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t1jQcObCcH2Ju+ak5HWnL88ivLpZd5+RuuJ6SPRbC1I=;
 b=bfIBLOJWzy9myAnXiW6VrCIHxs5qHg3nKkcmJiiaYrzDOXatyO4jYwH+
 PEZXa3PQZpBz3klDWWVFcEw1Cfw+RKLm/nx6x7IJddhr5vwxxbe3y9F4n
 KdZ9cc9Ta6lIg0FJBzkZjo4sADynp8+9K3Ds/XMyG70HI7Tel1eZl+A5x
 zBikaaFT1maYCrmYi0NYrZEhH2wQWRragQHSMscIsLjQzCrn79SALMT9R
 YYyflZXuNuQvZ2P9xBy6383W1jE+RVBzfWMME4ds4pTjMJv78oywJlH8r
 aVH84rS1eL64e/opC+vaeEQELdzkP5IXpyTxrCvRtdPEtVvRwAzn73/qx w==;
X-CSE-ConnectionGUID: BWA5kt/PRmeOQleKTJxYdg==
X-CSE-MsgGUID: +KtgJ12DTauYOfhjwEFLQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013722"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:08 -0700
X-CSE-ConnectionGUID: nspExZFZSLW3Py+DFrQKHQ==
X-CSE-MsgGUID: CqQk7tj8R66hdtvU7CXlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206814"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:07 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 07/24] drm/i915/lt_phy: Add xe3plpd .get_dplls hook
Date: Thu, 12 Mar 2026 08:06:40 +0000
Message-ID: <20260312080657.2648265-8-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080657.2648265-1-mika.kahola@intel.com>
References: <20260312080657.2648265-1-mika.kahola@intel.com>
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

Add .get_dplls function pointer for xe3plpd platforms
to support dpll framework. Reuse the ICL function
pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 58c24e2164ca..9aa8eb0a7d4a 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4653,6 +4653,7 @@ __maybe_unused
 static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
 	.compute_dplls = xe3plpd_compute_dplls,
+	.get_dplls = mtl_get_dplls,
 };
 
 /**
-- 
2.43.0

