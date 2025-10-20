Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A071CCD1A7
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36A210E4C7;
	Mon, 20 Oct 2025 18:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1fdruI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFCE10E4C9;
 Mon, 20 Oct 2025 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760986295; x=1792522295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1UMOv+HboWrxZckMJkqgJZfIaB6UAaafEggi4Aq5p4w=;
 b=a1fdruI/jpmcwx8JZLoXbldZwZAJO/Vm7tVAPTqj2dIPl81IKUGCYdcx
 Wgy1BC42BPlgCG7HUKsyWBl7TGqPOUGGFpinKyVVszgPScrZgC1BdpUpV
 eE48Kmy+weByoaK9G3jZ/u1wJrl2r9XMNcn3qhM7eogOHQ+zSaMFBKnNU
 LyCMuNVj+GKdtLzaK2UVMWlgZbB28jizCnAgnQI6uIgWCiOTW1ZxZjPsD
 OTD0uavUQV3JQ5wegZaKCbeyDsUvYxyglFQhYu4PnVuEaoraTcpVgDQZ7
 oMOeYoZITpjEw5v/ZPubdnBX6QgWG4EW1orDSOzQPd2UNvivR4j7aZY10 g==;
X-CSE-ConnectionGUID: 9SvKkWmTSHOM9S1h8q5fRw==
X-CSE-MsgGUID: x2xa6afhRmSIdqf3YWtWsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73398727"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="73398727"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:51:35 -0700
X-CSE-ConnectionGUID: 3XVpxOdiT8S9u/qOi3e58g==
X-CSE-MsgGUID: SFLjzUQdSZCBzKRaULiOuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="187417861"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:51:34 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 14/22] drm/i915/vrr: Disable VRR TG in
 intel_vrr_transcoder_disable() only on always use_vrr_tg() platforms
Date: Mon, 20 Oct 2025 21:50:30 +0300
Message-ID: <20251020185038.4272-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251020185038.4272-1-ville.syrjala@linux.intel.com>
References: <20251020185038.4272-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently we always disable the VRR timing generator in
intel_vrr_transcoder_disable(). But doing so on !always_use_vrr_tg()
platforms is redundant since we've alreayd disabled the VRR timing
generator earlier in intel_vrr_disable(). Do the disable in
intel_vrr_transcoder_disable() only on always_on_vrr_tg() platforms.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index b49121b2676c..d8fbbef1ae23 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -786,7 +786,8 @@ void intel_vrr_transcoder_disable(const struct intel_crtc_state *crtc_state)
 	if (!intel_vrr_possible(crtc_state))
 		return;
 
-	intel_vrr_tg_disable(crtc_state);
+	if (intel_vrr_always_use_vrr_tg(display))
+		intel_vrr_tg_disable(crtc_state);
 }
 
 bool intel_vrr_is_fixed_rr(const struct intel_crtc_state *crtc_state)
-- 
2.49.1

