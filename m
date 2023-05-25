Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D0C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 11:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EEC10E6AE;
	Thu, 25 May 2023 11:46:20 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0755510E6AE
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685015175; x=1716551175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WyZGY3ueqhcqKTjYRxlOM+tZD4W7cTzNiCH09Gf9IZ0=;
 b=Jn1iXA5SSKV9oMVUJP+DBzhC36zM4/bSRJkGjdywDVTgbHhN534Tnukj
 n5DvYZ9br0A3eyTKNslsMCMD/9gDq3n3/UFERRbYZw5uHsTgCq2Bb/Pbc
 et93VYVxX0AYD3o+CjcuYkB2v0YMiOQsIOgihYs2d2vgyFZSCYj67laxo
 JGpno/t6KdvThVUm9K8pTYVxYlbDnZCa2G9c6t7h6/q10+H5IQZzKBQ53
 OepbHkQe63ESTL0c9gg/+OPsnTPLzE3A8aSvghPWo1TehWEkF+Npn8YHC
 CltGUWUrAhZ0qRifHWDHjGV0o2luSpilh2lQHBDTL3LUz0A9hBLI8K+6X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440219444"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="440219444"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="774649516"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="774649516"
Received: from jwosulli-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.81])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:46:13 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 12:45:43 +0100
Message-Id: <20230525114543.400106-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525114543.400106-1-matthew.auld@intel.com>
References: <20230525114543.400106-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/migrate: retain CCS aux state for
 vram -> vram
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There is no mention that migrate_copy() will skip copying the CCS aux
state for all types of vram -> vram transfers.  Currently we don't need
such a facility but might be surprising if we ever do.

v2: (Lucas):
  - s/lmem/vram/ in the commit message
  - Tidy up the code a bit; use one emit_copy_ccs()
v3:
  - Reword the commit message

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f40f47ccb76f..4b4339f1b2d2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -552,11 +552,19 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 
 	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
 		/*
-		 * If the bo doesn't have any CCS metadata attached, we still
-		 * need to clear it for security reasons.
+		 * If the src is already in vram, then it should already
+		 * have been cleared by us, or has been populated by the
+		 * user. Make sure we copy the CCS aux state as-is.
+		 *
+		 * Otherwise if the bo doesn't have any CCS metadata attached,
+		 * we still need to clear it for security reasons.
 		 */
-		emit_copy_ccs(gt, bb, dst_ofs, true, m->cleared_vram_ofs, false,
-			      dst_size);
+		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_vram_ofs;
+
+		emit_copy_ccs(gt, bb,
+			      dst_ofs, true,
+			      ccs_src_ofs, src_is_vram, dst_size);
+
 		flush_flags = MI_FLUSH_DW_CCS;
 	} else if (copy_ccs) {
 		if (!src_is_vram)
-- 
2.40.1

