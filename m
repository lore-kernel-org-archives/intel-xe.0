Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE149D2595C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 07:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838A610E468;
	Tue, 27 Jan 2026 07:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fR/I/88/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DAE10E468;
 Tue, 27 Jan 2026 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769500620; x=1801036620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uCv3pGgErWDgTQjmtYedWPhWT8BqUXsAhqVpTGRhU/Q=;
 b=fR/I/88/Et+x4owIe87bj8R6lIroNluGlhAj32exUeKgDzerzinI9Odf
 1b9ULfwxIicOxpoR+1q+uPIWecHrcOHKhETpYY8iQLdYJYETq6PVNesOM
 GG8J2ds3unGcSUA9y65pBJodc8YDzjJRCyuyk0hY56e6JPflEKA2m+KnO
 Gz+nQ89UYMXJALHgw3MPmOJ107i+2DntlPyImVAyRZkQjhHhtcuN6dDOp
 IhS3EnyJGG1XR3I7JrAg0RfuowSljgWytrCYBvAP2NQnOLTsrF8X4MGuz
 4StP1nxor2cEQ5a6P2ak1RFN1IDHwz/ksk4ptxGt137yaCfA4JzysCZc3 Q==;
X-CSE-ConnectionGUID: a7kicRRTQda3y62yUmtUkQ==
X-CSE-MsgGUID: pBSWyKduRyeVaXQjsMO62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81320948"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81320948"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 23:57:00 -0800
X-CSE-ConnectionGUID: bKQyGOPAQzKCTJJB+pp4vA==
X-CSE-MsgGUID: 5zdZDW9dQJW8BtwxOeIu3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207026714"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa006.jf.intel.com with ESMTP; 26 Jan 2026 23:57:00 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com
Subject: [PATCH v2 1/1] drm/i915/display: Implement Wa_16024710867
Date: Tue, 27 Jan 2026 13:16:44 +0530
Message-ID: <20260127074644.991015-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260127074644.991015-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260127074644.991015-1-mitulkumar.ajitkumar.golani@intel.com>
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

Defeature port sync feature for xe3lpd onwards.

--v1:
- Use xe3lpd naming (Suraj)
- Use IS_DISPLAY_VER (Suraj)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d8739e2bb004..a3e6f9a31b20 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4588,8 +4588,11 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 	/*
 	 * We don't enable port sync on BDW due to missing w/as and
 	 * due to not having adjusted the modeset sequence appropriately.
+	 *
+	 * Wa_16024710867
+	 * Deprecate port sync support for xe3lpd+
 	 */
-	if (DISPLAY_VER(display) < 9)
+	if (!IS_DISPLAY_VER(display, 9, 20))
 		return 0;
 
 	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
-- 
2.48.1

