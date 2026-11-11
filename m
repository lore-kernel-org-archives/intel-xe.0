Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E9F606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bOgUK8PZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DB310FB31;
	Wed, 11 Nov 2026 11:20:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BD110FB25;
 Wed, 11 Nov 2026 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396024; x=1825932024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xEBawc3Xz56LF80JkwgqVTSG56w92vv3aPIaBN4MQVg=;
 b=bOgUK8PZNv/tx0S43Ft5qe2d5bMevbXCpyYD6hCX8XME/kDvb/cjSGTo
 9yvY+IgA8jAIIxVPEyNXFBZMouHfweA3E8w7t/r+yjWGAEJVlnH0cDdWf
 2tB+MWd5m3EAx5YveDu4/hVWIpVRmm70qWyna6I3bej2Q0h0jWgiipiNM
 pIiOr4wx7rTE3h3od9WByKzvul1k2w/T+1aJRy7gq3tFY0Gn/y3SKNzhO
 kbBC+GAe9TvfUh0mVpSlxIw6dS+xMLcPvoJFEQYJeSyO+kCfmQXQNZ72A
 AYZh3ZGuMLCFRZ94vyJGpCGTqsLpli5zUFcEw/ftK0uK4+X2+u6R0oEc7 g==;
X-CSE-ConnectionGUID: Iem1HlFkQrGo7Iu0+UmG5Q==
X-CSE-MsgGUID: HRbVIFQWQ/aPAk+xhYNkxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3186420"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3186420"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:23 -0800
X-CSE-ConnectionGUID: Rrpaie8rTTuVhnUTYgTSSA==
X-CSE-MsgGUID: D8RgGSFaTgmEDl5yJhfv4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8828974"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:22 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/13] drm/i915/dpt: Stop allocation DPTs from stolen
Date: Wed, 11 Nov 2026 13:19:57 +0200
Message-ID: <20261111112007.16790-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The original purpose for the DPT stolen memory usage was just so
I could sort of test the dGPU path (as far as the iomap is concerned)
without actually having a dGPU. Now it has long lived past its
usefulness.

Fragmenting stolen with DPTs may cause larger, important stolen
allocations (namely FBC) to fail. This will cost power.

Stop allocating DPTs from stolen, and just always use shmem for
iGPUs. This was already done for xe, but i915 was left unchanged for
whatever reason.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_dpt.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index 85d872c0f387..6daf75c3eb49 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -192,13 +192,10 @@ static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj, size_t size
 
 	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
 
-	dpt_obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_CONTIGUOUS);
-	if (IS_ERR(dpt_obj) && i915_ggtt_has_aperture(to_gt(i915)->ggtt))
-		dpt_obj = i915_gem_object_create_stolen(i915, size);
-	if (IS_ERR(dpt_obj) && !HAS_LMEM(i915)) {
-		drm_dbg_kms(&i915->drm, "Allocating dpt from smem\n");
+	if (HAS_LMEM(i915))
+		dpt_obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_CONTIGUOUS);
+	else
 		dpt_obj = i915_gem_object_create_shmem(i915, size);
-	}
 	if (IS_ERR(dpt_obj))
 		return ERR_CAST(dpt_obj);
 
-- 
2.56.0

