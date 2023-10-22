Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5775DCDB474
	for <intel-xe@archiver.kernel.org>; Sun, 22 Oct 2023 15:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011F610E043;
	Sun, 22 Oct 2023 15:57:45 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B0410E03D
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Oct 2023 15:57:38 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1697990250; bh=uoSZVPpOBl/WNaHpINH/ORw+aWhNZFw+QKnFBWt65Wg=;
 h=From:To:Subject:Date:From;
 b=grVNHXufaOG+5bsmMPrZtQJPO8WL5lDxNRsceHddhUxujBI2YKrqf/UT2pev5Ombo
 K7T4b3XTo9b07h7NJbd19MDcB6G7e1yLP+G11u0j4IsJiJC7eYqKNS/JCcjl0atq98
 nlVeIG/zrbpV79fA+kLvwfWdFI/GZ/gFl6EfNbwrn5dOXOImBRw8AH6JVVPwRyD0lr
 pymvKlzKhsoWjv65Ixcj9OBnOMLWOIfvcKkHpoMRyvBxD5KrGvaNaI1GNNMqIxsC9p
 DEqHgczFnXntJ39C6CRlQQIOy5SMZU6sSxy+MBjJGSDmXN3IXckBNNS/ARoKPs8jmE
 KRz4vBV8a4mKQ==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 39MFvRSJ717264
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Oct 2023 18:57:27 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Sun, 22 Oct 2023 18:57:26 +0300
Message-Id: <20231022155727.717251-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: add skip_pcode flag
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

Per device, set this flag to enable access to the PCODE uC or to skip it.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
---
Changes in v2:
- Added the flag 'skip_pcode' instead of 'has_pcode'

 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 drivers/gpu/drm/xe/xe_pcode.c        | 9 +++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 44d622d4cc3a..29199671d9e8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -257,6 +257,8 @@ struct xe_device {
 		u8 enable_display:1;
 		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
 		u8 bypass_mtcfg:1;
+		/** @skip_pcode: skip access to PCODE uC */
+		u8 skip_pcode:1;
 		/** @supports_mmio_ext: supports MMIO extension/s */
 		u8 supports_mmio_ext:1;
 		/** @has_heci_gscfi: device has heci gscfi */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2fae45b9d88e..05b0aa9f2ab7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -61,6 +61,7 @@ struct xe_device_desc {
 
 	u8 has_llc:1;
 	u8 bypass_mtcfg:1;
+	u8 skip_pcode:1;
 	u8 supports_mmio_ext:1;
 };
 
@@ -578,6 +579,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
+	xe->info.skip_pcode = desc->skip_pcode;
 	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 4a240acf7625..b324dc2a5deb 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -61,6 +61,9 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 {
 	int err;
 
+	if (gt_to_xe(gt)->info.skip_pcode)
+		return 0;
+
 	lockdep_assert_held(&gt->pcode.lock);
 
 	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
@@ -249,6 +252,9 @@ int xe_pcode_init(struct xe_gt *gt)
 	int timeout_us = 180000000; /* 3 min */
 	int ret;
 
+	if (gt_to_xe(gt)->info.skip_pcode)
+		return 0;
+
 	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
 
@@ -280,6 +286,9 @@ int xe_pcode_probe(struct xe_gt *gt)
 {
 	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
 
+	if (gt_to_xe(gt)->info.skip_pcode)
+		return 0;
+
 	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
 
-- 
2.34.1

