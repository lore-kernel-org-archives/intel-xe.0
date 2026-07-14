Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D172C44509
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025C110ECE8;
	Tue, 14 Jul 2026 10:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DA1AFSWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2FE10E687;
 Tue, 14 Jul 2026 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026207; x=1815562207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sIQNH2+t0S17jIIOiotXVKTLKPHo2txinsDtMk6qLjs=;
 b=DA1AFSWIX29wXyOAiKj1oiYgmewwFvTrKgL+uNBfhUJwWAbKyv6vZWCh
 QhKouK5AVVhCx3GhDtd5FyrIjGHOAjwXllERGqYlMzj8rNj3axsp0giy7
 V0IPECsuu3DKNLm1AamLRKAOpNoJdCL+BPCyoptwhzCzzMaNNyVS41r/Q
 N8IXPMUsdJNzkCw3U+f4/f1KXHCRVw5BM7cQl7NlfI5VDmP7DGfIIlp8K
 UdjgqhhzKhWrIi+AsLLGG1dxiI8AuFW0DOaJUNZziMFVpjH4cmdY5bvyn
 zSiM48XxvQwhPwfW64a+Vm1Epi38627F2NtMAu2Mo86PUzvfyESotubBs g==;
X-CSE-ConnectionGUID: 3GsPlFkQQqWxC5p1Px53AA==
X-CSE-MsgGUID: jv0iZB/dT/m7r0th/5jZqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88544451"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88544451"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:50:07 -0700
X-CSE-ConnectionGUID: OQBoNVXpRAiIr4B3ab8Czw==
X-CSE-MsgGUID: rDmGYvc0Tf6cvlE3/K7DGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="260134508"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa005.jf.intel.com with ESMTP; 14 Jul 2026 03:50:06 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v3 4/8] drm/i915/vrr: Dump CMRR state in the crtc state dump
Date: Tue, 14 Jul 2026 16:09:33 +0530
Message-ID: <20260714103938.2371448-5-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
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

