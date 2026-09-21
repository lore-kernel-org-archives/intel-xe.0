Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAE9C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E333510E219;
	Mon, 21 Sep 2026 05:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QykrtOiS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F9D10E0B0;
 Mon, 21 Sep 2026 05:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969038; x=1821505038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s4X6zlXGvAdWDaUwDqydVqdJa6tCO1OxQbPi/ys0bI8=;
 b=QykrtOiSuQnSSICl1uDduNlE8n1EuFDtnONxCEwBGXN/6Vvayk/Wn89/
 yhRF2ZMGIe/Dq+SruFQ6E1IpzWZuthq57040K9ujoRgwu2liumCLY1o5+
 HKQzk4ecsmkQsiL5XeNWSAMxni727YtGESxHM70Qx90VWwGxXko7p9tnv
 Ep5iFHVbBPwba4Du/oW2G0Vfzlj4z3P8k1MrWP9icS3Rmj2hyy70k30lx
 RXoI145oWekOxy1BEGrvCv2uGJQ/SBU3B7DUwTYOFu7+wO6Dz+cQYpbTE
 9Mwlmt3A8kq2nTx0GkgzUmmjHX3NEJtMQIpB1TPmn3kCJU3MBseZi9f47 A==;
X-CSE-ConnectionGUID: W7oxPjCXTY64vRKCIA7eBw==
X-CSE-MsgGUID: TEbmTk5eTXub5+ZBSO7jkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966596"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:18 -0700
X-CSE-ConnectionGUID: Yhh/h2cfRYq4HIwaEBOBqA==
X-CSE-MsgGUID: Z3nOY+0NTaOSAtlk9SWD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444459"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:17 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/8] drm/i915/alpm: log DPCD access errors
Date: Mon, 21 Sep 2026 11:07:04 +0530
Message-Id: <20260921053710.1586776-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921053710.1586776-1-suraj.kandpal@intel.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
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

Now that the DPCD accessors return a proper error code, include it in
the error messages using %pe and ERR_PTR(), instead of just stating
that the access failed.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 9ef9d0e45258..f54b29e193ee 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -756,7 +756,7 @@ bool intel_alpm_get_error(struct intel_dp *intel_dp)
 
 	ret = drm_dp_dpcd_read_byte(aux, DP_RECEIVER_ALPM_STATUS, &val);
 	if (ret < 0) {
-		drm_err(display->drm, "Error reading ALPM status\n");
+		drm_err(display->drm, "Error reading ALPM status (%pe)\n", ERR_PTR(ret));
 		return true;
 	}
 
-- 
2.34.1

