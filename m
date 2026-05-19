Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A4CCD4851
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 03:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB28B10EA36;
	Tue, 19 May 2026 03:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkvlOqgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9C310EA36
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 03:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779161537; x=1810697537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9qAbRC2KCi/b/adyM7BXGYAd/64TMHfTtXnH8Gu7uA=;
 b=RkvlOqgTl7Pr3neqD4bWHV+8fPi62KmBEVDDzpO7oX5SKAjuxamW4qMQ
 Y4xgGPHAWcZ7MBZwn4eoB6HWBp/LPdZqVBWvIXgHj3H7KVYZd3tKVLEkm
 Jqw7QCuG8C2a96Ky6d8WczUHwOdcFc9l8UeSxMr/wir4fFo/AOK5qx/q5
 lSAFb13fkaJEBXvpibO1Ylj2ZUyT2Qamfes2/VBFLKzVg0s3FpnpwwpjG
 caiXzFbupGGHu8ctk49ptEm/Cn14JhT4Y7WlTaczYI+RizILbGCTsdz2S
 o8Bfr1HJtUOQ68lRQ6uxT9JSpdrHgc5/OGDjk4zMMlfAGooxdAJ6KOyN+ w==;
X-CSE-ConnectionGUID: Vbrpxg4vSiSxO2T8QK8zSA==
X-CSE-MsgGUID: zeHDA+r0TuSv2tz9F6zwvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97462739"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97462739"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 20:32:17 -0700
X-CSE-ConnectionGUID: IV6wVn4YQNO6mncsf8Jv9Q==
X-CSE-MsgGUID: Z0kWxJUMQ2OaBi0HQLnDcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239697064"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa009.jf.intel.com with ESMTP; 18 May 2026 20:32:16 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Date: Tue, 19 May 2026 09:01:04 +0530
Message-Id: <20260519033104.480503-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512060128.209698-1-arun.r.murthy@intel.com>
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
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

After ioremap the BAR mapped address is read once as a sanity check and
if found to be all 1s then return avoiding the driver initialization of
a dead device.

v2: Move the sanity check to mmio_probe_early() - Michal

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 78adb303b663..d206e3720eed 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -90,6 +90,7 @@ int xe_mmio_probe_early(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u32 sanity = 0;
 
 	/*
 	 * Map the entire BAR.
@@ -103,6 +104,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
 		return -EIO;
 	}
 
+	/*
+	 * If the parent PCIe bridge failed to leave D3cold, or the device
+	 * fell off the bus, MMIO reads return all-ones. Detect that here
+	 * before any other subsystem (SR-IOV, GuC, pcode...) consumes a
+	 * bogus 0xFFFFFFFF.
+	 */
+	sanity = readl(xe->mmio.regs);
+	if (sanity == U32_MAX && !pci_device_is_present(pdev)) {
+		drm_err(&xe->drm,
+			"MMIO reads all 1s and device not present; aborting probe\n");
+		pci_iounmap(pdev, xe->mmio.regs);
+		xe->mmio.regs = NULL;
+		return -ENODEV;
+	}
+
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
 
-- 
2.25.1

