Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED9D59D95
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 21:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E2610E075;
	Fri, 12 Dec 2025 21:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrXdoYas";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB04F10E075
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 21:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765575151; x=1797111151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=an7wbbdwjrC642b0+1VURTgkkvhnFv03Bd3HG0zG3bw=;
 b=hrXdoYasIprQ/k8UY0lh0gVfP7yGU4mtqvFDbYewj+9oJyslAOxK5hXv
 r9u6ufLiyHsY86Q6eFlBklq/vabI48Y1vx2qwJdC408ZT3GCs0N6Sxfch
 felhgQ399dyMWQ3D3LHYOl4rB0WDeUCMrKtD/DQ2dvZ6hgyLlNRp1NeNr
 z1BUB98AXqDyUT25iSlITMzsJkYaicd8SVqErqu1077BBuis+uLsaS22z
 xF9vlX9muRUaHCzVVxVyHEnE/2/ZxFq94TawNu87O22WJ+E2HU9mOUf4Z
 lFRz9g+8L5nHs6m09QXhb0kVoyrW74GDFfhzO2WxZs7G+2RIwTglUtWzD g==;
X-CSE-ConnectionGUID: PhiRLARzSVW2bHiLLFqIZQ==
X-CSE-MsgGUID: JIhC03VrSdWIoAiB8OspMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67541886"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67541886"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 13:32:31 -0800
X-CSE-ConnectionGUID: B9ZpZP9vRqeau804DohY9g==
X-CSE-MsgGUID: n+O6Zdq/SaqrUuV2nMMMMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="228244669"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 13:32:29 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v6 01/10] drm/xe: Do not forward invalid TLB invalidation
 seqnos to upper layers
Date: Sat, 13 Dec 2025 05:32:27 +0800
Message-ID: <20251212213225.3564537-13-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212213225.3564537-12-brian3.nguyen@intel.com>
References: <20251212213225.3564537-12-brian3.nguyen@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Certain TLB invalidation operations send multiple H2G messages per seqno
with only the final H2G containing the valid seqno - the others carry an
invalid seqno. The G2H handler drops these invalid seqno to aovid
prematurely signaling a TLB invalidation fence.

With TLB_INVALIDATION_SEQNO_INVALID used to indicate in progress
multi-step TLB invalidations, reset tdr to ensure that timeout
won't prematurely trigger when G2H actions are still ongoing.

v2: Remove lock from xe_tlb_inval_reset_timeout. (Matthew B)

v3: Squash with dependent patch from Matthew Brost' series.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tlb_inval_types.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..a122fbb9fc4a 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -199,6 +199,20 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
 	mutex_unlock(&tlb_inval->seqno_lock);
 }
 
+/**
+ * xe_tlb_inval_reset_timeout() - Reset TLB inval fence timeout
+ * @tlb_inval: TLB invalidation client
+ *
+ * Reset the TLB invalidation timeout timer.
+ */
+static void xe_tlb_inval_reset_timeout(struct xe_tlb_inval *tlb_inval)
+{
+	lockdep_assert_held(&tlb_inval->pending_lock);
+
+	mod_delayed_work(system_wq, &tlb_inval->fence_tdr,
+			 tlb_inval->ops->timeout_delay(tlb_inval));
+}
+
 static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval *tlb_inval, int seqno)
 {
 	int seqno_recv = READ_ONCE(tlb_inval->seqno_recv);
@@ -360,6 +374,12 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 	 * process_g2h_msg().
 	 */
 	spin_lock_irqsave(&tlb_inval->pending_lock, flags);
+	if (seqno == TLB_INVALIDATION_SEQNO_INVALID) {
+		xe_tlb_inval_reset_timeout(tlb_inval);
+		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
+		return;
+	}
+
 	if (xe_tlb_inval_seqno_past(tlb_inval, seqno)) {
 		spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
 		return;
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..7a6967ce3b76 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -80,6 +80,7 @@ struct xe_tlb_inval {
 	const struct xe_tlb_inval_ops *ops;
 	/** @tlb_inval.seqno: TLB invalidation seqno, protected by CT lock */
 #define TLB_INVALIDATION_SEQNO_MAX	0x100000
+#define TLB_INVALIDATION_SEQNO_INVALID	TLB_INVALIDATION_SEQNO_MAX
 	int seqno;
 	/** @tlb_invalidation.seqno_lock: protects @tlb_invalidation.seqno */
 	struct mutex seqno_lock;
-- 
2.52.0

