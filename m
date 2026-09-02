Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F34C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE6510E4E3;
	Wed,  2 Sep 2026 12:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anO1DrtH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D47910F1A1
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788352912; x=1819888912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wbi8Ox71w/hp2VjYxeW/W9iwAoSQo8/hQ7KEj2ZyFQ=;
 b=anO1DrtHV3PvrOlvQvg50nIAugYmitrQpd6sVhRVI49pnc12Niktddnn
 h6silC88we10hzgQ+OQ0c6Cm48MPjoWQyggHnz66rPErhLiv/QgTLIU8s
 ZuofOkYFnTejDe+qKJYn5UxmAMJvZ3eXwRv/l94gaPWlw1PvYtjVNuYm4
 S9YadAANjZyt7UqwzSPUmdIRbTDr9yeEascoh8pVUQeN2M3f56nBZXl01
 ZMXt76mobgkU/XRRXoHXCfSZl17Y7JErtBH0BwmWRC3nUMvtCjSOkM2Pa
 rvxjO1EMxWaYKgimnpyTlicHw5eAtziAXMMSM+e365+gbfxMswRa6LA9j A==;
X-CSE-ConnectionGUID: hS8y6tyySdmmABcY3JVPcw==
X-CSE-MsgGUID: nyNyCDgvRNKB55hkBuAS/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88829519"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88829519"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:41:52 -0700
X-CSE-ConnectionGUID: JMISxiHFQMqL42+jowLPqw==
X-CSE-MsgGUID: z1afuAGWQFyiwz272GNhvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="269965287"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.174])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:41:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 4/5] drm/xe: add force option for global invalidation
Date: Wed,  2 Sep 2026 13:41:22 +0100
Message-ID: <20260902124117.918018-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902124117.918018-7-matthew.auld@intel.com>
References: <20260902124117.918018-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The flush is gated by the WA, since there would no valid use for it
otherwise, but for some very special usecases allow bypassing the WA.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c     | 2 +-
 drivers/gpu/drm/xe/xe_device.c             | 6 +++---
 drivers/gpu/drm/xe/xe_device.h             | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index a7158c73a14c..82974e933e8d 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -88,7 +88,7 @@ static void xe_dsb_buffer_flush_map(struct intel_dsb_buffer *dsb_buf)
 	 * both for weak ordering archs and discrete cards.
 	 */
 	xe_device_wmb(xe);
-	xe_device_l2_flush(xe);
+	xe_device_l2_flush(xe, false);
 }
 
 const struct intel_display_dsb_interface xe_display_dsb_interface = {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 73469ea5f333..b46a2c32ac07 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -203,7 +203,7 @@ static int __xe_pin_fb_vma_dpt(struct drm_gem_object *obj,
 	vma->node = dpt->ggtt_node[tile0->id];
 
 	/* Ensure DPT writes are flushed */
-	xe_device_l2_flush(xe);
+	xe_device_l2_flush(xe, false);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 396d02eb2af8..fa98b2d12204 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1270,7 +1270,7 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe)
 	return false;
 }
 
-void xe_device_l2_flush(struct xe_device *xe)
+void xe_device_l2_flush(struct xe_device *xe, bool force)
 {
 	struct xe_gt *gt;
 
@@ -1278,7 +1278,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 	if (!gt)
 		return;
 
-	if (!XE_GT_WA(gt, 16023588340))
+	if (!force && !XE_GT_WA(gt, 16023588340))
 		return;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
@@ -1333,7 +1333,7 @@ void xe_device_td_flush(struct xe_device *xe)
 
 	if (XE_GT_WA(root_gt, 16023588340)) {
 		/* A transient flush is not sufficient: flush the L2 */
-		xe_device_l2_flush(xe);
+		xe_device_l2_flush(xe, false);
 	} else {
 		xe_guc_pc_apply_flush_freq_limit(&root_gt->uc.guc.pc);
 		tdf_request_sync(xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6c4cfaebc44a..6d3d6d5eba29 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -205,7 +205,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
 bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
-void xe_device_l2_flush(struct xe_device *xe);
+void xe_device_l2_flush(struct xe_device *xe, bool force);
 
 static inline bool xe_device_wedged(struct xe_device *xe)
 {
-- 
2.55.0

