Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFE5CD98EE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 14:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5467B10EC23;
	Tue, 16 Jun 2026 14:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7U+g+sr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E63610EC39;
 Tue, 16 Jun 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781621607; x=1813157607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Vi+4IpuwM6XulHOA+oU6HfdBg1aOTXAgG+0+WnxBX0=;
 b=e7U+g+srDWMpulpyMzlvGU6AZk3V0idpi/5EOQT0cTaP7aiHeVENRdXQ
 K3JNwPDeF1WhQqU7tubNgp9a3RYOHrhm32JmvxawRyc3cLqQptH2UYYvy
 IChF5HcIrmpKwe9iLVNRVzwzuUv5fPL18xZ50TVRt+qcayhGTeybVcBZ0
 8u4w05QWY/jrFZZ0Gsw5ybgp1WemFxVpwMgb46GQktCeHBJXIQNkdYXQf
 dy2S4bq9cssICNwMX3ZxHnj0uxXD0T+qhLBKgCim1o+HVy4txJqscU+qm
 nNHWv2j5vaLwDCzGyAqjptm5erdAYCdhVZ6jGatXM1emMRABXH1GQJv/j g==;
X-CSE-ConnectionGUID: J0bDEOhbQBWqciGys+NKhA==
X-CSE-MsgGUID: SMa/GyNjQoqvJgzvqA0rDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69932845"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="69932845"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 07:53:26 -0700
X-CSE-ConnectionGUID: dqJ/Pwm6TAaVoEfU0uyl3Q==
X-CSE-MsgGUID: NeZLsMRLRU6lSXz6xnazkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="285896347"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 16 Jun 2026 07:53:25 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH v2 08/11] drm/i915/vrr: Compare state and HW registers if
 platform supports CMRR
Date: Tue, 16 Jun 2026 20:12:29 +0530
Message-ID: <20260616144233.832276-9-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
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

Irrespctive of cmrr is enabled or not, always need to check the
status of hw register write. Earlier it was masked to cmrr enable.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 0113f413f04b..b2c5b148c487 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1134,7 +1134,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	trans_vrr_ctl = intel_de_read(display,
 				      TRANS_VRR_CTL(display, cpu_transcoder));
 
-	if (crtc_state->vrr.cmrr.enable) {
+	if (HAS_CMRR(display)) {
 		crtc_state->vrr.cmrr.cmrr_n =
 			intel_de_read64_2x32(display, TRANS_CMRR_N_LO(display, cpu_transcoder));
 		crtc_state->vrr.cmrr.cmrr_m =
-- 
2.48.1

