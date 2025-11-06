Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027C7CCFA03
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 14:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF3E10E909;
	Thu,  6 Nov 2025 14:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDTQAdRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520310E909;
 Thu,  6 Nov 2025 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762440214; x=1793976214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6nNm0EpO0DM+P7RuqJPAPYnuS9782roJJw2qPyPJsh8=;
 b=RDTQAdRBIRTyfiIM2xytRyMbUMLg3cp8SP8FLRUkOubmQPOHfqYgb0FY
 lgj4i/JJilm6qnEKjcok8RiwVUp5u+Ibh6wT1ncW56L+a+Kjb3lvRcF+H
 dwy7I9nPfeQO4EWcRUXgQZwtluptmymdQ3LGOG/JX2cpK8VttcE0yp6hB
 EToL7PPpgLTtGTvw4HNF9skdMVxbE5XgjwZ6SChE3AdBpOHxG1n7ZWQtz
 mwLOGINVkVCARH73NsdhoIDsKh4rzU6xY21U223G0N+cRv7lEFBeLa1A2
 sXh9CgNwMEsBJy8GdVhTbo3kHCavefsIQB051Kk56CP0o6KgU6Tc8rbdJ w==;
X-CSE-ConnectionGUID: Bs+c8Tg7S8exvIs0QE9ytA==
X-CSE-MsgGUID: MHltLNTbRRi5dukqHpus3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64504111"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64504111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:43:34 -0800
X-CSE-ConnectionGUID: sEubXDRPSx+oDAFTyuuktA==
X-CSE-MsgGUID: Wb9XPNiHScmL5sIi2pH77g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="218527000"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:43:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	tursulin@ursulin.net
Subject: [PATCH 3/5] drm/i915/rps: postpone i915 fence check to boost
Date: Thu,  6 Nov 2025 16:43:11 +0200
Message-ID: <43c8f3805d86ee3ee8ae3ebd5db322d1bcb5d2a7.1762440096.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762440096.git.jani.nikula@intel.com>
References: <cover.1762440096.git.jani.nikula@intel.com>
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

Make the RPS boost code independent of i915 request code by moving the
dma_fence_is_i915() check to the RPS boost call.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

I'm not actually sure what the non-i915 fences would be here, and what
kind of overhead they would cause.
---
 drivers/gpu/drm/i915/display/intel_display_rps.c | 4 ----
 drivers/gpu/drm/i915/gt/intel_rps.c              | 7 ++++++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
index 27714b75d32d..44cb9dba0c19 100644
--- a/drivers/gpu/drm/i915/display/intel_display_rps.c
+++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
@@ -10,7 +10,6 @@
 #include <drm/intel/display_parent_interface.h>
 
 #include "i915_reg.h"
-#include "i915_request.h"
 #include "intel_display_core.h"
 #include "intel_display_irq.h"
 #include "intel_display_rps.h"
@@ -49,9 +48,6 @@ void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
 	if (!display->parent->rps)
 		return;
 
-	if (!dma_fence_is_i915(fence))
-		return;
-
 	if (DISPLAY_VER(display) < 6)
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 61d746bda462..05b21de6c24b 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2917,7 +2917,12 @@ EXPORT_SYMBOL_GPL(i915_gpu_turbo_disable);
 
 static void boost(struct dma_fence *fence)
 {
-	struct i915_request *rq = to_request(fence);
+	struct i915_request *rq;
+
+	if (!dma_fence_is_i915(fence))
+		return;
+
+	rq = to_request(fence);
 
 	/*
 	 * If we missed the vblank, but the request is already running it
-- 
2.47.3

