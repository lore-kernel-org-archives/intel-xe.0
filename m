Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A777606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nqVzM+mC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B46710FAE7;
	Fri, 20 Nov 2026 05:47:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E39112082
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153658; x=1826689658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rRdCGByoyAHx+TiKeuxDdGnh9many7wfH7XH0dChtPQ=;
 b=nqVzM+mCjXUc30bEV8cfQXpT73h/obOQclLU3ggUIxugLzMcPKGG+ENy
 RLsshLJ9GEg1tO1L9KLP2AoC/YmSH4ID6kRec6ZvuM/x3Idef8TbDAWI8
 6U4RJGXQz6qnFsW1Z+qqqNNTXsAydIDS5sqAea2L5j74vN7zDoU/6+gb5
 tHEHvkbBUfdxpHF10xwf7fOlgqJRScYx2ZVSmao3Pha6fPRqPsl0vsRTM
 lSSK2YyO9IA1mQTGhP3qYeVxVuXjwyyB6Mjioc6XhOYuu9e8uJa91E0BX
 rKZdT5sXiF7ofdHniEFqaRCV6aWLfytPuAhSrJ5SpmeLKDg33Almg/jwU A==;
X-CSE-ConnectionGUID: 5b3syWWeRXWyCXyJv7BscQ==
X-CSE-MsgGUID: WDYN/GTlShSakCk5UaGGgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4018535"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4018535"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:17 -0800
X-CSE-ConnectionGUID: GMkVwWB/Sy6/PNGwsdEM7A==
X-CSE-MsgGUID: tbW+DTo0QjeiwC23DEyOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10617165"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:17 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 14/16] drm/xe: Require a fully visible VRAM BAR without a
 primary GT
Date: Fri, 20 Nov 2026 05:47:25 +0000
Message-ID: <20261120054712.377573-32-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120054712.377573-18-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CPU copies can only reach VRAM that the BAR maps: xe_ttm_io_mem_reserve()
rejects any resource that is not entirely CPU visible.  With no primary
GT there is no copy engine to fall back on, so a small BAR would leave
most of VRAM unreachable.

Refuse to probe such a device rather than fail later on the first move.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 1c02889ba29b..4d399a83479e 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -23,6 +23,7 @@
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
+#include "xe_tile_printk.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
@@ -346,6 +347,20 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
+		/*
+		 * Without a primary GT there is no copy engine, so VRAM is
+		 * moved with the CPU through the BAR.  That only works if the
+		 * BAR covers all of it.
+		 */
+		if (!tile->primary_gt &&
+		    tile->mem.vram->io_size < tile->mem.vram->usable_size) {
+			xe_tile_err(tile,
+				    "VRAM is not fully CPU visible (%pa of %pa); a resizable BAR is required without a primary GT\n",
+				    &tile->mem.vram->io_size,
+				    &tile->mem.vram->usable_size);
+			return -ENODEV;
+		}
+
 		if (total_size > lmem_bar.io_size) {
 			xe_log_info(xe, VRAM,
 				    "Total size %#llx is larger than resource %#llx\n",
-- 
2.43.0

