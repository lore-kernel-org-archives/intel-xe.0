Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F13CDB478
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 13:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BA910E6D3;
	Mon, 22 Jun 2026 13:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwxJ0B5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C443110E6D7
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782134642; x=1813670642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGw6HE3bitFFA3QnfeTHHPnYHjelu6fHolSgGiOlC80=;
 b=lwxJ0B5i4N9EjpDKy42J/A8+JmJOkl1M+ExoYbpC3YUahYqS3oel7lDw
 aevSfrD4FN2uJsF3SwK3MRGNNOYSauI/8OrOvYm+fEmG3oYV6W8ekh+Es
 e9Ats67OmDKYecU8Ve31F3DNumlhpOZOk0Cy8GDhCpyAfumUcgjGiR5mR
 RZl88TywOYJCJk1TBVrh/RfMMZnRJiT1DiZQkzCWlq2SUBOu4DGmbMJ4M
 pELxVa+a7zG3sCVsVlEMt3L/8sxvnxUqp+0P5clFMGb3iP5pXi/FCHP35
 RrqGsWgFQFD6Um62ccUIhwpk9vDZvV+RmCgNVDh/S3eUp/E3jA0MUzi31 g==;
X-CSE-ConnectionGUID: QMS1nrN6SEaqWgEtRtMN8w==
X-CSE-MsgGUID: BIZreda7REe0jov4DJgBDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93228684"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93228684"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:24:01 -0700
X-CSE-ConnectionGUID: Wpmc5wPiRaCT7GLJeQUmTA==
X-CSE-MsgGUID: nUYjh7K0RfCcAbDjBKH23A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="279407171"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:24:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 3/6] drm/xe/mmio: Add check for minimal BAR size
Date: Mon, 22 Jun 2026 15:23:39 +0200
Message-ID: <20260622132342.19600-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622132342.19600-1-michal.wajdeczko@intel.com>
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
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

We initialized the root tile's xe_mmio structure with a new size
of 4MiB without sanity checks to see if mapped GTTMMADR_BAR was
actually at least that size. Check BAR size against first 16MiB,
which is expected minimum BAR size for the one-tile platforms.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
---
v1: https://patchwork.freedesktop.org/patch/727340/?series=167104&rev=1
v2: expect at least 16MiB as xe_ggtt relies on this (sashiko)
---
 drivers/gpu/drm/xe/xe_mmio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index fce890b6410c..8dd818e1184c 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -101,13 +101,18 @@ int xe_mmio_probe_early(struct xe_device *xe)
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
 	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
 		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
 		return -EIO;
 	}
 
+	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
+	if (xe->mmio.size < SZ_16M) {
+		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
+		return -EIO;
+	}
+
 	/* Setup first tile; other tiles (if present) will be setup later. */
 	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
 
-- 
2.47.1

