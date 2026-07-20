Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B39C44525
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7C410E83F;
	Mon, 20 Jul 2026 09:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6uGWaxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F94C10E83C;
 Mon, 20 Jul 2026 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538724; x=1816074724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6k+JOZxzjAn/Pj0uwG3knfdVyD0g38fYATdQuzByoI=;
 b=b6uGWaxveu6QxBbecz1NyY5Gw6GkHX2ln/ZhKzMKwUwMArpR96+St6Ux
 9pYi4cGoyQ3WlKlne4hMeOgAQOWWjB+Q00bopbPN4XqQilnq2NCL8E4Jt
 wlaUOvm9JZ1zscPfXw30TqXNCqY8XWGA1qUNMmwZC37mlcpxCWi+NWoaJ
 BdBDduyb5K0A56sYE4fwBEPYQCRi08DJ2JXRRLXXJq4neAyT9d4yECD40
 PMH/lQniOWuzOy5Sf1fFvLQfkEsIAmea/ioxJTNLAyLqcfhqjuZCJtaqH
 rj/mv9OOZ31ENSRdHfAS5KIeQTVRhb4i/B2+vM6S/wAqCdGKxNedJu1mZ Q==;
X-CSE-ConnectionGUID: hhCJbnGeRWm++T/1/1JS/w==
X-CSE-MsgGUID: 5Ht9RiYPSKKtb0vz8xysxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102664765"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="102664765"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:12:03 -0700
X-CSE-ConnectionGUID: DvW2iZDtRM+o8uf3SWb73A==
X-CSE-MsgGUID: UjhR5d4pSpm+DVtmdqplBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="260963381"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 20 Jul 2026 02:12:02 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v4 2/9] drm/i915/vrr: Restrict CMRR enable condition to
 VRR-TG-default platforms
Date: Mon, 20 Jul 2026 14:31:34 +0530
Message-ID: <20260720090142.2864289-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is reported as supported from DISPLAY_VER >= 20 (HAS_CMRR), but it
is built on top of the VRR timing generator running as the default
timing generator, for now this only happens from DISPLAY_VER >= 30.
Gate the CMRR enable condition (and its readout) on both,
so CMRR is only ever enabled on platforms where the VRR timing
generator is the default.

This is a preparation patch for the upcoming CMRR enable sequence: CMRR
remains disabled for now (the "avoid CMRR" short-circuit above is kept),
and this only refines the condition so that when the enable sequence
lands, CMRR is correctly restricted to VRR-TG-default platforms. This is
in line with the comment above, which keeps CMRR disabled until VRR with
fixed timings is working.

No functional change.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 51e4f3309b8b..d3cad81bba89 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -195,7 +195,7 @@ is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
 	/* Avoid CMRR for now till we have VRR with fixed timings working */
-	if (!HAS_CMRR(display) || true)
+	if (!(HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display)) || true)
 		return false;
 
 	actual_refresh_k =
@@ -1066,7 +1066,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	trans_vrr_ctl = intel_de_read(display,
 				      TRANS_VRR_CTL(display, cpu_transcoder));
 
-	if (HAS_CMRR(display))
+	if (HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display))
 		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
 
 	if (crtc_state->cmrr.enable) {
-- 
2.48.1

