Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07E5C07CB1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 14:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEB410E540;
	Wed, 29 Nov 2023 14:10:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1A010E53C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701267050; x=1732803050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5i16MJyQmvD9Cr+ZGAeFTKiKGJEiVyxdNmU0y8Yh0vM=;
 b=MgjCSb8tsj6DvF2siNXfBpDO/fTW9c8g1oUxD0WVBgsjcQaEGk6/LO8b
 y914pMgEkewIBxmr3HJI6uEP/vbDddo5uvEXqPUD9TZtTtuXnn55qPfO8
 HrJWn/pcUB47c2fGYDrmVhed6YA+gs8o1mvRSUy3k2rdbYJkGPI13Nvgz
 DEc38xsB2QKFKOuopdLUFJ9x+HoaFDIxXon9rGnL4MH4QYEieW2Od0gwS
 WNCgDpll+bm6K6T6axpUzG32CF9kRiILfKeBVx3X9IIehgKaXqnEh0cL8
 WchKSlZTRou3yOKbbMyOXcwszTd+0RFbIjBeIEr8yWIDavfjmve2uidSv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="52669"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="52669"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 06:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745269703"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="745269703"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 06:03:42 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 29 Nov 2023 19:20:51 +0530
Message-Id: <20231129135054.564076-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231129135054.564076-1-animesh.manna@intel.com>
References: <20231129135054.564076-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 3/6] drm/i915/dsb: Correct DSB command buffer
 cache coherency settings
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

The display engine does not snoop the caches so we should mark
the DSB command buffer as I915_CACHE_NONE.
i915_gem_object_create_internal() always gives us I915_CACHE_LLC
on LLC platforms. And to make things 100% correct we should also
clflush at the end, if necessary.

Note that currently this is a non-issue as we always write the
command buffer through a WC mapping, so a cache flush is not actually
needed. But we might actually want to consider a WB mapping since
we also end up reading from the command buffer (in the indexed
reg write handling). Either that or we should do something else
to avoid those reads (might actually be even more sensible on DGFX
since we end up reading over PCIe). But we should measure the overhead
first...

Anyways, no real harm in adding the belts and suspenders here so
that the code will work correctly regardless of how we map the
buffer. If we do get a WC mapping (as we request)
i915_gem_object_flush_map() will be a nop. Well, apart form
a wmb() which may just flush the WC buffer a bit earlier
than would otherwise happen (at the latest the mmio accesses
would trigger the WC flush).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231009132204.15098-2-ville.syrjala@linux.intel.com
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 7410ba3126f9..78b6fe24dcd8 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -316,6 +316,8 @@ void intel_dsb_finish(struct intel_dsb *dsb)
 				   DSB_FORCE_DEWAKE, 0);
 
 	intel_dsb_align_tail(dsb);
+
+	i915_gem_object_flush_map(dsb->vma->obj);
 }
 
 static int intel_dsb_dewake_scanline(const struct intel_crtc_state *crtc_state)
@@ -462,13 +464,18 @@ struct intel_dsb *intel_dsb_prepare(const struct intel_crtc_state *crtc_state,
 	/* ~1 qword per instruction, full cachelines */
 	size = ALIGN(max_cmds * 8, CACHELINE_BYTES);
 
-	if (HAS_LMEM(i915))
+	if (HAS_LMEM(i915)) {
 		obj = i915_gem_object_create_lmem(i915, PAGE_ALIGN(size),
 						  I915_BO_ALLOC_CONTIGUOUS);
-	else
+		if (IS_ERR(obj))
+			goto out_put_rpm;
+	} else {
 		obj = i915_gem_object_create_internal(i915, PAGE_ALIGN(size));
-	if (IS_ERR(obj))
-		goto out_put_rpm;
+		if (IS_ERR(obj))
+			goto out_put_rpm;
+
+		i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
+	}
 
 	vma = i915_gem_object_ggtt_pin(obj, NULL, 0, 0, 0);
 	if (IS_ERR(vma)) {
-- 
2.29.0

