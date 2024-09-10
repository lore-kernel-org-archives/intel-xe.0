Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C95EB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B76D10E825;
	Tue, 10 Sep 2024 14:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWQpAzAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7180210E825
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725979109; x=1757515109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8VEDW5RA8BC7rz8mWsrKa2ZKyLuNDVFmBqrmfdqi5TA=;
 b=bWQpAzAEyThuQHNFwUcPguw6R3IZyRzSYf0u5JOuaY1G8RiKc8lFdviX
 1uFAxXO6nQEbue+TMpTcDCQFH1AlhppmhazSAfrTcx2hOdY/4CAj7k4qu
 tdPS4mEG8LwgLER90qPjSN1wUIukAAakSHTLdchrIZV0AwXdH7B2v+HyS
 aS4oGWKR2cFwe+6MH587JBbU5tZLRfQWyx8t3PrbOO+OkyzI4+bp1ZhB5
 ICOYToONP46ETdcvBkvTOk7xY153PieTtbMQTYxOLgbykWHpgMlceLary
 aPBfz90UsIgvp6E/ghC4rorwZ19/HEfwfNx2ut2rZHAzG2xFQanVHVTrH w==;
X-CSE-ConnectionGUID: r/tsAadjQ+KzRuhhZtQPQA==
X-CSE-MsgGUID: z3b27qW3TW2LeIk1D/5pug==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24922263"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24922263"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:38:29 -0700
X-CSE-ConnectionGUID: oLX9J9otQTijeUFxbtOZTA==
X-CSE-MsgGUID: yCYGYXtZTtqeQHxSuh/mdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66855057"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa010.jf.intel.com with ESMTP; 10 Sep 2024 07:38:28 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar yuv
Date: Tue, 10 Sep 2024 20:07:57 +0530
Message-Id: <20240910143757.143614-1-nemesa.garg@intel.com>
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

Disable the support for odd x pan for NV12 format as underrun
issue is seen.

WA: 16024459452

v2: Replace HSD with WA in commit message [Suraj]
    Modified the condition for handling odd panning

v3: Simplified the condition for checking hsub
    Using older framework for wa as rev1[Jani]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index e979786aa5cf..4afe808f128c 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1029,8 +1029,13 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 		 * This allows NV12 and P0xx formats to have odd size and/or odd
 		 * source coordinates on DISPLAY_VER(i915) >= 20
 		 */
-		hsub = 1;
 		vsub = 1;
+		/*
+		 * Wa_16023981245 for display version 20.
+		 * Do not support odd x-panning for NV12.
+		 */
+		if (IS_LUNARLAKE(i915) && fb->format->format != DRM_FORMAT_NV12)
+			hsub = 1;
 	} else {
 		hsub = fb->format->hsub;
 		vsub = fb->format->vsub;
-- 
2.25.1

