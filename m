Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F6606A32A
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aDbzRqjy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BFB10E9DE;
	Sat, 21 Nov 2026 18:24:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAEC10EA30
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285427; x=1826821427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rRdCGByoyAHx+TiKeuxDdGnh9many7wfH7XH0dChtPQ=;
 b=aDbzRqjyHtLB9NbTqa46ROVQkCrT/bvIPpieBfZPPwC8u4WKwPTN+rjn
 BcmA0bs1mWIPvT6suLL9qvmDwE+ga5MKB6eHc4UyLmsO/Q/WFgp+IcWNX
 n5mrHsQUqUA1SOVJmYsOege8hdNDruspR2/8BTYCa+19pLbcKksRt+Ahl
 LAOzWUvABfNyn6Qnrm9q//XIZU2czXnoQ/BdMUHyHmyVE4CMeVkvcxNZQ
 MV09BGItfgxWNck1t59ozXrEvGRQwdnXc5hly0YTRAJxEb+LSe/LZBGqQ
 c3VbZfCr2sAVh5T0fP0pAE2FPYFF+yw8kKyV0WquFynHvenYirZ6KdbnI Q==;
X-CSE-ConnectionGUID: m2uQZaFeTC2MI+ZwnNioTw==
X-CSE-MsgGUID: 5qSM2oyGTQSFmSuCqc1BCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034070"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:21 -0800
X-CSE-ConnectionGUID: DuZUksyAS6q5MHImVf5IxA==
X-CSE-MsgGUID: p5Yii+6oRbW+MevblxpdcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934443"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 14/17] drm/xe: Require a fully visible VRAM BAR without a
 primary GT
Date: Sat, 21 Nov 2026 18:23:30 +0000
Message-ID: <20261121182317.48981-33-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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

