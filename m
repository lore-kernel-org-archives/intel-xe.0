Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E512CC44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 04:50:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CF610EC44;
	Wed, 22 Jul 2026 04:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPYROkzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C0D10EC3F;
 Wed, 22 Jul 2026 04:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784695794; x=1816231794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jocBpuu5C9lxFuWpslqlji9u7JXotQQuaG9BuuWzKPo=;
 b=IPYROkzhhI9l1OycMHPxb1OI2XEsFcAgHKN2phsYUrDMAc5/aGJxMDcw
 ALX2ZewrklM5vjLIx+TZH+l0bVcsT6tHrwLryVvoDn87/RadNNBvIna0a
 YnMAQYxZufoHAv0kSTgwr0vVaB9ut2XGcLyuh7yBBc8+6lMVtEv4k0Vgh
 hPyBxiFrQlv0Pxvheh6xg6jK8Ha6xanokA23GZploaCXvkBZLO5EU4sCX
 Mk/5n1VO4JfVWZlOFXXDfhbkMScjXFRBlIPwcqbEhRkYGj3nRq+r9wN9+
 MMvZXVpWS8YqzN+s6hZaq8C7foqvA1F1YgvrHO9AmGs2w43xS3onkVKGd w==;
X-CSE-ConnectionGUID: MWEPBfweRgieS5vMTZl1iw==
X-CSE-MsgGUID: t81vQWFgTQmjU4rF/uHZmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84298492"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84298492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 21:49:54 -0700
X-CSE-ConnectionGUID: 1Iw5YLjuS5qhdElQifEs7Q==
X-CSE-MsgGUID: Lz7YPa9XSjaBkGoBQBmARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253603240"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 21:49:53 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v6 7/9] drm/i915/vrr: Dump CMRR state in the crtc state dump
Date: Wed, 22 Jul 2026 10:09:19 +0530
Message-ID: <20260722043923.3241977-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
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

