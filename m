Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C891BC35FF2
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 12:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B4F10E420;
	Mon, 10 Mar 2025 12:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+hSQUyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4783F10E41C;
 Mon, 10 Mar 2025 12:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741609702; x=1773145702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=73c77X2jtrQLzajo0bb/IL2SbaXrtR99nV38+tucoMI=;
 b=i+hSQUyXh/O+tzV/jAbPokd4ywwZDeJulfnSGAdRl6BsP+/TftHgh2JU
 byIolnQMi2yJCnElMqackAoUxw0aUlL4e/ZIpWiLbM+Qgj9Jb+q3fcZa7
 k1T0tzP5LQqxX0S8idUULJTDrHG8IyuwKFDtBleS+zrcH76gyABA/rVcW
 VS4iznDnuaAo0k1P1kIWNkstRSOwOeOfKwJVYP9JuzzFmbIjWr8KZaiQv
 HrsbDpSYTcPBm62bVyvC/g5af4zW63a3RP/hE5dCYV4srZIBgkZGCxchu
 LcTSnhzsgOjQ6+LTMYtq8bXGi4Rj6Vm0dtOxlUoJ6DeUZFhae6CZyd2sY g==;
X-CSE-ConnectionGUID: q3lPNq1oQmmZY/5DCDRbJg==
X-CSE-MsgGUID: h3ozmO3ESuCJ+RlSbvDCTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="65057270"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65057270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:28:22 -0700
X-CSE-ConnectionGUID: 6X3CHONXSGWZ3NUjpTsy4g==
X-CSE-MsgGUID: tbQPjd5USAaVo33jjAWW5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="143180506"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 05:28:20 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 04/21] drm/i915/vrr: Disable CMRR
Date: Mon, 10 Mar 2025 17:45:58 +0530
Message-ID: <20250310121615.1077079-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310121615.1077079-1-ankit.k.nautiyal@intel.com>
References: <20250310121615.1077079-1-ankit.k.nautiyal@intel.com>
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

Switching between variable and fixed timings is possible as for that we
just need to flip between VRR timings. However for CMRR along with the
timings, few other bits also need to be changed on the fly, which might
cause issues. So disable CMRR for now, till we have variable and fixed
timings sorted out.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index db0ea206e26e..a57659820f4b 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -182,7 +182,8 @@ is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
 	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
-	if (!HAS_CMRR(display))
+	/* Avoid CMRR for now till we have VRR with fixed timings working */
+	if (!HAS_CMRR(display) || true)
 		return false;
 
 	actual_refresh_k =
-- 
2.45.2

