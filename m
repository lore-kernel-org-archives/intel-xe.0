Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B621C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 08:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1745D10F941;
	Fri, 25 Sep 2026 08:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eLuVCKW3";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049710F952
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=Zf90N5cS77GL3K1Judq7EqgExWK/Jcyjm7+qFFXAVig=; b=
 eLuVCKW38hbQI+gH9A/zxhWmI61TczNRU3Qx55qog6pp5PD977k9vL3b0E9/86cAENDL1ubFhDVr/
 WTr+Ip9ZOrB9Lkydr6OR5EZQkCIMNVS/5KUAfQwvcBT0wJBCDiYbuNgLwWtQvOlyPEdrSFzwpdiup
 5AvT+fF6RNJN6IEetCWC9BLixNoZohn6PuWs2iDK0sMFlvyMhcIe/nvKXL6VqfnygcmC4n9mFHaJW
 br+TEwAZ5N49XdD6bOLOOL/2TGbaa8WDN2HHo/is4yBZKi/oACRJ6kIbBIQm3IE2w4CBN6cyan+kr
 KCMmpxBwF23csn/r3Wlb1ibdM1XMML+fng==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xA0qx-0072tw-9d; Fri, 25 Sep 2026 10:00:19 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe: Do not emit Wa_16010904313 twice
Date: Fri, 25 Sep 2026 09:00:16 +0100
Message-ID: <20260925080016.64802-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.55.0
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

During development of
e8372edec948 ("drm/xe/xelp: Implement Wa_16010904313")
one of the interim patch versions contained an incorrect rebase on top of
some upstream changes, which caused Wa_16010904313 to be emitted both from
the indirect context and from the workaround batch buffer.

As this workaround needs to be emitted from the indirect context for rcs
and ccs, but from the workaround batch buffer for bcs, vcs and vecs, we
need to pass the location as an input parameter to setup_timestamp_wa() so
it can decide whether to emit itself or not.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: e8372edec948 ("drm/xe/xelp: Implement Wa_16010904313")
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
v2:
 * Improved commit message. (Matt)
---
 drivers/gpu/drm/xe/xe_lrc.c | 38 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f1cf1463f1b2..3ff4398cb9fe 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1099,8 +1099,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define CONTEXT_ACTIVE XE_LRC_CTX_TIMESTAMP_ACTIVE
 static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
 				    struct xe_hw_engine *hwe,
-				    u32 *batch,
-				    size_t max_len)
+				    u32 *batch, size_t max_len, bool indirect)
 {
 	u32 *cmd = batch;
 
@@ -1131,19 +1130,25 @@ static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
 }
 
 static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-				  u32 *batch, size_t max_len)
+				  u32 *batch, size_t max_len, bool indirect)
 {
 	const u32 ts_addr = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
 	u32 *cmd = batch;
 
-	if (!XE_GT_WA(lrc->gt, 16010904313) ||
-	    !(hwe->class == XE_ENGINE_CLASS_RENDER ||
-	      hwe->class == XE_ENGINE_CLASS_COMPUTE ||
-	      hwe->class == XE_ENGINE_CLASS_COPY ||
+	if (!XE_GT_WA(lrc->gt, 16010904313))
+		return 0;
+
+	if (!indirect &&
+	    !(hwe->class == XE_ENGINE_CLASS_COPY ||
 	      hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE ||
 	      hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE))
 		return 0;
 
+	if (indirect &&
+	    !(hwe->class == XE_ENGINE_CLASS_RENDER ||
+	      hwe->class == XE_ENGINE_CLASS_COMPUTE))
+		return 0;
+
 	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
 		return -ENOSPC;
 
@@ -1169,7 +1174,8 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
 						  struct xe_hw_engine *hwe,
-						  u32 *batch, size_t max_len)
+						  u32 *batch, size_t max_len,
+						  bool indirect)
 {
 	struct xe_device *xe = gt_to_xe(lrc->gt);
 	const u32 *user_batch;
@@ -1198,7 +1204,8 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
 
 static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
 						 struct xe_hw_engine *hwe,
-						 u32 *batch, size_t max_len)
+						 u32 *batch, size_t max_len,
+						 bool indirect)
 {
 	struct xe_device *xe = gt_to_xe(lrc->gt);
 	const u32 *user_batch;
@@ -1227,7 +1234,8 @@ static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
 
 static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
 					       struct xe_hw_engine *hwe,
-					       u32 *batch, size_t max_len)
+					       u32 *batch, size_t max_len,
+					       bool indirect)
 {
 	u32 *cmd = batch;
 
@@ -1247,7 +1255,8 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
 
 static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
 					  struct xe_hw_engine *hwe,
-					  u32 *batch, size_t max_len)
+					  u32 *batch, size_t max_len,
+					  bool indirect)
 {
 	struct xe_gt *gt = lrc->gt;
 	u32 *(*emit)(struct xe_gt *gt, u32 *cmd) =
@@ -1264,7 +1273,7 @@ static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
 
 struct bo_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-			 u32 *batch, size_t max_size);
+			 u32 *batch, size_t max_size, bool indirect);
 };
 
 struct bo_setup_state {
@@ -1273,6 +1282,7 @@ struct bo_setup_state {
 	struct xe_hw_engine	*hwe;
 	size_t			max_size;
 	size_t                  reserve_dw;
+	bool			indirect;
 	unsigned int		offset;
 	const struct bo_setup	*funcs;
 	unsigned int		num_funcs;
@@ -1298,7 +1308,8 @@ static int setup_bo(struct bo_setup_state *state)
 
 	for (size_t i = 0; i < state->num_funcs; i++) {
 		ssize_t len = state->funcs[i].setup(state->lrc, state->hwe,
-						    state->ptr, remain);
+						    state->ptr, remain,
+						    state->indirect);
 
 		remain -= len;
 
@@ -1404,6 +1415,7 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	struct bo_setup_state state = {
 		.lrc = lrc,
 		.hwe = hwe,
+		.indirect = true,
 		.max_size = (63 * 64) /* max 63 cachelines */,
 		.buffer = NULL,
 		.offset = __xe_lrc_indirect_ctx_offset(lrc),
-- 
2.55.0

