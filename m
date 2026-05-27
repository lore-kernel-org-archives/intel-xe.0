Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DF1CD6E4A
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 19:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3080010E950;
	Wed, 27 May 2026 19:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDUNymL6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39DD10E948;
 Wed, 27 May 2026 19:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779908454; x=1811444454;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xD2UBmkjRwVK6FNujK9g7E/huM0Duim7awciomOSXAQ=;
 b=iDUNymL64VnOHE2sjEkWmL4kQwE/u9GquNQbSgkJWF91UofD0Gwly9UA
 NIezWvsieZtFHpcEV7iJSyfG69dPQOGpqrePyIDb36t8U+oAL/IAs+EeN
 iKJ1ZonvUIv+U8jymdtamZDPCGQsiRVUz+YTjsNJuMwiGbNAPE3/9eEKZ
 tWLybqUK8KWTyYomDHFgnkTQHBZNcRmNT73SZ11c388ySwYMqhtf4WeG2
 cmfkdSJAhL530dxc4lDRQ0SDuwPaTQsyxzz7cP9+juf0jGMM2KvomDFRV
 wWXxQtj3BqV+9j4stNwhZ6NE+clWASPo9hX3tRMpIr+aLGZn40T/F1x0d w==;
X-CSE-ConnectionGUID: jKh1L4NET9GsqldwleLzmA==
X-CSE-MsgGUID: c9nivC6pRPqyp+K3y9k+2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80602158"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80602158"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 12:00:54 -0700
X-CSE-ConnectionGUID: XZkwD+hdSLmLdF3WrB7UJA==
X-CSE-MsgGUID: DhWgy9kuS3S2sC8xgqFcsA==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 12:00:52 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI 17/17] drm/i915/display: Enable DC3CO for display version 35+
Date: Thu, 28 May 2026 00:30:04 +0530
Message-ID: <20260527190004.118730-18-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527190004.118730-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260527190004.118730-1-dibin.moolakadan.subrahmanian@intel.com>
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

Display version 35+ supports DC3CO power state. Set max_dc to 4
for these platforms to allow DC3CO along with DC6 state.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 3ea51064a06c..0bb4f9d9c36f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1010,7 +1010,9 @@ static u32 get_allowed_dc_mask(struct intel_display *display, int enable_dc)
 	if (!HAS_DISPLAY(display))
 		return 0;
 
-	if (DISPLAY_VER(display) >= 20)
+	if (DISPLAY_VER(display) >= 35)
+		max_dc = 4;
+	else if (DISPLAY_VER(display) >= 20)
 		max_dc = 2;
 	else if (display->platform.dg2)
 		max_dc = 1;
-- 
2.43.0

