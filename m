Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CE7C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5C810E59E;
	Tue, 15 Sep 2026 20:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSqH1jdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0956F10E601;
 Tue, 15 Sep 2026 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789503003; x=1821039003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lUxetmA81Gr5FNdwwetRX/QRRbyzOeabXpCZHNNxa68=;
 b=CSqH1jdbrO+KDT2sKCbOdnQkzQL9MfB0eRKl/YoBOvfWZU60Giq2nfr8
 ciOkrhoul9/AfWu6gtw9JdNzVumVxOf0I0rSOnr/KVZfkGppDop6aJU23
 E3fShIPJNp9FOZQiknnyn3KIHwvu6s3mwfbmw9S9Nkt84KpjNLAzk75p9
 OvGQmBpuRD38y7bprKQCN1QeKp3doFYs2Sl1qItrHeQ2f/Ed7D/n8R2Wr
 ZCPnslX8U0s2pMIRoEhvZz8aBgoUaj9s9X7Xfm+R9xI2v6QOXUJuwrRkZ
 oS0aJ6IpmqtLVhF6Sd2EFEdXVTeISc9AyJdXmEldVV2g+qP0XxYWLcC8U A==;
X-CSE-ConnectionGUID: d3987DA5S9OcdwjOH/xiMQ==
X-CSE-MsgGUID: Jksikk9kTw22QYm76MMiRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89750717"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89750717"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:10:03 -0700
X-CSE-ConnectionGUID: GF0DC/R3R7ipvdEONkJ6tg==
X-CSE-MsgGUID: rpA1PpGSRNOvg3NYrtf81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270490627"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:10:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 09/10] drm/i915/debugfs: use the intel_gtt_view_is_*() helpers
 more
Date: Tue, 15 Sep 2026 23:09:20 +0300
Message-ID: <eac705c06806b5f68b3c7c9151172b288243a345.1789502902.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Prefer using the intel_gtt_view_is_*() helpers instead of comparing the
view type directly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index a3e27f9e4f47..ddb2ab4f22a2 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -209,18 +209,13 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 			   stringify_page_sizes(vma->resource->page_sizes_gtt,
 						NULL, 0));
 		if (i915_vma_is_ggtt(vma) || i915_vma_is_dpt(vma)) {
-			switch (vma->gtt_view.type) {
-			case I915_GTT_VIEW_NORMAL:
+			if (intel_gtt_view_is_normal(&vma->gtt_view)) {
 				seq_puts(m, ", normal");
-				break;
-
-			case I915_GTT_VIEW_PARTIAL:
+			} else if (intel_gtt_view_is_partial(&vma->gtt_view)) {
 				seq_printf(m, ", partial [%08llx+%x]",
 					   vma->gtt_view.partial.offset << PAGE_SHIFT,
 					   vma->gtt_view.partial.size << PAGE_SHIFT);
-				break;
-
-			case I915_GTT_VIEW_ROTATED:
+			} else if (intel_gtt_view_is_rotated(&vma->gtt_view)) {
 				seq_printf(m, ", rotated [(%ux%u, src_stride=%u, dst_stride=%u, offset=%u), (%ux%u, src_stride=%u, dst_stride=%u, offset=%u)]",
 					   vma->gtt_view.rotated.plane[0].width,
 					   vma->gtt_view.rotated.plane[0].height,
@@ -232,9 +227,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 					   vma->gtt_view.rotated.plane[1].src_stride,
 					   vma->gtt_view.rotated.plane[1].dst_stride,
 					   vma->gtt_view.rotated.plane[1].offset);
-				break;
-
-			case I915_GTT_VIEW_REMAPPED:
+			} else if (intel_gtt_view_is_remapped(&vma->gtt_view)) {
 				seq_printf(m, ", remapped [(%ux%u, src_stride=%u, dst_stride=%u, offset=%u), (%ux%u, src_stride=%u, dst_stride=%u, offset=%u)]",
 					   vma->gtt_view.remapped.plane[0].width,
 					   vma->gtt_view.remapped.plane[0].height,
@@ -246,11 +239,8 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 					   vma->gtt_view.remapped.plane[1].src_stride,
 					   vma->gtt_view.remapped.plane[1].dst_stride,
 					   vma->gtt_view.remapped.plane[1].offset);
-				break;
-
-			default:
+			} else {
 				MISSING_CASE(vma->gtt_view.type);
-				break;
 			}
 		}
 		if (vma->fence)
-- 
2.47.3

