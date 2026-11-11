Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B04606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G5JLnCbq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A6410FB2C;
	Wed, 11 Nov 2026 11:20:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0762710FB2C;
 Wed, 11 Nov 2026 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396028; x=1825932028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LQgL+XtZoG2/A0DGR31f/oDavYfwWvHdeh3RLYu975s=;
 b=G5JLnCbqKDhKTmjeO+tPld2DSAOA/pKMRoAyGzBRgJtEq5opDb8lE9nq
 J5AK8yxQy94uSPxwwITOtXXkAIAtsA7pcyFcamCO8MR9yKGh2AuH5PAEV
 kkg/tsJDNlmvmjAEJxbTX1RWJKmMKcdRM0HTTSE7jhSHkHljtmBy/bR4X
 qTccfPQr3CfLKTQhwEP1yTiJ7or5KBChN2gErnr1rNdKJXwvQ0wtlZ3oO
 9qa0R/g917rZf4Ava3SpIAHvG0fuMuRLF56Jz3ffzcA8WAE9NJWtMC+j/
 5kzuDVTMABeI8wS/mHNY00Zq02wfi+TbeuFZhlkmt+D2yQRtTtZYog70V Q==;
X-CSE-ConnectionGUID: xl/8gnq/TE2tOniOkd17rw==
X-CSE-MsgGUID: p6PFTUVDS6WHgd5y2w2XBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3186423"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3186423"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:26 -0800
X-CSE-ConnectionGUID: PV/+TD35S4O3vxMIUfcsZA==
X-CSE-MsgGUID: Rs40kffdThuwnIJmnpIFRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8828978"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:25 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/13] drm/i915/fb_pin: Remove overzealous vma NULL checks
Date: Wed, 11 Nov 2026 13:19:58 +0200
Message-ID: <20261111112007.16790-5-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Remove the unnecessary NULL checks from the unpin functions.
The pin and unpin are always expected to be balanced.

The idea of these checks probably predates
commit 58fa1760d08a ("drm/i915: Balance prepare_fb/cleanup_fb")
when we perhaps did have the real possibility of NULL vmas.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_fb_pin.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index 63be136f1a05..b5672b2cf5bd 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -244,8 +244,7 @@ static int i915_fb_pin_ggtt_pin(struct drm_gem_object *obj,
 static void i915_fb_pin_ggtt_unpin(struct i915_vma *ggtt_vma,
 				   int fence_id)
 {
-	if (ggtt_vma)
-		intel_fb_unpin_vma(ggtt_vma, fence_id);
+	intel_fb_unpin_vma(ggtt_vma, fence_id);
 }
 
 static int i915_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_dpt *dpt,
@@ -282,13 +281,8 @@ static void i915_fb_pin_dpt_unpin(struct intel_dpt *dpt,
 				  struct i915_vma *dpt_vma,
 				  struct i915_vma *ggtt_vma)
 {
-	WARN_ON(!dpt);
-	WARN_ON(!!dpt_vma != !!ggtt_vma);
-
-	if (dpt_vma)
-		intel_fb_unpin_vma(dpt_vma, -1);
-	if (ggtt_vma)
-		i915_dpt_unpin_from_ggtt(dpt);
+	intel_fb_unpin_vma(dpt_vma, -1);
+	i915_dpt_unpin_from_ggtt(dpt);
 }
 
 static void i915_fb_pin_get_map(struct i915_vma *vma, struct iosys_map *map)
-- 
2.56.0

