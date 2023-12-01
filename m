Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EEBC10F04
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 09:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5D410E82B;
	Fri,  1 Dec 2023 09:26:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FCE10E827
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701422815; x=1732958815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9r4OsbtuKW6MFIBLni9Jb9TxtqHxuNxhX0CwOyjWO/s=;
 b=Ca06fcwPTPIDiLEFp2GV0iQ2QUaetI9n+2WhFJg4MhGlK5nQZHklXqF9
 zdzOwS4kBkRyTRl1AxHg6hiKkl/y7PUKVJRNp3ZxD8U+UrTptLjkqBurS
 LY4XDyB89TDBfCFFCq/heXSdOOdtq3yOlaPi1hSxB177dCfln1YwHz9Xi
 MhftKJlnWr6F5jEjCWPJvkfJ3csOlct3cPNRrgCMwUhoPGCjTvZ25FhfO
 1J/VKYUzks+MVJ+tP83bDuTq676qJ1aQDHqqG61s3qZRkFRfKkUU6utM/
 x8OknWLLmivM4UfNc04fKRsDqH/1IMUmdvaxTDbDSZf8f3XB4HN7R8Qo3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="378499013"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="378499013"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 01:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798655764"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="798655764"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2023 01:26:54 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 14:44:02 +0530
Message-Id: <20231201091405.658548-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231201091405.658548-1-animesh.manna@intel.com>
References: <20231201091405.658548-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/6] drm/i915/dsb: Correct DSB command buffer
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
(cherry picked from commit 631b117ea8c3b7d4ec21ece69be6c465e79330fa)
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

