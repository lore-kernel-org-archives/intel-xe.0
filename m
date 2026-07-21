Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C01C4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 16:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8CF10EAB5;
	Tue, 21 Jul 2026 16:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1+ZKaLo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C0510EAB3;
 Tue, 21 Jul 2026 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784650587; x=1816186587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jocBpuu5C9lxFuWpslqlji9u7JXotQQuaG9BuuWzKPo=;
 b=W1+ZKaLonOrz9UQtlRQF+K5QOJb+gP5AZt7bX000aQg6+QG6vinJ6YwX
 NBzTDvPQuCE32mMAQR/F3zPDg8W6WB0SdUbOcVpROssj8Xe09OmeYba5R
 VLAKlT4TF1vylrcipW4WC3p7Ye7NTIDhLUs12JT2hliCCbDss1ZlBCWND
 D+f+QT4mG6mPdCATYs0k3OtAHlGOIB8HYY/qxZr0bMQT3AKi79N9PyejW
 w3AVEmtEwovMuKKIlyrCaNmDpraxFmhS7zuHUpDcc9YQMGpjRl+vWkZC6
 ousZPrlyEO0F4e2ndtRc0R1xAdmK55kEQPZu2+vgNwSX5W7Yhro7ZOPAD w==;
X-CSE-ConnectionGUID: 5b1IjkAjRxGCuibxcw1O3g==
X-CSE-MsgGUID: PrGx8XjtR8CwB1SirGVlsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95853565"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95853565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:16:26 -0700
X-CSE-ConnectionGUID: e0f2umrmSV+TP0dND3CwXw==
X-CSE-MsgGUID: WngU+c0FQkizGmGvtbyLHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253904867"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2026 09:16:25 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v5 7/9] drm/i915/vrr: Dump CMRR state in the crtc state dump
Date: Tue, 21 Jul 2026 21:35:53 +0530
Message-ID: <20260721160556.3144646-8-mitulkumar.ajitkumar.golani@intel.com>
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

Add crtc state dump for CMRR.

--v2:
- Remove video mode state checker.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 4493483f10a9..ad4f362e0c09 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -311,6 +311,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 		   pipe_config->vrr.dc_balance.max_increase,
 		   pipe_config->vrr.dc_balance.max_decrease,
 		   pipe_config->vrr.dc_balance.vblank_target);
+	drm_printf(&p, "cmrr: %s, cmrr_m: %llu, cmrr_n: %llu\n",
+		   str_yes_no(pipe_config->vrr.cmrr.enable),
+		   pipe_config->vrr.cmrr.cmrr_m, pipe_config->vrr.cmrr.cmrr_n);
 
 	drm_printf(&p, "requested mode: " DRM_MODE_FMT "\n",
 		   DRM_MODE_ARG(&pipe_config->hw.mode));
-- 
2.48.1

