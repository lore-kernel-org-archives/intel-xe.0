Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97028C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 00:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501A710E7D0;
	Thu, 11 Jul 2024 00:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dO4Hmz4p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E0610E7D0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 00:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720657995; x=1752193995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y/8ZInvXqNRbFDK64S7caPCGK5aCAbjJagJ7hyTKggQ=;
 b=dO4Hmz4pH7o/c3yI2bt9qI0u1pMSqFz10FRnNauR073vJZBDomC1/uM3
 k0S84gtgGcvsy2q5T4Ne/SRWfLogq1YYwSv/OF/mUJAwMER0jl5TcG5jQ
 YuOugpOEK5nGQVvwl+hDlPNg+MxT4AuDzZVG9wHYz5H7PXyBmIZOq2/0E
 3cCbXrXoVG0YEOkd42j+Guz+hXOGl0bTcMZTzPpfuOCG5Sr9sGOGFj7jE
 ncN5bfBSG6RdyI2/XnyO2nbY+cwYIKLK51ykV4aDny4b5ewixPHtdzR8y
 Hck3c1T1xhWd/osBc5drHKnuHS3ULJsA7IT1c9/55qUacQIdDAGD/AU6T g==;
X-CSE-ConnectionGUID: tZUfk9RiQMafbT0/VISWSQ==
X-CSE-MsgGUID: WbGv+oesRpOBt5NgKAbDww==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17884753"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17884753"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 17:33:15 -0700
X-CSE-ConnectionGUID: CVXEJNE3TGC+QE5tnPQcoQ==
X-CSE-MsgGUID: KEG5JrL4S/i+QHSdFbUe4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="71603847"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.125.7])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 17:33:15 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Date: Thu, 11 Jul 2024 05:42:59 -0700
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
Message-ID: <20240711124259.qbP2xZLMy7EV_Oe9qiM2tWPVYpDhMvwv0pkflpRVurM@z>

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

