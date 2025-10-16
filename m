Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E3BCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 18:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6E310E342;
	Thu, 16 Oct 2025 18:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdRP1CM+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3A510E342;
 Thu, 16 Oct 2025 18:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760640856; x=1792176856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QxJ9ptdU7igY0Fis2NN0jy+JXvbAqhIGO4d+AvjjlNo=;
 b=UdRP1CM+KqleqeP0eD8G85OV1EXkLg9PCqQRIUwWaKytylYEpABwUx/v
 foxhZqT4W7TwUfy+vLsMH5AHfQp6/vtZhYFwR+ntk69xJHaMFlpJyZOQa
 GgGcJDL6j1lkZYfBlzsDRlS76SM2m+t8kQb4ea+klnUb3zznLmf6q0vCl
 ao+B8QL5BjnZ/fGrEoRbTyZlqjL19qiFfNEvU+drOx8IGVyILk4NA5VS1
 y7Ra0k3+M7kVjhBsHmPO5zQzZvfDqwNMaVBeDz/EIs0v3yCp/WhAwL70y
 ZYJ8/Xe6R3iRFKrRheLvTJLpTYP3rlkrCVub8ZnXVWizUkYMh/z7jpA9E g==;
X-CSE-ConnectionGUID: ZHE/LLeNT1mRecuZ4xZL+w==
X-CSE-MsgGUID: 0LpzU2LHTFivLeO3pbeTRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62894803"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62894803"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:54:16 -0700
X-CSE-ConnectionGUID: mXxVr93WTAqfY0F9+hu4VQ==
X-CSE-MsgGUID: ft+PMHHqSfqcn234qkNzXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182514532"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.12])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:54:15 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 01/10] drm/i915/overlay: Drop the DIRTYFB flush
Date: Thu, 16 Oct 2025 21:53:59 +0300
Message-ID: <20251016185408.22735-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251016185408.22735-1-ville.syrjala@linux.intel.com>
References: <20251016185408.22735-1-ville.syrjala@linux.intel.com>
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

I don't even know why we have this DIRTYFB flush in the overlay
code. We'll anyway call intel_frontbuffer_flip() so there should
be no need to pretend that this is some kind of frontbuffer only
rendering operation.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 272f9e7af4d4..8400a0236cdd 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -821,8 +821,6 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
 		goto out_pin_section;
 	}
 
-	i915_gem_object_flush_frontbuffer(new_bo, ORIGIN_DIRTYFB);
-
 	if (!overlay->active) {
 		const struct intel_crtc_state *crtc_state =
 			overlay->crtc->config;
-- 
2.49.1

