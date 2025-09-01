Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61F6CA0FFD
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 07:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C5210E392;
	Mon,  1 Sep 2025 07:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DClYwqqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9449E10E392
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 07:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756710519; x=1788246519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ncNDHcvr2tQaDivlgG0IPcutPtME3kSIOi5w2tk8JsE=;
 b=DClYwqqXBzZ5ZMHWlAVnPZ8KmVKXJf/xAMwi1puZ/4d7I8XcXHuO4YNF
 IMSNM9ZqBKYZeFdi+0jPNW/Tr4raH0jb1na0cPir3LOipoEl4mKe/H1xj
 1Y0R0Jlne6DHsy2LohirWT5cfZjrhJfGY4Zc4E4efifZHcX1ObZyXgKvk
 rNbI3cm4Cn9uNpPX6MVHDyThbgC7HOjK+z5itV+51aiSgDR8ysCQbzvse
 OLsWFJKIcY2fLTj/JT5lIqf/n8i6QuJ6SUsekwTEyJREfG4xC460wI0kX
 FBcFxtRbT+45n0kz3V9LWOLPC25Igi9LgiQzdO1ijRGjXYZLkaUF3nzkq w==;
X-CSE-ConnectionGUID: Z0lgD6gzQvyR+TvHGM1yQQ==
X-CSE-MsgGUID: oHuCWqBfRci/B8Xbon0xqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="70270009"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="70270009"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 00:08:38 -0700
X-CSE-ConnectionGUID: K/kMm/EYS+2c0TNGOegU9A==
X-CSE-MsgGUID: O9QvpP2FSte6FcLnwTEo/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171284720"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2025 00:08:36 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: [PATCH v4] drm/xe/guc: Add devm release action to safely tear down CT
Date: Mon,  1 Sep 2025 12:55:41 +0530
Message-ID: <20250901072541.31461-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
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

Introduce a devm-managed release action during xe_guc_ct_init() and
xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
resource deallocation, preventing the use-after-free scenario.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Summers Stuart <stuart.summers@intel.com>

---
V3 -> V4:
- Fixed review comments (Michal).

V2 -> V3:
- Fixed review comments (Michal).

V1 -> V2:
- Fixed review comments (Michal & Matt B).
---
 drivers/gpu/drm/xe/xe_guc.c    |  8 +++----
 drivers/gpu/drm/xe/xe_guc_ct.c | 41 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
 3 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 37d06c51180c..b3a6408a5760 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -709,10 +709,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -847,6 +843,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	ret = xe_guc_ct_init_post_hwconfig(&guc->ct);
+	if (ret)
+		return ret;
+
 	guc_init_params_post_hwconfig(guc);
 
 	ret = xe_guc_submit_init(guc, ~0);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 848065a25c44..e431ff73227c 100644
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
@@ -252,6 +254,13 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
 
+static void guc_action_disable_ct(void *arg)
+{
+	struct xe_guc_ct *ct = arg;
+
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
+}
+
 int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -268,10 +277,40 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 		return PTR_ERR(bo);
 
 	ct->bo = bo;
-	return 0;
+
+	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
 }
 ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
 
+/**
+ * xe_guc_ct_init_post_hwconfig - Reinitialize the GuC CTB in VRAM
+ * @ct: the &xe_guc_ct
+ *
+ * Allocate a new BO in VRAM and free the previous BO that was allocated
+ * in system memory (SMEM). Applicable only for DGFX products.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
+	struct xe_tile *tile = gt_to_tile(gt);
+	int ret;
+
+	xe_assert(xe, !xe_guc_ct_enabled(ct));
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
+	if (ret)
+		return ret;
+
+	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
+	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
+}
+
 #define desc_read(xe_, guc_ctb__, field_)			\
 	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
 			struct guc_ct_buffer_desc, field_)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 18d4225e6502..cf41210ab30a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -13,6 +13,7 @@ struct xe_device;
 
 int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
+int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
-- 
2.51.0

