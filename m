Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED12C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 11:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDCF10F38C;
	Fri, 24 Jul 2026 11:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRwIpquz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7EF10F388
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 11:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784893790; x=1816429790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9UdGz+HdSfcO1W0w7JSuDftzwLvT6n3BuF3476cJKg0=;
 b=iRwIpquzBsyYCnXjCnnCjmPYTamKk4JR+vhDNuzDkHzwB2J8rQKSdrGv
 9tptp1HL10aS6CtNBOi08VfsTdRiKvGy+52CXvriNTL7eyok2VLWSAnDx
 CtOCJCvAk1PiLNfGExi416VqqgNVXYfnAtLVzZ2IwNJ/ow9KMDApFpPTv
 3L2JO5xn8rFSW2pJ5Ukeh9WT7U1Tz6ey2xb7ei/swqakY/mE+zw31XTzs
 XcDJAMjqgPe2XMSkcc3sRq0ZaBiwl33zrurQW/U/5Lt/gXkB1t8TjG7Lw
 4RXCN0y0FSzLksSpA8J7hvEEW/rL2+EYtleyuRqKRtfvJK52EC55EJkfH g==;
X-CSE-ConnectionGUID: VslStXmySbu1xtZDrV4qbw==
X-CSE-MsgGUID: FfSltwsoSu2RuHfF3+XUTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89385153"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="89385153"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:49:48 -0700
X-CSE-ConnectionGUID: PBGlhnUjQi2OJGAV2Wc1CA==
X-CSE-MsgGUID: tgSXOsGsTQWeBM3yKKK3AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="296909339"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa001.jf.intel.com with ESMTP; 24 Jul 2026 04:49:46 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 1/4] drm/xe/vf: Add KUNIT stub for
 guc_action_query_single_klv()
Date: Fri, 24 Jul 2026 11:49:36 +0000
Message-ID: <20260724114939.1560743-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
References: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
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

Add a KUNIT_STATIC_STUB_REDIRECT() to guc_action_query_single_klv32()
and guc_action_query_single_klv64() so that KUnit tests can mock the
GuC MMIO query response and exercise VF KLV query error paths without
talking to real hardware.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V2 -> V3:
- Added stub to guc_action_query_single_klv32() and
  guc_action_query_single_klv64().
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 37899fcf5b22..2ef260575c7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -10,6 +10,8 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include <kunit/static_stub.h>
+
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_communication_mmio_abi.h"
 #include "abi/guc_klvs_abi.h"
@@ -434,11 +436,13 @@ static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
 
 static int guc_action_query_single_klv32(struct xe_guc *guc, u32 key, u32 *value32)
 {
+	KUNIT_STATIC_STUB_REDIRECT(guc_action_query_single_klv32, guc, key, value32);
 	return guc_action_query_single_klv(guc, key, value32, hxg_sizeof(u32));
 }
 
 static int guc_action_query_single_klv64(struct xe_guc *guc, u32 key, u64 *value64)
 {
+	KUNIT_STATIC_STUB_REDIRECT(guc_action_query_single_klv64, guc, key, value64);
 	u32 value[2];
 	int err;
 
-- 
2.43.0

