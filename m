Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFB5CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D352510E706;
	Mon, 11 May 2026 12:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7USSdfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79F510E704;
 Mon, 11 May 2026 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778503612; x=1810039612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qOrGd25hUeciLsjXIJwXyVlU4ONMUd+CGfOcwKiJEQ=;
 b=K7USSdfuU7lVDn1S351lR8Ls+czywNfSJLUxHTKpa7jsSp/cwPtJYGTd
 1rkLz23hA4Ee4t8lV5/TZ2GibbCTDBROzyvvMKJo/1j1mX3gvYRReZWli
 6HgE2oNTsF4bQ0vgQ5rf474RTc1KahC2E3oJpebHPZzeAEMvt1dzDBvF/
 SmhuEqW2Og6+HQiZNUBhkHfTrH+NgV3PJVxwoc4XuLgvqcrJ4NOoRu1TS
 9sKFexjtCH5TfXs8yICVIlRPWOxlK78085GMJldbJXYgGoKBhiVuWEwi9
 FMUxrUYEJrm7lwmWezWColBRigwJT29jmpwKhrC+9djpmAk1ufzKjF7j2 A==;
X-CSE-ConnectionGUID: evE7K784RkCIV8ObVTLtzQ==
X-CSE-MsgGUID: XBiqjiGxQhy+ttN8kV+Gfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90764816"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90764816"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:46:52 -0700
X-CSE-ConnectionGUID: hB7KJ3gcS0SJJlZo/mWNDQ==
X-CSE-MsgGUID: HXzeOuaCTiqqXXPGdOj0PA==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:46:50 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 1/4] drm/i915/dp: Fix readback for target_rr in Adaptive Sync
 SDP
Date: Mon, 11 May 2026 18:02:15 +0530
Message-ID: <20260511123218.1589830-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260511123218.1589830-1-ankit.k.nautiyal@intel.com>
References: <20260511123218.1589830-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Correct the bit-shift logic to properly readback the 10 bit target_rr from
DB3 and DB4.

v2: Align the style with readback for vtotal. (Ville)

Fixes: 12ea89291603 ("drm/i915/dp: Add Read/Write support for Adaptive Sync SDP")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 892df1510254..c9ec27e9e124 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5371,7 +5371,7 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
 	as_sdp->length = sdp->sdp_header.HB3 & DP_AS_SDP_LENGTH_MASK;
 	as_sdp->mode = sdp->db[0] & DP_AS_SDP_OPERATION_MODE_MASK;
 	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
-	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
+	as_sdp->target_rr = ((sdp->db[4] & 0x3) << 8) | sdp->db[3];
 	as_sdp->target_rr_divider = sdp->db[4] & 0x20 ? true : false;
 
 	return 0;
-- 
2.45.2

