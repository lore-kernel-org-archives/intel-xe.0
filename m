Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4BBC5516A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E0D10EEFA;
	Thu, 30 Jul 2026 11:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fb8goarl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B4610EEE5;
 Thu, 30 Jul 2026 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409787; x=1816945787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jocBpuu5C9lxFuWpslqlji9u7JXotQQuaG9BuuWzKPo=;
 b=Fb8goarlOXQDOwziVbxI9/9yWX4EAKwmqzJI1sT8TZ98fZMm7H2XRuvh
 hknS/VXyXBOIbdh/NBzZrdiGp5i1m9kdjj2kakjYX7SlLHZzX1ASvTzHo
 YfdlDsjTeA9BwEjQhDmUs56S7X3Lz3LvgTwBPovmCCdhw1QNfBRvzTR+X
 1/czUCQ9wDYUttSAPmeRvXcDfiqP0+ijt7Ne+RhIu6YbaldGlyjQ4hjm7
 ojzhZVDi2MEXiFAQr+51z+kzR0nvqnoLk4CKZ+IUXelDJh0+2G6Xw3B/e
 Lw57kh7XHxk8CETZGFoAtNdQQB8sESXmWVfUIRNBmJOwPpeUbOLWB81sv g==;
X-CSE-ConnectionGUID: 9LC8azErQy6V9xUu+rh/9Q==
X-CSE-MsgGUID: IqsgB66RQs+WRzjQxDW75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86217240"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86217240"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:47 -0700
X-CSE-ConnectionGUID: kvttFonhRZa+kHngoJf2zQ==
X-CSE-MsgGUID: E25cTQfXSGSiD5QVkIy/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298482316"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 04:09:46 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v8 09/10] drm/i915/vrr: Dump CMRR state in the crtc state dump
Date: Thu, 30 Jul 2026 16:29:16 +0530
Message-ID: <20260730105919.3913412-10-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
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

