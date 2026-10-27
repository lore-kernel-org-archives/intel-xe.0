Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C74606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OrDSK472
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D610F608;
	Tue, 27 Oct 2026 14:52:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B394410F60D
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793112770; x=1824648770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BfrLDbbx8pxP2R21BzPR6xAP+j9U/aQ3ofTfjG2+OwM=;
 b=OrDSK47274ekrHKlzzbC8yUXjAnJqIwHLgyD9U1thxfzksneiEAHFE58
 nrYLlTa3Fc3vYokNuDy+KdRwjPl40eiO8oeVOfgUGbCkhvp05EAqpVoav
 HEd7VcOKY9ghwuEMMGE+PfMCfXn9qehNqExt3YrMVSU719xX/gGTrNuIU
 xo+M+SP9XoV7SGRBXsis519HB6jSBdrSqt5EOMhHpVppGSgBAu1qXGbH4
 YUQS0E+jRz5skn7GIsDTgjlp8axU8xVUh7TmGwdPogas8sd+YEM5DGW2J
 3bAy5IrnKRMR21z+OONWyNTA5xRAAnqug9caswk1TKTGTK6q11y9ulig9 g==;
X-CSE-ConnectionGUID: umZObZwNSQG+zhWChCBp8Q==
X-CSE-MsgGUID: S/daQrbBTlWEG7Ho9SYMdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1692097"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1692097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:52:49 -0700
X-CSE-ConnectionGUID: Ix0TWbPeTT6JqQMwE9PlyQ==
X-CSE-MsgGUID: EbQlgx6nSyat/3MA44Q8UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4904124"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:52:48 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/2] drm/xe/migrate: Keep access_memory chunks within the
 transfer limit
Date: Tue, 27 Oct 2026 16:52:36 +0200
Message-ID: <20261027145237.1862132-1-mika.kuoppala@linux.intel.com>
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>
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

