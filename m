Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA09C25B47
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 07:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06910E507;
	Wed, 25 Oct 2023 07:13:07 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00B310E507
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 07:13:05 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1698217977; bh=0QKVl8GPJqMpXtc6hCsHMEH7/kXpH5ksMqo0pK38wUg=;
 h=From:To:Cc:Subject:Date:From;
 b=Z6bcVm/SID5oeNjp4XUFf5yj3RJYkTOZxUTajtjbLV+rHsvykID5N1aGpGuMwd66E
 WKouNmo0/BlX/+DtSkNLgGeTzYCXZAXNqm+W4mGX26LbMXckw4Qg8no9rBoGfmOyCn
 F/hzwT9omB36MBZftn60fErA9saLc74Yb9LwlvGgICmvzA5R05O8jNotgJWZE3Rn9i
 lfvuWfc7fIOUjQ69EOXsZhLXc+28PdZT/Bs90H3Pj/L/U8OnTR5YPwGtbGM4SbiPae
 ogri8nocq41e30x1EWGbovsj5CthLEmtC+msmvvTThITDLFRtQC0eSXgYhCd2ZZa86
 vS5HSCH9wedHA==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 39P7Cqjt168769; Wed, 25 Oct 2023 10:12:52 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 10:12:52 +0300
Message-Id: <20231025071252.168758-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: move the lmem verification code into a
 separate function
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
Cc: obitton@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If lmem (VRAM) is not fully initialized, the punit will power down
the GT, which will prevent register access from the driver side.
That code moved into a corresponding function (xe_verify_lmem_ready)
to make the code clearer.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
---
 drivers/gpu/drm/xe/xe_mmio.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 0da4f75c07bf..d10230bd0c1a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -381,10 +381,27 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 		iounmap(xe->mem.vram.mapping);
 }
 
+static int xe_verify_lmem_ready(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+
+	/*
+	 * The boot firmware initializes local memory and assesses its health.
+	 * If memory training fails, the punit will have been instructed to
+	 * keep the GT powered down; we won't be able to communicate with it
+	 * and we should not continue with driver initialization.
+	 */
+	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
+		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	const int mmio_bar = 0;
 	int err;
 
@@ -409,16 +426,10 @@ int xe_mmio_init(struct xe_device *xe)
 	root_tile->mmio.size = xe->mmio.size;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	/*
-	 * The boot firmware initializes local memory and assesses its health.
-	 * If memory training fails, the punit will have been instructed to
-	 * keep the GT powered down; we won't be able to communicate with it
-	 * and we should not continue with driver initialization.
-	 */
-	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
-		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
-		return -ENODEV;
-	}
+	/* lmem verification must be done before mmio-probing the other tiles */
+	err = xe_verify_lmem_ready(xe);
+	if (err)
+		return err;
 
 	err = xe_set_dma_info(xe);
 	if (err)
-- 
2.34.1

