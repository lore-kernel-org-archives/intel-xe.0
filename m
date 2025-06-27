Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8C0C83010
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 12:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0236D10EA18;
	Fri, 27 Jun 2025 12:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PyQqibvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C8D10EA16
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751028571; x=1782564571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5vNe8r/dW+njtcgalLHF76AhKSQVpcHvU3UQmdoU9E=;
 b=PyQqibvv/8wcJ/Lesepr/8MMZO/wVuTH7pPtIpDk6YvMVymK7yathUhR
 GrhE7quMA31P3XthIVB5xwSiyrFEUC3oL83YL9lsbq5dEJlRwRIoksuBh
 RLXlG8iynhumf9lxJcLmPe7/sPh5jNBU9b0GRK5X7jhcYvRfGuEQwKFoa
 a7BZC6zOhS6xhHUvi5dBvrSUD+8M6uvsRDBexZmXnwsPQqx0YNrdvdYUC
 vGsidfpKDTCxlTpZZKPBWruyHFhBAJ5/h6/LWCKL91zU7CNcoK6pCdoPA
 7QZodGban1bD5GGv0vypYeGO68GUdlYSERfCOu3wRqRWh9po4RKRMZX0x w==;
X-CSE-ConnectionGUID: mNsGK6AtRt2Y2O5y4XN1RA==
X-CSE-MsgGUID: /L+KU0kySIWL9bP7FN6tyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64031915"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64031915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:31 -0700
X-CSE-ConnectionGUID: vpZlL7ciQGiXEiuBZXGhnQ==
X-CSE-MsgGUID: N183l/SlSQOwKx/3gKe7Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152969705"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 05:49:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 3/7] drm/xe: Introduce xe_tile_is_root helper
Date: Fri, 27 Jun 2025 14:49:12 +0200
Message-Id: <20250627124916.1392-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250627124916.1392-1-michal.wajdeczko@intel.com>
References: <20250627124916.1392-1-michal.wajdeczko@intel.com>
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

Instead of looking at the tile->id member provide a small helper
to explicitly express our intentions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h    | 5 +++++
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 2 +-
 drivers/gpu/drm/xe/xe_irq.c       | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e4da797a984b..741afb7029f5 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -60,6 +60,11 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
 	return &xe->tiles[0];
 }
 
+static inline bool xe_tile_is_root(struct xe_tile *tile)
+{
+	return xe_device_get_root_tile(tile->xe) == tile;
+}
+
 #define XE_MAX_GT_PER_TILE 2
 
 static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index d0519cd6704a..3ca8af721435 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -483,7 +483,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
 	}
 
 	/* no multi-tile devices with this feature yet */
-	if (tile->id > 0) {
+	if (!xe_tile_is_root(tile)) {
 		xe_gt_err(gt, "unexpected GSC proxy init on tile %u\n", tile->id);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5362d3174b06..1e6540ce9914 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -550,7 +550,7 @@ static void xelp_irq_reset(struct xe_tile *tile)
 
 static void dg1_irq_reset(struct xe_tile *tile)
 {
-	if (tile->id == 0)
+	if (xe_tile_is_root(tile))
 		dg1_intr_disable(tile_to_xe(tile));
 
 	gt_irq_reset(tile);
-- 
2.47.1

