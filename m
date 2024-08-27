Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C8DC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 06:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6061A10E28E;
	Tue, 27 Aug 2024 06:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHPHy4wA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D73110E28E;
 Tue, 27 Aug 2024 06:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724741435; x=1756277435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=znMumxJck9K4EAhlaSRRdsOMizhbfaZrZQJy1om3m5Y=;
 b=SHPHy4wAlONTRIzMygUYWDpmBNq68n5c4fn0yaKIXAOYMGTTqOw1Fnob
 gepbIerMiD6a2rDInMhiWSWAsdm8lcj9opMPCr80Iu/lDOgoEbiwGcN1j
 RXediF6NNkM5+ki8B2BOcco4/6KUbC3esrio9AH00Neb4y+UMUwJYSkyn
 /R2X3duavBi6rblq9NKqjbMHwGhzLiFj4LC5+OrbMRJlzDJ/5ZwrWgefu
 K3zlAJveCp7hgwVRxcfhQYTN085jILaDT7psKe9l4Ds2gROdyDgs0LtCk
 C2Auo/g7+JpdvkTRWdSjhXkg9LY7QjHKCTQlrZ1XUP+7w3OdgZACi33f3 Q==;
X-CSE-ConnectionGUID: ESADzepFQ4Sv85oKgtZSDQ==
X-CSE-MsgGUID: YduydxnMTCCGme000uXMxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23005698"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23005698"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 23:50:34 -0700
X-CSE-ConnectionGUID: 0kQcCHjoTp6IM6qodhI0Rg==
X-CSE-MsgGUID: bvbrF1X9S5KT7isN94P3Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62594288"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa010.jf.intel.com with ESMTP; 26 Aug 2024 23:50:33 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/display: BMG supports UHBR13.5
Date: Tue, 27 Aug 2024 12:10:47 +0530
Message-Id: <20240827064047.132278-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

UHBR20 is not supported by battlemage and the maximum link rate
supported is UHBR13.5

HSD: 16023263677
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 789c2f78826d..3232ec4b2889 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -528,6 +528,10 @@ static void
 intel_dp_set_source_rates(struct intel_dp *intel_dp)
 {
 	/* The values must be in increasing order */
+	static const int bmg_rates[] = {
+		162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000,
+		810000,	1000000, 1350000,
+	};
 	static const int mtl_rates[] = {
 		162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000,
 		810000,	1000000, 2000000,
@@ -558,8 +562,13 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
 		    intel_dp->source_rates || intel_dp->num_source_rates);
 
 	if (DISPLAY_VER(dev_priv) >= 14) {
-		source_rates = mtl_rates;
-		size = ARRAY_SIZE(mtl_rates);
+		if (IS_DGFX(dev_priv)) {
+			source_rates = bmg_rates;
+			size = ARRAY_SIZE(bmg_rates);
+		} else {
+			source_rates = mtl_rates;
+			size = ARRAY_SIZE(mtl_rates);
+		}
 		max_rate = mtl_max_source_rate(intel_dp);
 	} else if (DISPLAY_VER(dev_priv) >= 11) {
 		source_rates = icl_rates;
-- 
2.25.1

