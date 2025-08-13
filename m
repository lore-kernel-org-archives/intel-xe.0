Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A2ECA0EE0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 09:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8EE10E6CF;
	Wed, 13 Aug 2025 09:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZui/QMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64DB10E6CF
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755078936; x=1786614936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xmvXyg6wRgWjiKwEmlrtMcGI69lX77h8MV1A1DpwgHo=;
 b=eZui/QMXz87waQuqAlDpB8Z3/UUSy8G3FxTm8xKmUPQoM3Oa6k8C+j6q
 UtjB9JAC6vYON1I8hyCUjryyIOAD0aOFMkCTddFjCLdXodpPKXkqmwQsM
 2fsivNffu545tCF6+Pu5m+0DB+OOCigYqKZdm2dHRh6HwUh16fZRCJaB6
 FnKu7UedlgMG9hf0Q71Ac2Envhv70+9Bcb6+n5b+lR87dKGlpypZIcOai
 YP8K8MB+82SOCA2mwZdJe0nBzVsa5MRT/8C4hBc0HFwAZlc53yXAUEAeg
 /hoDITsvbHJ+vOQkMYCHQLsTlLaThqFH5re2qFU2TUDpTHbZ7/2GeZ1hD A==;
X-CSE-ConnectionGUID: 5AUdQmaRSX+ZRK6V//QtOg==
X-CSE-MsgGUID: WzLSrxPPTdOBEf+Y1LDl0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57234081"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57234081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 02:55:36 -0700
X-CSE-ConnectionGUID: siiFA8siSNKF1Equi0R9LA==
X-CSE-MsgGUID: 9W0Vtiw1RheNkeJOcIJu2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="167219346"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2025 02:55:34 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: [PATCH v5] drm/xe/guc: Add devm release action to safely tear down CT
Date: Wed, 13 Aug 2025 15:42:25 +0530
Message-ID: <20250813101225.16638-1-satyanarayana.k.v.p@intel.com>
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

When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
flag, the driver initiates TLB invalidation requests via the CTB mechanism
while releasing the BO. However a premature release of the CTB BO can lead
to system crashes, as observed in:

Oops: Oops: 0000 [#1] SMP NOPTI
RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
Call Trace:
 guc_ct_send_locked+0x8b/0x670 [xe]
 xe_guc_ct_send_locked+0x19/0x60 [xe]
 send_tlb_invalidation+0xb4/0x460 [xe]
 xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
 ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
 ggtt_node_remove+0x110/0x140 [xe]
 xe_ggtt_node_remove+0x40/0xa0 [xe]
 xe_ggtt_remove_bo+0x87/0x250 [xe]

Introduce a devm-managed release action during xe_guc_ct_init() to ensure
proper CTB disablement before resource deallocation, preventing the
use-after-free scenario.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Summers Stuart <stuart.summers@intel.com>

---
V4 -> V5:
- Updated commit message.
- Fixed similar crash while releasing resources on DGPU after reallocating
CTB to VRAM from SMEM.

V3 -> V4:
- Added new devm release function action_disable_ct()

V2 -> V3:
- Moved GGTT validity check to xe_ggtt_invalidate(). (Michal Wajdeczko)

V1 -> V2:
- An additional check for validity of GGTT is added in
xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
(Summers Stuart)
---
 drivers/gpu/drm/xe/xe_guc.c    |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 433abc787f7b..a6e46272c0ef 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -705,7 +705,10 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	return 0;
+	ret = devm_add_action_or_reset(xe->drm.dev, xe_guc_action_disable_ct,
+				       &guc->ct);
+
+	return ret;
 }
 
 static int vf_guc_init_noalloc(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3f4e6a46ff16..fe2410091bfc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
 static void g2h_worker_func(struct work_struct *w);
 static void safe_mode_worker_func(struct work_struct *w);
 static void ct_exit_safe_mode(struct xe_guc_ct *ct);
+static void guc_ct_change_state(struct xe_guc_ct *ct,
+				enum xe_guc_ct_state state);
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 enum {
@@ -252,12 +254,20 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
 
+void xe_guc_action_disable_ct(void *arg)
+{
+	struct xe_guc_ct *ct = arg;
+
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
+}
+
 int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
+	int err = 0;
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
 					  XE_BO_FLAG_SYSTEM |
@@ -268,7 +278,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 		return PTR_ERR(bo);
 
 	ct->bo = bo;
-	return 0;
+
+	err = devm_add_action_or_reset(xe->drm.dev, xe_guc_action_disable_ct, ct);
+	return err;
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 18d4225e6502..b9f06ec0db52 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 
 long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
 
+void xe_guc_action_disable_ct(void *arg);
+
 #endif
-- 
2.43.0

