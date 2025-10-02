Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EC6CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 11:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C1410E7C5;
	Thu,  2 Oct 2025 11:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIL81NN2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD0810E7C7;
 Thu,  2 Oct 2025 11:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759406086; x=1790942086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eXFWwROSSQYMZwz/e3NPFG5OLq368Nmhf3CheXgmgO8=;
 b=CIL81NN2c3L9dOKakII9yUJ9oBuOtD9aOgAyBJ1eLsARINkKkn+eKhfs
 kD61d+DvKrEBhqQeOYcQ0AzLz9pUwxPVv3STquOsJLTPCfqkvVYX/tx5u
 cn21G4SzTtJWWn8l50T++8mLcAJGthZUeIiIWt/28/PyKLzmZKx4iNujs
 QnDNi+vB0i5JNywQC+pGfrdiHDCwITLudE8UhmwT6BhKoKQjDZnen7G70
 J1BBNEDUnWUgl5E6ReA53xvfzzL3Ix7q0JwdZdqJkqCsQoJUVLzHpH0NS
 LukogjefTxbTL9bBEzZ49zZ3wuiWwtCLDjCw3n71D3QZVkthJJpytJocC Q==;
X-CSE-ConnectionGUID: lrne5PrSRNSscgQJl7z9/Q==
X-CSE-MsgGUID: 7kESephSTd+rsbDfh0c1Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65325230"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="65325230"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 04:54:46 -0700
X-CSE-ConnectionGUID: 2G2Wpf1HRT+p5YcNRa+xqA==
X-CSE-MsgGUID: TdH1P1oYQPKc17eC/Jd22A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="209727038"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 04:54:45 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/fbdev: Select linear modifier explicitly
Date: Thu,  2 Oct 2025 14:54:32 +0300
Message-ID: <20251002115434.6486-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251002115434.6486-1-ville.syrjala@linux.intel.com>
References: <20251002115434.6486-1-ville.syrjala@linux.intel.com>
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

Currently we use the implicit modifier fb creation path for fbdev,
but as we never call set_tiling on the bo it will always end up as
linear anyway. The rest of the code (eg. stride alignment) also
assumes that we'll use linear. Just select the linear modifier
explicitly.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 3fbdf75415cc..51d3d87caf43 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -214,12 +214,14 @@ static void intel_fbdev_fill_mode_cmd(struct drm_fb_helper_surface_size *sizes,
 	if (sizes->surface_bpp == 24)
 		sizes->surface_bpp = 32;
 
+	mode_cmd->flags = DRM_MODE_FB_MODIFIERS;
 	mode_cmd->width = sizes->surface_width;
 	mode_cmd->height = sizes->surface_height;
 
 	mode_cmd->pitches[0] = ALIGN(mode_cmd->width * DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
 	mode_cmd->pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							   sizes->surface_depth);
+	mode_cmd->modifier[0] = DRM_FORMAT_MOD_LINEAR;
 }
 
 static struct intel_framebuffer *
-- 
2.49.1

