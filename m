Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC50C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481AE10F134;
	Fri,  2 Feb 2024 22:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlnIU7M6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49FC10F131
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914280; x=1738450280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2jsFX1hQJqFgCRUHYfTNF8JFciKpOCAzttpcVZJXKK0=;
 b=UlnIU7M6bhuJyP/cMxiLypiD7Yjqoqye07mwzkXLYqNyaYyCri6VRwSB
 0Uh9lViIFLWwqF9M7XRyeIq3u/ysYAJlxJ+ALIqFas8lL+e+Rla29VxS7
 K4Y9+CcOllU4r0PBK0eEhC271fW0h7JOUmcBnBWdXVrD0nRAhdLdiavmK
 818MwOdcxPv+cwmIB7L+I98ks4Nck4c7utJas2YDtvi4k7wrFy3rQ7uYq
 0mO+zr/Btfl5xSunKu7EHUXDAGbLQqWMPwETwFmpXDIj0CzYL0iqv3YuD
 fVxCOY3K8PGeiD89ZhQ+tTtmPpI3imrTHzomD0+rFqpRhNa1SsRA902zr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153761"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153761"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332041"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332041"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:44:11 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 08/16] drm/i915: Fix region start during initial plane
 readout
Date: Sat,  3 Feb 2024 00:43:32 +0200
Message-ID: <20240202224340.30647-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On MTL the stolen region starts at offset 8MiB from the start of
LMEMBAR. The dma addresses are thus also offset by 8MiB. However the
mm_node/etc. is zero based, and i915_pages_create_for_stolen() will
add the appropriate region.start into the sg dma address. So when
we do the readout we need to convert the dma address read from
the PTE to be zero based as well.

Note that currently we don't take this path on MTL, but we should
and thus this needs to be fixed. For lmem this works correctly
already as the lmem region.start==0.

While at it let's also make sure the address points to somewhere within
the memory region. We don't need to check the size as
i915_gem_object_create_region_at() should later fail if the object size
exceeds the region size.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index ffc92b18fcf5..db594ccf0323 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -79,16 +79,18 @@ initial_plane_vma(struct drm_i915_private *i915,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= resource_size(&mem->region)) {
+		if (phys_base < mem->region.start || phys_base > mem->region.end) {
 			drm_err(&i915->drm,
-				"Initial plane programming using invalid range, phys_base=%pa\n",
-				&phys_base);
+				"Initial plane programming using invalid range, phys_base=%pa (%s [%pa-%pa])\n",
+				&phys_base, mem->region.name, &mem->region.start, &mem->region.end);
 			return NULL;
 		}
 
 		drm_dbg(&i915->drm,
 			"Using phys_base=%pa, based on initial plane programming\n",
 			&phys_base);
+
+		phys_base -= mem->region.start;
 	} else {
 		phys_base = base;
 		mem = i915->mm.stolen_region;
-- 
2.43.0

