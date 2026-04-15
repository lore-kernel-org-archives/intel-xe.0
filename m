Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C02FA0C2C
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 05:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A9310E677;
	Wed, 15 Apr 2026 05:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUWpYR/y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F5C10E0F4;
 Wed, 15 Apr 2026 05:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776231627; x=1807767627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=43KMjESg0d74sefkdcVmioWf5Mn5GOQhPGwcki2/BEE=;
 b=ZUWpYR/yEIS1qtbMNIgObpcfb5g8q6W14cAwmVFjGqBmMt81RDkSMoEC
 ZyRlD2w8LZZ3n+dPXu2YsluuoD1rGtJrHiAD+wCVyT1DwgYAoRN7u9GPj
 3rGAztEkYhtp2CvOn5ZfId6ysA9rwpxSBz6pL7XPcKZQFsNVnTgU74zBh
 fUqkMnRE3ba716vkf+2COrRoOpHOBVkC3sl89sUw/itEWTnGtYLCrXYV5
 /Jyf8/fyM9f/KCAepxfacvOfUOZjj0vKpbLR0U38lCJAJmLXeRMOyNZyF
 bH0gZ5A2wBZ1Fcl/Tz5uBvXaHvJJPozgUoPSv6UobWSLraGkMfSXxVZxg g==;
X-CSE-ConnectionGUID: NATYTUkaSf600CMr3r5XOQ==
X-CSE-MsgGUID: fFYOd7nOTACL++oWMgW7UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102657061"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102657061"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 22:40:27 -0700
X-CSE-ConnectionGUID: sL405VGcQAqqjVaIkbxciA==
X-CSE-MsgGUID: M+UajU3SQJ6ZZRPgHNvIRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227129780"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.244.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 22:40:26 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 2/4] drm/i915/psr: Read Intel DPCD workaround register
Date: Wed, 15 Apr 2026 08:39:58 +0300
Message-ID: <20260415054000.400070-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415054000.400070-1-jouni.hogander@intel.com>
References: <20260415054000.400070-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Read Intel DPCD workaround register and store it into
intel_connector->dp.psr_caps. Psr_caps was chosen as currently it contains
only PSR workaround for PSR2 SDP on prior scanline implementation.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
 drivers/gpu/drm/i915/display/intel_psr.c           | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index ee076106be85..ec00fcb46734 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -584,6 +584,7 @@ struct intel_connector {
 
 		struct {
 			u8 dpcd[EDP_PSR_RECEIVER_CAP_SIZE];
+			u8 intel_wa_dpcd;
 
 			bool support;
 			bool su_support;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index b4ca5843d098..1f3f0d35d52a 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -44,6 +44,7 @@
 #include "intel_display_wa.h"
 #include "intel_dmc.h"
 #include "intel_dp.h"
+#include "intel_dpcd.h"
 #include "intel_dp_aux.h"
 #include "intel_dp_tunnel.h"
 #include "intel_dsb.h"
@@ -717,8 +718,13 @@ static void _psr_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *co
 			    connector->dp.psr_caps.su_support ? "" : "not ");
 	}
 
-	if (connector->dp.psr_caps.su_support)
+	if (connector->dp.psr_caps.su_support) {
+		ret = drm_dp_dpcd_read_byte(&intel_dp->aux, INTEL_WA_REGISTER_CAPS,
+					    &connector->dp.psr_caps.intel_wa_dpcd);
+		if (ret < 0)
+			return;
 		_psr_compute_su_granularity(intel_dp, connector);
+	}
 }
 
 void intel_psr_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector)
-- 
2.43.0

