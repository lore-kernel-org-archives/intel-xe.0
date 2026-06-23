Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE35CDB47C
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 22:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB7510ECFC;
	Tue, 23 Jun 2026 22:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVYrbVto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BC710ECF8;
 Tue, 23 Jun 2026 22:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782254830; x=1813790830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Mf0NIiTWQ3dbS5ZULhG6zAXAvWqXK1z5f3dtuIs7M8=;
 b=jVYrbVto6/JP0xnYUVvBSlv5ByclcYxXIxi+mhsJs1Rhq5d2RdFkn5RZ
 xdkaiD50MRzpCibhEJRWxU0yHpikHgHtokX5h96FLpiiPiX8lZwjqJ39S
 RfhPCY32tiTt99yhV+eOnBZILw8qNRQb8FxCDVRReMjPONu8WIKyC5VPo
 KpwW4pMxdOXjiQ695gppjjgT9i9cDeI9d6IdQzVeKCTQR070gfVc43+Eq
 9msJ61/HCPpGP0LDpBf0hCTSsYNEOw3ZOAXXDlDdTsWkimxlmMZ4PUiVV
 Cg3sNdIWQBokVgnNiKXFKkJKKkoLxlx9Rdz6HJYF7pSy/8twtp/GtOmGo Q==;
X-CSE-ConnectionGUID: Ugijs8CYRFGA1DPV6r9VHg==
X-CSE-MsgGUID: xQBwPoF0T6uc+m0gCBFcYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82775548"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="82775548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 15:47:09 -0700
X-CSE-ConnectionGUID: 9/+sf5MtRQS7iG6lqZ7xtQ==
X-CSE-MsgGUID: lnDeJnftTqyDD26Irxor4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="249497087"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 23 Jun 2026 15:47:07 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 02/30] drm/i915/dp: Add struct intel_dp_link_config
Date: Wed, 24 Jun 2026 00:45:51 +0200
Message-ID: <20260623224619.1949975-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260623224619.1949975-1-michal.grzelak@intel.com>
References: <20260623224619.1949975-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

From: Imre Deak <imre.deak@intel.com>

Add a struct representing the public unpacked format of a link
configuration. This will be used by the DP link capability API added
as a follow-up, and by DP code in general that needs to track a link
configuration.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 7fd7dfd420487..8c1af7b8ba270 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1800,6 +1800,14 @@ struct intel_psr {
 	struct ref_tracker *vblank_wakeref;
 };
 
+struct intel_dp_link_config {
+	int rate;
+	int lane_count;
+};
+
+#define INTEL_DP_LINK_CONFIG_NULL \
+	((struct intel_dp_link_config){})
+
 struct intel_dp {
 	intel_reg_t output_reg;
 	u32 DP;
-- 
2.45.2

