Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC05CD8C85
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 04:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CE710E080;
	Tue,  9 Jun 2026 04:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYkGMuXF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E5510E080;
 Tue,  9 Jun 2026 04:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780980126; x=1812516126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F8vsYjG2239V0+zK2IrbMYZdUCcWrugUF0iFXZBxoco=;
 b=OYkGMuXFXmGtjL/igAoexcFa8vRAfHXgNWoCfJA0dLH7rjWU94kUoUTz
 YJXLGsQSnslUXuR/L3o71aTm/E1pw4FFd1v23wMQNPpprD0N8aUE5HaLS
 WV1jIIJ4aliPSLqTssLoHC1P0Lo8EYiXRy6wG8y7oc5mKFB+j75X1L44y
 NBswVEQ31Chc9YkPxdcTJxlx77a9aMC7sjSd3LI9TZATpXH1cUhX+CKDU
 jbwfrF7GmTVHlWH68aflAMDjHccmvDzCmjb2cl0kckjJ5VE+aKlFRPPSr
 r1Jz7o251kUhMVk+yDm/1GgH+LVoIIiAmrlZIAs9C4oYU35W2ICY4TAVS A==;
X-CSE-ConnectionGUID: EIQGrokDRaypAHmdR5UE5Q==
X-CSE-MsgGUID: oaudkduQS+eI2XH930hiKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="107168730"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="107168730"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 21:42:06 -0700
X-CSE-ConnectionGUID: W0qUuQYwS06jB9MMv9qXjw==
X-CSE-MsgGUID: rkp4ygX4REiVLAS8xjuTzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="249666920"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.252])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 21:42:05 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH] drm/i915/psr: Force fastset on debugfs write for each
 connector supporting PSR
Date: Tue,  9 Jun 2026 07:41:49 +0300
Message-ID: <20260609044149.274249-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently intel_psr_fast_set_force is forcing fastset only for eDP
connectors. Panel Replay is supported on DP as well and writing
i915_edp_psr_debug is setting debug parameters for each DP transcoder
(struct intel_dp:psr:debug). Force fastset for each connector supporting
PSR.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index e138982dc91f6..78795bd3ceba4 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3446,10 +3446,12 @@ static int intel_psr_fastset_force(struct intel_display *display)
 retry:
 	drm_connector_list_iter_begin(display->drm, &conn_iter);
 	drm_for_each_connector_iter(conn, &conn_iter) {
+		struct intel_connector *intel_connector = to_intel_connector(conn);
 		struct drm_connector_state *conn_state;
 		struct drm_crtc_state *crtc_state;
 
-		if (conn->connector_type != DRM_MODE_CONNECTOR_eDP)
+		if (!intel_connector->dp.psr_caps.support &&
+		    !intel_connector->dp.panel_replay_caps.support)
 			continue;
 
 		conn_state = drm_atomic_get_connector_state(state, conn);
-- 
2.43.0

