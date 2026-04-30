Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D31EFF8873
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 15:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF0510E44A;
	Thu, 30 Apr 2026 15:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8c06XM4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81BB10E44A;
 Thu, 30 Apr 2026 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777563971; x=1809099971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2d5dI/0rOHR9tF1eBiOzZYggSOyoKngAy5R1JlcPxwo=;
 b=n8c06XM4S4n3bb26CIcNZkt7fGQ8A+Lhj2oRC4P4cFAoid3zrIBqzb+L
 /EVrbfqSIEIYeTJ183I19kCJvZOhD4WqvJOgSvW1UZGTPceHrjYvl9Fti
 bWcGyv6E2W6F07l62QA6ae2PK2OjUsXzI/cfUzjrgEhZid19HaJe4D0Bk
 CD56k2WIJnobD94enNt34XjZo+8DL7jc6qPWGFMQHVHboA3mpI1ZqKm/k
 d1W8PSSOWjHYluklprILdwhNmEO8uFttNEuOsGwpzTjQ6kS7a02P6h1iC
 Q3mwMieiCpfF2GbANkBm4WwLiIQtp/Km+TQS5QVHb5JeyOwoeolUqKyBY g==;
X-CSE-ConnectionGUID: ldy/Gk/ZRkGyRHxkfseD3A==
X-CSE-MsgGUID: sVAR+5LnRiioetC5HQc7QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78229691"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78229691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 08:46:11 -0700
X-CSE-ConnectionGUID: d/lwXH7OQsOEAA4UeX476A==
X-CSE-MsgGUID: n6ZLRHyLTwKKqLlYkc4bEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="239612193"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 08:46:09 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Respect pin_params.alignment for GGTT
Date: Thu, 30 Apr 2026 18:46:02 +0300
Message-ID: <20260430154602.11393-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260430154602.11393-1-ville.syrjala@linux.intel.com>
References: <20260430154602.11393-1-ville.syrjala@linux.intel.com>
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

Fix __xe_pin_fb_vma_ggtt() to actually respect the GGTT alignment
specified by the display code. Misalignment can cause GTT faults
etc.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3e8114fbfbaa..8d0067f908c5 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -286,7 +286,7 @@ static int __xe_pin_fb_vma_ggtt(struct drm_gem_object *obj,
 	 */
 	guard(xe_pm_runtime_noresume)(xe);
 
-	align = XE_PAGE_SIZE;
+	align = max(XE_PAGE_SIZE, pin_params->alignment);
 	if (xe_bo_is_vram(bo) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		align = max(align, SZ_64K);
 
-- 
2.52.0

