Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C80DE6FE4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 22:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E2D10EB0C;
	Fri,  6 Sep 2024 22:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAF9YPQ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D24A10EB0C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 22:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725660267; x=1757196267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OCPPQoRBxS+h9YHSWRyyUfBtt0uazaFvGV4yXqtqGAc=;
 b=WAF9YPQ6AozbCh+mFCsWbLOoxzauKwheSfubWwtlRHSBq0zMtJsBDaBw
 UfWHcZYVLfOsqzgZF3I8emmFndXI8VyZYRCxQRUUzBC8cFsCPGlgxoaUd
 NR0Sz5K2FN+f1HVv1Wg3PXF0Oi4VbLcYVd99J3x5HBL8TYNod6lNdPWfU
 KUgJZsqEqVGn7IPKpKPcpQpHK41lJI9rsHPak7o6RCHQbsKzvtkoWqbfD
 LmCprO5u6Ciis7W+4+i7iSHOQZehy6o388GUtWtqaqZtGfrswQq9eSHkO
 dPm11wlYTka4PZ4oGoVDHPwQ2F8TXfaoNny1NAT1hYFhGx+ozd+tdDwoe A==;
X-CSE-ConnectionGUID: nDfXWrgqTLeJoSGW3FcD/Q==
X-CSE-MsgGUID: W3++wZjQR9ulF1W8WzIzJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24628696"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24628696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 15:04:26 -0700
X-CSE-ConnectionGUID: oAwz2NRCR725MxdMn+0ZOg==
X-CSE-MsgGUID: 0BaCC5F1TSWSrP95eFW4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65873534"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 15:04:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Don't keep stale pointer to bo->ggtt_node
Date: Sat,  7 Sep 2024 00:03:48 +0200
Message-Id: <20240906220348.1836-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

When we fail to map a BO in the GGTT, we release our GGTT node
placeholder, but leave stale bo->ggtt_node pointer to it, which
triggers an assert immediately followed by a crash, due to UAF:

[ ] xe 0000:00:02.0: [drm] Assertion `bo->ggtt_node->base.size == bo->size` failed!
[ ] WARNING: CPU: 4 PID: 126 at drivers/gpu/drm/xe/xe_ggtt.c:689 xe_ggtt_remove_bo+0x1d9/0x250 [xe]
[ ] RIP: 0010:xe_ggtt_remove_bo+0x1d9/0x250 [xe]
[ ] Call Trace:
[ ]  <TASK>
[ ]  ? __warn+0x88/0x190
[ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
[ ]  ? report_bug+0x1c3/0x1d0
[ ]  ? handle_bug+0x42/0x70
[ ]  ? exc_invalid_op+0x14/0x70
[ ]  ? asm_exc_invalid_op+0x16/0x20
[ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
[ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
[ ]  xe_ttm_bo_destroy+0x11f/0x260 [xe]
[ ]  ? ttm_bo_release+0x31c/0x350 [ttm]
[ ]  ? __mutex_unlock_slowpath+0x35/0x270
[ ]  __xe_bo_create_locked+0x4a0/0x550 [xe]
[ ]  ? mark_held_locks+0x49/0x80
[ ]  xe_bo_create_pin_map_at+0x37/0x200 [xe]
[ ]  xe_bo_create_pin_map+0x11/0x20 [xe]

While around, for similar reason, also don't keep an error pointer
if we fail to allocate ggtt_node placeholder.

Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f3fca5565d32..2895f154654c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -619,16 +619,19 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	bo->ggtt_node = xe_ggtt_node_init(ggtt);
 	if (IS_ERR(bo->ggtt_node)) {
 		err = PTR_ERR(bo->ggtt_node);
+		bo->ggtt_node = NULL;
 		goto out;
 	}
 
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node->base, bo->size,
 					  alignment, 0, start, end, 0);
-	if (err)
+	if (err) {
 		xe_ggtt_node_fini(bo->ggtt_node);
-	else
+		bo->ggtt_node = NULL;
+	} else {
 		xe_ggtt_map_bo(ggtt, bo);
+	}
 	mutex_unlock(&ggtt->lock);
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
-- 
2.43.0

