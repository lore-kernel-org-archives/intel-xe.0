Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A13C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 23:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B2110EB9C;
	Thu, 11 Jul 2024 23:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHurYtGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3448010EB9C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 23:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720741358; x=1752277358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y/8ZInvXqNRbFDK64S7caPCGK5aCAbjJagJ7hyTKggQ=;
 b=hHurYtGUhO+h+xw77niUpEcPa6iTmssgt0n8ir6QNl1X64ejXmC5tFqa
 jIrO4wUBdcmPamXHgIBmsFL8gvjmeQYoFwzp0JkEAETYEoKiilUB58gcO
 1/TtBzB1XKh/YYyuEy5tAi029UCfwg/pYO7ZObWYQKtl5abQ5zkXR0GR5
 AbCDXQmKwUj3nf8IgcJM1UuMt2y7fOVHozbEbAYPIdzg1gSrAUXoZyc5B
 uI2eIXq+u6omEVvmtakzNznNNthuURy168+ROZ1EDQfU3ACHVzZ9b8fU3
 hGvx6LgYILReLdgkromff3PjNi4SGO90wCs/k+vv/ZqlIS3wgyWs32ddz A==;
X-CSE-ConnectionGUID: mwBKBk+NTOGHSfrpivrk5Q==
X-CSE-MsgGUID: zYkm+iIoTjKjBEdlLYhH9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18301901"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18301901"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 16:42:38 -0700
X-CSE-ConnectionGUID: 2gKyeX2CT1eBBILUp+jBXw==
X-CSE-MsgGUID: VJu/VERzRi2tSw0r39GBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="71937034"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.155])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 16:42:38 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 1/6] drm/xe/migrate: Sample patch for testing
Date: Fri, 12 Jul 2024 04:53:56 -0700
Message-ID: <e597e39b0c22d3b58cda09e0e4b33f883b9140db.1720515376.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720515376.git.akshata.jahagirdar@intel.com>
References: <cover.1720515376.git.akshata.jahagirdar@intel.com>
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
Message-ID: <20240712115356.T9prkTSJ7RwKdW3GQnx5gJxAvLYKcoL8d9b8j4ttm0I@z>

For Xe2 dGPU, we clear the bo by modifying the VRAM using an
uncompressed pat index which then indirectly updates the
compression status as uncompressed i.e zeroed CCS.
So xe_migrate_clear() should be updated for BMG to not
emit CCS surf copy commands.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h  | 5 +++++
 drivers/gpu/drm/xe/xe_migrate.c | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0a2a3e7fd402..c3093506c28c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -144,6 +144,11 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
 	return xe->info.has_flat_ccs;
 }
 
+static inline bool xe_device_needs_ccs_emit(struct xe_device *xe)
+{
+	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
+}
+
 static inline bool xe_device_has_sriov(struct xe_device *xe)
 {
 	return xe->info.has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index fa23a7e7ec43..2fc2cf375b1e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -420,7 +420,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_PTR(err);
 
 	if (IS_DGFX(xe)) {
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_device_needs_ccs_emit(xe))
 			/* min chunk size corresponds to 4K of CCS Metadata */
 			m->min_chunk_size = SZ_4K * SZ_64K /
 				xe_device_ccs_bytes(xe, SZ_64K);
@@ -1034,7 +1034,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
 
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_device_needs_ccs_emit(xe))
 			batch_size += EMIT_COPY_CCS_DW;
 
 		/* Clear commands */
@@ -1062,7 +1062,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (!clear_system_ccs)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
-		if (xe_device_has_flat_ccs(xe)) {
+		if (xe_device_needs_ccs_emit(xe)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags = MI_FLUSH_DW_CCS;
-- 
2.34.1

