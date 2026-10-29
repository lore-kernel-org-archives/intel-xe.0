Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A6606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DowETyrq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA6810E11B;
	Thu, 29 Oct 2026 12:21:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCBB10E11B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793276501; x=1824812501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NoH3LVL+d7ENMVgmkzet25d0RwKqwc/7l5xTZzcjmr0=;
 b=DowETyrq9Hg0JdCDzf8GwhW84+TNnRYQ3ZvkqxwG3ZV5UBZG/nKlNXrS
 mGn1B2laqUknyOZeYsfGyJo+FJ2yZLyUHxjq/EEm5xcDdaSFkJUwnaOMT
 U404CZrrKgPCAiGbTlQxv49BSbeBR5oKdF4DENVAlvj3g5MtUN3Bccaib
 CGzkSVt/lrWgPLzuPXuKTkHs31H2+1HP1r968GfwJoBx08unZZQFxhlYE
 jMu6m3fGXPPUPHDJmGxNvig79eCHsQV2qODyaI2XAliVivGwyAqcO6j9G
 hm+ZQ5yK+3GwkHgHZ540g4YcZgi2yMwtHQeYC+tk+Y5knYznDIn0bF7xP w==;
X-CSE-ConnectionGUID: RnbBmwWzQ0OmoQ/eCLJzdA==
X-CSE-MsgGUID: BF/Bb/azQmizptZU+BocOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1894847"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1894847"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:21:41 -0700
X-CSE-ConnectionGUID: 4nvpFezVSI2Qa8nYPRIo5Q==
X-CSE-MsgGUID: RAmGihILRMiUH3NCbJGiKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5471478"
Received: from szadworn-mobl.ger.corp.intel.com (HELO mkuoppal-desk.home.arpa)
 ([10.245.246.253])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:21:39 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/3] drm/xe/migrate: Keep access_memory chunks within the
 transfer limit
Date: Thu, 29 Oct 2026 14:21:28 +0200
Message-ID: <20261029122130.2795549-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_migrate_access_memory() caps each chunk at MAX_PREEMPTDISABLE_TRANSFER,
but xe_migrate_vram() maps the system memory side from the start of the
page the chunk begins in, DIV_ROUND_UP(len + sram_offset, PAGE_SIZE)
pages.

So when buf is mid page, the 'wasted' space at the start of the first
page needs to be taken into account when considering the amount that
can be copied. Otherwise a full chunk needs one page more than the limit
allows, which trips the warning in pte_update_cmd_size() and, on debug
builds, the assert in xe_migrate_vram().

window:  |slot 0|slot 1| ...  |slot 2047|
         0                              8M
data:      [=================================]   starts at sram_offset
           ^ sram_offset                ^ must end here or earlier

This happens for example when the access starts at an unaligned vram
offset.

Fix this by capping the chunk at the limit minus sram_offset.

Seen on BMG with igt@xe_eudebug@vm-access-alignment, which rewrites 24M
and 48M objects from offset 4 through eudebug vm access:

  xe 0000:03:00.0: [drm] Assertion `npages * ((1UL) << 12) <= 0x00800000` failed!
  WARNING: drivers/gpu/drm/xe/xe_migrate.c:2255 at xe_migrate_vram+0xf40/0x15e0 [xe]
  Call Trace:
  xe_migrate_access_memory
  xe_ttm_access_memory
  ttm_bo_access

  WARNING: drivers/gpu/drm/xe/xe_migrate.c:2118 at xe_migrate_vram+0xbb7/0x15e0 [xe]
  Call Trace:
  xe_migrate_access_memory
  xe_ttm_access_memory
  ttm_bo_access

Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Jan Maslak <jan.maslak@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 70408fa0a606..19c37eb31589 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2611,6 +2611,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		struct dma_fence *__fence;
 		u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
 			cursor.start;
+		unsigned long sram_offset = (unsigned long)buf & ~PAGE_MASK;
 		int current_bytes;
 
 		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
@@ -2619,6 +2620,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 		else
 			current_bytes = min_t(int, bytes_left, cursor.size);
 
+		current_bytes = min_t(int, current_bytes,
+				      MAX_PREEMPTDISABLE_TRANSFER - sram_offset);
+
 		{
 			/*
 			 * Optimized copy strategy to minimize number of jobs:
@@ -2676,8 +2680,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			}
 		}
 
-		__fence = xe_migrate_vram(m, current_bytes,
-					  (unsigned long)buf & ~PAGE_MASK,
+		__fence = xe_migrate_vram(m, current_bytes, sram_offset,
 					  &pagemap_addr[current_page],
 					  vram_addr, NULL, write ?
 					  XE_MIGRATE_COPY_TO_VRAM :
-- 
2.53.0

