Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C58D26D60
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75A310E8E1;
	Fri,  9 Jan 2026 15:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4riqdgL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA4010E8E4
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767971558; x=1799507558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDVkCnGTj0ya1wEY7KecBIML7uzt4vgCBc/Zj2xsybU=;
 b=H4riqdgLC3ANJPwE3PL+BVAgVXxwyXVoDLwo8B4BRQ2koUuQe91+Ba1e
 UT2lmmDPEWMLvZyf6L07nxCUQSIhdrCxlFi32eqqyxvzw+xT+Rp6YInQ6
 K3TirVmRivbpXtpfMfJQky5zKre76v1Rzbimcc5Qfd+xScFVVKeLGEWwk
 YaZCfhXm0KpsJgCyW43ZIfcpMhylr8irf0TLjqxg+3E9dpusHsCgIOCLI
 JW8zBs1ouFtvoAqKCfGiXwsGOfZXOuI1FIOQYLXr0UL6UMBVBIh8iudRJ
 3RJyqzvXY1RnVWriLUpoTogU9PLTal9wW4D1IkoMWOMrkal3qW2vkEMao g==;
X-CSE-ConnectionGUID: +p6AvWXeRGi8F0mtuDXwwg==
X-CSE-MsgGUID: ewzVyUqkS0eascfFkEtkqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="79990717"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="79990717"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:38 -0800
X-CSE-ConnectionGUID: 2JIFU1SIS9SqwnHLeRWHPg==
X-CSE-MsgGUID: zbznVb9hTo6zrXm+HtHo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234687642"
Received: from carusoal-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:37 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 3/5] drm/xe/mert: Always refer to MERT using xe_device
Date: Fri,  9 Jan 2026 16:12:17 +0100
Message-ID: <20260109151219.26206-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109151219.26206-1-michal.wajdeczko@intel.com>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
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

There is only one MERT instance and while it is located on the root
tile, it is safer to refer to it using xe_device rather than xe_tile.
This will also allow to align signature with other MERT function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 drivers/gpu/drm/xe/xe_mert.c | 8 ++++----
 drivers/gpu/drm/xe/xe_mert.h | 3 +--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 3059ea6525bc..2077e1ef8b43 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -289,7 +289,7 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 				  ERR_PTR(err));
 
 	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
-		err = xe_mert_invalidate_lmtt(tile);
+		err = xe_mert_invalidate_lmtt(xe);
 		if (err)
 			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
 					  ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index f7689e922953..5aea6f082bc0 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -12,16 +12,16 @@
 #include "xe_tile.h"
 
 /**
- * xe_mert_invalidate_lmtt - Invalidate MERT LMTT
- * @tile: the &xe_tile
+ * xe_mert_invalidate_lmtt() - Invalidate MERT LMTT
+ * @xe: the &xe_device with MERT
  *
  * Trigger invalidation of the MERT LMTT and wait for completion.
  *
  * Return: 0 on success or -ETIMEDOUT in case of a timeout.
  */
-int xe_mert_invalidate_lmtt(struct xe_tile *tile)
+int xe_mert_invalidate_lmtt(struct xe_device *xe)
 {
-	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	struct xe_mert *mert = &tile->mert;
 	const long timeout = HZ / 4;
 	unsigned long flags;
diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
index 0e27f9fa24bb..44daeca094bd 100644
--- a/drivers/gpu/drm/xe/xe_mert.h
+++ b/drivers/gpu/drm/xe/xe_mert.h
@@ -11,7 +11,6 @@
 #include <linux/types.h>
 
 struct xe_device;
-struct xe_tile;
 
 /**
  * struct xe_mert - MERT related data
@@ -26,7 +25,7 @@ struct xe_mert {
 };
 
 #ifdef CONFIG_PCI_IOV
-int xe_mert_invalidate_lmtt(struct xe_tile *tile);
+int xe_mert_invalidate_lmtt(struct xe_device *xe);
 void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl);
 #else
 static inline void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl) { }
-- 
2.47.1

