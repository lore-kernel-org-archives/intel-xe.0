Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A223C0218D
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 05:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27D710E8D0;
	Fri, 24 Jan 2025 05:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nvo66Kz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFF210E253
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jan 2025 05:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737695081; x=1769231081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sU2zceit82BkL6W3a8LC3UYg5h23YrZLnJeaoynkC5k=;
 b=Nvo66Kz86gogXvLjr2qCGmssXRxx4hHu66GVpgK4Md+8TK7Ip47fhsPZ
 iHe6Uhf56rExap4R62XSoppDTabEzskXV2Dae7wIJPkPHE7j8gt7Wmit6
 +lj3vnzZl2voeZkOAHhnqBjoEYdX9DZAY9/SJgfHa4/liWWyB4uEtwS4X
 pRo2ajq4EfzC0ZZr9X4iyDVi3LHAmBeWKyN13OpFlNy4zTZN8iuAC/Lnh
 fWClYe92hn8XuJkTzviUf2nFhfGPH+mM+Ga40RfQKmc82tlVQsYIDBy6s
 p+C28BvpXr996Xj91zYDV0Uxg74ME3DvO6jSDzgR/6+nGCXumipTSeQeQ w==;
X-CSE-ConnectionGUID: /QtDr7GXSh6XcvTu2Rxd5Q==
X-CSE-MsgGUID: 8Q6DW13OS52IgO+2rBMFRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38253077"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="38253077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:04:41 -0800
X-CSE-ConnectionGUID: NQqY42ZMSCaBQyjOdkEJ/A==
X-CSE-MsgGUID: 9hF4oQtTSqCMIH1e7yE6tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112304764"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:04:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI 2/6] drm/xe/pmu: Assert max gt
Date: Thu, 23 Jan 2025 21:04:07 -0800
Message-ID: <20250124050411.2189060-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250124050411.2189060-1-lucas.demarchi@intel.com>
References: <20250124050411.2189060-1-lucas.demarchi@intel.com>
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

XE_PMU_MAX_GT needs to be used due to a circular dependency, but we
should make sure it doesn't go out of sync with XE_PMU_MAX_GT. Add a
compile check for that.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index b3da3863928af..df93ba96bdc1e 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -249,6 +249,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	int ret = -ENOMEM;
 	char *name;
 
+	BUILD_BUG_ON(XE_MAX_GT_PER_TILE != XE_PMU_MAX_GT);
+
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
-- 
2.48.0

