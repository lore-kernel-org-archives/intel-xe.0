Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C67F459EB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 15:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9184310E97D;
	Fri, 10 Apr 2026 15:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmIdJris";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7660410E97B;
 Fri, 10 Apr 2026 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775833506; x=1807369506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5zGi9mYqLJUNgIAtwQzAgLWLNjiPcnNj+lb1/gapYlc=;
 b=RmIdJrisA5ONACabviaHBo2Tt0/hCWmCFUqNg015OYCVNHguc+T6WMkb
 ZZdbs1DyiGbU/5OXI4/rMX2Sol50LOpKai5cl+cDoIyGiqskcvn9YsBxx
 jzwspw2PO2VJPLXQEmsNbDqWd0TxG8zAkBJGxZZJrRkj6ziFPjzhm/tsz
 djuiSdy1ILGAGyrBsCFguu9jhp7qsRMFpfwviko92r2IxeByKxxbb4Qmh
 0s2noVKcvRC0fqdBjinJLBloxIyDjZa8x5RBaS16IR/HifiIb+nVJnLp+
 DfB2564KEepKZAnWrAaD0S+J2D5QNrpdepDa/hAzhkYmaRjpNQPzmMEhb A==;
X-CSE-ConnectionGUID: xoTP1zqCSIO7Io2T0oodBA==
X-CSE-MsgGUID: cVqfEPQBQc2KYdi7UHzhOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76815316"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76815316"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:05:04 -0700
X-CSE-ConnectionGUID: 2wZVIvbURDWsvfeb0RlZHw==
X-CSE-MsgGUID: SnWYSHFDRaSe6H+twL8k1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="230827807"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 08:05:03 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/10] drm/i915: Don't pass the whole plane_config to
 initial_plane_phys()
Date: Fri, 10 Apr 2026 18:04:42 +0300
Message-ID: <20260410150449.9699-4-ville.syrjala@linux.intel.com>
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

initial_plane_phys() only needs the 'base' (== ggtt virtual address)
from the plane_config. Stop passing the whole plane_config and just
pass the 'base'.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_initial_plane.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index 060aa0388c39..6df57db9b62a 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -34,8 +34,7 @@ initial_plane_memory_type(struct drm_i915_private *i915)
 
 static bool
 initial_plane_phys(struct drm_i915_private *i915,
-		   struct intel_initial_plane_config *plane_config,
-		   resource_size_t *out_phys_base,
+		   u32 base, resource_size_t *out_phys_base,
 		   struct intel_memory_region **out_mem)
 {
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
@@ -43,7 +42,6 @@ initial_plane_phys(struct drm_i915_private *i915,
 	enum intel_memory_type mem_type;
 	bool is_present, is_local;
 	dma_addr_t dma_addr;
-	u32 base;
 
 	mem_type = initial_plane_memory_type(i915);
 	mem = intel_memory_region_by_type(i915, mem_type);
@@ -54,7 +52,7 @@ initial_plane_phys(struct drm_i915_private *i915,
 		return false;
 	}
 
-	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
+	base = round_down(base, I915_GTT_MIN_ALIGNMENT);
 
 	dma_addr = intel_ggtt_read_entry(&ggtt->vm, base, &is_present, &is_local);
 
@@ -101,7 +99,7 @@ initial_plane_vma(struct drm_i915_private *i915,
 	if (plane_config->size == 0)
 		return NULL;
 
-	if (!initial_plane_phys(i915, plane_config, &phys_base, &mem))
+	if (!initial_plane_phys(i915, plane_config->base, &phys_base, &mem))
 		return NULL;
 
 	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
-- 
2.52.0

