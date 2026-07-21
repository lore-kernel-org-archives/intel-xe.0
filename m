Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3967EC44536
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 16:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F9D10EA8B;
	Tue, 21 Jul 2026 16:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRzBa7gh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D0110E273;
 Tue, 21 Jul 2026 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784650575; x=1816186575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I3nvJZQZyJeh/8UjhKNI4yHk0AwbYHR2wj2uBcv2Cys=;
 b=cRzBa7ghMw5vpz1ccyzrDlHg88P8aYBWlWkrvYMMP9q5/mdj8Zwn9vOQ
 2zc+x9ok9h0kGX5OoYYL2aVSdCh0b2iQCq9m5HhAyAK1QZ3J9wGWPDMEU
 AePCjCzFzd+xGIAps2y/2l0jWrziaUwHB9OzBD0q3bK5DunCzobxdVn1g
 edChiaK70UOoXZqigrdmsAn316jUeIpUGYK+Gn8EzVpDBpHEgRTiEUMI/
 xc28PQiOM2URWqbvhjLp+19S/i6aUtbLrOlATlVoRQVHg9udsRy51FVH0
 6iWTM7ZEqkFPToQdRVYOXA8xx9VhxWd2zsgauyiO05Rq2m8J9cBXhkLhq Q==;
X-CSE-ConnectionGUID: /CeobdjCRPG5XFhVBEftCQ==
X-CSE-MsgGUID: PU8Z8SR6St6nQVCh+A3IDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95853548"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95853548"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:16:15 -0700
X-CSE-ConnectionGUID: jnaVfiW9TOyIWP4YOnh2aQ==
X-CSE-MsgGUID: A5BbNpUFR0Kx56kzqD//vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253904829"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2026 09:16:13 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v5 1/9] drm/i915/vrr: Return from PSR2 compute config in case
 of CMRR enabled
Date: Tue, 21 Jul 2026 21:35:47 +0530
Message-ID: <20260721160556.3144646-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is mutually exclusive to PSR2, do not enable PSR2 when CMRR is
enabled.

--v2:
- Restrict selective update config check (Ankit)
- Commit message change

--v3:
- Commit changes

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 40e3d7095996..6a90ded5d1fa 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1587,6 +1587,12 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_display *display = to_intel_display(intel_dp);
 
+	if (crtc_state->cmrr.enable) {
+		drm_dbg_kms(display->drm,
+			    "Selective update cannot be enabled when CMRR is enabled\n");
+		goto unsupported;
+	}
+
 	if (HAS_PSR2_SEL_FETCH(display) &&
 	    !intel_psr2_sel_fetch_config_valid(intel_dp, crtc_state) &&
 	    !HAS_PSR_HW_TRACKING(display)) {
-- 
2.48.1

