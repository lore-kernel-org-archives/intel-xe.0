Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3911CD5BB1
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 09:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693C010E655;
	Thu, 13 Nov 2025 09:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvivPwhA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ACF10E655;
 Thu, 13 Nov 2025 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763027929; x=1794563929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EvUNuHzzQzrwL3V12T3fRTiAekyWi6BSAI3XweAV3g4=;
 b=CvivPwhA9DDh0Zh0LRNdmQPT6HDunf1uE5iGuYe2+lnGkq/Rc0R2DuUV
 OPABkSknNBqT6KBbV/1z1KAuvn8mqOHRBMyaQCD5qENi+rbchScFki5f9
 QjHSLjbm3ydVY5S+tBg7Cbz+SlwnTFB+9oHw+k/E/NoooECdPLEanw1BX
 z+aMjO+oTphiwLK55M78VwKvBdZpdabArtw2JhLoJkkRgojcPs05R4Ddh
 /xVYAQvE3PZsVzB9zYFIZ3q8jn9i4GwllE00AosOWLgAnsiSaY0cq+A5d
 RakEbJ2Eb2KkIszmVCPCboeNoNucMpWoFZ1SV2w+Q74+1A6PbRl+WEWsd g==;
X-CSE-ConnectionGUID: tY28Fvs/T+O50GM/UAJ1UA==
X-CSE-MsgGUID: /VG9N/2yTf6gyT7D0GwAvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65262529"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65262529"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 01:58:49 -0800
X-CSE-ConnectionGUID: aKeDhHU6SsykWkaOEi7dtQ==
X-CSE-MsgGUID: hY5Bx0KDRbKJCOJcFyFYtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="226764207"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 01:58:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, uma.shankar@intel.com
Subject: [PATCH 8/8] drm/xe: remove remaining platform checks from compat
 i915_drv.h
Date: Thu, 13 Nov 2025 11:58:05 +0200
Message-ID: <3eca528805190eb4b10220c561412138765e83c1.1763027774.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1763027774.git.jani.nikula@intel.com>
References: <cover.1763027774.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

With xe no longer building anything from soc/, we can remove the compat
platform checks from i915_drv.h, reducing the file to just the to_i915()
pointer conversion helper.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 3e79a74ff7de..04d1925f9a19 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -19,19 +19,4 @@ static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
 	return container_of(dev, struct drm_i915_private, drm);
 }
 
-/* compat platform checks only for soc/ usage */
-#define IS_PLATFORM(xe, x) ((xe)->info.platform == x)
-#define IS_I915G(dev_priv)	(dev_priv && 0)
-#define IS_I915GM(dev_priv)	(dev_priv && 0)
-#define IS_PINEVIEW(dev_priv)	(dev_priv && 0)
-#define IS_VALLEYVIEW(dev_priv)	(dev_priv && 0)
-#define IS_CHERRYVIEW(dev_priv)	(dev_priv && 0)
-#define IS_HASWELL(dev_priv)	(dev_priv && 0)
-#define IS_BROADWELL(dev_priv)	(dev_priv && 0)
-#define IS_BROXTON(dev_priv)	(dev_priv && 0)
-#define IS_GEMINILAKE(dev_priv)	(dev_priv && 0)
-#define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
-
-#define IS_MOBILE(xe) (xe && 0)
-
 #endif
-- 
2.47.3

