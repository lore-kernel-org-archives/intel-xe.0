Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EFECA5FC5
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 15:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC89D10F47D;
	Wed, 30 Sep 2026 15:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGZWdlFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F5310F47E;
 Wed, 30 Sep 2026 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790780455; x=1822316455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lz5Bkn06BBuSmMV+ovfDf/YUxXZoJnllpXtq18rMWT0=;
 b=ZGZWdlFk+PHUBoNZsBviLV5LAbC36q/FksyArUivqt5q450TIvveu1v0
 BE3PAFjzNljSHARyhUwSd521PZMR7bmk02AMzjP8eac2S9UnWfJdBkC1O
 Q8djAXPFhYL8WLzJgfYMMFnd5iX1CemGM4HCqHAvVULcnmSeAx+si4ci5
 UgUsafwD/R82oqBqvSKPYUJik61oAw37cDhNqjf4/SPDv3lnnc6ArqbW+
 +EJ7uSvrmXCZK5QOejeHF1umBgqK1bnQiSeNU6U0laa+TCADl2jhzEkf/
 TuXGIaAd8bgxuqPtvH+udeXwtyucbQRCGu4FlsZla/V5/QEUClWhCSmK/ Q==;
X-CSE-ConnectionGUID: EiJyRbKoT3uc52S3VWLuLA==
X-CSE-MsgGUID: jFm5YGJxTdGkN3RTQdugQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90284225"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="90284225"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:55 -0700
X-CSE-ConnectionGUID: e4Gj45a/R/iPrK9KwW1Siw==
X-CSE-MsgGUID: iXVZZ427QfWTk+k9Qv4amQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275849643"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI v2 09/10] drm/i915/debugfs: use the intel_gtt_view_is_*() helpers
 more
Date: Wed, 30 Sep 2026 18:00:05 +0300
Message-ID: <6d9279ce0522f6768f55fb6c760862fdb92ffc03.1790780340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790780340.git.jani.nikula@intel.com>
References: <cover.1790780340.git.jani.nikula@intel.com>
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

Prefer using the intel_gtt_view_is_*() helpers instead of comparing the
view type directly.

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

