Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C76C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873D310F3EF;
	Fri, 28 Aug 2026 15:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFRF1FYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0110F3EF
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930070; x=1819466070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GoQDZIJ9l9g4fw31NYzHidcUd+APTWAJKYKrsdwfqF4=;
 b=aFRF1FYvbhmO35du+RbKeJp2I1Gw8N4mT4/eWn3H0SQ6L4ZapqpbJ12l
 7i9ZweobNdi7lrBYuyhmgoCwzlvB9EJxt7OCCB673yP3Nv+OVlLPKpKGj
 98MQsZjMsRWyhzFL2Bblle+Z5pSfSqTNNwK1oNeSNnY+q26gwCCm2Zd7Q
 UnGpJFpZluQcpVNDFTF78dfw8JXQxIlK480JjxhvolZNcphPSQVFhlFQA
 IpSXUmD1FKb5UlnQi7UGx2hm6B4GgjlWDL7upXpbyRprM7ZN4INPSgVt9
 JvYxdvkdoAeK2SQpeRYsGMneHFi4sJsNc53BN9Y5HL1+u1FRb/P3+bp9h w==;
X-CSE-ConnectionGUID: 49P7e/VUS1eyzLiFNmQlMg==
X-CSE-MsgGUID: vX+h6bJMTfSdbGVWWcbg0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92252196"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="92252196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:30 -0700
X-CSE-ConnectionGUID: uYstn9wvQrmaQ5zhVRCHSg==
X-CSE-MsgGUID: s68pPZaZSw+QTkr5xBM1BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="268746428"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.86])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/5] drm/xe: add force option for global invalidation
Date: Fri, 28 Aug 2026 16:14:10 +0100
Message-ID: <20260828151405.662533-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828151405.662533-7-matthew.auld@intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
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
index 74d566693dfd..82e0a555fa69 100644
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

