Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7732CCD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0A310E33B;
	Tue,  9 Jun 2026 12:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCwM7ReB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC6C10E340;
 Tue,  9 Jun 2026 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006668; x=1812542668;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cwDqnP0xWUQJwqrMF4OjtzmL0Qch2GAX7CL6hhu57e4=;
 b=bCwM7ReBQihwkvPKSYy3nNXO0Kigc6kVNRDiVgkIeJq2HHK427F27a0d
 U6GQAw5qI/Rl292XoWqLgxef+UpnSyqXvwa1HvB696JZRK3Tta9zChInh
 UZKB8+Q2bPmKms2TFK12yzlNwHYx7IRyot771qKuAt8oH9oUM5wV4OZFI
 z7awsC74+Wm4FjNurZlqWrCQx9GcLgrZBYlf4cnHsn2DI7/YOdrmG1Np2
 QNo0WfHW9iAIz4+bSuILzH5cvN/Ljhx/YLibkQjmXvS+XENW5RmIn9QzG
 9nCMdDkI+i6jvvFmA9EZEb/I1LJzp8lZ5QCBJjWJwrZtxl3JVTl/uha6s g==;
X-CSE-ConnectionGUID: ZqN0XsCZQtmr3XpIcOOWcg==
X-CSE-MsgGUID: 6CD9km4GTb+fjbqveVZoHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340453"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340453"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:28 -0700
X-CSE-ConnectionGUID: d3lgNXjyRFy/SI06lnw0Hw==
X-CSE-MsgGUID: jl3bpx2ETEGKZ9DTMqgdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988502"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:04:27 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 36/36] drm/i915/display: Enable DC3CO DC state
Date: Tue,  9 Jun 2026 17:32:50 +0530
Message-ID: <20260609120250.867750-37-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
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

Enable DC3CO mask in get_allowed_dc_mask().

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 122b3e98103e..573303c9c5f5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1117,7 +1117,9 @@ static u32 get_allowed_dc_mask(struct intel_display *display, int enable_dc)
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

