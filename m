Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F359E8B39D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 05:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80B210E33B;
	Wed,  4 Feb 2026 05:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gi+kmrdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C415810E337;
 Wed,  4 Feb 2026 05:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770182325; x=1801718325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C5PrrsbBwtpi5CH1Nf22xNxv3CXKkut1myZEbwzvsBw=;
 b=gi+kmrdYeCSir7MWBfaWaZ1mHjYZgq3sKi2xt5ujn/6djSjrpLAHW5vO
 TH8Tu4CcnIrZsTS8K+ZiXDRONFR48YRK2zwiUt3sgjN3H4M6LaFVx83CN
 SZ/HXUIdN02G+/pjdiW2YcW2rPGCusH3n4KFaEFcABuGlRL81iI46fgNp
 b/igByGE/WJg0QiaEXQWp+bvZdR/s2ImE9s2AL/QsjBVfXiKzb65vCIB+
 wBzO8wKMTn6OeQyzeB4eLsrqb/YvdavowW9F+Bn4n9U4pGEDEseVw5bxZ
 OZm9EBG07RhDqfyf3mP5IBUbbJraEDRkWnvQZHMoj/o6b64t7KSm8MIDN g==;
X-CSE-ConnectionGUID: W9CEphFlSNGlRTx/T2Xblg==
X-CSE-MsgGUID: 6pad1ki5TUyDE19N9PVinQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82102825"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82102825"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:18:45 -0800
X-CSE-ConnectionGUID: pgcz3pSeTbGkpPNFCuI+1A==
X-CSE-MsgGUID: KlC4bT1OSJOihBUtSfZtsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210127512"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:18:43 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, ville.syrjala@linux.intel.com,
 animesh.manna@intel.com, michal.grzelak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 5/5] drm/i915/alpm: Disable LOBF around transitioning for
 LRR/seamless MN
Date: Wed,  4 Feb 2026 10:32:50 +0530
Message-ID: <20260204050250.762718-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260204050250.762718-1-ankit.k.nautiyal@intel.com>
References: <20260204050250.762718-1-ankit.k.nautiyal@intel.com>
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

When enabling LRR/seamless MN disable LOBF first and re-enable
afterwards.
- pre_plane_update: if LOBF was enabled, disable LOBF before the
  update_lrr/update_m_n transition.
- post_plane_update: Re-enable LOBF after the transition.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 739a0a74e008..295f14416be7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1014,7 +1014,9 @@ static bool intel_crtc_lobf_enabling(const struct intel_crtc_state *old_crtc_sta
 	if (!new_crtc_state->hw.active)
 		return false;
 
-	return is_enabling(has_lobf, old_crtc_state, new_crtc_state);
+	return is_enabling(has_lobf, old_crtc_state, new_crtc_state) ||
+	       (new_crtc_state->has_lobf &&
+		(new_crtc_state->update_lrr || new_crtc_state->update_m_n));
 }
 
 static bool intel_crtc_lobf_disabling(const struct intel_crtc_state *old_crtc_state,
@@ -1023,7 +1025,9 @@ static bool intel_crtc_lobf_disabling(const struct intel_crtc_state *old_crtc_st
 	if (!old_crtc_state->hw.active)
 		return false;
 
-	return is_disabling(has_lobf, old_crtc_state, new_crtc_state);
+	return is_disabling(has_lobf, old_crtc_state, new_crtc_state) ||
+		(old_crtc_state->has_lobf &&
+		 (new_crtc_state->update_lrr || new_crtc_state->update_m_n));
 }
 
 #undef is_disabling
-- 
2.45.2

