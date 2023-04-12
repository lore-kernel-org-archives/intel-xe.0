Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8883FC77B76
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D35510E9DB;
	Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8257610E9D8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681339976; x=1712875976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S1ee/4q1NNyq4i1MS9Nne6akPbdQ9/9EkiMEV+6NIT4=;
 b=Ul+TZJhcZ5DZxTK/kDxifBlwEbnyrhG9Er3X5PUJZ5ZkbXOOaQdVjTPa
 +0NkXrcTriAVqw4dxGVFzWfJYVwt3vn9gHT1sLQYWr8Rol4NIhNEO29nr
 181WkwR/SbIyj+WKKzqT7RSj7IkOxKLo65EjHjFRNEX7TCdP3fQXik4YC
 dbQG7rPQog5vjN6bn70W2U7HXiL7sl/AvHhD9O4Pjz5JP8tL0w4kZXH97
 uv7YwqXa3HyBr7uWyg5Q+1IOwdWfeB/FNvrIy4orgEdGudN8UjPyRf63v
 AB615KHrL4L47rMvhzvAUCwkhpWML4N1+5Mu7Yi89MhqIuN66EsfMgNXA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="344038899"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="344038899"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721757096"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721757096"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 15:52:48 -0700
Message-Id: <20230412225248.3229571-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412225248.3229571-1-matthew.d.roper@intel.com>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 8/8] drm/xe/tlb: Obtain forcewake when doing
 GGTT TLB invalidations
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Updates to the GGTT can happen when there are no in-flight jobs keeping
the hardware awake.  If the GT is powered down when invalidation is
requested, we will not be able to communicate with the GuC (or MMIO) and
the invalidation request will go missing.  Explicitly grab GT forcewake
to ensure the GT and GuC are powered up during the TLB invalidation.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 374830a7a0cf..8348380bbcaf 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -198,6 +198,13 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
 {
 	/* TODO: vfunc for GuC vs. non-GuC */
 
+	/*
+	 * Invalidation can happen when there's no in-flight work keeping the
+	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
+	 * and GuC are accessible.
+	 */
+	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+
 	/* TODO: i915 makes comments about this being uncached and
 	 * therefore flushing WC buffers.  Is that really true here?
 	 */
@@ -222,6 +229,8 @@ void xe_ggtt_invalidate(struct xe_gt *gt)
 			xe_mmio_write32(gt, GEN12_GUC_TLB_INV_CR.reg,
 					GEN12_GUC_TLB_INV_CR_INVALIDATE);
 	}
+
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
-- 
2.39.2

