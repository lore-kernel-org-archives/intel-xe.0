Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F853CD8CB2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F4E10E64E;
	Tue,  9 Jun 2026 20:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIfwKyY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E666410E64E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036276; x=1812572276;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=PNyKI008kqYKmx7Xcm6Ue5w1LX71NJjLk8zrYcsx/X0=;
 b=aIfwKyY+NyY1pYP4eLNYhPy3Yq5PzVHU/169Bf95XEBE/M1ol2SBmBjh
 EQiH7RN/0YUdiW8QkizSPHI7jXF66owCq+ElQJfRgen3rWFTbX09/Qfkb
 d/oOW7ReW/I5zJOVY0846R/W35Y/b06DOP3LINqsXC4/uIiu3tzlvWwgy
 7DtfpJj1KCr7xW6fC3WJJBbzP1285KM6QNNinH3EaJtoIF4drrQZNM6MQ
 IedbWHAwy0oP9ShOP2hk9zow9NCVMrdNPEe2HzUYt5Bd+eRSXEUQAwsGB
 y27OMH+3vTlZOFxG/lIZ080vVsf8+YFGDpUGmlJ5FLTxIhqs3zOTNy0z1 Q==;
X-CSE-ConnectionGUID: YrwdXJjkSImvW8QG7tC3Ug==
X-CSE-MsgGUID: giZ+3yVERfKLi4pF2WlMDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383320"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383320"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:56 -0700
X-CSE-ConnectionGUID: mRPZjd/KSg+J19UC86IlFg==
X-CSE-MsgGUID: iaQAytc3TeKfWIZZemSJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027576"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:57 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:41 -0300
Subject: [PATCH 9/9] drm/xe: Add tile_count to xe_probed_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-9-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

On multi-tile platforms, we need to probe the hardware for the number
of tiles that are present in the platform.  That means that we should
do that as part of xe_probe_info() instead of xe_info_init().  Do
that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 11 ++---------
 drivers/gpu/drm/xe/xe_pci.c       | 27 +++++++++++++--------------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 31ec41aa997d..8df9029afcd3 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -311,17 +311,13 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
 
-static void fake_xe_info_probe_tile_count(struct xe_device *xe,
-					  const struct xe_device_desc *desc)
-{
-	xe->info.tile_count = 1 + desc->max_remote_tiles;
-}
-
 static int fake_probe_info(struct xe_device *xe,
 			   const struct xe_device_desc *desc,
 			   struct xe_pci_fake_data *data,
 			   struct xe_probed_info *probed_info)
 {
+	probed_info->tile_count = 1 + desc->max_remote_tiles;
+
 	if (!data || desc->pre_gmdid_graphics_ip) {
 		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
 		probed_info->media_ip = desc->pre_gmdid_media_ip;
@@ -382,9 +378,6 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	xe->sriov.__mode = data && data->sriov_mode ?
 			   data->sriov_mode : XE_SRIOV_MODE_NONE;
 
-	kunit_activate_static_stub(test, xe_info_probe_tile_count,
-				   fake_xe_info_probe_tile_count);
-
 	err = fake_probe_info(xe, desc, data, &probed_info);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6b2daad87316..1b5df4384689 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -728,6 +728,7 @@ static int handle_gmdid(struct xe_device *xe,
 struct xe_probed_info {
 	u16 devid;
 	u8 revid;
+	u8 tile_count;
 	struct xe_step_info step;
 	const struct xe_ip *graphics_ip;
 	const struct xe_ip *media_ip;
@@ -819,25 +820,21 @@ static int xe_info_init_early(struct xe_device *xe,
 	return 0;
 }
 
-/*
- * Possibly override number of tile based on configuration register.
- */
-static void xe_info_probe_tile_count(struct xe_device *xe,
-				     const struct xe_device_desc *desc)
+static void xe_probe_tile_count(struct xe_device *xe,
+				const struct xe_device_desc *desc,
+				struct xe_probed_info *probed_info)
 {
 	struct xe_mmio *mmio;
 	u8 tile_count;
 	u32 mtcfg;
 
-	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe, desc);
-
-	xe->info.tile_count = 1 + desc->max_remote_tiles;
+	probed_info->tile_count = 1 + desc->max_remote_tiles;
 
 	/*
 	 * Probe for tile count only for platforms that support multiple
 	 * tiles.
 	 */
-	if (xe->info.tile_count == 1)
+	if (probed_info->tile_count == 1)
 		return;
 
 	mmio = xe_root_tile_mmio(xe);
@@ -850,10 +847,10 @@ static void xe_info_probe_tile_count(struct xe_device *xe,
 	mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
 	tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 
-	if (tile_count < xe->info.tile_count) {
+	if (tile_count < probed_info->tile_count) {
 		drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
-			 xe->info.tile_count, tile_count);
-		xe->info.tile_count = tile_count;
+			 probed_info->tile_count, tile_count);
+		probed_info->tile_count = tile_count;
 	}
 }
 
@@ -975,6 +972,8 @@ static int xe_probe_info(struct xe_device *xe,
 {
 	int err;
 
+	xe_probe_tile_count(xe, desc, probed_info);
+
 	err = xe_probe_ips(xe, desc, probed_info);
 	if (err)
 		return err;
@@ -1002,6 +1001,8 @@ static int xe_info_init(struct xe_device *xe,
 
 	graphics_ip = probed_info->graphics_ip;
 	media_ip = probed_info->media_ip;
+
+	xe->info.tile_count = probed_info->tile_count;
 	xe->info.step.basedie = probed_info->step.basedie;
 	xe->info.step.graphics = probed_info->step.graphics;
 	xe->info.step.media = probed_info->step.media;
@@ -1037,8 +1038,6 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_soc_remapper_telem = 0;
 	}
 
-	xe_info_probe_tile_count(xe, desc);
-
 	for_each_remote_tile(tile, xe, id) {
 		int err;
 

-- 
2.53.0

