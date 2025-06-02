Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF2C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 10:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FFE10E22E;
	Mon,  2 Jun 2025 10:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RD6/E2p/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347FF10E22E
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748860420; x=1780396420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UtVnMtXZdMlKNn/21Wfsl9Px/B9pUkB/kA6Qbgd2tgI=;
 b=RD6/E2p/dshe+j7ypDa9brTuqMrGfAF4hXM+3xPrQRqLwa8DKZva0EUQ
 8r7onc+PKfU7vfdefyeaDLS2rkveyKl3ALK4LV+/4oMjYxGF1J6jPC1K4
 2HvuMvjAzUdBGu+vu62tPW53e3Jppk/3B/jp0tS94ZQ85ay7AWOWSxBjv
 UJ/xlQkLONmJ9Hbj+afHa3DehbX9MVWoBVeyBF+HLzqq48lY1lZBGHTIT
 TQ6kpU5y5m/RaMnhxrUqBPsjiGobhfHcZ8leFGIKeZDR+E1RLZd9dhHfQ
 pPzrWBOJtQeHNywytLg9Te0cStnKABsNojL5CvmYujm1aLcbKixf/nYCc w==;
X-CSE-ConnectionGUID: MdGPU+J0RpebfMT8o8QGwA==
X-CSE-MsgGUID: q9W8RNY2SFKmymwepsWQmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61123328"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="61123328"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 03:33:40 -0700
X-CSE-ConnectionGUID: qBj2QeKETianh8z4mJ2Qqw==
X-CSE-MsgGUID: U03EsXOhTlioOYnGYmg+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="149652018"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 03:33:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 3/3] drm/xe/vf: Add sanity check for GGTT configuration
Date: Mon,  2 Jun 2025 12:33:25 +0200
Message-Id: <20250602103325.549-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250602103325.549-1-michal.wajdeczko@intel.com>
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
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

The VF GGTT configuration was prepared by the PF, which should be
trusted, was obtained from the GuC, which likely already did some
sanity checks too, but since it's a received data, we should have
our own sanity checks to detect early any misconfiguration.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index 88e832894432..f221dbed16f0 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
@@ -11,6 +11,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_sriov.h"
+#include "xe_sriov_printk.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_wopcm.h"
 
@@ -44,6 +45,7 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
 	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
 	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
 	struct xe_device *xe = tile_to_xe(tile);
+	u64 wopcm = xe_wopcm_size(xe);
 	u64 start, end;
 	int err;
 
@@ -66,7 +68,14 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
 	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
 	 */
 
-	start = xe_wopcm_size(xe);
+	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
+	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
+		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
+			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
+		return -ERANGE;
+	}
+
+	start = wopcm;
 	end = ggtt_base;
 	if (end != start) {
 		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
-- 
2.47.1

