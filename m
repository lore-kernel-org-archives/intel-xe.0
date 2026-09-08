Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CE0C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827FE10ED3B;
	Tue,  8 Sep 2026 18:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1Y5o0Eb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2885610ED3B
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788893031; x=1820429031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Rw/JlqIG5T/As5eBmk3ZU9xOi4Qm3HLXKvGD75HOY0=;
 b=N1Y5o0EbC7EG+zkwpDs8l1XN5U/QTeh9BG/45PICzuAozBHuE5zDjupY
 YYT+p+Aq4ow/iddWpHXdUEd9DcN6Cp/hu92CQZfc1Ut7reeLk71/cY+Mr
 khsUnGAbYiAW3aGb+Z+TBP87E7/Tb/52LXqrOu6EkXx7GZoqF2Lt9EBdI
 64e/32mKUzxujEMfC6GEXlSPtYonF1UeT+TMWa3sHu/7n2w370R4lQcBf
 NvVYZnwGyTPcCsmz4D4hDFe5j+MEWHOLvffK20kzqNwkewgYgh6N16vKy
 ujq9Cqfa7fct7ph/iOscfSC8njzTW7Egd6Popl13sLIoUFDYBPRxOkb31 g==;
X-CSE-ConnectionGUID: Vkxxrz1rSZ+OfcVWuLutkg==
X-CSE-MsgGUID: oFEjAYYCQVytOBrgzLXNMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100826292"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="100826292"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:43:51 -0700
X-CSE-ConnectionGUID: UJO4LCE+QFqGYHxq5/so3g==
X-CSE-MsgGUID: +VW7/waxQOWS+74VcvE72w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270589962"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:43:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/xe: Keep walking on SVM eviction failure
Date: Tue,  8 Sep 2026 11:43:46 -0700
Message-Id: <20260908184346.92332-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The desired behavior for SVM eviction failures, which can occur due to
various uncontrollable races, is for TTM to continue walking the LRU
list and look for another eviction candidate. This is expressed by
returning -ENOSPC from the ->move() callback.

Adjust the SVM eviction failure path in ->move() to return -ENOSPC so
that TTM continues searching for another buffer to evict.

Fixes: 3ca608dc7561 ("drm/xe: Basic SVM BO eviction")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b162753cebb7..8264b2ef557e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1043,6 +1043,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		} else {
 			drm_dbg(&xe->drm, "Evict system allocator BO failed=%pe\n",
 				ERR_PTR(ret));
+			/*
+			 * The semantic we want upon SVM eviction failure is
+			 * keep walking for eviction, which is -ENOSPC.
+			 */
+			ret = -ENOSPC;
 		}
 
 		goto out;
-- 
2.34.1

