Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BCCE7314E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 10:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35C310E45C;
	Mon,  2 Feb 2026 10:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXkyhfCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6EA10E45E;
 Mon,  2 Feb 2026 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770029627; x=1801565627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8w11NIAeGaxobtFZZqqxVEDqNov1+wailnBFSsUjuNg=;
 b=KXkyhfCc6Po+6kHX1hu7FOIjh3povCW5N2hgeaXTDGGTF200F0UNN3q/
 Hh8I33SGFbYTxQ56FIJpBMhz7WUXvUj4s0f/tdSoaXVaq0guKb+GGHu7Q
 VoBK2gQuhICia7FM0snaVg4tSZ5sYsR/PUh5SI1JVZoihdoZUQ236IDKf
 9NGtOd9ckFLZNG1M7QCQQgXBvXF5KEJHp07s9gtAD/j5B7LWwRaqfOX4v
 JYVOEnO3e+N5qB/UhzHZxH2sCQYR9hNNXHvtiJAdoQp7/kct3rm6K3nQ/
 2sjT5++3RN3QuRIHxHSeD1/e31r3FPVgX6wD5CrTx80pfegVlYEVrcVnc w==;
X-CSE-ConnectionGUID: CgUyqkkSTI+6xOUctzrE4Q==
X-CSE-MsgGUID: XTP9EdXkQgWQs5YPC7xerg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70385073"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="70385073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:53:47 -0800
X-CSE-ConnectionGUID: HWWHALMQSF2zkiGQbTjHgw==
X-CSE-MsgGUID: DOi6LhgHSgyPui+2rwx+eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="232419902"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:53:45 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 17/17] drm/i915/display: Extend the max dotclock limit to WCL
Date: Mon,  2 Feb 2026 16:07:31 +0530
Message-ID: <20260202103731.357416-18-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260202103731.357416-1-ankit.k.nautiyal@intel.com>
References: <20260202103731.357416-1-ankit.k.nautiyal@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add upper limit check for pixel clock for WCL.

For prior platforms though the bspec mentions the dotclock limits, however
these are intentionally not enforced to avoid regressions, unless real
issues are observed.

BSpec: 49199, 68912
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9cfeb5530fd8..bd4219467e0e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8006,8 +8006,16 @@ int intel_max_uncompressed_dotclock(struct intel_display *display)
 	int max_dotclock = display->cdclk.max_dotclk_freq;
 	int limit = max_dotclock;
 
-	if (DISPLAY_VER(display) >= 30)
+	if (DISPLAY_VERx100(display) == 3002)
+		limit = 937500;
+	else if (DISPLAY_VER(display) >= 30)
 		limit = 1350000;
+	/*
+	 * Note: For other platforms though there are limits given
+	 * in the Bspec, however the limit is intentionally not
+	 * enforced to avoid regressions, unless real issues are
+	 * observed.
+	 */
 
 	return min(max_dotclock, limit);
 }
-- 
2.45.2

