Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFE9CD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 03:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A89112DB5;
	Thu,  4 Apr 2024 03:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kydAkaPo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2F6112773
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 03:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712202210; x=1743738210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uJLXbhpBxb+u0lxsKe+p/CbE2iuiU+AotdJ6WdlS8kA=;
 b=kydAkaPojVyQhBw71ZKFYUJUx16KaMT1mQAZ95dMMlZIif/X29iWAJop
 +P9g4nLIsyoyHHZGCVn0D/FqjpdxIjCtbx1bHNMAkEIkUa2g4aydoPiej
 aVy+Y+SbPxNOZ/2w8NV0FOKBv60bcF9tj6JS4kibGRmH8xAbtVSy34DaF
 rzYhxa9rEZjEPVI6YkUE5wY0UdSvWkl1j3C1ijbTLnum0Xk8B4gI4CWPJ
 bDEk3QNDgmOdvZUoAl1ZgMyX3XDjXOZnz4MYFwe5KMj9KQNxskUHjl8Xx
 V3+BYgnHTvDWDK3+q1PB7mIYpcDgw+1g0MQXfjwIqWMgcIq2Dp32zHM0/ Q==;
X-CSE-ConnectionGUID: MaWP5Aa8SZ+/Zcuu36u3gg==
X-CSE-MsgGUID: cw1genrWQEuc4eHIHHtFbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11296450"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="11296450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:43:30 -0700
X-CSE-ConnectionGUID: des2oZQaS6ii0gN6Hs2KSg==
X-CSE-MsgGUID: 0+Czpc7jQsOcjdH/cKEa2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="19101421"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa006.jf.intel.com with ESMTP; 03 Apr 2024 20:43:28 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe/xe2: Add workaround 18034896535
Date: Thu,  4 Apr 2024 09:13:31 +0530
Message-Id: <20240404034331.139854-1-krishnaiah.bommu@intel.com>
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

Add 18034896535 as driver permanent workaround.

v2: 18034896535 and 16021540221 are two independent workarounds
that just happen to have the same implementation, hence keeping it.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 74b33a3845f2..55d6eda65aec 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -428,6 +428,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
+	{ XE_RTP_NAME("18034896535"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
+	},
 	{ XE_RTP_NAME("14019322943"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-- 
2.25.1

