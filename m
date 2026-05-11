Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D814CCD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 21:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A3E10E8FE;
	Mon, 11 May 2026 21:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rx4aNY+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4A910E8FC;
 Mon, 11 May 2026 21:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778535741; x=1810071741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f0FmiBaZb0UgEGiiJTFNfkVbToFrW5HdHWlb30dGZcw=;
 b=Rx4aNY+aXatQJmEuB8nux2a12bzCdVa+iHCE+gRWG9dUtNiGjP9xXxn6
 KfcZBmL6++s64EB0Nfm9e3CgQqbQ7YPT3wLoF2xSAJiCV+5JXrOC6Vfvi
 vIUZGeNirRtKtbR83HUeEyQsMwM53Z27r2wMm5ZZtR33o7eQPAdachw9Y
 4ethjGTjrH8WZv+C7iMs1soltUppskdtx6Ky1hvJdjdk3Tk+Sito7k7wK
 0OlkxKdwuFX7YS8RzPhMi9OF3FNCzqMWsJWNJHHK3YhJ0DFksfmmsccS1
 p2UccvGlD8B+eaOT1r2rlEyxBZFwyQNve38Z4BaBESdc5XYFTsVX9KHDj w==;
X-CSE-ConnectionGUID: Z5s1G0fBRUOgnWGxN2fDuA==
X-CSE-MsgGUID: CQYd4VLSRmWVHmCmG2ILdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90816919"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90816919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:42:21 -0700
X-CSE-ConnectionGUID: AbVsSfpXR3ubKtfM5SHOEA==
X-CSE-MsgGUID: //NawgfQTIikJivEpdSlSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="275702962"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:42:19 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/14] drm/i915: Fix BIOS FB memory region name debug prints
Date: Tue, 12 May 2026 00:41:21 +0300
Message-ID: <20260511214122.8468-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
References: <20260511214122.8468-1-ville.syrjala@linux.intel.com>
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

Apparently we never initialize the name of the struct resource
underlying the memory region. Instead we need to look at the
name stored directly in the memory region itself.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_initial_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index 62365ba1ff97..90095a913428 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -57,14 +57,14 @@ initial_plane_phys(struct drm_i915_private *i915,
 
 	if (intel_memory_type_is_local(mem->type) != is_local) {
 		drm_err(&i915->drm, "Initial plane FB PTE unsuitable for %s\n",
-			mem->region.name);
+			mem->name);
 		return false;
 	}
 
 	if (dma_addr < mem->region.start || dma_addr > mem->region.end) {
 		drm_err(&i915->drm,
 			"Initial plane programming using invalid range, dma_addr=%pa (%s [%pa-%pa])\n",
-			&dma_addr, mem->region.name, &mem->region.start, &mem->region.end);
+			&dma_addr, mem->name, &mem->region.start, &mem->region.end);
 		return false;
 	}
 
@@ -106,7 +106,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 					       I915_BO_PREALLOC);
 	if (IS_ERR(obj)) {
 		drm_dbg_kms(&i915->drm, "Failed to preallocate initial FB in %s\n",
-			    mem->region.name);
+			    mem->name);
 		return NULL;
 	}
 
-- 
2.52.0

