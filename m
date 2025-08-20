Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F33CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 11:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DD910E6F6;
	Wed, 20 Aug 2025 11:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHIx75Td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E06110E6F6
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 11:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755689497; x=1787225497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=++Af6TCQa0r3LhfJE5xbp+rn7rogiVs0A7aF1YAIjuk=;
 b=RHIx75TdRt3u9TAoHky5C2xLrCyc2ClIjiB8k6S3fgaL+DHbsMyndUOi
 SefLbDj906TYWTCj5zV6cdGxtuS9/AKHjh+pMFJ1raX9RcgoxVW/a8Ujm
 JfTXWXXTEtF29yGE5Th3mNqdZ6n5D4zR2Z5xWGkkUimnto6N3qGGYQToU
 AUEBPgz9/MtISBPvlEP8bW6OqfWPFjsiMFyXGQw3ZaGUoM2cn+TzPz4ps
 +qp4FjX0LBE/2PrdFlx1ew2ZI07zZJZGSsrMJgOEBLIJdHsiAfsNTS2re
 zyP7aAnxJJlfq65WAnZ3hLBGCHprVRRA+kTNtruVD1bSdnF3OmDtTNCln w==;
X-CSE-ConnectionGUID: EKOHVR8sRCKqZVkgRWjLfw==
X-CSE-MsgGUID: /7CI/2WEToCONFFpoxtsPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61781163"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="61781163"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 04:31:37 -0700
X-CSE-ConnectionGUID: Q+NKxmT3SMSso7o+Y+8/5A==
X-CSE-MsgGUID: 0Qm7kkYtTBC/PhvJsHt6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168508488"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2025 04:31:35 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2] drm/xe/vf: Enable CCS save/restore only on supported GUC
 versions
Date: Wed, 20 Aug 2025 17:18:29 +0530
Message-ID: <20250820114829.7447-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

CCS save/restore is supported starting with GuC compatibility version
1.23.0. Gate the feature on the GuC firmware version and keep it disabled
on older or unsupported versions.

Fixes: f3009272ff2e ("drm/xe/vf: Create contexts for CCS read write")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

---
V1 -> V2:
- Fixed review comments (Michal)
---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 4872e43eb440..9ace6f83c0ec 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -10,6 +10,7 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
+#include "xe_guc.h"
 #include "xe_guc_submit.h"
 #include "xe_lrc.h"
 #include "xe_migrate.h"
@@ -258,6 +259,7 @@ static void xe_sriov_vf_ccs_fini(void *arg)
 int xe_sriov_vf_ccs_init(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_guc *guc = &tile->primary_gt->uc.guc;
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
 	struct xe_tile_vf_ccs *ctx;
 	struct xe_exec_queue *q;
@@ -268,6 +270,11 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	xe_assert(xe, !IS_DGFX(xe));
 	xe_assert(xe, xe_device_has_flat_ccs(xe));
 
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 23, 0)) {
+		xe_sriov_info(xe, "CCS s/r is not supported by this Guc version\n");
+		return 0;
+	}
+
 	for_each_ccs_rw_ctx(ctx_id) {
 		ctx = &tile->sriov.vf.ccs[ctx_id];
 		ctx->ctx_id = ctx_id;
-- 
2.43.0

