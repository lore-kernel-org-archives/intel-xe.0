Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97CBC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D6A10E9D1;
	Thu, 11 Jul 2024 09:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6jTLZWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36410E9D1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689536; x=1752225536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y/8ZInvXqNRbFDK64S7caPCGK5aCAbjJagJ7hyTKggQ=;
 b=f6jTLZWyp4svbXczT4Vfhjy2I68fxcR/H66CU8bX57KLMIm6RDYR9njd
 pPeDEo1kMKBU9/zM2q/u6S8he/nColYsNBEBOmHrNY74vw6B0TsuTO6Uq
 LFPDwyGslW1j+5PUh9vR7hpyj6IrVExv+2izOytY4XQ+atvcSk207AbXy
 VERSICysNXatH5kwuJ8mWe6zmK2JVYvH18LYFqrVOYH4XrFim2y+jw6y/
 PF5bfF2C9JT68MXfWv78L2GyB46SiiITaOmq9Rvhay6A2+deJ+JHzuJC8
 lC+M3M+O2UzoaZFdAquOCye3fJWl04pXGPfRxx003crAg6q5HLZsPqeQz w==;
X-CSE-ConnectionGUID: y5aHUSavTmyTA3q7DQ+VeA==
X-CSE-MsgGUID: KQhg30H1QkyboMfmiR9y8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17671896"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17671896"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:28 -0700
X-CSE-ConnectionGUID: oH+98HVVRM+bf4M/OJJwXQ==
X-CSE-MsgGUID: Mmnoe2CaQw+SVZqjEVtGFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="79210091"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:26 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.auld@intel.com,
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Date: Thu, 11 Jul 2024 09:18:14 +0000
Message-Id: <2b3532ca86b91da122154e56bd4ae95c2dafc04a.1720689220.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720689220.git.akshata.jahagirdar@intel.com>
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
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

