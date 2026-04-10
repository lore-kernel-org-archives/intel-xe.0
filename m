Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBF8F459EB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 15:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0334A10E978;
	Fri, 10 Apr 2026 15:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbhmYa5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADA310E978;
 Fri, 10 Apr 2026 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775833520; x=1807369520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztYKBIxXtG7VHMIGQm875oQWdMgQaKIwSICB3t1QvI4=;
 b=AbhmYa5xUswocyOJl8CsPevL26r34nR2yaMKg8erUWLt9jsB1Ga8ksnB
 rtc8aZe3Xt2LFmvCeTjdAZl4bsD33cKA5ct8Z9gadTERVLftzRTvf4fN7
 bE9oHZbMIU3qWFQumF8+mxb8abE6RIkVgzG3q8BEKEGph/nKt3nSk9Xyw
 cLFKfer0P/IcZIkC00iP2sXOSM/Overx3rQgyPKQByDaf4W/IiiDBn7J5
 HRKq/paioXRqAWmD+NJM/hIz0297VInd60797uImoImXt7syd/EnNakBO
 KmvVuinjIcWbomJTMKW5GdxYJKYPqlc3CZtVOJmuYIptFmQ+DL5L5pexl w==;
X-CSE-ConnectionGUID: VdPZBReKSsG9vdoDF8cocw==
X-CSE-MsgGUID: 4WxNwDtzSqi7Y2IpG0UeLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76815343"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76815343"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:05:19 -0700
X-CSE-ConnectionGUID: KcoA4uPwSimyxd7wdTHCtA==
X-CSE-MsgGUID: g3b1yoG6SSW7agAih+lnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="230827827"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:05:17 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/10] drm/i915: Reject tile4 BIOS FB
Date: Fri, 10 Apr 2026 18:04:46 +0300
Message-ID: <20260410150449.9699-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410150449.9699-1-ville.syrjala@linux.intel.com>
References: <20260410150449.9699-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

There is no such thing as tile4 fenced region, so there is no
way to have a linear view of the tile4 framebuffer for the CPU.
Thus we should never encounter a tile4 BIOS FB, but if we somehow
do, then reject it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_initial_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_initial_plane.c b/drivers/gpu/drm/i915/display/intel_initial_plane.c
index 4f1591b55752..5a5adf738d4a 100644
--- a/drivers/gpu/drm/i915/display/intel_initial_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_initial_plane.c
@@ -81,7 +81,6 @@ intel_alloc_initial_plane_obj(struct intel_display *display,
 	case DRM_FORMAT_MOD_LINEAR:
 	case I915_FORMAT_MOD_X_TILED:
 	case I915_FORMAT_MOD_Y_TILED:
-	case I915_FORMAT_MOD_4_TILED:
 		break;
 	default:
 		drm_dbg_kms(display->drm, "Unsupported modifier for initial FB: 0x%llx\n",
-- 
2.52.0

