Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C89D25031
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jan 2026 21:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593BD10E287;
	Sun, 11 Jan 2026 21:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pw2C3vSB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3820210E287
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Jan 2026 21:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768167536; x=1799703536;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ENnM1Ei2bSWu1AQpj7/qmjY1h8S+vz/JEg+F8NLrgbg=;
 b=Pw2C3vSByKljHgXXHgHEdxIfbKmlu4u/xP50dRSApcDUD6SLf+9Ual6K
 OBwfphbQy2xZXIKySsxE40ZqkYKLYpps1IZKVPGZPx6br2PSL2bHdT+8U
 vqG8FMYdpxbKFsbc9BJBtXMXavdHo56UUrnPQEo3Fa0H1fHoXAGa/YyUW
 Diqhp6arT4YrOHVDUgtod13rzbm0n7GMVMmyeox+E+RjligRkeOuqrpeG
 5jeF+sje6i2tuXGTW1FKx6NTriGbm/5QhYwcTCoSrgdhdre0gq/xgYKyt
 vptR70xzmC/10rQZDknfCPHyDI/d5otgIKjOO1vi5VvwlET3nuQPhszbT A==;
X-CSE-ConnectionGUID: RgdlLWNyRTyvweoQSBs7/A==
X-CSE-MsgGUID: MqJTvNd9SoG4pfdL72L2WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69365716"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69365716"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 13:38:56 -0800
X-CSE-ConnectionGUID: pUGcd2n1Rri7ibWdHceRMg==
X-CSE-MsgGUID: m9EOKOTCTzGbGg1jMjqDCg==
X-ExtLoop1: 1
Received: from carusoal-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 13:38:55 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/xe/mert: Always refer to MERT using xe_device
Date: Sun, 11 Jan 2026 22:38:47 +0100
Message-ID: <20260111213847.27869-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109151219.26206-4-michal.wajdeczko@intel.com>
References: <20260109151219.26206-4-michal.wajdeczko@intel.com>
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
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: drop redundant assert (Lukasz)
---
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 drivers/gpu/drm/xe/xe_mert.c | 9 ++++-----
 drivers/gpu/drm/xe/xe_mert.h | 3 +--
 3 files changed, 6 insertions(+), 8 deletions(-)

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
index f7689e922953..598b039dfe25 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -12,22 +12,21 @@
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
 
 	xe_assert(xe, xe_device_has_mert(xe));
-	xe_assert(xe, xe_tile_is_root(tile));
 
 	spin_lock_irqsave(&mert->lock, flags);
 	if (!mert->tlb_inv_triggered) {
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

