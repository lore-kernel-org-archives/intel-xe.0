Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A432C02194
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 12:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F7410E07C;
	Mon,  3 Feb 2025 12:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EauzBlJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC4010E07C;
 Mon,  3 Feb 2025 12:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738586989; x=1770122989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/kYH1lIwNp+YNrHwpP0PsEE90e6JTgR/lT7Fsa4eENU=;
 b=EauzBlJC2JQZdGsUgZkVuTm6ch3jj+cK3SzzTsId4+33SZGpc6vmkDnP
 +utE8XCM6EDX06637IeDjix7p88bp1dyeT/eVGUZr7g+MfiBQes3s5dSB
 GRiw1otDO/QIq9Bsfwazo9x0C/wpMvmOaJgAt5DrOVBVqghelltY46vXh
 HP3Tk5HcUEBhPWg+bVJCeYNYDB7rfCc9J+R3XsU8p4njAmiqwNlJ48YXd
 w9JoVx2kwfgNV5yPN8AEiOofvhe8ZKLsnoqfa3p10QNmH1d4oI1XxgI8q
 AmIn2mKm3/DpNgTS0sd52rOhv0kxpCFTdVueiY5kNB5CubBXPCr3FUNWB w==;
X-CSE-ConnectionGUID: WubE32f9TyKZXJMTAwvk5Q==
X-CSE-MsgGUID: oZMHobdIQHC+5v9sBNhRVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="61548014"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="61548014"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 04:49:49 -0800
X-CSE-ConnectionGUID: HoixI6T6QfmR450lpJYYOQ==
X-CSE-MsgGUID: 9N82FPbeQryKXcoRnNO/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133528793"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 04:49:46 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 01/28] drm/i915/vrr: Remove unwanted comment
Date: Mon,  3 Feb 2025 18:08:13 +0530
Message-ID: <20250203123840.3855874-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203123840.3855874-1-ankit.k.nautiyal@intel.com>
References: <20250203123840.3855874-1-ankit.k.nautiyal@intel.com>
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

The comment about fixed average vtotal is incorrect.
Remove it.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index adb51609d0a3..532abdb334b2 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -276,11 +276,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	 */
 	crtc_state->vrr.vmin -= intel_vrr_flipline_offset(display);
 
-	/*
-	 * When panel is VRR capable and userspace has
-	 * not enabled adaptive sync mode then Fixed Average
-	 * Vtotal mode should be enabled.
-	 */
 	if (crtc_state->uapi.vrr_enabled) {
 		crtc_state->vrr.enable = true;
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
-- 
2.45.2

