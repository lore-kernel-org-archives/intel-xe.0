Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B71CCA0EF5
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 08:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF02610E011;
	Tue, 19 Aug 2025 08:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCb2DUR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5D010E011
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755590743; x=1787126743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tpWjb4dLKRpY/dAZ+PbXjVUJ1pnYW4N0SMTjV8W4ajo=;
 b=WCb2DUR+/9XmcNIUi34gawXKgpLGxOxCEwhiu9h54OEWaeNk0CXMSt72
 StTP14FggsmPbuSHDVH/4nfOKSiTRRHrS2mbvtoBciH1VKa7FVFnCS8Rv
 9+OWL+YEub8KRxGKHgMdTtLeS04HkcC14vXO+YCtr14L/DOYFk42f8CMn
 SV96+LIzIRZURiqQ+jk9++QyMjeK5dMa30B/+Tw+ROwCfbilwg8zVhS4x
 z9CfNdLEeO2UglGHVCi1qUulABAO/q52A5QVPyCpGjhL6tPld6bTQq0k1
 /+8TU7Sei6WnyxK6WBIF2qtsie84yaDaC+TI9YQab87sApdZRFezrmIoM g==;
X-CSE-ConnectionGUID: ZdwLIm5KTgasubWIAkwBgQ==
X-CSE-MsgGUID: 4jdw5repRuaMmGgf/jgG/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57973966"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57973966"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 01:05:43 -0700
X-CSE-ConnectionGUID: cshqtmzkQGChVT8a2A6nmA==
X-CSE-MsgGUID: ZSLaiB8fQuab5btTk0I82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="198807167"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2025 01:05:41 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: [PATCH v2] drm/xe/guc: Add devm release action to safely tear down CT
Date: Tue, 19 Aug 2025 13:52:34 +0530
Message-ID: <20250819082234.21138-1-satyanarayana.k.v.p@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

---
V1 -> V2:
- Fixed review comments (Michal & Matt B).
---
 drivers/gpu/drm/xe/xe_guc.c    | 21 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_ct.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 433abc787f7b..5a6840d890f1 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -680,6 +680,21 @@ void xe_guc_comm_init_early(struct xe_guc *guc)
 		guc->notify_reg = GUC_HOST_INTERRUPT;
 }
 
+static int guc_realloc_ctb_vram(struct xe_guc *guc)
+{
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_action_disable_ct(&guc->ct);
+
+	return ret;
+}
+
 static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 {
 	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
@@ -701,11 +716,7 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
-	if (ret)
-		return ret;
-
-	return 0;
+	return guc_realloc_ctb_vram(guc);
 }
 
 static int vf_guc_init_noalloc(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3f4e6a46ff16..fe844cfedd24 100644
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
@@ -252,6 +254,23 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
 
+static void guc_action_disable_ct(void *arg)
+{
+	struct xe_guc_ct *ct = arg;
+
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
+}
+
+int xe_guc_action_disable_ct(struct xe_guc_ct *ct)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+
+	if (devm_is_action_added(xe->drm.dev, guc_action_disable_ct, ct))
+		devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
+
+	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
+}
+
 int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -268,7 +287,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 		return PTR_ERR(bo);
 
 	ct->bo = bo;
-	return 0;
+
+	return xe_guc_action_disable_ct(ct);
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 18d4225e6502..6be5c3bc5562 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 
 long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
 
+int xe_guc_action_disable_ct(struct xe_guc_ct *ct);
+
 #endif
-- 
2.43.0

