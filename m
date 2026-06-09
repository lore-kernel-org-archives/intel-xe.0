Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3187BCD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51D310E650;
	Tue,  9 Jun 2026 20:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldtVJtH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC32910E64E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036275; x=1812572275;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uLHHD+gN9uEVLSaoDMonohm8JwkxiLfo9FIEz46B7ng=;
 b=ldtVJtH6cvbQdZkp6qqToZlaaZCNWPiR44I9oNZr6oudse7voWgnZaP+
 +yxR99Y1n6xgM0s+PfTa/0f6AdMNaj3nqiFrzsdy2cwKRckmOz9OEKy49
 uEg4IgBTE1nUuD9TGRwJPUeQV7CAlMqHfZSEj7Pqw6XaWUM9phvjK/AGG
 qt+n2jWmzJUQnYjmDQuMME0JLh7tbYxw6HoOPbrxBKqKEdmluumBDukA7
 +EihSJ3OBO+C/VvIvOXMbxx67WhTEX9kNSsc2PGDYEFCOPL4zReF9l8zE
 EJy+wjKVtxgYiGz9K5iABzZjCQNPzQv9IM7+/lzbor04kjKSFDAHDiDuP Q==;
X-CSE-ConnectionGUID: Zk5HnrmmQT+Nxj4oKcG0OQ==
X-CSE-MsgGUID: PprIV6/ORRuNwQeEwqCCFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383312"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:55 -0700
X-CSE-ConnectionGUID: d1R3ctCwRE+uTXxUtnsg0g==
X-CSE-MsgGUID: AzGfj+W9QpeooWLAzziGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027570"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:56 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:40 -0300
Subject: [PATCH 8/9] drm/xe: Don't initialize tile_count in
 xe_info_init_early()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-8-21e83e188e60@intel.com>
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

The value of xe->info.tile_count is only really valid after
xe_info_probe_tile_count().  Any use of tile_count before that point
is invalid and, consequently, initializing it in xe_info_init_early()
is pointless.

Move the initialization to xe_info_probe_tile_count().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  5 +++--
 drivers/gpu/drm/xe/xe_pci.c       | 10 ++++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index cd64b1d614c8..31ec41aa997d 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -311,9 +311,10 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
 
-static void fake_xe_info_probe_tile_count(struct xe_device *xe)
+static void fake_xe_info_probe_tile_count(struct xe_device *xe,
+					  const struct xe_device_desc *desc)
 {
-	/* Nothing to do, just use the statically defined value. */
+	xe->info.tile_count = 1 + desc->max_remote_tiles;
 }
 
 static int fake_probe_info(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 388771ef6a52..6b2daad87316 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -811,7 +811,6 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe_assert(xe, desc->max_gt_per_tile > 0);
 	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
 	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
-	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
 	if (err)
@@ -823,13 +822,16 @@ static int xe_info_init_early(struct xe_device *xe,
 /*
  * Possibly override number of tile based on configuration register.
  */
-static void xe_info_probe_tile_count(struct xe_device *xe)
+static void xe_info_probe_tile_count(struct xe_device *xe,
+				     const struct xe_device_desc *desc)
 {
 	struct xe_mmio *mmio;
 	u8 tile_count;
 	u32 mtcfg;
 
-	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe);
+	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe, desc);
+
+	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
 	/*
 	 * Probe for tile count only for platforms that support multiple
@@ -1035,7 +1037,7 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.has_soc_remapper_telem = 0;
 	}
 
-	xe_info_probe_tile_count(xe);
+	xe_info_probe_tile_count(xe, desc);
 
 	for_each_remote_tile(tile, xe, id) {
 		int err;

-- 
2.53.0

