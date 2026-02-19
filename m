Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B101E9A05B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880C10E730;
	Thu, 19 Feb 2026 18:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAI2rCHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D9E10E72C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524424; x=1803060424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zvPuGUpLh+rIJq1IhXAbVOw46e69+PW92ASLERc+R1k=;
 b=QAI2rCHrXCjrr3oPKmEapRPTlJ58jDTXFh/SjRoQCarubGKEFfnbtb7d
 0tcvIn+KC8FaJEfE2ULTJHeHkJ8uN+h+ATr6/hwr0hEgMbxnNkNpErDKE
 W0MtTZITq4Dcu5aycUJuul/8pfwoMlv9GAOjlcGohXvTJT4/urSgcniD+
 aqH0xnmtIipLztompL7KbUi2kZVjcwfYZODPK2kK93LiQ2N7cKbUwlkoe
 kGGKqJs60uihty3A17KD8RMjhU3Z4UuIhF+xlqodOsfnhDxHU+iUsDpZt
 vTrQBkwCVjxMzs6HU/ys+lID84SLXOACWGwSav4MyuXGM+wE0N/t0GhG8 w==;
X-CSE-ConnectionGUID: 1gq03kFTSgKa+VCOiKVZGQ==
X-CSE-MsgGUID: yeD/k1m4StCJ11lcv9rvFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76482822"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76482822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:04 -0800
X-CSE-ConnectionGUID: +0MQ79l6Sh24AxOz2bdaQg==
X-CSE-MsgGUID: lc7eCGrvS6euCRPqnzC7wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245189040"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 10:07:04 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH v7 7/7] drm/xe: Open-code GGTT MMIO access protection
Date: Thu, 19 Feb 2026 13:07:01 -0500
Message-Id: <20260219180701.2418453-8-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219180701.2418453-1-zhanjun.dong@intel.com>
References: <20260219180701.2418453-1-zhanjun.dong@intel.com>
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

GGTT MMIO access is currently protected by hotplug (drm_dev_enter),
which works correctly when the driver loads successfully and is later
unbound or unloaded. However, if driver load fails, this protection is
insufficient because drm_dev_unplug() is never called.

Additionally, devm release functions cannot guarantee that all BOs with
GGTT mappings are destroyed before the GGTT MMIO region is removed, as
some BOs may be freed asynchronously by worker threads.

To address this, introduce an open-coded flag, protected by the GGTT
lock, that guards GGTT MMIO access. The flag is cleared during the
dev_fini_ggtt devm release function to ensure MMIO access is disabled
once teardown begins.

Cc: stable@vger.kernel.org
Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for ggtt_remove_node")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 79310f565fe3..cf3311f5d140 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -66,6 +66,9 @@
  * give us the correct placement for free.
  */
 
+#define XE_GGTT_FLAGS_64K	BIT(0)
+#define XE_GGTT_FLAGS_ONLINE	BIT(1)
+
 /**
  * struct xe_ggtt_node - A node in GGTT.
  *
@@ -117,6 +120,8 @@ struct xe_ggtt {
 	 * @flags: Flags for this GGTT
 	 * Acceptable flags:
 	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
+	 * - %XE_GGTT_FLAGS_ONLINE - is GGTT online, protected by ggtt->lock
+	 *   after init
 	 */
 	unsigned int flags;
 	/** @scratch: Internal object allocation used as a scratch page */
@@ -367,6 +372,8 @@ static void dev_fini_ggtt(void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	scoped_guard(mutex, &ggtt->lock)
+		ggtt->flags &= ~XE_GGTT_FLAGS_ONLINE;
 	drain_workqueue(ggtt->wq);
 }
 
@@ -437,6 +444,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (err)
 		return err;
 
+	ggtt->flags |= XE_GGTT_FLAGS_ONLINE;
 	return devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
 }
 ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
@@ -465,13 +473,10 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
 static void ggtt_node_remove(struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
 
 	mutex_lock(&ggtt->lock);
+	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
 	if (bound)
 		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
 	drm_mm_remove_node(&node->base);
@@ -484,8 +489,6 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 	if (node->invalidate_on_remove)
 		xe_ggtt_invalidate(ggtt);
 
-	drm_dev_exit(idx);
-
 free_node:
 	ggtt_node_fini(node);
 }
-- 
2.34.1

