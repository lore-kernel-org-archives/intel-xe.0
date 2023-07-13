Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49460C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2739810E706;
	Thu, 13 Jul 2023 15:06:39 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C6810E6FC
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689260794; x=1720796794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9sq9rbZotBzfr93dmoeQ/Qs/L7TZkB8JjofuWS+qgYA=;
 b=Gv8KUd4Q97KNljOaTSdeS6JfJ/wzUpG9J7bxRKiBqUCPp3YGPzxEfPyr
 kY0p4dlNXrg3JdsmU5mdOyhC68T+iufm8u+xWAsVbJXWV4LzWw3Iouwwj
 EgsrcsfjBCmW2Y0grfbY5Addm5d3chnuYAhjBYrmr5k/9qQus2/kS6668
 QmN6PNvP+88Ql7ybKgToHkEtp4ISgqG6NpjtvrHH2N5zLCHAFHMDE0x3D
 8H0o8u9ALI01V5cesrZ1Ld1B8+Ga7TrE7ldZFX/R2OTBlSjxcunCcoTC4
 0PaBDDWS7T/EyqAGn+93gGpPmOXFL2Cmx5Eb/4ZiUeAPQd1ryXRWVBw+7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367856911"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367856911"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699285546"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699285546"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 8817c471bfcd.intel.com)
 ([10.251.221.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:33 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 15:06:08 +0000
Message-Id: <20230713150611.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
References: <20230713150611.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/xe: Cleanup CODE_INDENT style issues
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove all existing style issues of type CODE_INDENT reported
by checkpatch.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  4 ++--
 drivers/gpu/drm/xe/xe_engine.c         |  4 ++--
 drivers/gpu/drm/xe/xe_guc_fwif.h       | 12 ++++++------
 drivers/gpu/drm/xe/xe_guc_submit.c     | 14 +++++++-------
 drivers/gpu/drm/xe/xe_hw_engine.c      |  2 +-
 drivers/gpu/drm/xe/xe_uc.c             | 10 +++++-----
 6 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 83c9245dd362..2865e989c30c 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -275,13 +275,13 @@ void intel_unpin_fb_vma(struct i915_vma *vma, unsigned long flags)
 int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 {
 	struct drm_framebuffer *fb = plane_state->hw.fb;
-        struct xe_bo *bo = intel_fb_obj(fb);
+	struct xe_bo *bo = intel_fb_obj(fb);
 	struct i915_vma *vma;
 
 	/* We reject creating !SCANOUT fb's, so this is weird.. */
 	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_SCANOUT_BIT));
 
-        vma = __xe_pin_fb_vma(to_intel_framebuffer(fb), &plane_state->view.gtt);
+	vma = __xe_pin_fb_vma(to_intel_framebuffer(fb), &plane_state->view.gtt);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 3831c5f82773..957b084629d6 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -173,7 +173,7 @@ enum drm_sched_priority
 xe_engine_device_get_max_priority(struct xe_device *xe)
 {
 	return capable(CAP_SYS_NICE) ? DRM_SCHED_PRIORITY_HIGH :
-			               DRM_SCHED_PRIORITY_NORMAL;
+				       DRM_SCHED_PRIORITY_NORMAL;
 }
 
 static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
@@ -540,7 +540,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 		return -EFAULT;
 
 	if (XE_IOCTL_ERR(xe, eci[0].gt_id >= xe->info.tile_count))
-	       return -EINVAL;
+		return -EINVAL;
 
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 27d132ce2087..e215e8b2c17a 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -64,19 +64,19 @@ struct guc_ctxt_registration_info {
 
 /* 32-bit KLV structure as used by policy updates and others */
 struct guc_klv_generic_dw_t {
-        u32 kl;
-        u32 value;
+	u32 kl;
+	u32 value;
 } __packed;
 
 /* Format of the UPDATE_CONTEXT_POLICIES H2G data packet */
 struct guc_update_engine_policy_header {
-        u32 action;
-        u32 guc_id;
+	u32 action;
+	u32 guc_id;
 } __packed;
 
 struct guc_update_engine_policy {
-        struct guc_update_engine_policy_header header;
-        struct guc_klv_generic_dw_t klv[GUC_CONTEXT_POLICIES_KLV_NUM_IDS];
+	struct guc_update_engine_policy_header header;
+	struct guc_klv_generic_dw_t klv[GUC_CONTEXT_POLICIES_KLV_NUM_IDS];
 } __packed;
 
 /* GUC_CTL_* - Parameters for loading the GuC */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 86c445903560..efbc4b13e9e1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -352,17 +352,17 @@ static const int drm_sched_prio_to_guc[] = {
 
 static void init_policies(struct xe_guc *guc, struct xe_engine *e)
 {
-        struct engine_policy policy;
+	struct engine_policy policy;
 	enum drm_sched_priority prio = e->entity->priority;
 	u32 timeslice_us = e->sched_props.timeslice_us;
 	u32 preempt_timeout_us = e->sched_props.preempt_timeout_us;
 
 	XE_BUG_ON(!engine_registered(e));
 
-        __guc_engine_policy_start_klv(&policy, e->guc->id);
-        __guc_engine_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
-        __guc_engine_policy_add_execution_quantum(&policy, timeslice_us);
-        __guc_engine_policy_add_preemption_timeout(&policy, preempt_timeout_us);
+	__guc_engine_policy_start_klv(&policy, e->guc->id);
+	__guc_engine_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
+	__guc_engine_policy_add_execution_quantum(&policy, timeslice_us);
+	__guc_engine_policy_add_preemption_timeout(&policy, preempt_timeout_us);
 
 	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
 		       __guc_engine_policy_action_size(&policy), 0, 0);
@@ -372,8 +372,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_engine *e)
 {
 	struct engine_policy policy;
 
-        __guc_engine_policy_start_klv(&policy, e->guc->id);
-        __guc_engine_policy_add_preemption_timeout(&policy, 1);
+	__guc_engine_policy_start_klv(&policy, e->guc->id);
+	__guc_engine_policy_add_preemption_timeout(&policy, 1);
 
 	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
 		       __guc_engine_policy_action_size(&policy), 0, 0);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b7b02c96e998..1af5cccd1142 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -312,7 +312,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 	/* TODO: missing handling of HAS_L3_CCS_READ platforms */
 	const u8 mocs_read_idx = gt->mocs.uc_index;
 	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
-			        REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
+				REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 	const struct xe_rtp_entry_sr engine_entries[] = {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 70eabf567156..e244d27b55d5 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -201,14 +201,14 @@ int xe_uc_start(struct xe_uc *uc)
 
 static void uc_reset_wait(struct xe_uc *uc)
 {
-       int ret;
+	int ret;
 
 again:
-       xe_guc_reset_wait(&uc->guc);
+	xe_guc_reset_wait(&uc->guc);
 
-       ret = xe_uc_reset_prepare(uc);
-       if (ret)
-               goto again;
+	ret = xe_uc_reset_prepare(uc);
+	if (ret)
+		goto again;
 }
 
 int xe_uc_suspend(struct xe_uc *uc)
-- 
2.34.1

