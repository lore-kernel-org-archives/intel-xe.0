Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49401C87FDD
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D4E10E441;
	Tue, 30 May 2023 21:16:21 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31A110E43B
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481369; x=1717017369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gceJ2C/NYxX+4ICO+zxsJCQmNWBRn6YOY9DHkvMBSAE=;
 b=dsmCghVP2qc1HbgAqE0e+ShDUYv+D9oxBp0QXBCox+k0Kw+2VN6OJkB6
 hIjW8JbknWEAVsB1Ax8RWzXvODww9rglH9MGD2+Z1KJ3Pl8cLyRM1M68J
 mnwzs/INouLDvsvb9cO7SLWsJfwkaQMFtXiNMHzKJDvBbKh0rvGq8VsWV
 t8ppiE1a1Cvt0XbwMLUROdMjRDyLMDlKnUYtCncpyjDLI0ktNGvy8igRm
 nqm2lNl+sNi4ezTmWwZdbTkw9YmFCsKQWDtvmfpZUiGAAhtiTy0CImH7M
 IL8jZr5vg+B90DzYQT8J6CP9k9OtlIjXzmF7t+K0Av3OlUCpPv1e22X7y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311955"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311955"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139440"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139440"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:35 -0700
Message-Id: <20230530211549.2632538-18-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 17/31] drm/xe: Drop extra_gts[] declarations
 and XE_GT_TYPE_REMOTE
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that tiles and GTs are handled separately, extra_gts[] doesn't
really provide any useful information that we can't just infer directly.
The primary GT of the root tile and of the remote tiles behave the same
way and don't need independent handling.

When we re-add support for media GTs in a future patch, the presence of
media can be determined from MEDIA_VER() (i.e., >= 13) and media's GSI
offset handling is expected to remain constant for all forseeable future
platforms, so it won't need to be provided in a definition structure
either.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h |  1 -
 drivers/gpu/drm/xe/xe_pci.c      | 36 ++++++--------------------------
 2 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 34d5dd98885e..99ab7ec99ccd 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -20,7 +20,6 @@ struct xe_ring_ops;
 enum xe_gt_type {
 	XE_GT_TYPE_UNINITIALIZED,
 	XE_GT_TYPE_MAIN,
-	XE_GT_TYPE_REMOTE,
 	XE_GT_TYPE_MEDIA,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 42e6fcb07c94..2565a6b6ff4e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -46,7 +46,6 @@ struct xe_device_desc {
 
 	const char *platform_name;
 	const struct xe_subplatform_desc *subplatforms;
-	const struct xe_gt_desc *extra_gts;
 
 	enum xe_platform platform;
 
@@ -272,21 +271,12 @@ static const struct xe_device_desc dg2_desc = {
 	.has_display = true,
 };
 
-static const struct xe_gt_desc pvc_gts[] = {
-	{
-		.type = XE_GT_TYPE_REMOTE,
-		.mmio_adj_limit = 0,
-		.mmio_adj_offset = 0,
-	},
-};
-
 static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
 	.has_display = false,
 	.require_force_probe = true,
-	.extra_gts = pvc_gts,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -562,28 +552,14 @@ static int xe_info_init(struct xe_device *xe,
 		tile->id = id;
 
 		gt = &tile->primary_gt;
-		gt->info.id = id;
+		gt->info.id = id;	/* FIXME: Determine sensible numbering */
 		gt->tile = tile;
+		gt->info.type = XE_GT_TYPE_MAIN;
+		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
+		if (MEDIA_VER(xe) < 13 && media_desc)
+			gt->info.__engine_mask |= media_desc->hw_engine_mask;
 
-		if (id == 0) {
-			gt->info.type = XE_GT_TYPE_MAIN;
-
-			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
-			if (MEDIA_VER(xe) < 13 && media_desc)
-				gt->info.__engine_mask |= media_desc->hw_engine_mask;
-
-			gt->mmio.adj_limit = 0;
-			gt->mmio.adj_offset = 0;
-		} else {
-			gt->info.type = desc->extra_gts[id - 1].type;
-			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
-				media_desc->hw_engine_mask :
-				graphics_desc->hw_engine_mask;
-			gt->mmio.adj_limit =
-				desc->extra_gts[id - 1].mmio_adj_limit;
-			gt->mmio.adj_offset =
-				desc->extra_gts[id - 1].mmio_adj_offset;
-		}
+		/* TODO: Init media GT, if present */
 	}
 
 	return 0;
-- 
2.40.1

