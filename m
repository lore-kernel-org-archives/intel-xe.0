Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA10C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 17:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8184310E153;
	Tue, 28 Nov 2023 17:07:52 +0000 (UTC)
X-Greylist: delayed 864 seconds by postgrey-1.36 at gabe;
 Tue, 28 Nov 2023 17:07:50 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C2C10E15F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 17:07:50 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1701190402; bh=I9OWbGZTGFI+fA8hPcb4bPqpNunS4/cCZCCjjss3bQE=;
 h=From:To:Subject:Date:From;
 b=Uoo6u36cAEwry6OaqIxSqaGeyLFWBRsFx4RP+3mzmxfDK8ePIREwTnKprfukkkVjj
 a1cx5c8FuIGtpb03Q1lj+JRqwDgmUstDDlsobctCNcOY5dZfD1q5bmIQ3uclImHPks
 k5HJzMxC2m2tVnBQ0RjFLT/c5FVnPmGhmHT0YZ5edrmzNWlx1JgjtK19h9yw+mxYw6
 /5ODhqDTLhSNtvnWzURMgyDoLf4U5R7Cy+A06tpCGrYceRAd3YJBp3/Bnh9Yxd0QRO
 jwzCF2+HIfZiUQJKLwApNlQUaSV/6YStqOd6LCGlGIEpeEJ9Gp+CGHzt/qmqrUwaLQ
 4Tka1r8q3dFNg==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 3ASGrHKP3142197
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 18:53:17 +0200
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 18:53:15 +0200
Message-Id: <20231128165316.3142184-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: add skip_pcode flag
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
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 drivers/gpu/drm/xe/xe_pcode.c        | 9 +++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2712905c7a91..72ab96869659 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -260,6 +260,8 @@ struct xe_device {
 		u8 enable_display:1;
 		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
 		u8 bypass_mtcfg:1;
+		/** @skip_pcode: skip access to PCODE uC */
+		u8 skip_pcode:1;
 		/** @supports_mmio_ext: supports MMIO extension/s */
 		u8 supports_mmio_ext:1;
 		/** @has_heci_gscfi: device has heci gscfi */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 994679a4eb89..20ca30bf58b1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -63,6 +63,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 has_sriov:1;
 	u8 bypass_mtcfg:1;
+	u8 skip_pcode:1;
 	u8 supports_mmio_ext:1;
 };
 
@@ -581,6 +582,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_sriov = desc->has_sriov;
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

