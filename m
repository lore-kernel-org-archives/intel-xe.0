Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D50C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 04:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FD110E1DE;
	Mon,  6 Jul 2026 04:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxjskzGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8F910E1DE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 04:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783312944; x=1814848944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XCqVmzVJpBn0E6gcsELbECkvVwSih87U5egV7zXr7+c=;
 b=JxjskzGF36uN0UCtMjABQkwVfyynLKABrbtgE2XoK8Ho/XXvF3p+ESIe
 zYiQVE+vcMJen+fbiATQ9I4eS9ecSIPS3nBa/zB9ZHEJsk5ghv3LOfH98
 /zZ5rxrYHM3tHbLlKWVMnZLoNzVh5Xt1a05IFEnNJhbj9bZUfgLfZgbhG
 yOkdp2PkSTPiDd9uaL1myj/sSHUZXQrgsGMYVIf3d1pK6zGFp10K5uKBF
 PG6lP4RcQusltybZlZe0j8MGXL2NH3AnoZyabnsrjRgLZVI6H/eA3SLcl
 InTyCwQ4G2pzDPKZ1nsLXA6v/CMH2KoudbTUaASXw6m9rqGRvfubFng3m g==;
X-CSE-ConnectionGUID: D6YXYg9kTnGK0L+TkiJ7qQ==
X-CSE-MsgGUID: 0SQBZKMmQzuOGfpMPJKCVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101484027"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="101484027"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 21:42:23 -0700
X-CSE-ConnectionGUID: CCh3HA0NT5uagy543hr8wA==
X-CSE-MsgGUID: NqPVMVUIT5upXc9X/iRTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="252533861"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa010.jf.intel.com with ESMTP; 05 Jul 2026 21:42:21 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, raag.jadav@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3] drm/xe: Check for dead config space
Date: Mon,  6 Jul 2026 10:11:12 +0530
Message-Id: <20260706044112.3225462-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519033104.480503-1-arun.r.murthy@intel.com>
References: <20260519033104.480503-1-arun.r.murthy@intel.com>
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

If the device or its upstream bridge has failed to come out of D3cold
config/MMIO reads on it return all-1s. Once MMIO is mapped (after
xe_device_probe_early()), probe the GMD_ID register; an all-ones read
indicates the device is not accessible, so bail out of probe early to
avoid consuming bogus 0xFFFFFFFF values later in xe init paths.

v2: Move the sanity check to mmio_probe_early() - Michal
v3: Move the sanity check to pci_probe to handle much early - Matt
    Use GMD_ID read for the accessibility check - Matt

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 08c14a0202d9..80f30b970871 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1199,6 +1199,17 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
+	/*
+	 * MMIO is now mapped. Probe GMD_ID to make sure the device is
+	 * actually accessible; an all-1s read indicates the device (or its
+	 * upstream bridge) is dead (e.g. failed D3cold resume). Bail out
+	 * with a clear error instead of consuming bogus values later.
+	 */
+	if (xe_mmio_read32(xe_root_tile_mmio(xe), GMD_ID) == U32_MAX) {
+		dev_err(&pdev->dev, "Device not accessible (dead config/MMIO); aborting probe\n");
+		return -ENODEV;
+	}
+
 	err = xe_probe_info(xe, desc, &probed_info);
 	if (err)
 		return err;
-- 
2.25.1

