Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EE9C27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 20:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB8110ECF8;
	Fri,  7 Jun 2024 20:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXWAp8/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BED210ED01
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 20:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717792568; x=1749328568;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lyTo/xNjj9J6JyLgBvI30WhIsvUrd3tICkmcOUWtsHQ=;
 b=NXWAp8/7if03U6UyQwV7nOnHQkHGedoSD2dB0xdELZ4lvh+wgPtWFwBO
 JHyHAgHAwR6wOzhocaYX937mURI8cZ1BZtw6TnMaqCAL74aCQA3ae83/Z
 aoRAABhn26iv6XDGDYyOrH1aqVZw3GZgbOwwfNh/mdU7XlKUhF2T6NJpD
 GRW3IDqdsHL8ju3OzsWpN8x0isnHWQAhClWl9VUA2itll6qoMqoPHvVZZ
 8ikqgu8kBF11m5GhaBXsuIw2vJ2XMK79TbEB5v4cj/Oev32jkQL8K5PqO
 K0bwMWrjb57gOvttBlwm/d6rfxDc/qaXfTvfOu0zlviTxHnuRPCN2MXQp Q==;
X-CSE-ConnectionGUID: j1iBkxKoTuG9mwp5f1AdGg==
X-CSE-MsgGUID: fdSvhZhUQgiCVmHQGO6zHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14372475"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14372475"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:36:08 -0700
X-CSE-ConnectionGUID: zq8SyfbQR4CdS1UkrkZvtQ==
X-CSE-MsgGUID: kdR6DVy7RxS2CNJEhn7bCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38377909"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:36:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/1] drm/xe/oa: Combined diff of changes between v15 and v16
Date: Fri,  7 Jun 2024 13:36:03 -0700
Message-ID: <20240607203603.1966481-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240607203603.1966481-1-ashutosh.dixit@intel.com>
References: <20240607203603.1966481-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, provide a combined diff of all changes in a single patch
to help with code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

This patch will not compile, it's purpose is to just provide the diff.

* Rebase on latest Xe changes and a few label renames

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 ++--
 drivers/gpu/drm/xe/xe_oa.c     | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d61c56b13ec3..d29d8689d4ec 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -662,7 +662,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_display_init(xe);
 	if (err)
-		goto err_oa_fini;
+		goto err_fini_oa;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
@@ -681,7 +681,7 @@ int xe_device_probe(struct xe_device *xe)
 err_fini_display:
 	xe_display_driver_remove(xe);
 
-err_oa_fini:
+err_fini_oa:
 	xe_oa_fini(xe);
 
 err_fini_gt:
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 3ed4ca19f9cd..d0a46485571a 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -686,7 +686,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
-	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
+	struct xe_lrc *lrc = stream->exec_q->lrc[0];
 	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
 	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
 		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
@@ -708,7 +708,7 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 	int err;
 
 	/* Modify stream hwe context image with regs_context */
-	err = xe_oa_modify_ctx_image(stream, &stream->exec_q->lrc[0],
+	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
 				     regs_context, ARRAY_SIZE(regs_context));
 	if (err)
 		return err;
@@ -720,7 +720,7 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
-	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
+	struct xe_lrc *lrc = stream->exec_q->lrc[0];
 	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
 	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
 		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
@@ -746,7 +746,7 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, __oa_ccs_select(stream));
 
 	/* Modify stream hwe context image with regs_context */
-	err = xe_oa_modify_ctx_image(stream, &stream->exec_q->lrc[0],
+	err = xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
 				     regs_context, ARRAY_SIZE(regs_context));
 	if (err)
 		return err;
@@ -1238,7 +1238,7 @@ static bool xe_oa_find_reg_in_lri(u32 *state, u32 reg, u32 *offset, u32 end)
 
 static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
 {
-	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
+	struct xe_lrc *lrc = stream->exec_q->lrc[0];
 	u32 len = (xe_gt_lrc_size(stream->gt, stream->hwe->class) +
 		   lrc->ring.size) / sizeof(u32);
 	u32 offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
-- 
2.41.0

