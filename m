Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59771CA5531
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 10:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302C710E497;
	Wed, 13 Sep 2023 10:07:17 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CAD10E00A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 10:07:13 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1694599001; bh=a1OMx40K7siOpuTrHkGY7dYMbzvxOxeSTPOzmfVMpbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zx/4qsKJwVQkZc36n2XmYenCfT/NiPFI9txq1gaf+5EkDwitwqRymcUi/zSJC8C3n
 uIsTwrQhAwB5O+RQoA/HT4FkVFheByBi8eG9vJm90aRdXsAKfkWGTLXt4W4KtoP4TU
 n2L4nONskcxn4zp73HDJmQa4BLV8HhFlaJdPCnafNh6tJ7a1op7DbyE5tgTg/7lEi2
 gc4knRqAw3VcZ6iqSUo2xNWKvvxlxpb9KwoN8r98JgUuIVjOqUR+9tU1lIBvqAGiuf
 tElWxYv7wz2wRwxpl0eI6lW5AIvuXMqA7HdVREsG49T0I8b9vICKBZT/RY9rvC/8q0
 ZsWgTSIAY/hjQ==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 38D9w0R31661142; Wed, 13 Sep 2023 12:58:13 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 12:57:59 +0300
Message-Id: <20230913095800.1661119-6-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913095800.1661119-1-kelbaz@habana.ai>
References: <20230913095800.1661119-1-kelbaz@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: map MMIO BAR according to the num of
 tiles in device desc
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When MMIO BAR is initially mapped, the driver assumes a single tile device.
However, former memory allocations take all tiles into account.
First, a common standard for resource usage is needed here.
Second, with the next (6th) patch in this series, the MMIO BAR remapping
will be done only if a reduced-tile device is attached.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
---
 drivers/gpu/drm/xe/xe_mmio.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 054ad752303f..52e4572e3c4a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -383,14 +383,13 @@ int xe_mmio_init(struct xe_device *xe)
 	int err;
 
 	/*
-	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
-	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
-	 * This will get remapped later if we determine that we're running
-	 * on a multi-tile system.
+	 * Map the maximum expected BAR size, which will get remapped later
+	 * if we determine that we're running on a reduced-tile system.
+	 * The first 16MB of the BAR, belong to the root tile, and include:
+	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
 	 */
-	xe->mmio.size = SZ_16M;
-	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar,
-				  xe->mmio.size);
+	xe->mmio.size = (SZ_16M + xe->info.tile_mmio_ext_size) * xe->info.tile_count;
+	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar, xe->mmio.size);
 	if (xe->mmio.regs == NULL) {
 		drm_err(&xe->drm, "failed to map registers\n");
 		return -EIO;
-- 
2.34.1

